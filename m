Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E330256BAED
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E4E113CC1;
	Fri,  8 Jul 2022 13:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6BC113CC3;
 Fri,  8 Jul 2022 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657287377; x=1688823377;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xszMNu6c8XJYpk6eMxcExGjhxAsKO+y60/9i0Nf48wA=;
 b=kD/3KpnPDSyLUFJOab0nmGcc4qnCIE7p0T6eRllweVa9wP6PdOix1ur2
 N0XxeLhnp/8Kjat6Mq9+VT19+vB0oT00JgZHne463eBAI7c8aBdbngn9l
 D6urRKdRea9hDqVfzQCuXq0LYm1HKFv7IucmloabPym579SRTz9MzB1s/
 eIZNICSstdE4uGbhEess27WT954xZ8xF6FbrFFr/O0HDM1x+eVniyrNOX
 qkyMmizEsQ+AhmnHzVRpni7AVNT+QSMXTJKOfWpRGOwEFJoXrR2dqThPz
 R9ndsRyxA6mnCTaMl5GjMtuf03NjS7QRBjuehhE4TRRWs/kt+U9adqsx4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285408927"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="285408927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="626704880"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 08 Jul 2022 06:35:56 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 06:35:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 06:35:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 06:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSWoBBxvQtir2gseFjz/a56rhIYO5YDdQ/YQHcxvlyYOcIbklbLsKthm//yHWe7wP2CNV2SJr7o+3Q6RdQz9LQHoYAUgWmnFkjytGjv/9HtxT/iisW6xOSX5wkTPqunzilko9R0O2b8U68Ybq7HdqEb0u+/5ZkhkfebNSn8c4ZMwGQgaI00eqeXjRd/cSMYBzITNM/GEKf53FhTYzNT3tnD5YZxz1rbIY3KoPb8PZsbQi47tS2phgNp9FeDwDENc1NL88EtdcjaPg2MBxSvEQNS/We/f8Jid/VqE6PQwx+qpSKUwF61OMtsBy7uYKQKZUL3AGj8UoLle22YjQXAkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xszMNu6c8XJYpk6eMxcExGjhxAsKO+y60/9i0Nf48wA=;
 b=eGBFL9g9Y17gGBqn8qj8vH5+7tOxePbsW/+x/rcfJNfU5w2iYyKn0EvkzL2hawk8jwyslqXyfu1OyZ3SG4Amv+20AYAwrKI6+k/lyWGsIdCmJEww66G0FX3XiLQaaNe5wznhj7lPRkZxlE4yqxrbkAU3Ky3ahQwoLLc3fUTQ0mxE2yfHLAETldqeZFSgX802V1aWSJ1SPFTViqQZthcMDogi9+lm/X9ua6YoJX7JkU+LsjmhiP9G7Q51AjfZ3fP0U/9fGA+KbnvYcVhclzrZuOfadYExwHpkntKdHS5z/46nxJTftBAZ912Dg5AlXv3iJYJfvVbOYFCibtQvnqrtSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 MW3PR11MB4650.namprd11.prod.outlook.com (2603:10b6:303:54::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.17; Fri, 8 Jul 2022 13:35:53 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9%11]) with mapi id 15.20.5417.021; Fri, 8 Jul 2022
 13:35:53 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 3/6] drm/nouveau: audit bo->resource usage
Thread-Topic: [Intel-gfx] [PATCH 3/6] drm/nouveau: audit bo->resource usage
Thread-Index: AQHYkevsluZg0R1v/kmYDISzXyg1Vq10evjQ
Date: Fri, 8 Jul 2022 13:35:53 +0000
Message-ID: <DM5PR11MB1324CFA8CD1A94875D6DFF6DC1829@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
 <20220707102453.3633-4-christian.koenig@amd.com>
In-Reply-To: <20220707102453.3633-4-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bc2c8fa-102a-4993-3f1f-08da60e6c787
x-ms-traffictypediagnostic: MW3PR11MB4650:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HItCLJyjNXmpu8Xm5XMJVbixQWzwpaDe9l+psdFw+9OPPvkIyp/4ubNRFYGV74cdAdXKGH8wOfZEzROwhybL+XoBsysvFPVJ0wnY8oMJ759wG2bbzLvnAqId1pcVTmCGjM2+ibdOgtEW/pS6MUs1MAMqGHhe9ge7ojTOG9838C/Y2F5k6hj+zUfKYEIoFhphwOJChRxx13mRRZlW9FFy2wuJs0HwhSTEc6WOl966E3Fo3ie03v6CsXOQTn4b6BTwqOIGQXYg1lLb+lx/fzsB/yHDVbCnUqT+Lu0H+7YYi2PHBkMyxttkoshate2f+9kEKK0WxRnj8MKI64O0d+NUAEzaM3BFDaGtWyI1+ezA8oNECsBNxx+U8NmoRH8C4aJ1bZHAK3X9Tv0khGc8M1EIUoz//x5W1x3gGn3aYqJlvadHZodsEPy9OCHqwQOtDlrkBW+5pMsj081xOWg+tcVP/EudI7s24Limf+7y5ixz2elErQxMI6HeertkfItJWa7yzPv6NMQMzXgfS6hhf9cwQKIaShCdDLP5t4o/lqs2A/0WcLIFptybQ0+9fgXigQs0ro3fVNVvhIaPzVrgGgQ7Xef0Q/CcgMxNPZVVADMaCWD+3NiaVDkbial8fSB2Fp3ksP0mRmkrYmBqD0LvcoZ1aDOQVtsvlCFeIaRykhbXiNNXsUuJdw9gMTSlJAkzerRfv2dwbu6uUWL4OOoxBJ8On/8hjWH36Geu2shvEzo6C81IAMmKniSjUWIJ8ymaq7pasbPccH734/e6Np94UdWvS5rJLeLzXYcRU/SRDM0UJ8bEI5BEjX4BLRtReD968I1L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(39860400002)(376002)(366004)(478600001)(186003)(83380400001)(64756008)(66446008)(55016003)(71200400001)(4326008)(110136005)(8676002)(66556008)(66946007)(76116006)(82960400001)(66574015)(8936002)(26005)(122000001)(38100700002)(9686003)(52536014)(5660300002)(316002)(33656002)(38070700005)(2906002)(6506007)(86362001)(66476007)(41300700001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU5EN0FqdjJQSGFpaE8xY21iVGZxbjZVL3p5SlBFcnZZYUVsdVl1dVd3ZWw5?=
 =?utf-8?B?eWNBa1NjZUdIdW9kR2FUc2g3VjdnU0lYcDBDc044RXFuVmlDeFEreE5BQmJv?=
 =?utf-8?B?UlNtN1A2V2pnaDRRRE5ueGlGYUcyaElBOUI2ZHorOGRjb0F3S1EvWFZ1WU5s?=
 =?utf-8?B?ZHNCTEZDd201UUlNRzI5eU1lTjIrQXh1SExLRnF2dHA4K1BOWDN6a2MxWllW?=
 =?utf-8?B?TjYreWcxVGxWTjh0R0U4L0g5OFVVMndIUW5aTG9nbktmZ1ZydDE0dnJwcTdM?=
 =?utf-8?B?Z0Q0a3lTWjdJTGZRSmsvb2FxM3J4NWNTT1pCSVc5QytwakFUbk94Mm1JNXNa?=
 =?utf-8?B?OEVlRWEzUVdkcjRiNCtlbjcxVUcwTHYxd0RqdzhwbFY0MVNFVTM1S09aZ3Ix?=
 =?utf-8?B?a2I2eXRFc2c3MlRIZ28vQXR1cUE1NndwMzRiSXAxTVNVL3hSVTJNWFJGZEla?=
 =?utf-8?B?ZWo4eTFoaG9KZVhqVnZ2azNoNitaMEMya0s2L1I3SnVxdWFURjhnb0JaZi9L?=
 =?utf-8?B?ejluNU9WTnBKMGYyZGFEdU9mWXBiZjhaaXg5cDlFTmREYXJ5ejJreUNxMi9Q?=
 =?utf-8?B?YXdwbElOcUFOdWltQkJtWHBVUGZWYStVQ0dnZDNzaHh6WkZVc1doOFhOclNn?=
 =?utf-8?B?ZzdCd1pXeWZYdnBMVXJZTTBRQ3BhdlNsZnBLa3BCSkM3UDVINkd1SzJRdGNa?=
 =?utf-8?B?UXpNTGlKaWVLYnU4blVuMXhsY0V3Wm8zeWpCdTVPSitXcXkxOERtUU9uZ3g0?=
 =?utf-8?B?di9lVFBGanRFeUI1VkhKOHVWUE5PdjFPdlNiWEthUG04OGw4YUY1TWFWb25O?=
 =?utf-8?B?RU81dko4KzhVZFJMTmc0M3Vjd2Y3SEluL2duV3pEOE9tRmljQyt1Vjg0VTZT?=
 =?utf-8?B?eXFRWkVBaFVBL205aDdwZUw0RldCdTJVcC9yK01GMk85Q0Z5elc5ZXl2eVZN?=
 =?utf-8?B?NjYyZ1ZMUDkwQ1htQUpYTmNaaFp3Z2Q4QmR5blVLQ3VRVUdHbW1OVFV3bVU0?=
 =?utf-8?B?TzFDenpTRnJmTnI4RHRRTDZXZi8yYlpyV0dYdFlIcytCalpFMXdhSXMweUdE?=
 =?utf-8?B?d3o4RDIrczVtMDZxb1RORThwN0tqeG9NaEtMN2Z4bnFlQndyNHZmbUs1NUVh?=
 =?utf-8?B?cnNPaENhdWFUVXo0VkMrRVZBQjIrYi9rOW56WGhHd3N5MFNSQXgyd1pnOTho?=
 =?utf-8?B?L3AzbHJkRGg4SlRRZmZVZHozL2lQUjFZUXNYRDcvWkxBZ21ZVFBpNkZjUWdR?=
 =?utf-8?B?NGtHTyszaFhQMURUOEpVeXNKYjFzWnh4SG1uZ21XUDByVS9BNkNVZ3ZoVnha?=
 =?utf-8?B?NzRzZ2RiK0pLZDJ0bnY0ZlFzQkZjYitRNXNXazRGdmt6NnFlK2p1MnUwbGpp?=
 =?utf-8?B?SXFSY1pJdVJlcS9qWGhEaTBIZy83MCs3d0NBWWZsOEhjTkM0TnN1T1JxMlQy?=
 =?utf-8?B?djhoOHlaOTlXLzdzdjgvbnMvakxIQnlIRG41bVY5blQvQ25Xek9rK2Q1YkEz?=
 =?utf-8?B?dWdndDJ0eGNGdE5hejJLd0VlRWdvMXh4MW5EalRSZWEzKzgyMkdRZzhtK1Ru?=
 =?utf-8?B?d28zL1V2djN1RVhsQ09wRmo3L0ZwS3BBakxodmFTdTV5aWRBN1dWZHhpU2NU?=
 =?utf-8?B?NWxlTFU5NXJweDJCMkZXYmJURW5TWWsrYTh0cVVCTldsV090T04xUXdUWEJ4?=
 =?utf-8?B?THJOT0ZoT3o0eUdyV1l5ZDd6WXhETStvWTFqbGxLNzhKVXVUWmVpNGNKVFZx?=
 =?utf-8?B?RytyYXJKQWhERG03MXhZQ01RaHJDMjJDK2JZZWJNMWRpUEQvbFhTVi9FQUVy?=
 =?utf-8?B?YWgwYlNJa3Y4TklCcm5kWEthVEprQU1KZnl4amgrUFUyamlLNGp5enhmay93?=
 =?utf-8?B?d1BCbjN0RE5ham54OWs0ZmJtc2hTNlNzNFZoRllZREFFR09PVkt6alFJZDV0?=
 =?utf-8?B?UlR5b0dwV3Q1TEl0bUt1ZjZ0RTIwVmRBNHI0b1pTemhNTkRrVytpWW1RbmF6?=
 =?utf-8?B?c1BSNEJuT0U1UTUwOVlmNVgxZ21OY0NFRkZwK1FPV0RJTUZuRjFuUmtQVG9w?=
 =?utf-8?B?V2pyWGxnQ1dXampYUGFpVVFldFl0ZzBFbXlZLzkvTlhFVksvdHdFdlJackpz?=
 =?utf-8?Q?H3Y7MquUXzdimhK4KpGbV1l7U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc2c8fa-102a-4993-3f1f-08da60e6c787
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 13:35:53.2464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkytbjQyjjJDPy+tLdt5NILzzHbEouTqgnqrLL8oNXfeOoywDstJIhKvwyCQ7wuLeidgjMxvGrzcY/lc7XinK60pbDymvSfOxtb24Lefdrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4650
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1nZngt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgSnVseSA3LCAyMDIyIDY6MjUgQU0NCj5UbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsNCj5ub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj5DYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPlN1YmplY3Q6IFtJbnRlbC1nZnhdIFtQQVRDSCAzLzZdIGRybS9ub3V2ZWF1OiBhdWRpdCBi
by0+cmVzb3VyY2UgdXNhZ2UNCj4NCj5NYWtlIHN1cmUgd2UgY2FuIGF0IGxlYXN0IG1vdmUgYW5k
IHJlbGVhc2UgQk9zIHdpdGhvdXQgYmFja2luZyBzdG9yZS4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNClJldmlld2VkLWJ5
OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KTQ0KDQo+LS0t
DQo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDMgKystDQo+IDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj5kaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jDQo+Yi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMNCj5pbmRleCA5MmNkMTkwMjEwODQuLmY4M2ZiNDNiMmU0
NCAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMNCj4r
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMNCj5AQCAtMTAwNiw3ICsx
MDA2LDggQEAgbm91dmVhdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+
Ym9vbCBldmljdCwNCj4gCX0NCj4NCj4gCS8qIEZha2UgYm8gY29weS4gKi8NCj4tCWlmIChvbGRf
cmVnLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYmICFiby0+dHRtKSB7DQo+KwlpZiAoIW9s
ZF9yZWcgfHwgKG9sZF9yZWctPm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0gJiYNCj4rCQkJICFi
by0+dHRtKSkgew0KPiAJCXR0bV9ib19tb3ZlX251bGwoYm8sIG5ld19yZWcpOw0KPiAJCWdvdG8g
b3V0Ow0KPiAJfQ0KPi0tDQo+Mi4yNS4xDQoNCg==
