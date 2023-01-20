Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97D7675F1B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 21:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3000410E389;
	Fri, 20 Jan 2023 20:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8665F10E1B6;
 Fri, 20 Jan 2023 20:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674247759; x=1705783759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dY1f35NQDl0HZc7MtKITGzQnpYBqEoXrDYeCrDgReeE=;
 b=b0UMEgq+qpgAG2g5ctMxAY+qCR21h7rNjVWjZDVrqIkGlNnOd52f1E9u
 zcBcP+I0KaOZIdXAv/mCVG3QUKFYYGMINKxpsMUTM0Ap4qx45KqNV05wW
 m2SgDCRq3fT2ds6Fgf4Q7xhC8j6lDxMuvJEyWxaGh1P/wjF/CSGs5nqyk
 BhAcc+TNV9cIGxFAiahhzB5piH/ErFznFdSgFJAtyIWM5la4FYUHj4vaO
 Fexi76ocNXpkUByI4gtE6smyM05L1SEV6kY/YovXL/gCWT0CYP554KpaX
 PPWGWFg7F/AaLH00ikZrrdCZyoOT4E2QB1J0+1bW18C44ABZ/BBH05ZE3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313578991"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="313578991"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 12:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="768811955"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="768811955"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2023 12:49:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 12:49:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 12:49:18 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 12:49:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJ5ZGWf3hIf0PSavDGkKzsj+jzD5qSbt5fOADLz97HCNGVmtt7M08cYTLs6H8W1tI+1F53d1Khgvch6OTtc6q63ej9UjksRfoKuq4b1ijT5bLSuSbErMii3nGfLnSvl/vPlP+xzSad41PSUb3UlzqvPAdG8EtClvbZMTbz72Fi2TIEArMcd3WSA2g5gHQoWNGPWTJkFsfVLS4NUi0GLoA58juk86hMFC4ypRkWy4m9eHQ9zdEY1Zx53StQ+k59ujmWHoAgSBkdbMyAT8nvrcMVAYImsxU/4RlMtnuQKSxgLIzikQHYvau778v3t/atEpOPWOy2uyVgEmCsy4IFn3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY1f35NQDl0HZc7MtKITGzQnpYBqEoXrDYeCrDgReeE=;
 b=lD7SoO0gwCvptTKQLwj7jB+Naz+KcaWBx3QyGYo2Up1BY22ZiPcr9ZHjScQbM9MkWsqWzDNv9pwUQU19xXbMh/rK1ejmL4xV4HL0KQY2JSEnzPuabaUGbUJNAk+XDYygMWPk/Lyf7j1aaokqMOgRE56d430opQtmrwQZlZhI/9CWod3mZXt9w7lG7HJbUf2ALAXJELAcRFU61W3HWG1iBntN4hK9Kp3xHV4Wxq/HbDG859UO4MWQ4zzvV6AcHlN+KUeEZqzfkzD8L4G0TpB6VD5RmQVHtuVZNTSN754doVcmK6skjSjbHU+MO87DypmKp4vPuUmLTCFe+HFHJsb0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB8235.namprd11.prod.outlook.com (2603:10b6:610:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 20:49:11 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 20:49:11 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/9] drm/i915/pxp: Add MTL hw-plumbing enabling for KCR
 operation
Thread-Topic: [PATCH v2 3/9] drm/i915/pxp: Add MTL hw-plumbing enabling for
 KCR operation
Thread-Index: AQHZJgWgvtjtDgTEnUuAE7p3/Xu+4K6k6IwAgALssoA=
Date: Fri, 20 Jan 2023 20:49:11 +0000
Message-ID: <462f9e541fe04c7779b179ef4ad965ae5dfe8c06.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-4-alan.previn.teres.alexis@intel.com>
 <1572e763-b59d-cc48-e1d4-831e77a07bf0@intel.com>
In-Reply-To: <1572e763-b59d-cc48-e1d4-831e77a07bf0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB8235:EE_
x-ms-office365-filtering-correlation-id: bf6552bc-ce7f-4235-7d27-08dafb27c889
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DjsVaGMm+ylthPLpPCcsdshUQh6JfpNMFoAx9ph30WJgxalCeUL5eqnhbcj/lsHwlzwTzQmp+P3ydGP1qjnJIGaFvIB8WTgcN0J3Ngoq8sXQVwz+D6NCwj9Us45X2Lh7oydw7i8eQrb1MqJwl4MQ/DhFaLUGlGBdAdAZkeJ/sGkCNbRBoimpNUohIzbe1RGNbiOgKBJ5/mNI3SjB4ciIPUy4pkTQ58FV+BiEe8OkFZadKc4n5WKU+75fOXZcP+t0Nz7Z/8bYKDX7d9t0lPoGY2jY6kACM9qNTR0+FaOvQoIBt49naINaKNEBzz3VUVeeWSsHnI/suc3vY7UdD9fGQl3j0+RusBR2dJBjmshjXfNlVr5xne0z30KEtbvg/5KVhmAZei4OWeZXfbCqyDrxfBcHmcBzYQNfhq/KmSAyiGIzRg4ocb/64Esc93yH0VYsNomNITXblvCa3olqGUtaEfT9So2ehddBgy9hQA2IDVKg0flkKh1dspZ03/8feSrjQa9Jg2IlsXM+5GcKCypUQfaX70Krqam3ki5W5KzF28SEVpgI0Kp3WfMot/W7cboz2yPSk1UpCqEp/sr09/erdneNLzOAdOIrnT+MKbR8p8w/OgfgohhTOtwtGuQhrTsa3R3I2VJv1EHR5ne2ibVrjTF1VsZoyCu/T34wIma9w5GzE7ckOBun4zjok4Cl/yAJR+J7a/8quVMoWGc6R0FrGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(54906003)(186003)(2906002)(6486002)(110136005)(6506007)(6512007)(26005)(2616005)(478600001)(316002)(38100700002)(36756003)(71200400001)(122000001)(38070700005)(86362001)(82960400001)(83380400001)(41300700001)(4326008)(5660300002)(8936002)(91956017)(76116006)(66446008)(66556008)(64756008)(8676002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzV4dkRPVjZYTE5TWHVtR3M4c0VBSThveitNZ1FBdUNxMUJkTkdXUFVzRjlW?=
 =?utf-8?B?ZkVXRWJ4ZzFrb2dsTzZwWlVrcU52L1pHWHZ0S2FJR0dQTlQ1MjBYNHFqZVZ3?=
 =?utf-8?B?UGRoYnp4Si8vSVRTdXFHWlNkaFdZejZ1ZkhNN3ZhTmN1T1pQNm54UFBJUWh3?=
 =?utf-8?B?N2cxY2xZWGVDTytrMEx5eDRVdHBTWjdUejUwcW4wSzBGVVEwTndOVlo0ZUJM?=
 =?utf-8?B?M3ltV2tVaURwVkhmRTkwcy92SkZ6MUVPU0tVSnhTODZaV0xmcWV1aGl0UUJB?=
 =?utf-8?B?TWlaWmFkSDdDZnZXclZVM1pPY0p1eC9LY1JKMUx5OGw1ZkQwb001Wkx5OEpB?=
 =?utf-8?B?UE9ha0N2MFhvY1piMnhDQy9Fd0N0c0tGNGJZVTE1V3QzNzdHelluMDN4VTBq?=
 =?utf-8?B?N25DcTRQYXExS0w2V05CU0VGTXBqYVNDMTRqWVVSRVZadmhYb2pyV1FqV1o1?=
 =?utf-8?B?bmJ3RmNoWHFrM2pCMTBtd3NGeHFQTU5XZkZMN2RZS3hPQ0NLNEN2eGQyL3V2?=
 =?utf-8?B?SkF3aUJBWXBMR0JENkhBanZTeE5xMkJMbnFMK1YrdGxFWjNWRG1waitYNEIx?=
 =?utf-8?B?TWt6QTdtdUJxN1NVQ2MvUTVCSGpPeWxoS1AwZjZRUzY0RlNpRmNIQ1pTMjBJ?=
 =?utf-8?B?d2VMZ0hiYVduWWhVZmwybEJlWDJ5TlAzR2hUQVBzbjBZUEhmVUxPdlBoc3N3?=
 =?utf-8?B?T3ZiSlRRQUZnUkVOeFRCVXFvSllGU3BXMW1WMkJEWGpJMTFnakE5TjRHUGox?=
 =?utf-8?B?Z0Nyc0luaXp1bDRaZWZsb3Vqa0ZucDFqOWE5eU5wVHBkYlJhR2NjOEZ4YzhR?=
 =?utf-8?B?a1hxZmdHZmJETHBpN1JsUFNtMVg5U0oxR2NCbXNPWXN1QVdzNUIwYzFFcDF3?=
 =?utf-8?B?a0d2c1VxOW5EMnVsOXJXa3JsU2M5OHB2ZWJPOUhOSzBId3dKeXlzeXdQeUdR?=
 =?utf-8?B?c3lpWFVxSndGMjVkUTNOS25vdWpQY0VNVEdmNDJ1VHFZQU9mSjg0Y2xrZWNT?=
 =?utf-8?B?em1LWDBCb2QwL2JzMTNsZnZFRVFMT3pjZ0NDSFJnSXFwMUNhNnhtV2dGM2gr?=
 =?utf-8?B?YmU5WUI4WFAyYkozZ2NvZy9zQnJacE0xK3JtcUVyeWQzQ2xWakNkNFRxRGZw?=
 =?utf-8?B?Z0RibHU3R2tNTDRDRm1aS2VkeU9yZVJQaWhpWGJ1Y2VqZDdqcHhTUkJLbE5j?=
 =?utf-8?B?blo0bmx0Yk03WEJPMnlrQUg0LzU2cmw5SC9xL2VYaFZvc2ZEaHlsZlptL2ZR?=
 =?utf-8?B?a3lrbDJZSWV6L3ZQREZIdXNvWSttQTRmZkRiMk96aWJHTzZBamRCTU5iZ3Vq?=
 =?utf-8?B?SllObEVabU9zMU9hMmNaTEZOcjZ0Vm1LMU8wUmZ6MVBKSWJDbnlOUUhQai9l?=
 =?utf-8?B?d0NvRGFTRmJmUlpXQUJNMWVZRHdhdXB0OGRGS1J1RnFBb2pHV0RTem5FTm9Z?=
 =?utf-8?B?ZmpZbExxWXhDcXRmR1pHZndyRVlqWjJPUzVhWXBYYTRrTjJjQXpBR1NzOG40?=
 =?utf-8?B?ZXhVVjB2cG5MamJRQ1BsZXpMZmpiK2JmN2llZ2V5SjM4aXhxbjMyRzE3TGhn?=
 =?utf-8?B?clVNUll5ZzdEWGJ1QzZ3UDdlMmttZmtyUUdrQk9rdDR2aWZJREl5Vm9jWW4v?=
 =?utf-8?B?T3h3azI4RklDZ2gzOSs0TWc1cUFXVTgvTHoyUms1RUNTK3E2cG1nV2JYWTg1?=
 =?utf-8?B?UTBGK2ZobHlFZXVXK3RuajFpM0FxcGJDVVVLMDJ6RlpqQ2oxTnpYZXlCNmFr?=
 =?utf-8?B?UDc3dk9vcURaRVVVTlFlWXNBb3RWVnRKTDNGZWovb3pnZkJYSWFWaklsUjdB?=
 =?utf-8?B?VkhWb1FsLzNkRUFWQVNvT2w4dGhFNUkrUkw5dFF2aWhvZCt0dXo0L1RnSUEr?=
 =?utf-8?B?ZTRkc211NVJaQUlpUElZbUhPb09DbVRabmEva3JoTkRqaWFhZ284RVN2S1Rr?=
 =?utf-8?B?ZGd0UjdDMzNNWTZaM2NETDBYYzF5VW94V29uTy9kKzhENEdCYjJkV1lLUUxx?=
 =?utf-8?B?RWM1SU1QY3ZheGZYcVZuZWh2bFNuOFRnaTNIR2NDVS9HV04xU2dNOHRaWU0v?=
 =?utf-8?B?WS9SV0cxcCszOW5LMmJLQWdhY3hXb1ZSU1N2Ri9kdzJIa0xNVGFEOVNZNndt?=
 =?utf-8?B?S3o3bVFXbWtrMmI2K2RqQkpLQkYrZENlSDhDN2ZVNmJUeC9YQ0cyTGlKNjJl?=
 =?utf-8?Q?mkks+S0r0J16Sdj4rw4zHIpYN2mX0BHSmWS/054wJVIi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <079E2D75EC6DF246A959E04E6DCA03FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6552bc-ce7f-4235-7d27-08dafb27c889
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 20:49:11.2471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVLq2CkXf3I/iZawGjxpgbnUt0OEF8pX/oxYGGVAG1Rd9tys+hajE6gB2SG8nbtnWy+Oz3Z5rviGbQG70IqONhu6OjMIXIpHvoKNSgu+p5nicaaPcefRxYDNMa1vK8/h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8235
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZXZpZXdpbmcuDQoNCk9uIFdlZCwgMjAyMy0wMS0xOCBhdCAxNjowOSAtMDgw
MCwgQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgd3JvdGU6DQo+ID4gDQo+ID4gDQpBbGFuOiBbc25p
cF0NCj4gPiA+ID4gLS8qIEtDUiByZWdpc3RlciBkZWZpbml0aW9ucyAqLw0KPiA+ID4gPiAtI2Rl
ZmluZSBLQ1JfSU5JVCBfTU1JTygweDMyMGYwKQ0KPiA+ID4gPiAtLyogU2V0dGluZyBLQ1IgSW5p
dCBiaXQgaXMgcmVxdWlyZWQgYWZ0ZXIgc3lzdGVtIGJvb3QgKi8NCj4gPiA+ID4gLSNkZWZpbmUg
S0NSX0lOSVRfQUxMT1dfRElTUExBWV9NRV9XUklURVMgUkVHX0JJVCgxNCkNCj4gPiA+ID4gK3N0
YXRpYyBpOTE1X3JlZ190IGdldF9rY3JfcmVnKGNvbnN0IHN0cnVjdCBpbnRlbF9weHAgKnB4cCkN
Cj4gPiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHB4cC0+Z3NjY3NfcHJpdikN
Cj4gPiANCj4gPiBJTU8gaGVyZSBhIGJldHRlciBjaGVjayB3b3VsZCBiZToNCj4gPiANCj4gPiBp
ZiAocHhwLT5jdHJsX2d0LT50eXBlID09IEdUX01FRElBKQ0KPiA+IA0KPiA+IEl0J3MgZXF1aXZh
bGVudCwgYnV0IElNTyBmcm9tIGEgcmVhZGFiaWxpdHkgcGVyc3BlY3RpdmUgaXQgaGlnaGxpZ2h0
cyANCj4gPiB0aGUgZmFjdCB0aGF0IHRoaXMgaXMgYSBjaGFuZ2UgZHVlIHRvIHVzIG1vdmluZyB0
byB0aGUgbWVkaWEgR1QgbW9kZWwgDQo+ID4gYW5kIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhl
IEdTQyBDUyBpdHNlbGYuDQo+ID4gDQpBbGFuOiBZZXMgYWdyZWVkIC0gaW4gYWxpZ25tZW50IHdp
dGggdG8geW91ciBuZXh0IGNvbW1lbnQsIHRoaXMgcmVhZGlibGl0eQ0KaW1wcm92ZW1lbnQgc2hh
bGwgdGhlcmVmb3JlIGdvIGludG8gcHhwX2luaXQgKHdoZW4gd2UgaW5pdGlhbGl6ZSB2YWx1ZSBm
b3Iga2NyX2Jhc2Ugb2Zmc2V0KQ0KDQpBbGFuOiBbc25pcF0NCg0KPiA+ID4gPiArI2lmbmRlZiBf
X0lOVEVMX1BYUF9SRUdTX0hfXw0KPiA+ID4gPiArI2RlZmluZSBfX0lOVEVMX1BYUF9SRUdTX0hf
Xw0KPiA+ID4gPiArDQo+ID4gPiA+ICsjaW5jbHVkZSAiaTkxNV9yZWdfZGVmcy5oIg0KPiA+ID4g
PiArDQo+ID4gPiA+ICsvKiBLQ1IgZW5hYmxlL2Rpc2FibGUgY29udHJvbCAqLw0KPiA+ID4gPiAr
I2RlZmluZSBHRU4xMl9LQ1JfSU5JVCBfTU1JTygweDMyMGYwKQ0KPiA+ID4gPiArI2RlZmluZSBN
VExfS0NSX0lOSVQgX01NSU8oMHgzODYwZjApDQo+ID4gPiA+ICsNCj4gPiA+ID4gKy8qIFNldHRp
bmcgS0NSIEluaXQgYml0IGlzIHJlcXVpcmVkIGFmdGVyIHN5c3RlbSBib290ICovDQo+ID4gPiA+
ICsjZGVmaW5lIEtDUl9JTklUX0FMTE9XX0RJU1BMQVlfTUVfV1JJVEVTIFJFR19CSVQoMTQpDQo+
ID4gPiA+ICsNCj4gPiA+ID4gKy8qIEtDUiBod2RybSBzZXNzaW9uIGluIHBsYXkgc3RhdHVzIDAt
MzEgKi8NCj4gPiA+ID4gKyNkZWZpbmUgR0VOMTJfS0NSX1NJUCBfTU1JTygweDMyMjYwKQ0KPiA+
ID4gPiArI2RlZmluZSBNVExfS0NSX1NJUCBfTU1JTygweDM4NjI2MCkNCj4gPiA+ID4gKw0KPiA+
ID4gPiArLyogUFhQIGdsb2JhbCB0ZXJtaW5hdGUgcmVnaXN0ZXIgZm9yIHNlc3Npb24gdGVybWlu
YXRpb24gKi8NCj4gPiA+ID4gKyNkZWZpbmUgR0VOMTJfS0NSX0dMT0JBTF9URVJNSU5BVEUgX01N
SU8oMHgzMjBmOCkNCj4gPiA+ID4gKyNkZWZpbmUgTVRMX0tDUl9HTE9CQUxfVEVSTUlOQVRFIF9N
TUlPKDB4Mzg2MGY4KQ0KPiA+IA0KPiA+IE5vbiBibG9ja2luZyBzdWdnZXN0aW9uOg0KPiA+IGl0
IGxvb2tzIGxpa2UgYWxsIEtDUiByZWdzIGFyZSBhdCB0aGUgc2FtZSByZWxhdGl2ZSBvZmZzZXRz
LCBqdXN0IGZyb20gYSANCj4gPiBkaWZmZXJlbnQgYmFzZSAod2hpY2ggbWFrZXMsIHNlbnNlLCBi
ZWNhdXNlIHRoZSBIVyBqdXN0IGdvdCBtb3ZlZCB0byB0aGUgDQo+ID4gbWVkaWEgdGlsZSBhcy1p
cykuIFNvIHdlIGNvdWxkIHBvc3NpYmx5IGhhdmUgc29tZXRoaW5nIGxpa2Ugd2hhdCB3ZSBkbyAN
Cj4gPiBmb3IgdGhlIGVuZ2luZXM6DQo+ID4gDQo+ID4gI2RlZmluZSBHRU4xMl9LQ1JfQkFTRSAw
eDMyMDAwDQo+ID4gI2RlZmluZSBNVExfS0NSX0JBU0UgMHgzODYwMDANCj4gPiANCj4gPiAjZGVm
aW5lIEtDUl9JTklUKGJhc2UpIF9NTUlPKGJhc2UgKyAweGYwKQ0KPiA+ICNkZWZpbmUgS0NSX0dM
T0JBTF9URVJNSU5BVEUoYmFzZSkgX01NSU8oYmFzZSArIDB4ZjgpDQo+ID4gI2RlZmluZSBLQ1Jf
U0lQKGJhc2UpIF9NTUlPKGJhc2UgKyAweDI2MCkNCj4gPiANCj4gPiBUaGVuIGlmIHdlIHN0b3Jl
IHRoZSBjb3JyZWN0IGJhc2UgaW4gdGhlIHB4cCBzdHJ1Y3R1cmUgd2UgY2FuIGp1c3QgcGFzcyAN
Cj4gPiBpdCBpbiB0aGUgZGVmaW5lIHdoZW4gd2UgbmVlZCB0byBhY2Nlc3MgYSByZWdpc3RlciBh
bmQgcmVtb3ZlIHRoZSBpZiANCj4gPiBjb25kaXRpb25zIGF0IGVhY2ggYWNjZXNzLg0KPiA+IA0K
QWxhbjogc291bmRzIGdvb2QgLSB3aWxsIGRvIHRoaXMuDQoNCkFsYW46IFtzbmlwXQ0KDQo=
