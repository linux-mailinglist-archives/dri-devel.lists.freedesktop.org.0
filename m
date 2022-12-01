Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C102063FA3D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2181210E678;
	Thu,  1 Dec 2022 22:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0934B10E182;
 Thu,  1 Dec 2022 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669932201; x=1701468201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zSeEUoZFIagpwlwR3bwq7MYr/Le8Dmp3vbIkdGIXD1U=;
 b=Q+1irUbep4vHZ7gjl7u0N6HnYaHOaiJku2mK9qusHgwyreoESmrm5htL
 HkbIceUkojX0zbePf2CZG0qZclYrgeSaN2d3tEoUIB4ZIXBKYeG8iw+gq
 saTQbZtHQtsgVdWJ8RAMRVANVsx6aLfgriWFm5xNnGerpVU/JHxQ3JbIe
 UmbfLLIMAdVFUJ3XA8eSlL+7Fn2H9k9PLYqHAQEu1WJcNRclI2cbCEoXE
 q2WX36ioc9f863wSET9AGX7O/TkHmgDdpQ/DqiHIZ9Ulj4cUzVKbA6H5o
 orQK6OJTQ/hnvqI5EYgccEV4SsHSXNjJh7+0Q85C2xsNNJVS1H1TJGpPa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317676475"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="317676475"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 14:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="769388905"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="769388905"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 01 Dec 2022 14:03:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 14:03:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 14:03:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 14:03:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF3g3GKl2uHV0Yn2xdVTOrspQrlH1jCHOmI0F5npt5O2OY9vCDNgzJcdNT7Rv6yC44/xJLeLLF26z4TIfJdFdzWC8ES2WR7RP0dDfO4LqiFHqVw+kjjZIuvH2p2c6mNIm/J5BS6DZs6wmHvp9WnTw3fbqMUGUd1rgjL5Mec3d2bRJ6SjG/qWW2Bj2oX+J5qYgZKhSLJaaGxIrnuhBdtPsWzr6e1W32Hack0kh6AqD739CyTzDCDfc9iIZLctKlU73M2s+kqbhd/hl9CwfVJ2lcUEOyLFgAno0APtyd9SIFa+rT2kyG7ptHAFqSNgKGei4HNYkpLZocSlQGiRLG5urA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSeEUoZFIagpwlwR3bwq7MYr/Le8Dmp3vbIkdGIXD1U=;
 b=nTzTq/Uhao3xPNwbrGAbElMVy02G0r9dyRYsnOlZs7xEG6R04wgLwQIrBvU9OJ7/YX6HKDBqYWr79xnp1r8cWhPd7ToAMgpyGqg8Oq8i1qTUT6MBum12V23h/f//wgW58PYGoZ9rQ2dYVjJRJD2abUC1mzvJTX7PepQFTNwnQDpVNH2sxh6ksSowHtdN94oqplnSQLM6le2CEZUq0Tmwc+Z/HYzNYjbb6ncYRHOhexU4L5ECHXvdPBgF75zrIvGoQEvdnTG7RDfRk01Ipwe7FKPd+ssSU0yoYr36foCYH5+UZvIOciyPm2HEgUTsJGgH4rNPBYqymqX5LxzV6SR3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 22:03:01 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::e46f:38fa:b467:fd91]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::e46f:38fa:b467:fd91%3]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 22:03:01 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 0/2] drm/i915: Remove frontbuffer tracking
 from gem.
Thread-Topic: [Intel-gfx] [PATCH 0/2] drm/i915: Remove frontbuffer tracking
 from gem.
Thread-Index: AQHYuE6VbohteNGZJUu6OEMpSNkvkK5aML0A
Date: Thu, 1 Dec 2022 22:03:00 +0000
Message-ID: <3ec4e382c67ff7d8a1eb05e27b0fbf5fd1e272c6.camel@intel.com>
References: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|IA0PR11MB7283:EE_
x-ms-office365-filtering-correlation-id: 20b94ae1-6fc5-4fdd-4d02-08dad3e7d02e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WJWGZ96KO4+XYIjCXeyqMN0/M9ciG2teZHlqpRz/3vEJjgDbqpA2U8GxVqmSl4KjdL/gHhEqsEE1jJS3hkDa/ZleIWd7q+WP5XbiHdyfl7+dIitsR5tYf6OTM7Lg4Z24VCsoF6bzo3XD+3egoLuvDG7JZWxmKo8FcjwgiGuNQtRj33tHjb6afbnSJoWgozo7WnQulO4p/CjrJGCwFeJddzGk+4pQcbz0TuS6GGt9UyVzbfA6Cd0f30yhKgkK6uNNqYcS51N3b2Wkd9z0m05KoREonjziXazGTJsKgngI4ZKDq8xbt1S3MiutR1dBNQSrIJcEAdlU0GF7Nx+xxIk+1hdH0TD70MtpzBwGMz9T3QeodW66cv1IsWo3n0LO6mksulvV4bS8oNauYl2iLeuNRraHEtIiWZjBDpmmtTJd8d+yDAhSzXj99leMhJ7UZ6qaDjSuGM90+lYDtpVYOArhPQ9A8dyvXBo8hne+vMUajf6QK39I56T3Kt7rRRLXhP5OzYLdv/QdMLEHoXUjQuSf7KTaOfFJ70JhnREJld86obk86A/5hIrku9jQvDpe4++hGBx8vHfIgwMS+4FXt5WsVvH4zUmvQn00BRO3AptCLq3QTo2QFPIuUAkaAV5OpSM9l407daJh9ApCXaid6rhN6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(38070700005)(36756003)(82960400001)(316002)(110136005)(86362001)(6512007)(478600001)(41300700001)(6486002)(66476007)(4326008)(966005)(2906002)(71200400001)(66556008)(66446008)(64756008)(91956017)(8676002)(8936002)(76116006)(5660300002)(66946007)(83380400001)(38100700002)(122000001)(186003)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDF3Tm41RVkvaENIejFsVnVFVDA1UUJ4T3VBclFGZFk3eDA5ZW9aNDlLeVFP?=
 =?utf-8?B?b0pEcmQwQ2g4a3lDaFo1UTJRczhKZ1NxQ2hpb2hKajIycWNHZzdYd1dpYkhm?=
 =?utf-8?B?Sk9kTkcxdnpQT2pJcXVLRWxTYlozekNidlVtZUVESStxajVHWFNRUDM2cVM5?=
 =?utf-8?B?ODJMOHJ4ZnVrQXRybWljREtmNnNLRklkbmE3S3pnK0cyY0xSSTB2ZVhBWHRW?=
 =?utf-8?B?ZzhFUFJUZDNHeWtyQllYZEU5QW1JMWpNNHdxNGV0Z2tQMkxSeHQ2Z1kzcGxt?=
 =?utf-8?B?dWNpZFpWc3dwdWYwTVRJc2hpcGw4K0xTWXNNWjBQUVZVZjJiaHlkQTBtb1Fu?=
 =?utf-8?B?N3pKU2VudFVPRHVBdTRkUUZMWnorbkdHRStLQlh1K2J5RmFjNm9BUTFBZ3JG?=
 =?utf-8?B?SDY1OVVweFFxQmEvYWlpTkJaaW9Ea3lWTzBxMlROcGhLVzN5dll6QTBLZGtr?=
 =?utf-8?B?ZWZQVmhCL3QvLzhvdzJQTkRCY205Uy81NjBLSE84c3k1SzQ2UUdRMHk4US9C?=
 =?utf-8?B?RExZVWtGNHM4WXB2QjdyZjlSWVc0K2dEQmhVZE8wMkpzR0dtSDgwelZYeWJr?=
 =?utf-8?B?ZnQ0NThZVzFGMHFpV0pyU0xoL05nQkgyUmhoK0dsZFNkblNZTEp0bVZLNWFE?=
 =?utf-8?B?TzJLQ0FpeWVkeWRabUFBSnNaRzlZQ1l3Zm1aaXhHaGdTckNIeEhTNnovV1pP?=
 =?utf-8?B?NlJFSkNTSDk0VEErRlFkNTA2cDd6Vk9PN0I5ZlZJMTNBQ1dLbG9mNFRTOUpk?=
 =?utf-8?B?d2VrRTA5a3JmaXJtNFVFSnNwU0ZSeWRMd1c2Sm9KekI3eFBiTWloSmxOem0x?=
 =?utf-8?B?OXdWM1p4VkdoSHJwbXpFY1FWMGRWNXJDeWxWdHFoYlJ0MXMvUi9ySXNveWlh?=
 =?utf-8?B?WWJIQ05mK2tUWE5jWkFtTmhrdno2R0JzVzM3MHkzb3FJbVh3NjRxeU4vOHB6?=
 =?utf-8?B?cXBCekIxZ3A4WjZYYjVMbmJTQWRMSUlNb3Y1bUdzdEdROUVrSTNhM0xEY3k5?=
 =?utf-8?B?SlhJQW1Xc2p0UlV1R01TWVl3SFZBNENOTWRMdGRPd3RWc0hlekVFZVBqZWFZ?=
 =?utf-8?B?dWRlZzRPb1Q3NEZ2a05xQTBZbjduTHM3aTdSNUV5N0VPZjNaZGZHb0dZaHRL?=
 =?utf-8?B?UkovOUxqRjJPRHc0V1prZ0hxZi9FcEEyd0RoMG1uazZTZjlDTEJLNjI2RzhB?=
 =?utf-8?B?ckJnbmFVTUVCUDgvcXVSZXBSdStYQy9tbjh0Rm5tT3VicVJyT2xHNzlGQlFj?=
 =?utf-8?B?a3lXczlhaUFLbEFhbC8rdDByNGJKdzRtcHVSbnpHdFc0bklweEIyN3VRQVY0?=
 =?utf-8?B?cXg5Ry9yNDh2MmpJZkxiWVpERThuWHV6VjlMejRwclQzbGttL0VBaFA5U2h6?=
 =?utf-8?B?eS83M1BEcHFyV1ByVHp6c0FrRm5tR1hDY3ozZUcrRVllSVVPUEMvbFkyY1dP?=
 =?utf-8?B?aHFnQTJpTjNmWHp4eW9SMHdUbitIOGVQckNVNVBqaW1wTmFTWXRDaWFZMWYr?=
 =?utf-8?B?Sjc1ZG1JSzFTVVY3RGNtVlM4NUxSaUpaSmdMaWNFLys4T1J2OElmQ0dwdCtn?=
 =?utf-8?B?VFZPLzRjZXorT3pMeHBDelJCUnJ2M25VQWZmRzNDU05mWTRZaEtwSUF0TVVX?=
 =?utf-8?B?MzQ2OU44RythSUsvL01FbzBQckFRNXNvMlRSdTBTZk8vcUhJZStIR0RscGgz?=
 =?utf-8?B?WEU5UDRPeUlYd1hMc2k2TzJmVlViVS81c3FZUVBPQ0VMV0ZTbG1WWnhFb3lZ?=
 =?utf-8?B?amswWUlzYjVtMjcyWDFmSnJmL2YrL0U2MWwxMlNnL05LdksvLzd3ajJham1r?=
 =?utf-8?B?aG1GY0R5RS9iNTA3eHVkZmpWaUEya3VKNzB5bThDSTU4Wm1sV3FhOWs3bHQ0?=
 =?utf-8?B?QUpxdHZ1bVB2UnBieTVFZXk0LzAwc3RCcTZUcWhqZTBBM0hUdWpXOUZHMFh3?=
 =?utf-8?B?TTNjTG5vUUhWcE9EeFd0U0Rud3VjQXEyNXdTS1FybWVNL2N0cFRmR0pkR1l6?=
 =?utf-8?B?c3ZBUnBWZHhFNktZWU56QVkra0FqRmdnckFjeWp2ODA2RTlKU2RGNm5KUkU2?=
 =?utf-8?B?S25YOElsMW1yTjExak9HcVhKRStpOFJvM2JIMXhSVm1KVVNCQUJHM2d5ajB0?=
 =?utf-8?B?WktCNkdpUTVxV2xxZmltS2pSa3AyY3RLbGZRTUg5L1VNYjRpM1g0am9sN2hh?=
 =?utf-8?B?TVplMVdGbTBjS25GSkViR0szZWVsb2QrcURGY1dkMDNQYTFUQ3dHb2RaY0xo?=
 =?utf-8?B?UGh0dng5c3NzajJzT1U4ZTdLbVpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <493552A9FD480B4D9EFF64DBE6D60462@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b94ae1-6fc5-4fdd-4d02-08dad3e7d02e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 22:03:00.9323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pINnRBjlJ0Op07Wj4IlZk2xNPhHsgTmyslRWQuhI2QM23MS9zos4vgUg9gLrSFROmWZwBe53/yc6eXSo3Capd8AS55rgCoa05D4FmtyyplA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkNCg0KSSB3YXMgZ2l2ZW4gYSBsaW5rIHRvIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTExNDk0Lw0KYnV0IGNhbid0IHNlZW0gdG8gZmluZCBpdCBvbiB0aGUgbWFp
bGluZyBsaXN0LCBzbyBJJ2xsIHJlcGx5IGhlcmUuDQoNCk9uIFRodSwgMjAyMi0wOC0yNSBhdCAw
ODo0NiArMDIwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6DQo+IEZyb250YnVmZmVyIHRyYWNr
aW5nIGluIGdlbSBpcyB1c2VkIGluIG9sZCBkcml2ZXJzLCBidXQgbm93YWRheXMgZXZlcnlvbmUN
Cj4gY2FsbHMgZGlydHlmYiBleHBsaWNpdGx5LiBSZW1vdmUgZnJvbnRidWZmZXIgdHJhY2tpbmcg
ZnJvbSBnZW0sIGFuZA0KPiBpc29sYXRlIGl0IHRvIGRpc3BsYXkgb25seS4NCg0KT2ssIGJ1dCB0
aGVuIGhvdyBjYW4gdGhlIEtlcm5lbCBrbm93IGlmIHRoZSB1c2VyIHNwYWNlIHJ1bm5pbmcgaXMg
YW4NCiJvbGQgZHJpdmVyIiBvciBhIG5ldyBvbmU/IEFzc3VtaW5nIGV2ZXJ5Ym9keSBpcyBmb2xs
b3dpbmcgdGhlIG5ldw0KcG9saWN5IGlzIGF0IGxlYXN0IHJpc2t5Lg0KDQooY3JhenkgaWRlYTog
aGF2ZSBhbiBpb2N0bCBmb3IgdXNlciBzcGFjZSB0byB0ZWxsIHdoZXRoZXIgaXQga25vd3MgaG93
DQp0byBEaXJ0eUZCIGFuZCBhbm90aGVyIHdoZXJlIGl0IGNhbiBldmVuIHNheSBpdCB3aWxsIG5l
dmVyIGJlIHRvdWNoaW5nDQpmcm9udGJ1ZmZlcnMgYXQgYWxsKQ0KDQpBbHNvLCB3aGVuIEkgd3Jv
dGUgaWd0L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZywgaXQgd2FzIGFncmVlZCB0aGF0DQp3aGF0
ZXZlciB3YXMgdGhlcmUgd2FzIGEgcmVwcmVzZW50YXRpb24gb2YgdGhlICJydWxlcyIgb2YgdGhl
DQpmcm9udGJmdWZmZXIgd3JpdGluZyBjb250cmFjdC9BUEkuIEFuZCBJIHNlZSBvbiB0aGUgbGlu
ayBhYm92ZSB0aGF0IHRoZQ0KYmFzaWMgdGVzdHMgb2Yga21zX2Zyb250YnVmZmVyX3RyYWNraW5n
IGZhaWwuIElmDQprbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcgcmVxdWlyZXMgY2hhbmdlIGR1ZSB0
byBpOTE1LmtvIGhhdmluZyBjaGFuZ2VkDQp0aGUgZnJvbnRidWZmZXIgd3JpdGluZyBydWxlcywg
dGhlbiB3ZSBzaG91bGQgZG8gaXQsIGFuZCBwb3NzaWJseSBoYXZlDQp0aG9zZSBydWxlcyB3cml0
dGVuIHNvbWV3aGVyZS4NCg0KQnV0IHRoZW4sIGhhdmluZyB0aGUgS2VybmVsIGNoYW5nZSBleHBl
Y3RhdGlvbnMgbGlrZSB0aGF0IGlzIG5vdA0KZXhhY3RseSB3aGF0IEkgbGVhcm5lZCB3ZSBzaG91
bGQgYmUgZG9pbmcsIGJlY2F1c2UgaXQncyB0aGUgcmVjaXBlIHRvDQpicmVhayB1c2VyIHNwYWNl
Lg0KDQpJJ20gY29uZnVzZWQsIHBsZWFzZSBjbGFyaWZ5IHVzIGEgbGl0dGxlIG1vcmUuIE1vcmUg
c2VudGVuY2VzIGluIHRoZQ0KY29tbWl0IG1lc3NhZ2VzIHdvdWxkIGJlIGFic29sdXRlbHkgZ3Jl
YXQuDQoNClRoYW5rcywNClBhdWxvDQoNCj4gDQo+IE1hYXJ0ZW4gTGFua2hvcnN0ICgyKToNCj4g
wqDCoGRybS9pOTE1OiBSZW1vdmUgZ2VtIGFuZCBvdmVybGF5IGZyb250YnVmZmVyIHRyYWNraW5n
DQo+IMKgwqBkcm0vaTkxNTogUmVtb3ZlIHNwZWNpYWwgZnJvbnRidWZmZXIgdHlwZQ0KPiANCj4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5jICAgfCAgIDYgKy0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyAgfCAgIDQg
Ky0NCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggICAgfCAg
IDggKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmMgICAgICAg
fCAgMTEgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMg
ICAgfCAgIDcgKy0NCj4gwqAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZm
ZXIuYyAgfCAxMDMgKystLS0tLS0tLS0tLS0tLS0tDQo+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Zyb250YnVmZmVyLmggIHwgIDY1ICsrLS0tLS0tLS0tDQo+IMKgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9vdmVybGF5LmMgIHwgIDE0IC0tLQ0KPiDCoC4uLi9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3BsYW5lX2luaXRpYWwuYyAgICB8ICAgMyArLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgICAgICB8ICAgMSArDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NsZmx1c2guYyAgIHwgICA0IC0NCj4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG9tYWluLmMgICAgfCAgIDcgLS0N
Cj4gwqAuLi4vZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMgICAgfCAgIDIg
LQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuYyAgICB8ICAy
NSAtLS0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuaCAg
ICB8ICAyMiAtLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3BoeXMu
YyAgICAgIHwgICA0IC0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jICAg
ICAgICAgICAgfCAgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggICAg
ICAgICAgICAgICB8ICAgMSAtDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYyAg
ICAgICAgICAgICAgIHwgICA4IC0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1f
Z3R0LmMgICAgICAgICAgIHwgICAxIC0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Zt
YS5jICAgICAgICAgICAgICAgfCAgMTIgLS0NCj4gwqAyMSBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspLCAyNzQgZGVsZXRpb25zKC0pDQo+IA0KDQo=
