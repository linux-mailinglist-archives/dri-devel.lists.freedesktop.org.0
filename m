Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20085728791
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 21:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A539510E606;
	Thu,  8 Jun 2023 19:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7F910E0C8;
 Thu,  8 Jun 2023 19:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686250872; x=1717786872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IPRbBSeATDmFYmWoXJ6ja0qvFxL6gO/LKrm5fwhNiF0=;
 b=dcOF7OnRqSHm9DX7+zzNOssV7oI/dNZkdZ+UpISrsrOf6EkvfxsBVayo
 QcpFQhmtceIYP6q0TN7FbqGQ92TyseLIxZuNLvws6f53m30U3AF5CiOri
 gIDuTPN9/xNSLHDJGTjYZu243B/Uk5qXeVZHZyr2LQtJW4J9q5fjJdx8w
 zkeZfq/EZoFvrZTE+bw34rZz7bF2L8aPII2q/WdNKW2gDGqWUVobGQG4w
 8HghOavDvT+I6K1yxn9syL7TiZzeQ06jjrhSwE9uXKzB2WNU5SbYWlL1f
 cIx6j1cSgHcA/TWcovgS2d2mKnvUHC4ddaAUTsWvX5rphcl2QWsKMjgsl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="347048818"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="347048818"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 12:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="710073833"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="710073833"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 12:01:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 12:01:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 12:01:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 12:01:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z63K+iF7Ql7fVGsivIxIte1d+X4Q5PrUB2GMmY818O6xVWaZDwLA6c9cQbGSJ8KtBN+n5t3KD/ER+u9rwAMuinn8eDKqydDpa9+uxTPvIy56OS7Gd1Fh6tMuQ7JH1Lj2edaR/OiVPWCi2qWC3nnyLKun3O88SXmya8bw4yVbFXdcI+39gsR3bgq6kkNg58rqGIJKqWsX4ULg34ks3Nv3r1igIxaNkdLX92bTiZLlEMo1k79hDhbCQnaGbS7KOwDR3ZHqCHaSPvJm03qefkqGRa+xRj8a8+xJO0qEkqgfJeCagM7JWViX/DICBI3+MxROG6RynNTJd5S+7PWWKk9vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPRbBSeATDmFYmWoXJ6ja0qvFxL6gO/LKrm5fwhNiF0=;
 b=hlZNvWe3gWuqNST4gjmeEtltWdPFwjyj5bv+mArrTbdtYDiXJI2gH1dr0nf8JggWGV06YOTuUEYC55gGCuHbLNFtRq9wCy8HZjGRzFvUKjJNTW7zA2gnYEncUxh427RiNVOFW3VaTpnoBeacOuEzUah5Vd9854gyHUWe/9mq089hicrR8VNyYI0+TxdgKCkSqlSFvSSMZMYa/UBZMwtoXmhinui8CH5d5U6seh0hhB5gSP88izPEd1sK9ZoFs5BbsdrQxHGgEBPWqdYzP3+VXcSBMcrjrJtk/nVqYEazKqWLqsbXJBqWrtvquU21AKwJzwfmfJhkz9dKLMelYzaMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Thu, 8 Jun
 2023 19:01:10 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571%4]) with mapi id 15.20.6455.037; Thu, 8 Jun 2023
 19:01:10 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [v2] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Thread-Topic: [v2] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Thread-Index: AQHZmjUKPXURPqso+UqcPFZh/Emo26+BOmMAgAADb9A=
Date: Thu, 8 Jun 2023 19:01:10 +0000
Message-ID: <SN6PR11MB26220A9E664E6A435FECB70F8F50A@SN6PR11MB2622.namprd11.prod.outlook.com>
References: <20230530170104.2192126-1-alan.previn.teres.alexis@intel.com>
 <SN6PR11MB26223D9B57C1103BFD0B32BD8F50A@SN6PR11MB2622.namprd11.prod.outlook.com>
 <05874bd1572e33ff56cb0d4b93584f9f6377b88a.camel@intel.com>
In-Reply-To: <05874bd1572e33ff56cb0d4b93584f9f6377b88a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2622:EE_|DM4PR11MB6430:EE_
x-ms-office365-filtering-correlation-id: e6ab34a7-2c6e-4bd7-1ce5-08db6852b907
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: STLIzHC0kPHlxNrZVjRSxjAjxCFDd5xYH4gRDpylBbQBZ/0yyoRwgD8BhOINBtsux1E61nVWlBT3GciF83ZCXEH21m/1u6JXtVnIICIkg7bt8TvGngecz8pNID/RQYFxCUq0EvoSP3KGYLr0XazvGXdClM4p8ECYA+YriuwvdTTuJuloQ4vgUSs5B/IC54/pl9LBWHPktVBk/h3Jd5RiuGXBwAGiCuCu8huJ4UOnt8P11vLvucTFD0Pjn6aENGhReIFRkR9Y86/y0z3TU1c2Nuy5eoWahii+gNinSfCUATDe912D5juuBhxDRiCVi/ILrfM3ogVMnpF2qY1LVWumEnxtNVHrtSRXimryVv8/Es/CySSZm+qDvjGVg3UGBaDDA7Z40gGtLpnrAMEscv2VnPVBnJYpZ/x4wZdN9FaXnpRJAYTHiIofklCy2o374jFwk7vkIMgz3KxHzjFF/Ji9d2/lCCA6v9tjNsYl6j5WJypeHCZmUvRitk9K5NhDFPdzroUvUUMgC7g6K5ifFE2J93+ArJQlcSurESLiP7SXQS79VHfK+3DBh5RIgs+L+ZJKBwDQy+tDJG7OQM034WC5M36fidj7e3U3VvsK2CZ0itN6cYYd2L7dpMeDjfnRZ+gA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199021)(6506007)(38070700005)(5660300002)(8676002)(53546011)(38100700002)(8936002)(26005)(9686003)(82960400001)(122000001)(83380400001)(2906002)(52536014)(55016003)(4326008)(66476007)(66946007)(66446008)(41300700001)(33656002)(71200400001)(64756008)(66556008)(478600001)(86362001)(450100002)(76116006)(186003)(110136005)(316002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjZqd05ibzlLblIwV2xVUURiZXpyRDB5bnJ5a1V5UW53bkU0YkIyOG41NkNS?=
 =?utf-8?B?TVpkY1Y5MFZQZm1uMEVUbEJveGZMY0NNUGNXRDZ5QzNOYlVuU1hocVBIWkFZ?=
 =?utf-8?B?VWtGcXJ1VEM1L1pRcmZIcDg1cXUxVUtMVGZVQlJodEdRMU0wekZyOUhDVHlv?=
 =?utf-8?B?WEF4Um1XMlNLbmZPTXNpemxsQ0tZTVFIN2IxRC90OGx1ckV3ZWgyUVJjc1VB?=
 =?utf-8?B?aDJ0bU1paTBBTUhVNXFzVVY5M0NwVUpTR3ZIM05Na2lDbjREYjBoSFFKaHQv?=
 =?utf-8?B?T3FKWXhCOVlNNEZaQVk5SjUvY1AxdXQvSVkrSFFONFdkZXVoVFdNZEh3NkFO?=
 =?utf-8?B?ZTlwVUlLNm9RdVd1d1UrcFZnM2xWbXR6Y1FuRk9wY2tZM3dBTmxDTTZZTkt0?=
 =?utf-8?B?WkxVZGFLdExOWlcvT3dLSklnR211VEV1bms5M3dYeWgrazlUaHg1d2srN3d0?=
 =?utf-8?B?Qk91VGdFdHBxcUl6RHV2WDdqV3gvaGxodmZoYmNWRWVNN2grelRBS2IrNGo2?=
 =?utf-8?B?ZWNHMGFXNkE5cmE0S0NKZHkzNnRkUmtxUklZanZwc2J1bTJYL3llK25rZWNu?=
 =?utf-8?B?R01DK3pGUDNnS1VmR3JDeE9KaWp0ekZ5dmNEZnFVSy9tU1ZHMVI1WTF5UkxL?=
 =?utf-8?B?RGFSdVJOVTdvZVo2RkU1YXpzWG1HckovYjZHQWxGSXdYalJjVUgramNIWXRT?=
 =?utf-8?B?RGtUY3M1QVpDSk9YWW55d3NrU1Z3SjVHMDNOVmxZUlNhV2lsMW9WYldiYnk1?=
 =?utf-8?B?SmNnbUd3MVhIM2dKVlVzdnQwQmxKMDVPcHB5SEpMcE02bFZMekJiNUlyVWJM?=
 =?utf-8?B?b1ZQdGlqdytlckRXSFBLbUNtRG42cG9hSDd4c1dHb1U3Mkt0MThzNyt4VWxq?=
 =?utf-8?B?bldjeGVmRUFXUDBVSGRnckw5ODBFK2lHUHRKRXowTWJDcVFhY1cvRXgvamFL?=
 =?utf-8?B?KzZSY1VZUEQxRUdiUXpwNUd4cEtJWlJzemU4VCtqSHlMUDU4ay9nTG5OZW9i?=
 =?utf-8?B?VmhIeHpVMDAvaVF4aXpteXFjS2t0Mnp4ZURnRVJiUGV5RHFtNW1OV2w4Y1lB?=
 =?utf-8?B?OHlUczYvUEV6aGZRYThNUEczbVQrbVNqdk81NVBDYnhYcExXbmM5OFBwTklB?=
 =?utf-8?B?OHJJbzZTQ0NpQ1l3Z0NadnRRVXhGYXNFbUJZUUlpOWF4RXN3cFNGQlM0bmdp?=
 =?utf-8?B?RTNGNlFOQVhUSFRFaVVuUGw2MWk4bjlJOVhnYlFySjVuWlZWcEhMbXViQldh?=
 =?utf-8?B?UFdtTmM4cElSVFRLSmg0M21UOEJFd1dWbEJESk1wN2tHc2F1a3phaGlSVThX?=
 =?utf-8?B?eFU0bkNZTUFtdUQ0aVpldEZUbE1MeW9CWjBScTlNSGxJNHJ1WVJ5RjZDODNT?=
 =?utf-8?B?R3hZNnljZXdZMFZrbFpneGJhRHRuQytnZlZmbnplSk9ST1VBak5jbEJubjlX?=
 =?utf-8?B?RFZNT0pQNkZZdjJoSDltblBFaTdwd0NhWnl6ZzNXcGpONVB6dk9YWGNrUDk1?=
 =?utf-8?B?eXFlb0xpZlp1bHJGRFdqSzROeVhlRksxa2w0VWZPYmFQVWs4MG9JTndJSmNo?=
 =?utf-8?B?UUNyYU9GWVN1VGlMZE5kT0VxR0U0b0JuYm51UnZwMFMzcVAxbG9SVkxxOWk1?=
 =?utf-8?B?TklXazRkek1xNUNUTXlRUC9TRjRlSUNUdkY4aHpGakN0UHFBQlh3bThEbytn?=
 =?utf-8?B?SUlYbnBPSlVXQmRpUUZySlhtbVFkdllzY3Q3R2d3d3dKYXdIRHJtY1NPbFVK?=
 =?utf-8?B?ME1aSWdRK0VYRlJIdFp6dERiajBnUnhVWXM4TTNhS1NTbmEyd244UzIvZXFi?=
 =?utf-8?B?czYzajlMNVA2cEZ2Z3lMMDlXdWFsNlQ1WUlIMFpTVzkvclFBVmhqR2FrbDEw?=
 =?utf-8?B?djRUUm80dEcwem5XaVVhWTkxSW0wYVRpd3hoMlNnZC9HREJKMEVaZWpqaS9M?=
 =?utf-8?B?MEczc1ZGajc5aVFvUEJpNERhVkZTMm10WGtYdXUrTURsdnE3YStQYXRLdHZr?=
 =?utf-8?B?Y2ZSZmt1OGJEUEJhODR5UFJ0UkJDWVRmNDJ0T0FteHAxSTE1dWxGdnloZFc4?=
 =?utf-8?B?ZTFuNlN3bHVaOElvYm1VblRpRFppMGhSajBYWmMwK0xHM3JiNG1RTmR0YjhC?=
 =?utf-8?Q?gEyUWFSVvZM2F3qpG5WpAAWPL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ab34a7-2c6e-4bd7-1ce5-08db6852b907
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 19:01:10.3595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OM/VlykVVutgOS5i0HCE6FDPwvTvfLMUb9ChQ6EsmZ7K0Lwpt2DXD4TjNwoB6oSnofk+kEz7CZiDR3K7Ks4Afw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGVyZXMgQWxleGlzLCBB
bGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gU2VudDog
SnVuZSA4LCAyMDIzIDI6MzEgUE0NCj4gVG86IERvbmcsIFpoYW5qdW4gPHpoYW5qdW4uZG9uZ0Bp
bnRlbC5jb20+OyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW3YyXSBkcm0vaTkx
NS9zZWxmdGVzdC9nc2M6IEVuc3VyZSBHU0MgUHJveHkgaW5pdCBjb21wbGV0ZXMNCj4gYmVmb3Jl
IHNlbGZ0ZXN0cw0KPiANCj4gT24gVGh1LCAyMDIzLTA2LTA4IGF0IDE4OjE0ICswMDAwLCBEb25n
LCBaaGFuanVuIHdyb3RlOg0KPiA+IFNlZSBteSBjb21tZW50cyBiZWxvdy4NCj4gPg0KPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFsYW4gUHJldmluIDxhbGFu
LnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiBhbGFuOnNuaXANCj4gDQo+ID4gPiAr
c3RhdGljIGludA0KPiA+ID4gK19fd2FpdF9nc2NfcHJveHlfY29tcGxldGVkKHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlICppOTE1LA0KPiA+ID4gKwkJCSAgIHVuc2lnbmVkIGxvbmcgdGltZW91dF9t
cykNCj4gPiA+ICt7DQo+ID4gPiArCWJvb2wgbmVlZF90b193YWl0ID0gKElTX0VOQUJMRUQoQ09O
RklHX0lOVEVMX01FSV9HU0NfUFJPWFkpDQo+ID4gPiAmJg0KPiA+ID4gKwkJCSAgICAgaTkxNS0+
bWVkaWFfZ3QgJiYNCj4gPiA+ICsJCQkgICAgIEhBU19FTkdJTkUoaTkxNS0+bWVkaWFfZ3QsIEdT
QzApICYmDQo+ID4gPiArCQkJICAgICBpbnRlbF91Y19md19pc19sb2FkYWJsZSgmaTkxNS0+bWVk
aWFfZ3QtDQo+ID4gPiA+IHVjLmdzYy5mdykpOw0KPiA+ID4gKw0KPiA+ID4gKwkvKg0KPiA+ID4g
KwkgKiBGb3IgZ3NjIHByb3h5IGNvbXBvbmVudCBsb2FkaW5nICsgaW5pdCwgd2UgbmVlZCBhIG11
Y2ggbG9uZ2VyDQo+ID4gPiB0aW1lb3V0DQo+ID4gPiArCSAqIHRoYW4gd2hhdCBDSSBzZWxmdGVz
dCBpbmZyYXN0cnVjdXRyZSBjdXJyZW50bHkgdXNlcy4gVGhpcyBsb25nZXIgd2FpdA0KPiA+ID4g
KwkgKiBwZXJpb2QgZGVwZW5kcyBvbiB0aGUga2VybmVsIGNvbmZpZyBhbmQgY29tcG9uZW50IGRy
aXZlciBsb2FkDQo+ID4gPiBvcmRlcmluZw0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJaWYgKHRpbWVv
dXRfbXMgPCA4MDAwKQ0KPiA+ID4gKwkJdGltZW91dF9tcyA9IDgwMDA7DQo+ID4NCj4gPg0KPiA+
IExndG0sIGp1c3QgYW4gY29uY2VybiBhYm91dCB0aGUgZml4ZWQgbnVtYmVyIGhlcmUsIHNoYWxs
IHdlIHNldCB0aGUNCj4gbWluaW1hbCBoZXJlLCBvciBsZXQgaTkxNV9zZWxmdGVzdC50aW1lb3V0
X21zIHRha2UgY29udHJvbD8gVGh1cyBubyBsb25nZXINCj4gbmVlZCBjb2RpbmcgY2hhbmdlIGhl
cmUgaW4gdGhlIGZ1dHVyZS4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBaaGFuanVuIERvbmcgPHpo
YW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+IA0KPiBUaGFua3MgWmhhbmp1biwgdW5mb3J0dW5hdGVs
eSwgYmFzZWQgb24gaW50ZXJuYWwgdGVzdGluZywNCj4gaTkxNV9zZWxmdGVzdC50aW1lb3V0X21z
IGRlZmF1bHQgaXMgdG9vDQo+IGxvdyB0aGF0IGl0IGRvZXMgb2NjYXNpb25hbGx5IHRpbWVvdXQg
Zm9yIENJLiBGcm9tIGV4cGVyaWVuY2UsIHdpdGggYSBsZWFuDQo+IHVidW50dSBjb25maWcsIGl0
IHR5cGljYWxseQ0KPiB0YWtlcyBhYm91dCB+MSBzZWNvbmRzIGZvciB0aGUgbWVpLWdzYy1zdy1w
cm94eSBjb21wb25lbnQgZHJpdmVyIHRvIGxvYWQNCj4gYWZ0ZXIgaTkxNSBsb2Fkcy4NCj4gU2lu
Y2UgQ0kgcmVndWxhciB1bmxvYWRzIGFuZCByZWxvYWRzIGk5MTUsIHRoZSB0aW1lb3V0IG9ic2Vy
dmVkIGVuZHMgdXANCj4gYmVpbmcgcmVwb3J0ZWQgYXMgaXNzdWUuDQo+IA0KPiA4IHNlY29uZHMg
d2FzIGJhc2VkIG9uIGludGVybmFsIHRlc3Rpbmcgb2YgdGhlIHdvcnN0IGNhc2Ugc2NlbmFyaW8g
LSB3aGljaA0KPiBoYXJkbHkgZXZlciBoYXBwZW5zLg0KPiBXZSd2ZSBvbmx5IHNlZW4gdGhlIDgg
c2Vjb25kIGhhcHBlbiB3aGVuIHRoZSBrZXJuZWwgY29uZmlnIGhhcyBjb25maWdzDQo+IGVuYWJs
ZWQgZm9yIHZlcnkgbWFueSBTT0MgSVANCj4gZHJpdmVycyBhbmQgY29tcG9uZW50IGRyaXZlciAo
c2VlbiBvbmUgYXQgbGVhc3Qgb25lIGN1c3RvbWVyIGNvbmZpZykgb3IgaWYNCj4gdGhlIE1UTCBi
b2FyZCBJRldJIHdhcyBvbmx5DQo+IGp1c3QgcmVmbGFzaGVkICh0aGlzIHdvdWxkIGJlIGEgb25l
LW9mZiA4IHNlY29uZHMsIHdlIHN1c3BlY3QgZHVlIHRvIHRoZQ0KPiBmaXJtd2FyZSBkb2luZyBh
ZGRpdGlvbmFsIHN0ZXBzKQ0KPiANCg0KVGhhbmtzIGZvciBkZXRhaWxlZCBpbmZvLiBUaGUgaTkx
NV9zZWxmdGVzdC50aW1lb3V0X21zIGlzIHRvbyBsb3cgZm9yIHRoaXMgdGVzdCwgc28gaXQgbmVl
ZCBhbiBzcGVjaWFsIG1pbmltYWwgZm9yIGl0c2VsZiwgdmFsaWQgcmVhc29uLg0KVGhlIGNvbmNl
cm4gSSByYWlzZWQgaXMgYXQgbWlub3IgbGV2ZWwuIExvb2tzIGdvb2QgdG8gbWUuDQoNClJlZ2Fy
ZHMsDQpaaGFuanVuDQo=
