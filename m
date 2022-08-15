Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE4592923
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 07:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15935A9907;
	Mon, 15 Aug 2022 05:44:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20F6A9902;
 Mon, 15 Aug 2022 05:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660542244; x=1692078244;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=n2OfYz/CLWRC+hTB1t2bFsbdVlL+0EndoJINdK1S47I=;
 b=bQ+f97sF0aZs/mbOw/2Di0SPN+xcM0vAhwoQ8pxXNJmvVZK+11sOQqPg
 48Al2t5uO40f2v6r69R61/RtmT3r8sQ0NvhLHvI/mworMUIhQYRTsiUL8
 vq87y/5R+sw81yaMqzA6qkCbh+WxUjcmOT2sptSN5oH09MvLoPqDqR8Wt
 YBILmKUKT7Z7wsS/aagHdzEtgLJg0ZnVNl9yiSuX54MHgHdkn9G2vBtRK
 J57xn9iBHyMPHA4BOm5NxIlBib/mnBfHAqh4nSa8rOKEctSWfr2EasuwT
 +NnHSJHeV5sy4xdr23hWsXQBHBng44w3+vo9xW8NK6ogGEwHYJhHYdDRW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="378183576"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="378183576"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2022 22:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="557177210"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 14 Aug 2022 22:44:03 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 14 Aug 2022 22:44:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 14 Aug 2022 22:44:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 14 Aug 2022 22:44:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Sun, 14 Aug 2022 22:44:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FykTif/6u3Hnxo7KeAguzr29vy8kRQDq5ejxFbDS2li/TzzQY/G1FmxiOMbSv5OqCSG5TJTTORHi4hOcPEAVaQiNAuDRFDNG132NKThSqNLpSp3uILqkm5zBefvtmmZuAaqMLupW++JtoCM46CJghW4pbsOZmvwoQNx0GQwQMBZzS7fNzeTn0pb1ciMvw/rOYw/qr0LgEa06Bijv5KWgIWP6UpQmWkbQ3Crpliw5ee+3wSG36DSXwTOi155QA9FSKn+6/pUaS4Knii+Juup7mTWltcTVuTPdSdPwI7by/CMWEfJ94WTrGVEmYMi6hYeHMGU9VkEzyZK6N48oML+sJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2OfYz/CLWRC+hTB1t2bFsbdVlL+0EndoJINdK1S47I=;
 b=fyd6bY6HQmCtcIQfLNG9bClJbMfi0P11j+scNijYkE/Wa2G/3xjQh/QC3YOY/uR+tk2vB0I2PePk3yLBQZwA8ahTDWpTJXdznXVXdodJwfkK+CrUxYK6o6mNvCbHHz9nQ8m8/d/eaeMN/+x/TrQowFoY/MQ+7RJnd0DCMKkPaiF3hX9ICVCEIryHMWpP7e9HUh6S2huLoGgmN3a+zrqR6lcOfG7PorqgU329IHVUxlvb1oO3+abjuhOsm9+yaeTEHc7uHDfgu5UmU27xdbmPHFQJ3YQsrdTqj5EmG2FfCLeZSJYuwEw5KcTH///4U3QF6yEhJ5rYjI4o18pNfnk5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SN6PR11MB3535.namprd11.prod.outlook.com (2603:10b6:805:ce::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Mon, 15 Aug 2022 05:44:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 05:43:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/guc: Make GuC log sizes runtime
 configurable
Thread-Topic: [Intel-gfx] [PATCH 6/7] drm/i915/guc: Make GuC log sizes runtime
 configurable
Thread-Index: AQHYoijOcb6buHaR6kq6RLxoI+2+ya2vkBQA
Date: Mon, 15 Aug 2022 05:43:59 +0000
Message-ID: <45a631be0b27767a66458ba06a22eb0ee2c93760.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-7-John.C.Harrison@Intel.com>
In-Reply-To: <20220728022028.2190627-7-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1215de4d-00a7-45b3-0c1c-08da7e81271d
x-ms-traffictypediagnostic: SN6PR11MB3535:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UImRGOSiaJ4t9xU1Sogk8KKZMCcKvgZOgB5lJ/fHk6gOoY+fHShWMjdUvleHFb/lEJ+x4OwbJiVGmRHJMakd76cMx0pl4K+ff7wzT8QykL6GGrkSlu6NXHsljtGp9MJvRlkHCgH2iBOcpuPJZpFWRs1k9Wacf22sbiaIVgrxq+HitukURXyFuDNn4pVVMTC4ZGcqfbVG7fo/4w8EeLBpWNkYC6fAhUkioxU/Eq6AP/4hycTXS21IV0KBX2NBm8YLBMn+7sBlO/CgRMU52U/pb53esIJLl4jATy8QQ47hgGW12HbUzsB08QseHKutj3kNbDToKji4+M5lTg/W7jA2oMshLXOzVqOrQKQLJfH9Z+OLfcl21GTl+DsoesRN8RoHZ0oncE/btCe3x2AaXcRDguk+M4TD7SJ9a9ZniaVZvFWmITIyXqIoPrwAbQPHUTSKq0YtDrkfP0zqYehdjT16YBnqRQ7y2BlIkLBz51W/9OAvzfi9itYwwu5j2OwR2/ngJyhj1+7EP6NBcdsNvr3TJHUQn0N0bayN0o0YYTwvTL8PrER3G5K+6uegHhChq+SsdFd3x2yLig08/9S40usvY/LyEELRv0hXhx+8j6Z6EzA9vmDfPZY/P7mZNimWPZkkeI9h2VALGtjFCVhe6O5/dMo9quRDJTIuQb0prBfoYCBuKUPPBpFjS+eotHpz4h5mQJQtQRqWBWYfLztJ9IS+alckykAb9bAqBrvT1RMSpyMeKx3Vkp3ppf9SBWZ0LEKjJhX7JWltEl/7NDFclcwxIPg/Pjm4dnPvNqf6Ct7f8cuN11lVHShuRJfTMJzG6xs3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(39860400002)(346002)(376002)(4326008)(66556008)(66446008)(66946007)(8676002)(76116006)(66476007)(64756008)(316002)(110136005)(450100002)(91956017)(5660300002)(8936002)(2906002)(82960400001)(122000001)(38100700002)(86362001)(38070700005)(36756003)(478600001)(6506007)(41300700001)(71200400001)(6486002)(83380400001)(2616005)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2xVaXlEcTNQM05ObWxBUDBmcEV3MVhXMU5lQ2p3MDlVb1A5YWNlLzlNUUEx?=
 =?utf-8?B?eTZSS0Zvb0xuNVVpQVAzUFdkQTIvdjFnd3I5WGhRNjludHk2SG9xbFFEalRi?=
 =?utf-8?B?YnA0TWRYWDh6ZHJYR0dDcWNURjdZTVM2Rlo0MWwxcHczaVZ1d2NHMk1ralRq?=
 =?utf-8?B?SytPNzN1TXBWTzBNTGhzUms3aHV4Nlc0cXZqZFBlVVZ4S3M1UklVMVU0M2sy?=
 =?utf-8?B?OTJXOVFldWpMbkFaOFJaM3lkMVp1SjdKcWZkOC9RVStNZWF6RFp3U0dqREsw?=
 =?utf-8?B?VWNCdWJuM0xFVWQzalRwa2tma1FjWURsUE56WjZTYTVtdmdaWlZvWHdBc3du?=
 =?utf-8?B?RGhpZS9ObE5PaEYwSk9FSUtaK20wTXZNUzdEaHM0TGRyWEFIUVRJNmdkN0pu?=
 =?utf-8?B?RDVqRytqMis3UlZYM3V1Zk1ucWhidThnR1g0R01ZNjhMT0p0VFp5djRCYjd0?=
 =?utf-8?B?WVh4cXNCcmZPTFVtTTQwU0J4S1l1YW5KemxoQXJUaUZiT3ZuamQvYUR6UXcr?=
 =?utf-8?B?QitoeHRSa0xwTmI5ZTh5TVVJdU0xSGl3MllLNVRYRzM5bW5NV3JZSWsyLzFN?=
 =?utf-8?B?ZENueFpzQUxGZ0ZvZjZoRWNFMjg2TStJL09wbnhrMGpuTGE3TW9PbHE5SU1O?=
 =?utf-8?B?U1hnVVh1U0tKNkV0ZDVHdHl1dDdCTi9SRlQ5b1lnUVhScDFBTU40WUp6OXVL?=
 =?utf-8?B?QTNPU0gvQm9menBYQ2ZXL0E5R2hkN2diYVZpL3dZbS9LN2hNbjRoT0Q4aEZW?=
 =?utf-8?B?WnVGTXdqUks2QWJWWWtBRlhNKzR0MWZpTG9KTDlZaVRsRXlnaHVzenNpOGpR?=
 =?utf-8?B?UUkzZkJ4SWxabmlzNDZ5UjJQbmhiWXJGUmNtWlhlSlVicCtYNmM5TC80UXZ0?=
 =?utf-8?B?THZ0ZkJoT1p1eVpPeDBhVmFUOGp2dDFhY3pYbHM0ZWFrL2xPYjZEd2drSlQv?=
 =?utf-8?B?cVJlVnVyT1BKVGFMNFZ1YVd4UGlHRG83MTRtTy91ZEpBS0hMa2lLWFRaUHpC?=
 =?utf-8?B?cUdTd3RJUUFFYVRDYW40Q3YrTlMxdGJnL051VTl5ODZjZU5xL3kwUm1rN0xx?=
 =?utf-8?B?QWJKazBCNEx0RENqRVZQWG5TK055RWJZekpXcUFLU2h2QjBDd3k4YTBRbjkr?=
 =?utf-8?B?Qnh2STE5M3dXNjVUVW01MDlpdkZRNDZ4a1g2eFFJbTM0cUJ6ZERXTzN2WGFZ?=
 =?utf-8?B?Mmh6Y3ZadHUrdXRpSWFQa2hSUmVITEMyRi9DcHo0dmpMQStMU3RSN1VaNXRO?=
 =?utf-8?B?dHZKQUQwejV2bDFwMEdLbFNKRCtZT0RINkJiei9CN09HYVo1Z3orVjFPK2Y3?=
 =?utf-8?B?MExzdGxMb0loNmxDSjY3cjkrWVJZcllQN1FCcndtdEZBZlMzaTBxR0xwaWZK?=
 =?utf-8?B?L09ETHEvTkhVcE1qWnFmV0NsNzhyOE9oQW0xZ1FPOUI3ZGRXUGt0aWRGY05M?=
 =?utf-8?B?Y3NaQ0hGd0t6SDhmTXBxRGNUTzZ4QnVmSWJiaUhPeWJXR2tFd2lQVkRNSE5n?=
 =?utf-8?B?blhhZ29PZFNaNzFTZ3N6VlJNTmdhb09na1dhU0tzVFhGMU5nTmFxQTdRemdh?=
 =?utf-8?B?QlRxT01xcjk1S05wS2NVSVM0b2wvQXF2TVp0Mkdjdlk1eTRJR1MxaFpsUGVr?=
 =?utf-8?B?RGRYSHFVblNWU3dtcVhYQ2NqK3FDdFQwRjlpQXNqWGRDNVdwNGo5S1FETUlv?=
 =?utf-8?B?WmlGOWRzTi9HbUd1TmhyR2l4elVQQnYrQTExZ0Jua2lCSFR2Y0FkcG9IU2t0?=
 =?utf-8?B?eGtKQzk1SWxDb1A2MW4zVllkc3hOREJjUXI5TW1EWEduZjNHUnZCbGFwWTNo?=
 =?utf-8?B?bm0yNCtaQ1ZxWlF1NFVYdFk3MTNCK3FiS1RZOUlRMlczb1RKbWFNR0FXQzU0?=
 =?utf-8?B?V1dKNlROWVp2WTNPU2Q4TnFnek5FS2NYYXhZc3B3Y0luQWFBemlIRTZpZUVh?=
 =?utf-8?B?eGdzS1lRdXZxUmNlUVdSR1lRSFMvYzNJcGNnenNiSUdObnhaSWQzT1VlRVBL?=
 =?utf-8?B?VFJSVnRTWmZQWTRtbGVLWlVwOThqczl1Q0QxYzJONkI3dGdVejdFZGV2clFp?=
 =?utf-8?B?Ny9wcjd5ZkJ6Sk5Vd2x3ZnFhaDl5Vk83QjkxdGZobXljNytabyszVlpWKzdw?=
 =?utf-8?B?SExGZlI1Q08zNXRONlpVSmdpOG56R0FPMnhkQlByZnJSYnpHZlN3YkVrUElJ?=
 =?utf-8?Q?MM+lMmGezvAVCm2jQwkM4qo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FBDAEC1E9736C4DB1A3F6AD02071D20@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1215de4d-00a7-45b3-0c1c-08da7e81271d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 05:43:59.8130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mohaab2/S6RJddn3oq6shGND4R8YeGsuJhWJz3P5ZREvdUAo8TCj+04OY/Po59oM1N+QW4ARIocpzvW3z4eOG0H8AoY1KEYsougGEWqfR7A3gU/n7xeRjUCZbzPasjkc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3535
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4gDQoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2
aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KDQpPbiBXZWQsIDIwMjItMDctMjcgYXQgMTk6
MjAgLTA3MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20gd3JvdGU6DQo+IEZyb206IEpvaG4g
SGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IA0KPiBUaGUgR3VDIGxvZyBi
dWZmZXIgc2l6ZXMgaGFkIHRvIGJlIGNvbmZpZ3VyZWQgc3RhdGljYWxseSBhdCBjb21waWxlDQo+
IHRpbWUuIFRoaXMgY2FuIGJlIHF1aXRlIHRyb3VibGVzb21lIHdoZW4gbmVlZGluZyB0byBnZXQg
bGFyZ2VyIGxvZ3MNCj4gb3V0IG9mIGEgcmVsZWFzZWQgZHJpdmVyLiBTbyByZS1vcmdhbmlzZSB0
aGUgY29kZSB0byBhbGxvdyBhIGJvb3QgdGltZQ0KPiBtb2R1bGUgcGFyYW1ldGVyIG92ZXJyaWRl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQElu
dGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWMu
YyAgICAgICAgfCAgNTMgKystLS0tDQo+ICAuLi4vZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1
Y19jYXB0dXJlLmMgICAgfCAgMTQgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2lu
dGVsX2d1Y19sb2cuYyAgICB8IDE3NiArKysrKysrKysrKysrKysrKy0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuaCAgICB8ICA0MiArKystLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuYyAgICAgICAgICAgIHwgIDEyICsrDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BhcmFtcy5oICAgICAgICAgICAgfCAgIDMgKw0KPiAgNiBm
aWxlcyBjaGFuZ2VkLCAyMjYgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pDQo+IA0KLi4u
DQo+ICtzdGF0aWMgczMyIHNjYWxlX2xvZ19wYXJhbShzdHJ1Y3QgaW50ZWxfZ3VjX2xvZyAqbG9n
LCBjb25zdCBzdHJ1Y3QgZ3VjX2xvZ19zZWN0aW9uICpzZWN0aW9uLA0KPiArCQkJICAgczMyIHBh
cmFtKQ0KPiArew0KPiArCS8qIC0xIG1lYW5zIGRlZmF1bHQgKi8NCj4gKwlpZiAocGFyYW0gPCAw
KQ0KPiArCQlyZXR1cm4gc2VjdGlvbi0+ZGVmYXVsdF92YWw7DQo+ICsNCj4gKwkvKiBDaGVjayBm
b3IgMzItYml0IG92ZXJmbG93ICovDQo+ICsJaWYgKHBhcmFtID49IFNaXzRLKSB7DQo+ICsJCWRy
bV9lcnIoJmd1Y190b19ndChsb2dfdG9fZ3VjKGxvZykpLT5pOTE1LT5kcm0sICJTaXplIHRvbyBs
YXJnZSBmb3IgR3VDICVzIGxvZzogJWRNQiEiLA0KPiArCQkJc2VjdGlvbi0+bmFtZSwgcGFyYW0p
Ow0KPiArCQlyZXR1cm4gc2VjdGlvbi0+ZGVmYXVsdF92YWw7DQo+ICsJfQ0KPiArDQo+ICsJLyog
UGFyYW0gdW5pdHMgYXJlIDFNQiAqLw0KPiArCXJldHVybiBwYXJhbSAqIFNaXzFNOw0KPiArfQ0K
PiArDQoNCg0KDQo=
