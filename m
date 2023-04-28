Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C208C6F0F8B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 02:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C984F10E282;
	Fri, 28 Apr 2023 00:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2352B10E282;
 Fri, 28 Apr 2023 00:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682641352; x=1714177352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yQJyWe6HAicwPDxgt7AMIWX/RXeM0CK1pDcd+GMVzCs=;
 b=T9jZs13++RlfRYqUEyb3Yajl/QwXwAfTBQh8xS3sVFxtuDQ8zlzuCTmw
 qmo8wNhcYWBCv4rRtbOZarDrP5V5uwST1VGHEcUd8huSi4Podo1ychPX7
 ZAj/fh3VOZOszfz8ahGuoM+xH25b8GPVKLnk1I80v+xgf+SDu4Q5Ayo9r
 zEX2i8WM/hYS+N1syGV83VQfnzpmWZnAgofoxmSTj74gfZYylINQRjpaZ
 PgBXgaZBRZ4f2mG1Qu2zHcmVCt2n4uj23kkSy6yfKeABDs9ltuow5o5jK
 eeWSwfEbwfMd6jmXOyb7+g6fAiCQTScAHvREfF/wC32Hiv++dCVnyH2su w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349623794"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="349623794"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 17:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838640098"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="838640098"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2023 17:22:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 17:22:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 17:22:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 17:22:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 17:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Af0aGP7G9MgQdTYn7q5cJJ2D/XFdKio9PsXXE++I42PpWNNv3igaBhHoqgIfRlSL+ivBmiglHJ3ZMXGrB9TlkwRmmlrnCNjFrkEZkhBim5lJRwPQojyT8dJRdYCJiiMKrQZWxg3hudkZGkFkCbrezi60wPTNyFTY57/kphUxFvjpU/ONfgaXvpHMuJjO+0ry5LIQzh1OWkTFZCWb/umv9jurAlFzYYZsk0GJb+2npmcg6QZLbHUNykzExvhgg4+rghtk2uuQAq11S0Yo0zL9HboE3r6if177oNRWf5609/ZFwfGcKPZxgIlYwgnGCa7OsmSJ5ohcZYYHL2EvqAONuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQJyWe6HAicwPDxgt7AMIWX/RXeM0CK1pDcd+GMVzCs=;
 b=YC1NND/eyIrhiVLlL6p7dG2/1MUV9+8Ze4GStOjED8MGdGJedEFJeEJGpjO0pkWhSJ7WNhcsx/o5JuGmbeDOebpkANn4Njqi/RS92BN83e2QLO4JnyQD0Hz6+Uu09D62AYDME6f5DpFiWAPod7Sl4LFiBW2oQ6icHPRJNeEWbpksHcD3tk6nb5oRLmycuNAoxVnyU/m5Zj0nUFEJ3i2py5hMj/VtcyWsvLUvPUNXiwZH5+94yuNqiE6hae3hTGDmMeyfznn/6u9yev0gtwefAN6onj7tBMRvRpGY5AHcDsEfuGvy+4gBlziUTAEG/HA8x9iNQaZC4AjszAj5/H/Y1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 00:22:26 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 00:22:26 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v9 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Topic: [PATCH v9 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Index: AQHZeWLWHJzMk5zv7UiDZKAi/gDyz68/3DwA
Date: Fri, 28 Apr 2023 00:22:26 +0000
Message-ID: <5a769c138fe43118c823e74ee158e64513f87c47.camel@intel.com>
References: <20230427234843.2886921-1-alan.previn.teres.alexis@intel.com>
 <20230427234843.2886921-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230427234843.2886921-4-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB6753:EE_
x-ms-office365-filtering-correlation-id: 004e4957-0d07-497a-82c3-08db477ea51a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CKZqXTwaE7pKLYogah8wIJNZRjb1szVJdRnnhBmHDrxLuBOVmPEzUtFdjGCFKbz7aNUW+FQyvDUHikulwW0OOkguVVzoJPGYjauUb3UBuWfVvjZy444R4ZFoTGP1JMCsmOqomNzNaZ9wT6/N8tgMTtQDTWmJRPtlAYWsmLVHTwVrmNGZPv3QXE7l0UakvaF2Al9jkFar9fi6q1h7dS+sGp09StVsWzviC5grL9t8qDsqYyDUgm+8HOxGNipswZTaM2j5yiIkgxfZLVArwUnoBvtNTwfS6vyNB3aty+xt/qYD9qwrI+OKyv8hxd/D9lgtLZIbNogtKzbaRSD1B0oVosQqJP+nVMF/0VRydtM+El9tmYwjjNv1FIfvWw8fBQHEGx/DvT6dLXJGWMT0mx614dn9B+H2CVuzEh3QK7Okri7c7lt3p+VpaBliHrmw2gQRcRca2axkGnGV/da/j8fqi+zTa29GvkwyZ0PEvlAHt7eT6NseCWAiiJ99DOhcSUhvo9y5GVhxTABRWLIiHGqgolkRASS+bdKjZbo/HikM210n/ldHsod/L2medd8oFPu1fHb76U4YTc0Lk8pdDwP/Lobm0SvD65QNNu/qT+jQdSRguoe8/UAfjf2lCrCRNcXQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(26005)(6506007)(6512007)(5660300002)(186003)(71200400001)(478600001)(54906003)(8936002)(8676002)(36756003)(6486002)(38070700005)(4744005)(41300700001)(38100700002)(66556008)(4326008)(91956017)(64756008)(6916009)(66446008)(86362001)(316002)(66946007)(76116006)(82960400001)(122000001)(2906002)(107886003)(66476007)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFduV0szSkpjaVBueGlRY0NuWW1nUlgrZzVQN0lvYXZpSXo1Q2NqRTAzWnBK?=
 =?utf-8?B?ajdYMzZGU0RGOCs0OVBqV2ZiNHRZdzRPZU5lWEtUeWVJYnovRXRjcmp3TXo4?=
 =?utf-8?B?WnU4SHRyMjRUckQ3ZnZZdXpvTFVlMUxLLzdzWDJhQTVPbmxlYy9UZUZ5dkh1?=
 =?utf-8?B?V21oOXoveU91aTU4aC9pWGh5YUVpdlNtTGhOQnM1RENtOGZPUU9DRG1YVjNs?=
 =?utf-8?B?N0hZc1FDWWtla3Mxcnc3OTlWcUFvWW1BWlpWYTNYdUcxS0FwNDdDZE8zOHpr?=
 =?utf-8?B?MFY0aEpwSkxvQS8xYW93VnJ4Q1B1VTRKQWtSaG1ubExKRWdqbjZXd1FLTVdS?=
 =?utf-8?B?UnVYbDB0OWUyc2dFNkFBWU1ta05oOThMTjVyVERiaWJvTnZZb0JubTQ1KzRM?=
 =?utf-8?B?T2RhUEVUaGlUM2ZyWEVrVFZyREpzT1l6RURMc3BFT1g0SjdwN2pQK1NGQnV6?=
 =?utf-8?B?KzVIS0hmS0ZWZVZqTGVGN0hJV1BGRmt6WGU2bWIwYUtCREhjT3lZNisya1M1?=
 =?utf-8?B?WFd4WDRpMVlsaXdMM09wZW1aT1diSmFzMFhYb1RTYnhaMFB2eTZIZ3BvUk1r?=
 =?utf-8?B?ZVRLeDF4T1g2SWtYRjNidUhwb0pPTjVxck9BQkRpN3NVSUc0Y0dwRXpDUHJa?=
 =?utf-8?B?VHVRZ1pSTnNrMUcwdFFoOVpEMy85T3Zua29kenVYN1p3aDNvQ3pXVllZT1JN?=
 =?utf-8?B?VDZkYzQrd1hYZWdVUXQ5SUoyWVZxUlRhemk4TWpZRHVYaEp6Q0RzVktuQjZ0?=
 =?utf-8?B?REpSOEp6WVZZYjNRTUIybGFLb1JTc0I5cEp0ekxSTzBWZE1LbUN0SlA0ODlo?=
 =?utf-8?B?QWlVMGZoSTdiSkt1ajN4N0hVSWI1ZXNyQTZORjg3ZTk5Y2tpNUkwcy9Cc2E1?=
 =?utf-8?B?M3ZvRlVFWU9mYVRqd3Q4eCs3VUNka0VjK2Z1eEg0aEE2RnBFRmswNjVacUZF?=
 =?utf-8?B?OUgzSU54czlyVDVhOFMvNUlBT2dCZm4zamRLQjZzT0R4T25KUndtSmJpRU14?=
 =?utf-8?B?Q2RLbjFjSk9OTFRUMklVUUdhY3BnMmZZbUlRZDVsY3FCbVRMdzA0aktJK0U2?=
 =?utf-8?B?aVlxK2xVQ0Vqck9oRDhFMnJ0Z0N1SWw4YXVYdHNtVVVtQ3RlZytZQ3BIQjhh?=
 =?utf-8?B?NEc5T0wvMEdLOHUvcTVxa3RBQzFoczRrZWxaSUlGRk1NNGJEYUltYXRLanVY?=
 =?utf-8?B?QmZlTjVqa3huM2Fva2xMVDdUS0dyajBzMGZ0amxJdnF1TTY5SVlUVEZETXNH?=
 =?utf-8?B?eG1tb0pPK1h0UktSQkFvQXJpWjBia0llcE53eVRZMWdNZEhrZTdLVlhoUkFo?=
 =?utf-8?B?SndveTFTSE1QamN0OS84R2d0anhCU0RSd1R0QjNGK2dPbmNZb2cxeVRMemJW?=
 =?utf-8?B?ejVQcjVvZXBGQWNsTWxRelVySnNEaHFEdUpnQTJPTjA1V2xCaUcyT2w0UVMx?=
 =?utf-8?B?QUVEbEoyYVZHVEh1WW10cFVRaXpmcVRBR3I5NzVvN2xPSnhNUmZxcnd5OWwv?=
 =?utf-8?B?dDFLcE5iWFNoSlBLcThUUjUzYkh4NU9uZWhweC9pTkhHLzRVSU5Ja25YbitV?=
 =?utf-8?B?OEpOZlEwRmNuWk9samlBRGxBN0pteGZoQUZ0UXhaYmV3Slh3TGh4YU9TVnBP?=
 =?utf-8?B?dzF4Zm05aW9LUVVIbTN1Z2dPYUhNTlNsR2Z3MS9qVUczVjljUHdYRCtjNGVN?=
 =?utf-8?B?akhSZWREQzVsOHJtbFBUZEhpTzc3cXZVYmZ0M3UvdThCaTkzYWsxOVZDZE5F?=
 =?utf-8?B?OTlvN0NUbW9mOVM3UWxUTStpZFVHaStuaVhIMmdDSUlPMFhaWmE0RHZNWWVh?=
 =?utf-8?B?bDByUCtpRjZZa0Q3aEFkbkVPMWxNTEJNWHdUWGJBc0Rtd2hHUmJScmtjRkFm?=
 =?utf-8?B?K1JPOTBSNm9iMzRBSmN0Q00rRWY0ZlhvZTFwSTg4dWc1VzhyWXRBYitKS3JW?=
 =?utf-8?B?cEt3TmVKdlhCUmU5eEZqWk9FbjNQVTRmcjI0Z2xOUXpYL3F6SWJjSFE4YjYw?=
 =?utf-8?B?SUdsQlMyQWFHcXVhbU5Fb1pJVjFiQWxiWXBOYzJxSlVNbTVFWmpzWXZrTTM2?=
 =?utf-8?B?bjI5bE1LWWJhOW9xTG8veWhiYnJQcnVxRDFXeGNVem5wKzlIT0t1ZUNZZjZ1?=
 =?utf-8?B?bmNja0E3c2txSmZVQUtBZHhBTWRWaXh1ZlQ3Kzd6K0ZaZHg5VXFNRXZtWEpH?=
 =?utf-8?Q?mqF/4TqfUVixkpUHShwl1mM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <920439A38D5E274FBA057FE67094AA1E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004e4957-0d07-497a-82c3-08db477ea51a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 00:22:26.4480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gfl1QaM1B9R/8uVegDTdgrMAHfPyEJ8gZmFpMMeoKm/WfC+Jbyq6kBjdFj2JvWbyrsDg4q7k8ObPSGw8ysVUV8KljI26exYKhYoX5X8MvJBWIpQx8BK85kzVHxjfAL/L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Landwerlin, 
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTI3IGF0IDE2OjQ4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBZGQgaGVscGVyIGZ1bmN0aW9ucyBpbnRvIGEgbmV3IGZpbGUgZm9yIGhl
Y2ktcGFja2V0LXN1Ym1pc3Npb24uDQo+IFRoZSBoZWxwZXJzIHdpbGwgaGFuZGxlIGdlbmVyYXRp
bmcgdGhlIE1UTCBHU0MtQ1MgTWVtb3J5LUhlYWRlcg0KPiBhbmQgc3VibWlzc2lvbiBvZiB0aGUg
SGVjaS1DbWQtUGFja2V0IGluc3RydWN0aW9ucyB0byB0aGUgZW5naW5lLg0KPiANCj4gDQphbGFu
OiBJIGFjY2lkZW50YWxseSBmb3Jnb3QgdG8gY2FycnkgRGFuaWVsZSdzIFJCIGZvcndhcmQgZnJv
bSByZXY4Lg0KUmVwYXN0aW5nIGFzIHRoaXMgcGF0Y2ggZGlkIG5vdCBjaGFuZ2U6DQoNClJldmll
d2VkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50
ZWwuY29tPg0K
