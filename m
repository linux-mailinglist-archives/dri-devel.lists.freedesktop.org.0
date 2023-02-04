Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C668A8CC
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 08:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48D310E98A;
	Sat,  4 Feb 2023 07:29:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1E710E117;
 Sat,  4 Feb 2023 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675495763; x=1707031763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rYfyBwOJpZoJBEEDq9OMIG8u6VRtevBpHMd4ksed6dc=;
 b=YIoYfk+/HoZB601x1jpLD1kF+T5zmv0IsW4tPbL5IlOZjOZGkDDQI4Rf
 rIDJMoeX/4QrstPquR9Z0B1mLZdrZCclKz63aTvwY7JjXb4FV8PkL08zY
 9kWtPlAIt98Nw6xM6FZkqhKb9x7C85aqaI3DcjeK6xtnthDucNhQ1frCN
 UODc0ZHR2PT+77O/AJINhalupgcO3JJXuMMLrGuo4PC6zeKkyG4sNQhS8
 nmQbXkPkfXT3kumPvnLgA0+uF+de4JxKMea2ykwD5+kOXZ1yYWK8RlZO6
 q8QPzKhTKGfYiMvB5cdRaoI0iUPL0YamFDBuMWl1jCAP8oQGzNakMTZgD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312581839"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="312581839"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 23:29:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789929110"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="789929110"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 23:29:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 23:29:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 23:29:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 23:29:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2o7PLvEIXrMZZX7uDxF7FhyMDgd+yilKWwlDrDxIJ+S0a1yKO5VqvigqHsa3JIZQI4iZa2OmIcHApaSJcd36T5PENOAHi2tHYhZIzVCggUMJnRJhfOqp9PPcPA4tq1sjE4YR5jxXTH/6BHaOOIA3jyKhy8bxspn0EDM4k/BTqGim17LZPRsPZ05k9zTkbH5FX7GUFfukqoTEs/bRpp4McuZOnD/ok4npPVmgdk3VdT8nJZ/5jUR8cSZ6ktTlBSf2o6uI3EpvVht1hMgApsXYP66D9fOUVyEu4wVbAfSiQDPWGs8dFq3jQs6ghfe310Uir8XZkN6nVyf8GYoGYSZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYfyBwOJpZoJBEEDq9OMIG8u6VRtevBpHMd4ksed6dc=;
 b=hEH8OxB3FEx1W35JSaXZBdwf9yNGTaqH2VNOy7I4fXRR/7sLfou8mr1JbKfIUpcHxtQVocHGhF1cXntayO90CvXoIob4VBNexE0XkqBM/9Wo788SqHcMCgUjAr4Pz7glU4aiNSTsGeCXGdCeTmYYI8SvVyPw8VwVphH+hodPIbbErcvSqcHz7FNtyOIwHqGYe0hZuOrNxfBlP8DxLrTXLITiO3ujx1f1ERBq2IC02uRFHAdrhke81GHEtQNtnU0zPhRKEwstHJ9hXC+L76idO0osNVRma70udzbUzJv5RlY+/IluVUqrtL3kbfUpLtb0/RElRaAZG7iIKPjD0sLpdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by DM4PR11MB5471.namprd11.prod.outlook.com (2603:10b6:5:39d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Sat, 4 Feb
 2023 07:29:14 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::17f6:2dff:ce11:ff0d]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::17f6:2dff:ce11:ff0d%9]) with mapi id 15.20.6064.027; Sat, 4 Feb 2023
 07:29:14 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/guc: Clean up of register
 capture search
Thread-Topic: [Intel-gfx] [PATCH 2/3] drm/i915/guc: Clean up of register
 capture search
Thread-Index: AQHZN2xpoTvMN9AS5US6J7pprGf2366+ZegA
Date: Sat, 4 Feb 2023 07:29:14 +0000
Message-ID: <3b2ef1cbe2eea5c13da72feec8fc2bb9d3cc5ec1.camel@intel.com>
References: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
 <20230203011043.3427096-3-John.C.Harrison@Intel.com>
In-Reply-To: <20230203011043.3427096-3-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|DM4PR11MB5471:EE_
x-ms-office365-filtering-correlation-id: 96af4586-b005-4af9-ad0a-08db06818439
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VzFobAGIlrbX9gdhULQ1wgFe8d62VHgAtDH3wQ+Cuytyyw1ud9x5ExoLvb3DLfdZMAFbbTqwVw0YKDkqt/XnsZpmaM0p2VJcxKg0YiXWuxisPWEuvV9TXJAi4xQ/6FBONf//rU84bkfZ/DaJGbCm9NBCVfbQdmXcn9t6xNhe8MoCQOYV3gT7G5IrCT5w/w2LVPJUrTjWxrrNh1aqci35bgeT8X9KYugW0DDNJn7EsGHk1cALfWm7ffMoI4QyJ3IpaJl5LsgqYYVJVIMOAs1MxOkU2Jwjb9r9Vczi7sBmTYe15ohrL6wqQUKvtG8z8OBUcIYlGQmE5Vx48cKwLDbMyEEk4yCOYgeU9EeqIiqFXR4+uadzZS3E7XFFXA/P00j9KAAprB9N3E55ChhttGACDGPs3KXMI8ryUs8j/kzB6gZob2lhBZAe3wC4jzBSdtNExgipYg9sz/kvl4KnGNxh6sv5xhVC68Pd7WEYj2cML2rKG6xWJgH0S6LE/YnHVSrw474pqwSe3eb+/pGdjiBqvKPmdHmzFGQH9ZyAuGCIFynfk5IlXJcxu4MTqXv10DgSPYsd+hSh64LRpLrcdw2+v5v51m3URGTVQvikDQvpkaShHZQnLWZzi+JV685FTrbngSCQpURuIklNX+cnPkVT6GT18NldIxlv+ru2TiW/1G3sbh/G3MFaN8MGKwIhi7BLV+qHOVEeEpI4IbvAii8Gyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199018)(186003)(6512007)(26005)(83380400001)(36756003)(6506007)(82960400001)(5660300002)(38100700002)(122000001)(2906002)(8676002)(4326008)(66556008)(64756008)(76116006)(91956017)(66946007)(316002)(110136005)(450100002)(66446008)(66476007)(8936002)(41300700001)(6486002)(478600001)(86362001)(2616005)(38070700005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHdndDV2V0RXZlJBcU52TVlneWlWcGpWbko5VElLemNnb2Y1Q2JLK2V3OHcw?=
 =?utf-8?B?UzM2ZzRhV2RHZmdhcUc2SGRHMHVEaWlzTXB0eDM1R1hkbm9TVTJNS0VZeEdN?=
 =?utf-8?B?eVliYjE0VFpiZGpKT21kaU1rSTVrR1UzRS9KMjczN2VHS1l3T0Q2dGtSWTgw?=
 =?utf-8?B?MjdqRkRYUnNLQ3FYNGYwYXh2YTg0ZGVmQk5OaFFySVBoUEFPOXZxMk42cklq?=
 =?utf-8?B?V3dMVzFtQlFKNmphZG1kTk9DVXBDUHJwMldERXR6cGoxeVdvdm1FeGFTMXZq?=
 =?utf-8?B?TTBTYUxRSVNDRDIrV2t2RUszUVNoaGc5dGFMUTl0TTYyZWJudm1JTXJnWHJW?=
 =?utf-8?B?TjAyalkyNnNVZ0xlVVFqSGtoSzBSa1B0WjduRW95VGI3ZFN1TWIzaStCcFEw?=
 =?utf-8?B?SG5YT21GT2pkVEpFSlZ5NHQrYmYvMkxydTN4aXBNbkRxT0E2TXljUmJkakl1?=
 =?utf-8?B?Vys0RlBBRHdRVHRzZUpsc2FpTGFhUThjc3lxNlpUT25YZE12YmV1cmdtVjNG?=
 =?utf-8?B?NmN0YXM1cENWMUc2MXlici8vb3BHa2M0SW1TS2pYSEk1M3AyM0MxTUlzYmhi?=
 =?utf-8?B?OWNqWVlDUGxjczBXWTFIRUVrOHdUYnZYWk5MVHE2NG9ub1dxWVJCQXhRVGlG?=
 =?utf-8?B?dmppWDltWG9wQlpOUTFGL21UNTVwbmtiRXBQZU5mK0dDa3Z5cFpvLzFwb0xX?=
 =?utf-8?B?NFh1eUl2dWRJc2xTK1BaMllxWHAzZ3RlQzVuVHBjTTAzaG5zaDBObE5iQk5Q?=
 =?utf-8?B?TVVKUFIvZng3aHZ4R1VSQXZkMWJtZE8wWksvbWR4cTN6NnJkR3dvMkpUakkx?=
 =?utf-8?B?bGFYd2xlZlV1ck9rL3c3QzZJSE9xZzJVNmdZMmZmbEZ2Z3BBYUV3S0ZHU3Nh?=
 =?utf-8?B?MEhQZGdCTWZwNGgvaEw1VWo4bWd1Q2U3RDZaQ3BROFFmcWEyaVY0ZGNPNlUz?=
 =?utf-8?B?SHhob3Y4Sk05RDNCS1kyb1VnT0EyMmo4dlZDR091RFpqZmRrMTlBWGdtYWRO?=
 =?utf-8?B?NjJzd1E0TUs2ZVpybHlzV2VMbVlnbmZiUjJqVzRoV2dyK3kyd012Y0ljblRv?=
 =?utf-8?B?Q2lqQmFuV0hZckZ2aVVRYjErVDlYVUhWblkwRUd6RTFpNGxHdEdaTC96MU5I?=
 =?utf-8?B?WW92VDFqWEZsb2ZSTkZlY05CT3FjeTNCOVRkU29rbkFkNVNZVHdadmhyUldQ?=
 =?utf-8?B?TUhpVUZqSVBrUjZMZ2hsMmMvUnRuT1ZZT0p1dUpMRjNtSUFvd0kzTVNyb1J1?=
 =?utf-8?B?NHVmNkk5WFhBWjl0NnZ2ZmtvN2hLbk9Wd1FWazg1STNWSkV3Mi8vMktDdVY4?=
 =?utf-8?B?d3FMajdLb3o2RjZZUkxCRXVjbWJ3QllMMVBTcUIvbThHb2Rhck5GcWpvZm1q?=
 =?utf-8?B?QmM4YmRMSjU0Q3VHdTgyc2o5djg2R3c3cTc4SytPcGxicmlUQzhLNU42ZDA1?=
 =?utf-8?B?TkZZb2JOQTViNlB3RWFwRW5oYmovQ3VWaU00TTNWTkRnbVlubjM2YmpDRWpy?=
 =?utf-8?B?Rm8zMGtqOEtyWVBtYXVpYzFvUnBHRkU1U2kzZkxpWHFNK3JGc0RhTFJCZ0lU?=
 =?utf-8?B?YVBTdE1TYmF1TW1QeS9GR1hiSmNqK2JTdnRkaFpoZlYwR3I3MzZzQ3AvQXpk?=
 =?utf-8?B?Zit6d3djNFl1S1R3SDBmOEIwRFZPZHlla2phcW5pY1N4RUpQSXV3Q0hzK20z?=
 =?utf-8?B?SGRyTzVPYmVTRVNsb25DNlRFQnB3L2ZKck0xQ1JRSXhvNzl3eldTWDhFUEI0?=
 =?utf-8?B?YWs3QTFUK1pkMVF3YkFxT2doU0hLRkY4ZmhIMEUwTnBDOUt0Q2lEVUIxUFJT?=
 =?utf-8?B?bUU3ZWRSK2RGQTZSd1Y2cXdsMXpkUy9zSlhFZ241N2Q0a3A0RUpwQllqaGFy?=
 =?utf-8?B?K0dmMHM2MHVFRjE4bWtRRWhSdUFJbkloc3FPd2tHZUkxMUd2WHp5RFZTdU95?=
 =?utf-8?B?SHZOeWdPbkV6OEpOd2NQVWFPeEhreS9QK3RKZUllUzljbEk0NkxhSnVXWHZk?=
 =?utf-8?B?aVZpWkVIS0dCRTdmUTcwQS9OeE13Q29CUlhGOHE2akFrSDMxeW9scjltRHBR?=
 =?utf-8?B?b001dkNOUjdJb2RCaUh6MG91T3k3Nm4wU3VFLzhsbnkzd0lkS3FKUmJsL2F1?=
 =?utf-8?B?Vm5ydjdtMkZIdnJaRGtyQW15TFp6MTg1Mnd3NE5TR2JxR2hhVXJpdTY2REJi?=
 =?utf-8?Q?kHuXHVhhPJNCvYdz10wY8k0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3986D89C1E0CAD46A9E00FFA751F6761@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96af4586-b005-4af9-ad0a-08db06818439
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2023 07:29:14.1352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kFehKZnTSC4Km45O+FAN954XRsumLS2EaXDxbYIAwehAfQx3moYzK0/WcJu967Azz2wU5K15oVLPs9W9lLK7Q7izNgPoD9yfy1z8FAluPumZv8Ha6uEE5YmA2DmAbvRr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5471
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

SSBzZWUgeW91IGFyZSBpbmZlcnJpbmcgdGhhdCBhIGd1Yy1pZCBvZiB6ZXJvIGNhbiBiZSB2YWxp
ZC4NCkkgYW0gZ3Vlc3NpbmcgdGhhdCBtaWdodCBoYXZlIGNvbnRyaWJ1dGVkIHRvIHNvbWUgbG9z
dCBjYXB0dXJlcz8NClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4NCg0KUmV2aWV3ZWQtYnk6IEFs
YW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQpPbiBUaHUs
IDIwMjMtMDItMDIgYXQgMTc6MTAgLTA4MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20gd3Jv
dGU6DQo+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+
IA0KPiBUaGUgY29tcGFyaXNvbiBpbiB0aGUgc2VhcmNoIGZvciBhIG1hdGNoaW5nIHJlZ2lzdGVy
IGNhcHR1cmUgbm9kZSB3YXMNCj4gbm90IHRoZSBtb3N0IHJlYWRhYmxlLiBTbyByZW1vdmUgdHdv
IHJlZHVuZGFudCB0ZXJtcyBhbmQgcmUtZm9ybWF0IHRvDQo+IGtlZXAgZWFjaCB0ZXJtIG9uIGEg
c2luZ2xlIGxpbmUsIGFuZCBvbmx5IG9uZSB0ZXJtIHBlciBsaW5lLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jIHwgNSArKy0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY2Fw
dHVyZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuYw0K
PiBpbmRleCA3MTA5OTlkNzE4OWVlLi44N2IwODBkZDZiZWFkIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMNCj4gQEAgLTE2MjcsOSAr
MTYyNyw4IEBAIHZvaWQgaW50ZWxfZ3VjX2NhcHR1cmVfZ2V0X21hdGNoaW5nX25vZGUoc3RydWN0
IGludGVsX2d0ICpndCwNCj4gICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUobiwgbnRt
cCwgJmd1Yy0+Y2FwdHVyZS0+b3V0bGlzdCwgbGluaykgew0KPiAgICAgICAgICAgICAgICAgaWYg
KG4tPmVuZ19pbnN0ID09IEdVQ19JRF9UT19FTkdJTkVfSU5TVEFOQ0UoZWUtPmVuZ2luZS0+Z3Vj
X2lkKSAmJg0KPiAgICAgICAgICAgICAgICAgICAgIG4tPmVuZ19jbGFzcyA9PSBHVUNfSURfVE9f
RU5HSU5FX0NMQVNTKGVlLT5lbmdpbmUtPmd1Y19pZCkgJiYNCj4gLSAgICAgICAgICAgICAgICAg
ICBuLT5ndWNfaWQgJiYgbi0+Z3VjX2lkID09IGNlLT5ndWNfaWQuaWQgJiYNCj4gLSAgICAgICAg
ICAgICAgICAgICAobi0+bHJjYSAmIENUWF9HVFRfQUREUkVTU19NQVNLKSAmJiAobi0+bHJjYSAm
IENUWF9HVFRfQUREUkVTU19NQVNLKSA9PQ0KPiAtICAgICAgICAgICAgICAgICAgIChjZS0+bHJj
LmxyY2EgJiBDVFhfR1RUX0FERFJFU1NfTUFTSykpIHsNCj4gKyAgICAgICAgICAgICAgICAgICBu
LT5ndWNfaWQgPT0gY2UtPmd1Y19pZC5pZCAmJg0KPiArICAgICAgICAgICAgICAgICAgIChuLT5s
cmNhICYgQ1RYX0dUVF9BRERSRVNTX01BU0spID09IChjZS0+bHJjLmxyY2EgJiBDVFhfR1RUX0FE
RFJFU1NfTUFTSykpIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgbGlzdF9kZWwoJm4tPmxp
bmspOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBlZS0+Z3VjX2NhcHR1cmVfbm9kZSA9IG47
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVlLT5ndWNfY2FwdHVyZSA9IGd1Yy0+Y2FwdHVy
ZTsNCg0K
