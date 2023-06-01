Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCD071F57B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 00:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C158710E5E5;
	Thu,  1 Jun 2023 22:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1654C10E5E0;
 Thu,  1 Jun 2023 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656831; x=1717192831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YvCLEOu5q5uUgOHzr2nIya4PmkYw4Z20jLsc93UtEtA=;
 b=Pc/nf+ga7JDpyxyTFEOqbVT2WDonbRH+Hcgy1GpgRqdnXKa0JzCFBaJg
 BQNqRK+CrpwbpmKq10Mf3uMehjL264YPhzkyUbZ9VT3/tM1frY5TI9g50
 emil1inpQnZe7nJ3wta6hyezINnP2D3/AavpqlJzqEgJNI6Sr/hyXO9cW
 mjnh5ZBfqddN14KjMTRaZwdiu9lW2EUk3LSu9tn/QcAdP7O5lxrBSDj3V
 E4Wc+ZlSq+ErEehZkWCVBLoAz7YuuX44a8uF5gHpV9NGFFGdHRgEJsr8E
 87xyn/xzbxhzFyqVguoONPR7or+Z3m7mX+MXkzCglr1AFvu7AYZbd7SsY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="355713501"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="355713501"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 15:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777387326"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="777387326"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2023 15:00:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 15:00:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 15:00:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 15:00:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 15:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiOXrqcznDTjkwyiFPQHk5YSDkQLrFjRNpXdi5WxfzWqhb986bCQYhcH8jEH24hkj4DhQ+KVMkgT8AcjfpYp4LcmftUqbwl5G448HPf3KcCKXVBrYe1YsvODpF00VIlI50ATuADepdrpRIwQXzo4kGFQm8uc13ycnk0EWP4W8YT4Q+eR2L+vKX+5aMY0n0hiZZL2ktb6FUqP11YBTBNzdDgpTo+VodqplArmGVpzWzeACQI1E4Ud3Ua9DYNTV4o117UnHZ9elyEPtwGaOwXTkU7QRpWIcdNp0MXES0sx8btLsIS1c/bEi0TFaBn6UGgBbJjMcOr2r2PMYgZNXH8hCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvCLEOu5q5uUgOHzr2nIya4PmkYw4Z20jLsc93UtEtA=;
 b=W/zfP4G2kqs8OB7XEiE7CESKPGu+l0/SwBh7klK7P/IPQKrlQFZWsKFoUBm/QqLSp1DihcH9467uUDgC4mYaWIz+30KnAR9jp2VxCrapBQubhWebWq3PT6qvJGx7v8cb35d7Cv1k+DGzw7MAhFVhVMSyivwD5JghoIUm61kr5+omjOKn7JptnwSJJBO/z33H2Z3vyOPVWptPX8plHzLDR3OniEK5AIPKYM33c14fdIMAWU7qkSuxQY3RYeA9v7fvwVmx1NX7MSv6Aers2tInxjxSbqbN1KvGM2QMGUbAIYkA9RMZ97TyT+TagnlKG/8th9EnWNH4FuN+Lxo2HKUTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN9PR11MB5388.namprd11.prod.outlook.com (2603:10b6:408:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 22:00:27 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 22:00:27 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "arnd@kernel.org"
 <arnd@kernel.org>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: use correct format string for
 size_t
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/pxp: use correct format string for
 size_t
Thread-Index: AQHZlNErgcp0owLrw0GI/n494DzXCq92f02A
Date: Thu, 1 Jun 2023 22:00:27 +0000
Message-ID: <a97c3bbb260587a352a6d8d228e65cc6ae8fd59e.camel@intel.com>
References: <20230601213624.3510244-1-arnd@kernel.org>
In-Reply-To: <20230601213624.3510244-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN9PR11MB5388:EE_
x-ms-office365-filtering-correlation-id: 90448e6c-f3f5-4832-c496-08db62eb9bc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zi4XE2ZCsLOXM3lcdbMR6a+FNX3Ib91Sk3miS5QvGKArOgdUOCPeHOu18tnRIKbYsO9gH8vp10LqIa0olkFH8CSJ6n4i0tdmBIi+F60532WWiV4KRN9BYgFq1PLXSA1nxeH8eE/JrK2emmUBZPdehPMAoJ38HTD1n5cRSFCoIvOnhvECYdA/1XnzWm7e7M0Gsf09hs7Kr+mkMRJ+2w7UceJaKPoLgYoZ+EMx2Tc/iqY3fh147nwtC7Ci+V/6lUvHEuSoj8bzrt/qIJpakP8l74CmiAjiPMrsNd8WIJ3F8qZj2eK9T6w8ooQfqFFctMXysI4H8hjtO7P3iIOfyGT7bUeQ1A7VUX36vk1QfQPXxhh1+rmGhKIaRZR7LVJrspXrdI50u+8iXCII67MlGK974Exsj+JuzVStZbtBiEiE9mJYNp50EB4zdGN42v0XDxS7DSiNeEv1zRBB8a2eVp62vZDsnOq8tms/VSOvIw0JwNToHBat5xyfqtcphTDXQP0MmL+aLQIXzLiubPS7QXda7eGw2vS2KBZ5Xh/nUxN98tvdzRL1ERC9k6mWVn8OiftVa3shBaXiJ5yPTstdh+zpB8NKfSt2hvR3CVI0r1xq1wM0Y3eJwCqgsKMVu2zjLg/t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199021)(36756003)(82960400001)(38100700002)(122000001)(86362001)(38070700005)(8936002)(4744005)(7416002)(41300700001)(6512007)(5660300002)(26005)(6506007)(8676002)(66446008)(186003)(2906002)(2616005)(83380400001)(66476007)(66556008)(316002)(6486002)(66946007)(76116006)(91956017)(71200400001)(110136005)(478600001)(54906003)(4326008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckk3dzNudnROOEx4bjRDb0R6ZCs5c3c3NUNlcG1KS0dsbkpwQmp4WlhpMlBp?=
 =?utf-8?B?RVdOWU5PLzU5dkVXNmQySUY4eXpGV21nMUxLWjE1Qk11REc0ZElhRmdvTG1z?=
 =?utf-8?B?Nit2YUZjdWd0L2NXNFNIY3p5dDd5RkRoM1A1SmQ2VXdKYmNmMmg0QlVlUTJ4?=
 =?utf-8?B?azBlKzROeENDcWtCaHZPanh3SUpqdk1GemxkZmh4M1d3SU5Eb3RNYnFEZ2Ja?=
 =?utf-8?B?VHBmVkhNK1hRcVVDZGw1akp6c1d3SFN6Ymo5ZE1VNVlpcUpQaVpscWlSdnQr?=
 =?utf-8?B?QldnbGNVL1p1ZEpaUDgzNWlWMmVoQ2c5d21mSjFLNUtkUlUrdW9PWkp3eXk4?=
 =?utf-8?B?RXpIWWRZa1hzSzZSMGVNYkdXSnRJOWZYNExEdkozanl2VEhhNXU3cm1iK3N0?=
 =?utf-8?B?b2dFc2xRQm9jZEpSdlFYWkI5OHlYMkhCYlFyRUFkSnBLZ3lXc3crY1JJQjIw?=
 =?utf-8?B?aE5wWVRPc3VacFh1Ri9VQ1JiWWtIRk1jS2JGRWVIUE8xTThhcElZdFVLcGJV?=
 =?utf-8?B?eFI0cUl1dHZ5dmk5V3ExNHJRZllTYTNnck9Dc3hhZ2hhWVpGMHhCbzEyWHoy?=
 =?utf-8?B?dloyMFREVXRuSlA0L0d1VFVlODZhelVtZmFUS2U1NlRwRDZ1Zk91S0oyUGcv?=
 =?utf-8?B?YXI0U25DejIwR3VCUDVkVjBpdlI0Vi9sMUdqZHFaekNnREphWTd5QzRsZ0x1?=
 =?utf-8?B?V0ZOVDN0SmxXR2k0MldKK2pNNjNDb3lyVmd5ODZVM1J3VmJWaDVLU09rL21p?=
 =?utf-8?B?SXI4dFlGUlJiNVJHWDUybW9XSlN0UjdSNFRQRU15LzgvT0RtbkpEUmVqSXdx?=
 =?utf-8?B?ZVNab1dpMWpMejBlL1dQbTF4cnMrbEpDQ3l0dFhLd01kSUVRWE5FZGIxa0JU?=
 =?utf-8?B?WE53OGsycnlFTWh5U2VDUWVwTHhCZGdnNHhjZHk0UTFOWFpDR0kxTmFtN2RL?=
 =?utf-8?B?VVlkdHVlRU5od0ZsN3lvR01aWnlXVWFwTmFkb011TlVnSThBcmVSSlFNMkE0?=
 =?utf-8?B?bHZiTVNweCtReHFEbXRicWFjVDNaaGJoNXpoWVZIZE13K2RpVmNleXNUQ0p3?=
 =?utf-8?B?SGpYakZXOWdQL2dWRHNZSUtGRERZK2pkS001cUJyS0h6WFZKTmMrMTlZdnFj?=
 =?utf-8?B?KzdmUlA2NUU1TzQ1emtla3k2cEJhLzhGanppS29rWlZpTURZaDFyRGYvbWxW?=
 =?utf-8?B?V2lDNlJNQzRlbWdsWEllVllPQ0VabVpDbE14bE1EL3djMDFic2NjYkYxQzlT?=
 =?utf-8?B?S09tN3BjeG1CSXVKK3ZLei9kVVM0MnJLU1dDeTVXdTdxdXB0ZTU4QVp3Nkpz?=
 =?utf-8?B?RUxWLzhJZlRyS09nU2syKzA3dm4wbHpDZi9lRDUvK2lFTG1Xa1lNYWYrWWFZ?=
 =?utf-8?B?U1l6alVUaWJpWEczSE1oRExXVk1QZUN3alhaaDJjYytsRzZZY0RjSFEyM1VY?=
 =?utf-8?B?eEhTTjZxWlBGcjdrWW8zRkRhdjdrbCtTSGdiUFNpeEtEL1RUa2g0SWV3c3Vs?=
 =?utf-8?B?TDVoUDEyWTcwTUFWeUZ2MHh6V1VGaDNKb2VyRFNLTS83UndVNUdMdk5kUDh0?=
 =?utf-8?B?YzhnWStGaHJXSlkwNVc0dENPY1Fwd21WcXRJM2ZXZWY0cG9waWxYQ1J5Kyto?=
 =?utf-8?B?MEZqZ3lUY2crc1pQVzVSSmNEd2Z6S09yYjUvZzdlRlJGb2M4ODNUYzNWUG9L?=
 =?utf-8?B?S21iMEtkMVVTbUEycnUyaEJDeWRGOWVKTW5GMW9ET09zeGlQekF1RFRiWEtr?=
 =?utf-8?B?Z3RkdWpWNXhzdUtRakdVVGg5VHcybnBMcjFvYXlWZkpUbnNGTEZ4K1VRdTNq?=
 =?utf-8?B?eTFlOEFvd1g3QkJ2K0lTZThibzFrd1VSSDQzN2dmS08rMk1UaVRMVjBpdnZn?=
 =?utf-8?B?RkhJelYwa1hlRnpYTWZwNEZYckhxU01IN3h2cExQWjdZNGtFZTQ0cWdVdHUx?=
 =?utf-8?B?ZWxIQ3ZxdzJ5YmV4RTVhRmlQUU9BNlBxMDVDRFliREltQ0FLNmhQdkc0K2dG?=
 =?utf-8?B?S1VyRHNzbzRCRlJrbG5zMmV0VW1yNENiUVVKRjhxVHhocGFzU0xXVHlpRUxW?=
 =?utf-8?B?TzczRHBMQUE1MkJObU13SEViank5T1JnZHZuOGJycXF0V0JhZmtPbENra3FK?=
 =?utf-8?B?S2hIOVJDRHNVTWh5NXBSb1AwdkZqRzNpcmFaZTdjbTdVRlpYZEtFVTA2d0NC?=
 =?utf-8?Q?rcjqXgnitvPdh2QP3N1jpBc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CDB40787BA4694AA3B6EFDB8EA4D5E3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90448e6c-f3f5-4832-c496-08db62eb9bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 22:00:27.3419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XnVsNHx5a6lmhzR1+QhJ9COWCewRSoRsxkudiSE2pu/tGbMQRAV9NAbotnZH/SecY98eikHQhIHNKsl7sIUsT95natWm+A+ltoOV+KJtJ4rEPnTNoExKuh55qchw5VsQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5388
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
Cc: "arnd@arndb.de" <arnd@arndb.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA2LTAxIGF0IDIzOjM2ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gV2hpbGUgJ3Vuc2ln
bmVkIGxvbmcnIG5lZWRzIHRoZSAlbGQgZm9ybWF0IHN0cmluZywgc2l6ZV90IG5lZWRzIHRoZSAl
eg0KPiBtb2RpZmllcjoNCg0KYWxhbjpzbmlwDQoNCg0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9weHAvaW50ZWxfcHhwX2dzY2NzLmMNCj4gQEAgLTE0Myw3ICsxNDMsNyBAQCBnc2Njc19z
ZW5kX21lc3NhZ2Uoc3RydWN0IGludGVsX3B4cCAqcHhwLA0KPiAgDQo+ICAJcmVwbHlfc2l6ZSA9
IGhlYWRlci0+bWVzc2FnZV9zaXplIC0gc2l6ZW9mKCpoZWFkZXIpOw0KPiAgCWlmIChyZXBseV9z
aXplID4gbXNnX291dF9zaXplX21heCkgew0KPiAtCQlkcm1fd2FybigmaTkxNS0+ZHJtLCAiY2Fs
bGVyIHdpdGggaW5zdWZmaWNpZW50IFBYUCByZXBseSBzaXplICV1ICglbGQpXG4iLA0KPiArCQlk
cm1fd2FybigmaTkxNS0+ZHJtLCAiY2FsbGVyIHdpdGggaW5zdWZmaWNpZW50IFBYUCByZXBseSBz
aXplICV1ICglemQpXG4iLA0KPiAgCQkJIHJlcGx5X3NpemUsIG1zZ19vdXRfc2l6ZV9tYXgpOw0K
PiAgCQlyZXBseV9zaXplID0gbXNnX291dF9zaXplX21heDsNCj4gIAl9DQpUaGFua3MgQXJuZCBm
b3IgY2F0Y2hpbmcgdGhpcywgYWx0aG91Z2ggaSBiZWxpZXZlIE5hdGhhbiBzdW1ibWl0dGVkIGEg
cGF0Y2ggZm9yIHRoZSBzYW1lIGZpeCB5ZXN0ZXJkYXkgYW5kIHJlY2VpdmVkIGFuIFJCIGZyb20g
QW5kaS4NCg==
