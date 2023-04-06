Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCB6D8EF6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 07:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E3F10E02A;
	Thu,  6 Apr 2023 05:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C2F10E02A;
 Thu,  6 Apr 2023 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680760280; x=1712296280;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=03WK3WpQeIDiZ1P/SF3H+iqzuTs0FeEWYhlzBTN6XvU=;
 b=JW7G2zBqXswi0EPzcOU4fybn26ISQ+JrVVO/7d1zwouz0UeTx4tcmVel
 0R0/KHOk/DSp0Q/sI8tt3pqFQ5EyaUDDAlM8NRhBpCSDYCppUoLuiXp9D
 Yo4KBg99Y7/kWyxYRVyTJbM4xwGluaGKxNN2Qrd3R+vxPQS/aS22QGEta
 3q/efkDodLF89iArxRe89BN2NuIlNFbit8zltFYpOieddtAGyOiKsyKtg
 d5V5FUVlOcdUt6yC1whYcY49gfJmKacXgGsulTlJrGxJELCZtv0lqQ2gz
 jaLid1UvXndefjB5dgSH2BwmLgjkH2Ifd0qHAo4uIhM+gkUymOA8eiz9W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342658193"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="342658193"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 22:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="719570200"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="719570200"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 05 Apr 2023 22:51:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 22:51:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 22:51:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 22:51:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgoijrLfkjDmThUZ8Y0CujGBN3j8iHPJo3wklGvDHq13IVm49amxzi39aXQujOaCtuHCEW3OPRGluS6me/B2GTFPnEN/lAIMmAU68nlhYA3knMcqq4n4ww8CzWmxY73pTWeA3Snlgg+50hnxjOCfu8MsIaq+Ak46IGV3Ogls+vI4fniikDzfxkwB7NUP8v4gfQapk7y38vNYkc8qe0yxlBfXXzCq6norFF9OaBNIWfk7+4eUla3KwBmGL+SC7QT4BZXKgWIqLOdDb0KQ3SNrU1kZGJ0V5jvzr8QUMmmZdb7kmgwY69TSYhG4BgMzqKbHRnPNekzFC7tw2tIWdLvsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03WK3WpQeIDiZ1P/SF3H+iqzuTs0FeEWYhlzBTN6XvU=;
 b=XNluGept0hLihHIkO2QBf12K5YEkaBk2kdv9vxrddrizqZOeo1U5V4cTZB7iH2EMXliXcwKtGbw+0yIgiruPUTuq/gJzD9LLXRqbNfTl9i+2tsX3+Y+Lbd5Dnr460Tc+Eh719FWtClmimCqxfcXWWIW4E6JzBpl+IpvpXdLxCpBrtC4hetXvTLDv4On+EmIhgY1VqtBcGludi2PO4zOpF+1Jz+mBUExVpWgZeKpyIJYiQ4ZA9/wIgxkHrnklwnDVuVDx1Uc/aoqE+fc9vyq9pZzSRurL4BNnxYV14w+bFe0qha+M3SkspQk9/tiDAz/b3PfGHwTsP5kd19nxT1/hgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.31; Thu, 6 Apr 2023 05:51:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 05:51:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 6/8] drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
Thread-Topic: [PATCH v6 6/8] drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
Thread-Index: AQHZSxt0gg2pP60yBkW/CfUxfukzN67p4fUAgDQfbYA=
Date: Thu, 6 Apr 2023 05:51:17 +0000
Message-ID: <1d642aabe38f71559ff7c5b6ea2ad7d930b58d35.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-7-alan.previn.teres.alexis@intel.com>
 <1991b162-8210-c64a-0bcc-1811ff93ae10@intel.com>
In-Reply-To: <1991b162-8210-c64a-0bcc-1811ff93ae10@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7825:EE_
x-ms-office365-filtering-correlation-id: 042ff64f-59dc-4579-1a69-08db3662f067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cewsLrzror9vaqP41Ii8RGVZS+wFCKSurMNMq9dROmyjqigMw6gZeAhpNKCnu3Wzhz7pMV1KoMQ0hkZNflY4XdKsXpjVYiNmjNWrc1HnHpT7nllRgFf26C7FMydrGQNnGT5/xcD0UdK0oWNIgsjEhQQsb3gH68stOARFHBeEeobm2YFex3Nrgw7nNwwGOieBSvCzpSG2SgUvP0S9mhWI90BAXpNPia0iSBmAzU8ANlKfcZgQT4J3BxRpTfHOTxswHZGcFVy+dXIsvHLqNzu+V7fa/kGC5/CrI6kn2ctx3zpsHNapcit5te7b9OLm3yphxmJIp6sHJWWI5eadKTTvtaGs21zi/u0gu8Nx2cIK+obganqVwSPN+uyqa3oH5vhPL/9KIR7a//LdvuL8wEIL1evqFpkXmQROSXqcmDgD6xq4UQNSMa/v52yTM9IebKKQZuZiVJqS/CoaNIclEHSP5mRJj6aepv3ZW2vfMyj+T/gObx+lGYCactVC4oTUbfh67pvTAP5zz832wiIIaSI0yLyJGrG9WLQirqq5FK/pYl15k92QFEt7MfTIStLgrkiPmO7BB2PYC0YvJdse52pHX5inG6vOoE4Xbsw7t/aUvtkpxKY0R9HdUugZYnRLUM3h
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(186003)(6512007)(2906002)(6506007)(26005)(38100700002)(86362001)(38070700005)(36756003)(82960400001)(122000001)(2616005)(83380400001)(71200400001)(8936002)(41300700001)(5660300002)(316002)(6486002)(478600001)(91956017)(54906003)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(66946007)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3Y0aEUwcGRYczA1N2VrUXR5akhIY214eHBubTcvVTB3SXVxU2ZTenZGTnNO?=
 =?utf-8?B?RFM3Vng2OFpibWZRVE5MRDVQcDNETlJ3bURlbnM3L3QyN1V6NlhNRFFhSFhp?=
 =?utf-8?B?eXF0UmMvY2NFOWxKQ1FrS012cW5vU2R4U0YzWHdGeEppSG1tZHVSYVZBbnp6?=
 =?utf-8?B?OXpkcDRYUm56bXRxR2RDVEc4SEV1aVNVdm1lbjJaTEpkYmRVWEVRcm0rb1Nw?=
 =?utf-8?B?ZEJoZ3BxZ2pLWTIyUGFCUmtPelg3ZVF5M3ZudGkrSVJDdHNrcndlNlcvdWlM?=
 =?utf-8?B?aWZpOEd6ckp0WUxYRng1L1lZcmw2Q2NneGVrbDFJNHVGYWNSalpsd2R6WkRN?=
 =?utf-8?B?NlFyWG9CZEZnaWJDaHpWM011Z0JnL1lIWWVsM3FaN1NROWdQaW5RWjV0TWRH?=
 =?utf-8?B?S0FXa3NwZU5ycFQrb3FtN0pldERCQlJ0YmR0Z1RwYmphNk1GbVQycGVyb2xl?=
 =?utf-8?B?V0Vxd3U0b2wzRHB3ZjgrcWZOMmE3Q0ZJenVVOVkyM1dZVmFFM3JTRERkcGNV?=
 =?utf-8?B?ZjFGaHBhWXZ4M3FNTnpWS09TUXZJOU5mNjZkdUtxd0NraGswVE9Wa1g3TnZu?=
 =?utf-8?B?VXNuKzBVS1Z0b1FXVmdFZHMwU0Z5UzJJTERPNG9POFB3SE43dFZGcmRSTm1Z?=
 =?utf-8?B?aVA0dkpmRWhvUTdJZmtLSVp1Z1JNdkxrSGlYM3dDb1E2Q0pyQkZFU1M1MkZy?=
 =?utf-8?B?VzVuLytEVGVRZDE4ZVB1cVRHV2ZXZFFTdVc5bjFGeEltbzg3YXVKMzgrWms0?=
 =?utf-8?B?OXY0K1lFUzVoNkttQlluUllDUjgrcVNvUjAyU2k2OXlwSzF2ampmTk9aMjZB?=
 =?utf-8?B?Sm90T1VFcUNWM3pqYkU2TGVjUlhrWWF3b0tqcUhRenlUdHBJekM2NUoxaHd6?=
 =?utf-8?B?akpRNWN4NTMyZjNTblQ4aTJOanVBSElQcFJmZzBPTDRwY2lNQlVwaWI2bTJo?=
 =?utf-8?B?T2JiRVVRdXA4bDRoNjlzWDJEZWFOUk41ZHVZZ2Q2ZE1uZFNMQzVXMnhBQWg0?=
 =?utf-8?B?Y2lvWk94Z2RibTg0YXdBaVBPdUxJOFh6YXZMdmh2UlA5TElXclhzRi9jOTRq?=
 =?utf-8?B?SEZHTURRS3JMeThRamJzQ2EyT3BvbEEyNTU2WithcFhyS0FubGFPVERpeUJP?=
 =?utf-8?B?d05NcEZ5NmpGMkhZU3V2S05XZmZlcG5teGZia0NQSFdWQXBKSmNPUS8yUnVx?=
 =?utf-8?B?WEtCTjlWelFlOVJRVlRlY3ZzdWt2cmNpcnVsZ0hUMVR3WUpOSXllT1hVZ2JG?=
 =?utf-8?B?aUlVa3poeDg1ZzU5Sk4wMlB0eHJham9lZXAyTE1MRVZNVmFaM0Fqd0FhSUZT?=
 =?utf-8?B?NE1xZDRsT0xxcXJVWW9YRkhJRHhlN05QeUhyd3ZWTEt0MWdHd0F2cUl6ZGlT?=
 =?utf-8?B?SmU4T0VDNGhQTDduZ20yaWlWZ1UwWTlRek40RkFpN29QdlZtQjh5RlF5STNR?=
 =?utf-8?B?VU9VRDZQdjBWcElIdGFCMktLZE9qMXhVLyt0UWx0Tyt5SUN2NEEzYnRyQkhZ?=
 =?utf-8?B?Tk05a01BOG1NTDZtN0FOZ1NIQzE2eThUSVdhU09EeTZCcnpjY2xaNEhMbTdG?=
 =?utf-8?B?ZmZWYzlYTVh6NTdrSExZNTJpZ29wZ1VzWGlZRDFONVA1NDU5QUM4enFkVVdX?=
 =?utf-8?B?M3ZqenZLVnBMNTZiSVY0RzBucjdpZEswRElvT1Z2SzFYSHRCaGRBQ0t0Nm5H?=
 =?utf-8?B?Qkk5ZDJPVHZ1MEF3K3BLbS9FZllnNGZDaUxHNmhBV1hKKzd2dXkrdFZZL2V6?=
 =?utf-8?B?Q2dCemJJTkg4a0JuM01lbXY1MDlNdUhpblh0RzFGMFUrQ2dqd1UzOXJneUdy?=
 =?utf-8?B?VzAzRUoyRStKeWVscGVqSVhaVURLSnZma2tmSFBGY1lWMUxBUlE1OXhlV204?=
 =?utf-8?B?L0EvaWs0Z2JRK01kb0VUQ2p1ajlGWUtnSHB6UU05blpXWEF1RkI5QzdGd05O?=
 =?utf-8?B?eHhZVVArc0g5ak4wdEZQZ2FhTUJ4WWJjU3hROTV4RTYzMkUzNHNuUC9lMTlO?=
 =?utf-8?B?a0xyMEUydFRhRkVsVFJ3a0NtUFdrUllxdXB0YTQwLzUzaCtGYnh0SnpSNFp2?=
 =?utf-8?B?NGxZWTlBZHdlQWxVOWZtcFNSSk1nV0xpNkYyMEJReXpiTlBIRFFGejN6dnh6?=
 =?utf-8?B?eGpzajIxRmROTmtVNWdDbnpCMjRrbU5yL3VoclduOTZCaGxHZzcvZHhhR3Fv?=
 =?utf-8?Q?5YFHIlS2eo4/dZGf5cINnEU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA16DAC669146A49B776FC1856B2539F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042ff64f-59dc-4579-1a69-08db3662f067
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 05:51:17.0588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrjTXujkOQ+Yl6Xl04a3vFeUV6/RC3obnL1CMBFSvHM5imAthx49Epx26v8hxYf+F15S2TjdV5S6c6kTPckSJeOn9ivH2k8RhrMWkY4ANC9JSJP6vC+RroBTtFLN0Smc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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

PiANCmFsYW46c25pcA0KDQo+ID4gwqDCoHZvaWQgaW50ZWxfcHhwX2lycV9lbmFibGUoc3RydWN0
IGludGVsX3B4cCAqcHhwKQ0KPiA+IMKgwqB7DQo+ID4gLQlzdHJ1Y3QgaW50ZWxfZ3QgKmd0ID0g
cHhwLT5jdHJsX2d0Ow0KPiA+ICsJc3RydWN0IGludGVsX2d0ICpndCA9IGludGVsX3B4cF9nZXRf
aXJxX2d0KHB4cCk7DQo+IA0KPiBpbiB0aGlzIGZ1bmN0aW9uIHdlIHVzZSB0aGUgZ3QgZm9yOg0K
PiANCj4gMSAtIHRoZSBsb2NrOiBzZWUgYWJvdmUgYWJvdXQgdGhpcw0KPiANCj4gMiAtIGdlbjEx
X2d0X3Jlc2V0X29uZV9paXIoKTogdGhpcyBzaG91bGQgd29yayB3aXRoIHRoZSBtZWRpYSBHVCAo
d2UgdXNlIA0KPiBpdCBmb3IgbWVkaWEgR3VDKQ0KPiANCj4gMyAtIHdyaXRlcyB0byB0aGUgR0VO
MTFfQ1JZUFRPXyogcmVnczogdGhvc2Ugc2hvdWxkIGFsc28gd29yayB3aXRoIHRoZSANCj4gbWVk
aWEgR1QgdW5jb3JlIGFzIHRoZXNlIHJlZ3MgYXJlIGluIHRoZSBzYW1lIHJhbmdlIGFzIHRoZSBH
dUMgc2NyYXRjaCANCj4gcmVncyBhbmQgd2UgdXNlIHRoZSBtZWRpYSB1bmNvcmUgZm9yIHRob3Nl
IGFjY2Vzc2VzLg0KPiANCmFsYW46c25pcA0KPiA+IEBAIC04Myw3ICsxMDEsNyBAQCB2b2lkIGlu
dGVsX3B4cF9pcnFfZW5hYmxlKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4gPiDCoMKgDQo+ID4g
wqDCoHZvaWQgaW50ZWxfcHhwX2lycV9kaXNhYmxlKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4g
PiDCoMKgew0KPiA+IC0Jc3RydWN0IGludGVsX2d0ICpndCA9IHB4cC0+Y3RybF9ndDsNCj4gPiAr
CXN0cnVjdCBpbnRlbF9ndCAqZ3QgPSBpbnRlbF9weHBfZ2V0X2lycV9ndChweHApOw0KPiA+IMKg
wqANCj4gDQo+IEFGQUlDUyB0aGlzIGZ1bmN0aW9ucyB1c2VzIHRoZSBzYW1lIDMgY2FzZXMgYXMg
YWJvdmUuDQo+IA0KPiBPdmVyYWxsLCBJIGFtIG5vdCBzdXJlIHRoaXMgcGF0Y2ggaXMgcmVxdWly
ZWQuIEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+IA0KYWxhbjogY29udGV4dDogZHVyaW5nIGRl
dmVsb3BtZW50IG9mIG15IGluaXRpYWwgZmV3IHJldnMsIGkgbmVlZGVkIHRvDQpleHBsaWNpdGx5
IGRvIHRoYXQgc3dpdGNoLW92ZXIgdG8gdGhlIG90aGVyIGd0IGluIG9yZGVyIHRvIGV2ZW4gZ2V0
IHRoZSBJUlFzLg0KKGkuZS4gYXMgaWYgdGhlIGZvcmNld2FrZSBkaWRudCB3YWtlIHVwIHRoZSBy
YW5nZSkuLi4gYnV0IHVwb24gcmVjZW50DQpyZXRlc3RpbmcgaXQgc2VlbXMgdG8gd29yayBmaW5l
LiBJIGd1ZXNzIHRoZXJlIG11c3QgaGF2ZSBiZWVuIGEgYnVnDQpzb21ld2hlcmUgZWxzZSBpbiBt
eSBicmFuY2guDQpTbyB5ZXMgaSBiZWxpZXZlIHRoaXMgbWVhbnMgd2UgY2FuIHRvdGFsbHkgcmVt
b3ZlIHRoaXMgcGF0Y2gNCg0K
