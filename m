Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F228876D6E5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D075B10E563;
	Wed,  2 Aug 2023 18:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90AF10E20E;
 Wed,  2 Aug 2023 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691001353; x=1722537353;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aOcFr5gk2etIB5xJJdJUH6eeOVqCSd4PBVrHT5wJnGo=;
 b=m8FuH5Air8mwV9v8MIgIPgiMuoiaP1cSquGtnpmlpumpd7a6IF6uXSR0
 WaKb4GxtjwFsLk+c1Kt+Gs/wEEsQdlD+/Bc/z+T9TbZM3OTat4UeILAoj
 uGm0186RWl1wqGIYOGUDK6Xa6vVz4XQYcs9Vg89dWk/QNLljIH9wqO/Gq
 oc3iLAJSw4MtanHrjRHnIb0doS3fMYYnwD7VkutFHE48N7BAOpiA7UfpD
 GOdSrHUUOnSelP+MmR41cWJaQdHFEOlAe0LrVaejYcUt+aBynnzYYNgRe
 cses7Ze4gZYlYBg6/XgnWcS+yOve4w4TfxkYU8MPuxOtDu3uOF1F00RPf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369671080"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="369671080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 11:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="758852107"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="758852107"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2023 11:35:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 11:35:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 11:35:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 11:35:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 11:35:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5lyT8E7M5IODBwotND51/LJbLQjt3Ij4twZcask/FwFdv0WeEv6KSWDdnP+Cww0hTGmIqlM7cQk49LCOEE+0P9cb+lYPcVT9unrGWCuFmAz0+Im60NSUequawB0VqnXSZcLWtak6on9kkMIgGj7q+37RZGMEPLqbJnmpfJYiDu1f8f0arDUxqhVWElAD4vRCp3s/4WTIwWXAP8CHAXMK0ctntyXiIQQQz4vK+ww2fSTWsxlByd+m6ulkM0huBDh2JG3BCNvTqTcIES3OG/rvE1W2DdtHnmjdjtZSm2iRcQ7YFyTLudDGRw9kvmvx78Zbflk+6RpPyv38grcPxxrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOcFr5gk2etIB5xJJdJUH6eeOVqCSd4PBVrHT5wJnGo=;
 b=JEtNmcsQ86exIKypdn83NdbTBh5HM618N4IsGAJj1QZgxA8JmOYu9JnhnLm7XJN9b8kUIxe+gq5lgWGt7vLA6jneKk0LrvEw8Unbq5SVXwu9xYeZAW/TY67dxOeMynZemMkwDBi0GhhOl83s11Kdv+WG34tMwt5QfTssR1PP7z99Rto63jijexQtXAk275nNmAcyl8RTFQlJf0KezLEX12yND5yLm5taU5G6F7h1HbOjw2vODdEtsP0fYVQjp7B7fxmpVH6guWaiD0ekTNK2T9gnVBKgzCKlC31ITfwdrBVLsx5Z9vFYDh5CjH8gU7fn11QxUGPlR26DLj190st6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 18:35:47 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::9ff3:209f:a79f:a504]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::9ff3:209f:a79f:a504%7]) with mapi id 15.20.6631.046; Wed, 2 Aug 2023
 18:35:47 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/pxp/mtl: intel_pxp_init_hw needs runtime-pm
 inside pm-complete
Thread-Topic: [PATCH] drm/i915/pxp/mtl: intel_pxp_init_hw needs runtime-pm
 inside pm-complete
Thread-Index: AQHZlKIObNes6Y3ba0KsaPn1wg3zia/OcrIAgAlEVoA=
Date: Wed, 2 Aug 2023 18:35:47 +0000
Message-ID: <32fa28216eacfad2e228f8266c73c3f7554fbd64.camel@intel.com>
References: <20230601155917.2402415-1-alan.previn.teres.alexis@intel.com>
 <5249e8ef-a756-fa5b-270a-e7e3964e6f9b@intel.com>
In-Reply-To: <5249e8ef-a756-fa5b-270a-e7e3964e6f9b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|DS0PR11MB8083:EE_
x-ms-office365-filtering-correlation-id: add56608-a068-46a7-8c7b-08db93874a29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: USVtwvhF7J8XigfR34B0lnb9CPd+PU+eGkEqI3MtlmDI1YjXQY/I4P/rtrV7ZXmPGIybx+TqbrVgx2DnGi27QAgpmnYWK2G2cyNVnTUAdziNztpBMOUKxA7O29KIfrU/71uvssN+GEQQv/6COZ/LbzABtuQDvybuGGstyOZCSbZhrAoT//46Fc4yp/EXW1cAZzkyly9WhLmLttsk8Uq5VT+jF5lt4BNLkM8VmaCL3WMRyyDEdUHqto4Chv5oCJBcYjoGUMh4eKAAfURWs4/K0KVUETjZq97EK6VguwRLpofFm2Sr4c7k6fdVsP49QXVCyK8tJbwasgtHi5UEhMAEC5Oh+rCY4/9xfLEMV3OCm4mThWdc1IjhmgBMYi9vOPNpaI7RUg5k9+t2iPIVlKUJHDsNURfgKiMonsYTWyeeBOOqCyCTUswXhiamQPoIQk4J9u1EH0+o+jE4Ya5EGAF8Jo2WOCJi1kU59B91kkYwNKHYDcIwbh5KfuGj4sDPyI53n1Y2Y+EzkixyGzQXjU3eOLzF4mqFUS/dfEdlF/vV/Jtl6nVNxeEmAWioKfWuJHj4OwdMc6E2mZNGVSTJDKfoBDrZWfLzL+d1e4FRIThCIY/0hfRFMIypb334i3livxTs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(8676002)(5660300002)(83380400001)(122000001)(2616005)(82960400001)(41300700001)(38100700002)(4744005)(316002)(186003)(8936002)(6506007)(38070700005)(26005)(4326008)(66946007)(66446008)(86362001)(64756008)(66556008)(66476007)(6512007)(76116006)(91956017)(450100002)(2906002)(6486002)(71200400001)(36756003)(478600001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDJRR2dINDdXT0h3TDAyTEhnMUY3aDJOR1pXemJHdk83SWpqTk1qbGM5UDBz?=
 =?utf-8?B?QTdnL0ptK2ZUK2llVEluQUEyMlRWSHlUMFhabnBhZEEvaHdKR3FJRzhEV0JK?=
 =?utf-8?B?d0pTN3VaS3haSSsva0VNeWdTSVV5QUJGTWJWZ3dYdlRSNVdqRDFQOWtoS0tL?=
 =?utf-8?B?bXRNTCs2OE1MQytlL25MR3NjeDQ1VGovSFljSkpXZDh3Z29QcUM3bmlkOVJm?=
 =?utf-8?B?NHVxWHBPVUNta3dvRzdoelZOOW1keVNFbmhqQWtRNXRwdlJmQTNoNXp5eWhu?=
 =?utf-8?B?VVhIYjJ0VUVLaEl5SlBqNE1MNXlsQ1ZqQVZKYVhZam1vMXJ6eG9oL0VjM25s?=
 =?utf-8?B?R3NoVEE3Nkd0YUV2WXZ2QUI5SzdFSWN1SDh5aklsK2RjS0dTa2tDRzlvSjM0?=
 =?utf-8?B?NmVrOVBJeHlOM0dGOHBCWE1DWVJjbUNURWNBaEd2c0tJdWpFTGNJSHdQc1NP?=
 =?utf-8?B?Wkp1cWsycXFDNmZ5ZVJTUUdkdi92b0Z2THJPSGNydWhUaGZVMU9pd3g0THV5?=
 =?utf-8?B?UnF2WEg0UFhOQVY0cWpEdjNic3d5Y3psdWZuQUVqODh4R1pVV2Y2aGNHdFBX?=
 =?utf-8?B?TUgxYWo4MEtwQW1QY2dRWFhOZnJ3MEJQMmdiZExrWWJybkxHcGplNkt1ZHpy?=
 =?utf-8?B?bHR5TFphdkZmNXZMTmsvbm1BNllCYXp1Z3lPZEtXNDgreFNjUkpaRTNVNlMx?=
 =?utf-8?B?b0VkYUdlSWRWWmJUSHRGeTJ2Qlk4WXliQjBRaXZ4R1JpZjdXcWgvaUNMNXNI?=
 =?utf-8?B?ZDRxQWhuaXVvbEtlU0NoeEtVR0FMSVVmRVMvQ1BDb210dHVXSWlDREkrTnZD?=
 =?utf-8?B?TGIwY29lKytPTW00Sm80bHpCMUtBekdxcXljOVRzeFJBVUFnVmtJeXZ6ai9h?=
 =?utf-8?B?U09WcDgrY0dMVFl2RU9XOFRzZGwvREhKcXA0S0NMUDB0ZFJkV1RraTBjUVdt?=
 =?utf-8?B?R1A5cGpkNlZsQ0E3Vld1YjJLOHR3bEVyaXFSZnhoQ2o4TzNYcXRRKzRYMlo1?=
 =?utf-8?B?cWQzdVB6RjZZWE1IQmpyNDdKWmZRRXFPQkVYaVJHMloxM0t4dmdBTjQ3ejJQ?=
 =?utf-8?B?NHJmakliWGdzWmxQbjVHNVFXOHljV05xUUJIU0YvZWNEWjlWN3ZuVXBnUDBZ?=
 =?utf-8?B?UW5qVFlSTkdBeW90aEpVdklTeUV4eDJQM1F0T0U1eUlvWE0xQUxOUE1qTXNm?=
 =?utf-8?B?UjZaQzgvMk5Hbnk3OHU3bkJiMnFhcUF3N2RKaytrWWN5NnVscjlqKzdCbkQ4?=
 =?utf-8?B?cjFvVm5rN0I2bGtUbTQ3NnM0bE8zWFBjd2U3Z3FHMUg0cHYzNFl4eXo5bDE2?=
 =?utf-8?B?UzFHRXdTWWw1M1FNNG1kNm93ajM0N2VYRWwxYjROR2lCSGJQQ1NDSUsxOU44?=
 =?utf-8?B?TWlwVXU5NHJPQnpPeDl3YkZROGovam5KaWpuc2pKQm9QQ1czb09RZTRwWktr?=
 =?utf-8?B?SkpzRlVjTVNwTGZ1TUcydEVPcjlYQWNsdEttUFhtRGR3QlRXK2xwMGxlbG9h?=
 =?utf-8?B?L3BJU1ZVWVZFRHhaN0ZhcWxjVll3Zll0NXg3clZpZDV1NTRmUlR1RHpxN0pG?=
 =?utf-8?B?VDh6R3RibGFBNzNScWF5Rzh6YWwvd3RjMElhRVFIbW44a0tLbE1IY0h6cUN4?=
 =?utf-8?B?a0o4QVVBcDBPbXA4V2hUdEV5MEVzYnpwRExDZ2FNeEdJUW1pNXpqSWNXQWZq?=
 =?utf-8?B?dGQ5aFJzSFZMWnIvVUdaVHhVbjJiZUN6ZUJOM3pGYlYwRm1iRWZoMzdJN25B?=
 =?utf-8?B?SERLT1NLSm5rdGpTcnBYUHJCNUtCTzRhQzJPUUkvUWgrOFhYVE4xMlhQNUlk?=
 =?utf-8?B?TnJIYUlERDZSQ3lVZmwxY2xLVmYySVA4Tmp6eEZpT1JQTWh1djR5WkFuMVJv?=
 =?utf-8?B?aDZSamxCUDJXUU9idVhEMXByNldoNUZobHhmVkZDM2JyL09tQitZQjliSlI3?=
 =?utf-8?B?YTkrUXJwcEM1QUtnb2VZdm9udWdpblRGaGZGN2RnM3QzRnNJMG9MUlgvVzBa?=
 =?utf-8?B?dmdYVDE4VGVkMHA0aEg4SUs4aGFrcFNVTFE0elBZSzN5eTEzNWswWmt2ZEtH?=
 =?utf-8?B?a1piSWpMM3lTOUdzWjRHckNhVlBuMFRJTWRUdUhHdWN1SDM5M3dxWk1ydDEx?=
 =?utf-8?B?dDRLTkVVbXdsT0FvR1licUl5MzBMc3lmUEdCS0IwbFByU3dUakRSZnRmNlVp?=
 =?utf-8?Q?Isl9U6UYVB1auXzxig42aBs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B3C0B916B884B44A94C8E7FBE9379CF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add56608-a068-46a7-8c7b-08db93874a29
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 18:35:47.7002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9e8Y9+qp/K5JMgRfz7FRp5uqQzACF3xOl0XCWuXq3qLrw84yYFthaVKAiumxqcCg2Sq75UeRYFzQR8FvOpZhuSoqWYABsNbc+tIPygn+hp7aYey/4iMP6fWy2unNmYSm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
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

PiA+IA0KPiA+IA0KYWxhbjpzbmlwDQoNClRoYW5rcyBWaW5heSBhbmQgRGFuaWVsZSAtIGknbGwg
cmVzcGluIHdpdGggYmVsb3cgZml4Lg0KDQoNCj4gPiBAQCAtNDgsNyArNTAsOCBAQCB2b2lkIGlu
dGVsX3B4cF9yZXN1bWVfY29tcGxldGUoKQ0KPiA+ICAgCWlmICghSEFTX0VOR0lORShweHAtPmN0
cmxfZ3QsIEdTQzApICYmICFweHAtPnB4cF9jb21wb25lbnQpDQo+ID4gICAJCXJldHVybjsNCj4g
PiAgIA0KPiA+IC0JaW50ZWxfcHhwX2luaXRfaHcocHhwKTsNCj4gPiArCXdpdGhfaW50ZWxfcnVu
dGltZV9wbSgmcHhwLT5jdHJsX2d0LT5pOTE1LT5ydW50aW1lX3BtLCB3YWtlcmVmKQ0KPiANCj4g
VGhpcyBpcyBjYWxsZWQgZnJvbSB3aXRoaW4gdGhlIHJwbSByZXN1bWUgcGF0aCwgc28geW91IGNh
bid0IGRvIGFuIHJwbSANCj4gZ2V0IG9yIGl0IHdpbGwgZGVhZGxvY2suIE1heWJlIGhhdmU6DQo+
IA0KPiBfX3B4cF9yZXN1bWVfY29tcGxldGUoc3RydWN0IGludGVsX3B4cCAqcHhwLCBib29sIG5l
ZWRzX3JwbSk7DQo+IA0KPiBpbnRlbF9weHBfcmVzdW1lX2NvbXBsZXRlKC4uKQ0KPiB7DQo+ICDC
oMKgwqAgcmV0dXJuIF9fcHhwX3Jlc3VtZV9jb21wbGV0ZShweHAsIHRydWUpOw0KPiB9DQo+IA0K
PiBpbnRlbF9weHBfcnVudGltZV9yZXN1bWUoLi4pDQo+IHsNCj4gIMKgwqDCoCByZXR1cm4gX19w
eHBfcmVzdW1lX2NvbXBsZXRlKHB4cCwgZmFsc2UpOw0KPiB9DQo+IA0KPiANCj4gb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4NCj4gRGFuaWVsZQ0KDQo=
