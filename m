Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FA5569B9E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 09:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CF112BDD6;
	Thu,  7 Jul 2022 07:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C4912BDD6;
 Thu,  7 Jul 2022 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657179137; x=1688715137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=67/YJ3BEkrrsXwInl8Fu0v8fbuZwQvI7pWyTfCYWSA8=;
 b=SVRVaIeTi48LwCcoGaJakRBZNRo8PK8DXL6RLlm5SBfj/YOSh+8X0J4F
 1t+TY9nKEFgkiQVrYIUJRZFvcc8aRUgEZR6BQwJKVeARpsMxW/e1ij9I3
 Z1T8GqeIBJlv+h2iknovubxA1qzqK1k+iXLL3HCWsi/Efr5i2kMkXY9NX
 xdokyusn+Oiv44lIjYGL5D/JjPSTLZ55PHx1C0vXSk/B3WfuQpqYRTzNp
 cZV59JnSuvAAxyxk1cQeerFKMHt8n0HD//ToX7gr0FuZGIl4SRYvbBC/Z
 CCJV5wdt/HrOXBe7k8zwXQM4FntSXy9KH9TifcJGxSOARPSzw+2boP6DH w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="347939894"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="347939894"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 00:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="591102022"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 07 Jul 2022 00:32:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 00:32:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 00:32:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 00:32:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTGu20wsgIuTJaRmi8XnQPfkChm5cD7HBJSWETjl87GG4Cz1V4epu/eIWAKDic3TUZ28oi2nlYi5eeUE5ATSoe8ZKUpc0uabLFowd80ALfp/ayd++b7WjrMxOfMrKYDbaI2mFgGdYrHS5BG0iHMWRbW8quIpdvCVSatCXctF+T11CG3YrnX089qMHSXrVM1BpgEPqOLJCbOYn7lYhtCp8b/zkxeBkAIfjAWoJYXs4U19f9PZoCKnyLYjGGjHh5l7MLwFOgztAkRGrv2ubOHcSZdrVaqcOO+UX0yci15hYTop0BeAZNGWv38C9cm3LEjw7kgl2QQ2jG13SPjYBtlFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67/YJ3BEkrrsXwInl8Fu0v8fbuZwQvI7pWyTfCYWSA8=;
 b=ggwTvf6lfIFl0oYj5SOA2ieZmtUOf4n7ymqzqCMYIOY+QP5omuWZMOhU5Af5Yvckob1uMj3Tl/C3EZqwveMSBwyQ9fpyC6sBh+xsC5NUxSXeg67gGYKSBfpzQUee1hw1Sal/AbyuoWyCgp4h1vLqf4Jy4t+VQEDOSaIQ9/bJXmk1Tu726o+4LxgmY3QYYM/zfRBh8BEx1va0swV0+wB8e3ig7GYZT7uyZ6NWtPUo1Pz/F+M6SM/3GnEUbuMoo8+jplfhRNokGAhXx1/DtWje+tIjnZfV7VQNB8RK7g26ZM85mDBGGK+YKehF2vXrnaxpSX/L1NmlVMcHyQdXyHz4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BY5PR11MB4212.namprd11.prod.outlook.com (2603:10b6:a03:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 07:32:14 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd%5]) with mapi id 15.20.5395.022; Thu, 7 Jul 2022
 07:32:14 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 01/10] drm/i915/vm_bind: Introduce VM_BIND ioctl
Thread-Topic: [RFC 01/10] drm/i915/vm_bind: Introduce VM_BIND ioctl
Thread-Index: AQHYjZ0aHJygNl8wvkSa0amK5/9+fK1vkJOAgALRf4CAACoNgA==
Date: Thu, 7 Jul 2022 07:32:14 +0000
Message-ID: <117ee54783bc88715214cb5082a11b0239dce0c4.camel@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-2-niranjana.vishwanathapura@intel.com>
 <fbbba03a0a0d0f97136b1449276b763a70beb084.camel@intel.com>
 <20220707050143.GK14039@nvishwa1-DESK>
In-Reply-To: <20220707050143.GK14039@nvishwa1-DESK>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05840216-6777-413e-aee1-08da5fead016
x-ms-traffictypediagnostic: BY5PR11MB4212:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rdheo9muDEMm0gD5nsEvWZYtjZu9+coihZ2SM4Wvc2hoj/EWpvwDN7nYKqdHBB3M0grXC6suAeUSyXZGkz2IfrlB3lXhsSP5gT+PvNF28+T75ai8Tzr+gWQLCH8th/AhyYVt9M2I8FoSEMC2q4dMct9aKUAsyMApNf309uFPdFy8L4Qw9Sz3G6bbqbhXK/N+uelHVZbbsUmT+G1MGLMaEnbt7Q0uMXxe1dF7105oJc0F3jN9FjnfHyQrTHT5oIkEshiscuJ9z5ZTz/rH9mezQZdyMU65+PzHN9qDaBD/ts1ogQqLXU8vdaS29DXrNBrAd9pws95JhcFFhCo5q5jcggqY9xK3n6nejAQj+eBcsDCXw4tLoiSxvxwS2hUMe2OO0an9UPM3vJ56OCH2KuVRZ1GSqkNJv/1Wo8JfMNn1SLwOONbn6IaE1dbpoGnS+48/PB/9Gnk8o2E08UoELWWm0F0JzccD9EDNyby41C3IBQWxYnwaxgDszCrVliLKqGYTAdccw7qFfCrWW/DaaUT/BRBeUA5yk7pXOEixnsCZD6xnzG4OBNHJQimdglAna14eTv+x1sKunqzU27GP0cy3UDobEGTGcVN0tOJReB+cgxJdln7my/+zoKJhLyRdxg/AiULTcBL6mosQfRv2M0X/B+DWb0sTDdA8hjKsloY4WYiAoKuJaKcd9zvO6G08ZBxRVstIEhXbemiN6x3rKvZgLHAaKQTVFzYtdTV+H8qqmaxg6lQrO8boVWxVDCNUtpnUhJMPIpFVVap5zHPQxVqSw8vId5nR2hR1lIUem6JP87hGOBWHwhHamOW2zPrCMTACNKZH0O0jVkii7Q1rNVpL1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(376002)(136003)(39860400002)(366004)(83380400001)(54906003)(37006003)(6636002)(6862004)(8936002)(5660300002)(36756003)(82960400001)(2906002)(86362001)(66556008)(316002)(8676002)(71200400001)(186003)(478600001)(38070700005)(38100700002)(64756008)(66446008)(91956017)(76116006)(66946007)(122000001)(66476007)(6506007)(4326008)(6512007)(26005)(41300700001)(2616005)(6486002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STUvQTA3c3pQcy93V3N2UUM4WFlUMmxlQnNqbmZ4aUVzc0tyY0FRWTZJSEcy?=
 =?utf-8?B?VGNoUE0xbnU2dTdTdEpISlpxNmpjdTdoeElodzI2c3hpM2pteTEvVU05ei9t?=
 =?utf-8?B?Vk1FWXpIQXBNa0Z3S3pXcko3V1JxMVIxTzZ0M1B4TzJsSnA0dmpvZW1nZ1ND?=
 =?utf-8?B?RDRUbFhsT3F1Q0ZCdEZVeDZCbk5YZlRuNlFUVXJPNnh0OWdLbDZOcExEQVIv?=
 =?utf-8?B?WW9nQTE2a3BwdVNTNDJYdWdYY1FzSi9ieE85ZjhjM28vUHRkSkVJM2g4d29a?=
 =?utf-8?B?bzA1Uk1OK3ZQTmVrdURxMFpyWHNCN1RtUTl6QzVJalArVEh5KzJHSld0N2F6?=
 =?utf-8?B?eWFKb3hkcWxxVkliYmI2aHBWZzRvbXN0ZGJTdzJwR2xGSE1sWGJnR00wazNL?=
 =?utf-8?B?ZktGd05kMnorTDdrWkhja2tSaE1sakdXK0NNQlk3WUIxQklyQWZpYXZtVVBO?=
 =?utf-8?B?VXRZUEJadnQ5VHRJeWsydnhTSmhmd2dHZkxEVVdlZSs2SWIyQzlSTlg5dVlv?=
 =?utf-8?B?aTBRMkFJSklRaUNoV1kxNDlldDJFblZmMm5EMENNQkRUQ2lvbnFZVGRka0JU?=
 =?utf-8?B?d2xhcVNONTVmQVk3SmxCaDFZVERvRWs0OXpaek12ckFqRFBjRHpaWDNFdWZk?=
 =?utf-8?B?RmxwcGpZWklaV0gzUFI5enBKb0ViWkV2MkpwQUhheEt3Nkp1UUxEZUlmT2th?=
 =?utf-8?B?ei9mODZyZkdWUEE2b21sYU1nV0JtZzJ2YmxhZ0VjQnFIZTd4UlBrQ0ZvL2Yr?=
 =?utf-8?B?RUdZQlpWS1NpYnVHVWpaZXNHNXRyQW4wdmI1M01LdXNCTmk1cFcxZlNBakk1?=
 =?utf-8?B?SUNQQXFWSnNBaTIwckRBQTZBRWMzdmhqQmVaNjBneVc0b1VXUnVGSGMyOG5N?=
 =?utf-8?B?R0p6L2J3SFZpN3dPZ3ZvNGJaeW4wMmMxbC9jWTVvM0hKMVRENFFLb0JBT21k?=
 =?utf-8?B?TnNNei95NXFESlVNcjQ2eWJqek9COXQ0Q092Zzl3QVVKN3RaK1p6cnU0bDFG?=
 =?utf-8?B?VjFSdWlFam9mcFlnVlJPcEpxRk5oM3FobG9JOHBKZ3ZIeFZMY3NVeWt6a3Js?=
 =?utf-8?B?L2xURUhmZm5NdVRMclhqelFha0pUQWxTbUFKOUh6N2ZIczllT2hQZjFvOWF5?=
 =?utf-8?B?MVRqR1ZkL2pjSktuMjkxd014cDY4ZVhBZmlmcjhtMHMzd2ljUTVqY2FPV056?=
 =?utf-8?B?THJBbW9KUmFoeGpDRlZwSVJBRng3Y0tSMSt6dTA5ZkN4NlZmWU1GbnBuMk83?=
 =?utf-8?B?Zjk1N1hOakg5elFrdUIzYlRvTkRlQ1BZK2lVeDJPMGtPUmdabU51YTRWZnM5?=
 =?utf-8?B?cTg1N3Vyckd5MHhrWnFONlV3YmlsSVhkOXRLWmlvbnRwS21OVk5iVHdLMWU1?=
 =?utf-8?B?by81YlBzaHVYeHpRMWc4cXFkU20yR0hyUFlDb1g1ZlZCRk1ESXlOL3hhNEJP?=
 =?utf-8?B?TnJrbkdNVVZ2Snl5WHhKbFdDYWM1b01MSW1oRXN6VFAwTldNblRWNHZlMndh?=
 =?utf-8?B?TVptWit6QVR1am1GOVNFWC9BYzY1T3BweDZZRm5adWhlVzhhb0ErWVlORlc0?=
 =?utf-8?B?SzhjSE9zQldic3ZKa1loVUZGRWRkc2xZL3NtYnpBNDExTlJUcnJHOGVubWti?=
 =?utf-8?B?RlRVVzFGcUl0cDZCbllZMTRoTDBwNkl0enhab2xzeFNOSHFPb0t3YU1sb0U0?=
 =?utf-8?B?eVRhYzlnc3JaSmlUWjk2b1dscHdyU0Z3ZmZRMVNRZXVMWS9EZkpUWi9kdno5?=
 =?utf-8?B?NlNYeGJTTVFTWUMvV3UrcjF4MlZhQlV0NkJFYUxiOUxValJoOWNpTGNja1VL?=
 =?utf-8?B?cVV6NWVKYWFrS1pMeTVvSzJxWmtKOHJTRFh4VUk2YTZscmp2ZVRnajdQUjB5?=
 =?utf-8?B?SEtucklZakw0MW4zMHpCSGplMFhwYjd0NllTT3VsRGxHUEtGTmo2Sm93dHhy?=
 =?utf-8?B?dEFWd0l5Zi92L2g2ZHVKTmJOL21icEt6NWZsRGkrNnl2cHN2QWNnY3QrWUhl?=
 =?utf-8?B?Y09GUmllaVMydC83MXhsZ3ZOUzREczN4Z0t4V0pKUjZWQVZ3VlZ2TEJXQkU4?=
 =?utf-8?B?M3hxeSsrUm5rbWw1TENuZkZKMUI4U3lRTmpiY1F0MFFoMFJnU2VTOThXRFFG?=
 =?utf-8?B?YnVSYTRMQ1NBTjAvcjhqcDdDVFBnQzlQM2h2R0xHZit0c3VwaW1KbndhMG4w?=
 =?utf-8?Q?KHMErhBfITC8LN7s2wjO4qw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7984D9779D92EA4997503154DB3EC7C9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05840216-6777-413e-aee1-08da5fead016
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 07:32:14.4323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6AQ+FCfr2FDUMVMVLxoXF5GTFWXlAw3PNIjEPpr4lLmrS7y+6nJVbL/0Xh4nfbbUAYYi1w1mqeQW/u98Ig1h8uEdB2mRtwf681tCTH7FS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4212
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA3LTA2IGF0IDIyOjAxIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiA+ID4gK8KgwqDCoMKgwqDCoCAvKioNCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oCAqIHRydWU6IGFsbG93IG9ubHkgdm1fYmluZCBtZXRob2Qgb2YgYmluZGluZy4NCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoCAqIGZhbHNlOiBhbGxvdyBvbmx5IGxlZ2FjeSBleGVjYnVmZiBtZXRob2Qg
b2YgYmluZGluZy4NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqLw0KPiA+IA0KPiA+IFVzZSBwcm9w
ZXIga2VybmVsZG9jLiAoU2FtZSBob2xkcyBmb3Igc3RydWN0dXJlIGRvY3VtZW50YXRpb24NCj4g
PiBhY3Jvc3MNCj4gPiB0aGUgc2VyaWVzKS4NCj4gPiBBbHNvIHBsZWFzZSBmb2xsb3cgaW50ZXJu
YWwgbG9ja2luZyBndWlkZWxpbmVzIG9uIGRvY3VtZW50YXRpb24gb2YNCj4gPiBtZW1iZXJzIHRo
YXQgbmVlZCBwcm90ZWN0aW9uIHdpdGggbG9ja3MuDQo+IA0KPiBJIGp1c3QgZm9sbG93ZWQgdGhl
IGRvY3VtZW50YXRpb24gY29udmVudGlvbiB0aGF0IHdhcyBhbHJlYWR5IHRoZXJlDQo+IDspDQo+
IEkgdGhpbmsgd2UgbmVlZCBhIHByZXAgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgdGhhdCBhZGRzIGtl
cm5lbC1kb2MgZm9yDQo+IHRoZXNlIHN0cnVjdHVyZXMgYW5kIHRoZW4gYWRkIG5ldyBmaWVsZHMg
Zm9yIHZtX2JpbmQgd2l0aCBwcm9wZXINCj4ga2VybmVsLWRvY3MuDQoNClRoYXQgd291bGQgYmUg
YXdlc29tZSBpZiB3ZSBjb3VsZCBkbyB0aGF0LCBidXQgYXMgYSBtaW5pbXVtLCBJIHRoaW5rDQp0
aGF0IG5ldyBpbi1saW5lIHN0cnVjdCAvIHVuaW9uIGNvbW1lbnRzIHNob3VsZCBmb2xsb3cNCg0K
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS4zL2RvYy1ndWlkZS9rZXJuZWwtZG9j
Lmh0bWwjaW4tbGluZS1tZW1iZXItZG9jdW1lbnRhdGlvbi1jb21tZW50cw0KDQphbmQgY29tcGxl
dGVseSBuZXcgc3RydWN0IC8gdW5pb25zIHNob3VsZCBmb2xsb3cNCg0KaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9kb2MvaHRtbC92NS4zL2RvYy1ndWlkZS9rZXJuZWwtZG9jLmh0bWwjaW4tbGluZS1t
ZW1iZXItZG9jdW1lbnRhdGlvbi1jb21tZW50cywNCg0KYW5kIGluIHBhcnRpY3VsYXIgdGhlIGlu
dGVybmFsIGxvY2tpbmcgZ3VpZGVsaW5lcyB3aGF0IG1lbWJlcnMgYXJlDQpwcm90ZWN0ZWQgd2l0
aCB3aGF0IGxvY2tzIGFuZCwgaWYgYXBwbGljYWJsZSwgaG93LiAoRm9yIGV4YW1wbGUgYQ0KbWVt
YmVyIG1heSBiZSBwcm90ZWN0ZWQgYnkgdHdvIGxvY2tzIHdoZW4gd3JpdGluZyB0byBpdCBhbmQg
b25seSBvbmUgb2YNCnRoZSBsb2NrcyB3aGVuIHJlYWRpbmcpLg0KDQovVGhvbWFzDQoNCg0K
