Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6D788EED
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 20:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AD310E15E;
	Fri, 25 Aug 2023 18:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6110E15D;
 Fri, 25 Aug 2023 18:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692989323; x=1724525323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pWPVYO7l0cutcjxgCkppiyFirQvSa8vAohZXLLcjJLU=;
 b=oJO7XfVjRIsJHdzWiHgrw4s2bznbeIqadHQBitKOsSwgMtLx2ZpDPyFV
 Jv/EF493C9M/n82kaE5P94hktZ8FJMLOUxSinnjyDW2RcbhuHg6pNCeJU
 BLwhbpoC5oBJvZquiwkIOF0fL+GivVXIsfNAm2txcyceofa5eK9qvw9vr
 6Ho9R1mBmMAMowrrF7MtkAcW5zXghkaMv8A8Sp6kNqbcBevtsTrKAZEJY
 xvl13RVnmg0k1SccaZ6g9mm2zGoBDfPvnPQimrj2RKKLXuppVZxdiAOkk
 p3M1y6tdOSijHN7rkHCbEh9T0qA2z+kazJFF0wyBfqqkUhDZpYvclV45H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359775915"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="359775915"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 11:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="803061764"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="803061764"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2023 11:48:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 11:48:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 25 Aug 2023 11:48:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 25 Aug 2023 11:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xgq7OwGZNp1AOh+cJ1UylSJwJwoQ/IgEKwqInUe5cHDF4B0EaGCrGXMMhEDeCivxu+T/wOxoxYqCO2LjsiT3rtGAXwE9ItAoQLiP6Gkk+gJ9ptBUb7GWsDVAZn9fC37NYDJpmKLXofkPGapJ436pTKRcMoCvSTFWko+LOtvCMx91KqLN3Sg6EjAji74U84ibeSMkapZnk4QEe04YCcU9S2ku4Mh3UZC5Ca8Q0i8RIcKV9uCXDTTpQdNxIsbJpgRNT7/JU2ou08eRCGaMS+nbpEdB4rY/lNF02CD2eMZgSmkti513D5KX+BEhhirpJ5Wgqoz7DMCiaxwbpehNhuVQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWPVYO7l0cutcjxgCkppiyFirQvSa8vAohZXLLcjJLU=;
 b=KQOv1+M6ZDjXEiBUIHiJ88s7in0pl2TFZYjq7ZDlxygUW3sXGIG6W4ReM2hnms83UQQTgQQ8Zzjer2MBGQYbxfGAY3ARwaGpEg00MV5tPGyolWCYFUXlNb1+skCapB6flTVp0/8yafnJFmEQOSAWS2uQLxFU9xxPr9Tkg/B3Y8jth01G5CX3nxmor6eOTLESb0Z4EluViQnQ+zTVvD1O7747SLrt/BhLbtXZ2CxtOqQRwPmG/wDjtiHKAsm+C3rvZrdPb5Ve16d7AjYk6T72bdiplsy/+3OFKuEw8N3J8O/WrUugpAdnpoiTxbd3i+PTMabSIyv+pFq2/ili2nWPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 18:48:40 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 18:48:40 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Thread-Topic: [PATCH v2 1/3] drm/i915/guc: Flush context destruction worker at
 suspend
Thread-Index: AQHZz3/wF33VWjv+xk+EPUvOFZbmRq/7aoQA
Date: Fri, 25 Aug 2023 18:48:40 +0000
Message-ID: <3de68363e448fb1b7a5cd1a7c63362d2c7190a2f.camel@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-2-alan.previn.teres.alexis@intel.com>
 <ZNuDb5ExA9DkW+Pa@intel.com>
In-Reply-To: <ZNuDb5ExA9DkW+Pa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|LV3PR11MB8554:EE_
x-ms-office365-filtering-correlation-id: abaec06e-ee8c-4818-7e45-08dba59be62a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V2th19PS2mx84FNzO1wY4r0Kpnmyw0XmO3ISr9vfg+NBVZENI5EQ6bkr+dIZuoephckNhwpkS3sWZD9gy1A2XMTST5MVP4ydK5JrQZjXJOurtEd0B1VlUydiRXQPU9oDSmoWeHRb2GuhhhNEZYqLG9OjVpG6Z7Bx1reIST2n8WhTO4t7MC8GPSIaqr8J8YRWSikToMzoW5a9+WP8sbTMT+L9SuMpUTklUpsz0kBBVBs+gJ/i0RjTCj9WhpHuSTGeF7QhEya6roMcyjpxFyYSinPBNr9OFhz6mZ+SwgcSxXTarH6nbLB4X8cpWESKlpmlYZ3fZjoQTxUDU+IkqGo6gYMFhGAc+K+kjpoKKaIRAqIYJB5nExAJQCmMfRCtRC7q/oH3L3IvD/FhShkPRO0BFdlKL0dtcE52sOg7B3pPnzGTaskrUlHs8P0U7TP5nPamgiBgaMITSTGBdqhFuEn447x4WVLCgkYWCeobk4KHLl5QgdlTx2dd5dCLQo5MD7x/WG/47vhfxhfSMYCfS2cBP/o+3pAjsmLgme81BvdFuOF3dYoijBB12VAw4MmugSfdSeIK9SZGrOFuABx9CcC6GgD9LLTYhjIGDU/Y8UDAe9MhDqH0IqWYMTmSUX2lom61
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(1800799009)(451199024)(186009)(8936002)(450100002)(6862004)(4326008)(8676002)(2906002)(64756008)(316002)(37006003)(6636002)(15650500001)(54906003)(41300700001)(5660300002)(66446008)(66556008)(66946007)(76116006)(66476007)(91956017)(82960400001)(122000001)(83380400001)(38100700002)(38070700005)(6512007)(2616005)(107886003)(26005)(86362001)(36756003)(6506007)(6486002)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zi9SVVdpODBRN2VaMDY3MHNVYXRydGkrQm1FQ1ZHSnArOW1naGxzVlZlL2FJ?=
 =?utf-8?B?RCtHZUZ5dHZTUW1LTVdLR2UzVFd1aTlqTlVKeXd6RGp6OWxLQTdZVlpxeXdk?=
 =?utf-8?B?RnhFcmljNUc5bm4rSDAxb1NPUlo0VDlLdEh3TElqK3lleUIvUUJ6K0hBL2lo?=
 =?utf-8?B?TG9YRVE4aVZxUzJrM2lLY3k2akxVL0ZOazFYNG1LRm1OZmhsRU0rQytIRVJ1?=
 =?utf-8?B?UnRicE9PM3FVL0hwdmU1MnkwSzU2SmJhMHBRNWY0RUt6UHF3OWtXalJ4dTFZ?=
 =?utf-8?B?RUZjZGx2SG1pQmcyS29zMldJc3dielgySVhkcWNsS2wvYjBBbTZMNUhjQTBR?=
 =?utf-8?B?bjRrZmlFT2dzaU9KWnlvczRUWjgvMWRhWW4xeDF5OGxWNDduUWxRZXlOb1kw?=
 =?utf-8?B?MW5pZ3NBY3RmeHk2OTZaVHROUURMc004cTBpaEZ3UEZBdTVUUXZSQ1l1Ni9E?=
 =?utf-8?B?UDUzb0owNm41NElneDhMRnJoZHpQUkpYR245WnpsNmZWdytvbTVZZHVmU0gx?=
 =?utf-8?B?RURPUFVPV0dYdnVwYXYra3dhN0NTNXZUNHFVczk3bXQxVk81dHlkMC82K1RM?=
 =?utf-8?B?VlpWbjlSbFdqT2FZeDY4eStZUXBTTUYvSnEyeWFBcWE5d0NtdHJoZVowV2t2?=
 =?utf-8?B?dEtidDZjaFdPVHFqdWoralYxYzJSRERON3JJVzdtVmRabTM5enczVEtHL0Zl?=
 =?utf-8?B?SHFrbkwxWG5sTWE1ZFBITXVsRlh3ajJEbTVCZ2pwU3B2cmhrdFVvTFFPamw0?=
 =?utf-8?B?WHhyc3p5b2NtNTg2M0ozc2ZFVmZOSGFNM1hhNjZESE1TeDkxOFAyeE93bSsw?=
 =?utf-8?B?eEViVVE2WWlkN2piSi8yR1E5ODZtaHJENjdoQ1IrMWYybHVmNUxiZlNweUZ0?=
 =?utf-8?B?OFA5NFVMOG1vV3dBdmhXb1YzYmozdDdzM0dqN1JPTTZ5cmFnUHRWeXVRaHZ3?=
 =?utf-8?B?dUxZWHdEUFRTbjgrYTFJYUZWMUVFZ0lmTFpic0ZQTGQvc3MvRWRldndkV25v?=
 =?utf-8?B?aXF5eGRCUkNSUWdvZ2JwOFhGWlJ0NEdZUVNVcHNWVW9taStiWC8vYUtYejBs?=
 =?utf-8?B?aGtnQ2dFTkQ0ZWFoeC9ZVkp1MUNKd0E4c09KMVVkVFNWckVOT0s3Nlp2WFpU?=
 =?utf-8?B?NUgwY2pES1EwRE5YNmdSOTEzK091MnVOMUNWTmhPTjVtTWU3OVNpaFp4MnF3?=
 =?utf-8?B?Uk1Ca0NjbzEwR3RNTXhnbWh1QXVhQlNzNDYxVll5alJUNmpIQnlPdm5YTXhG?=
 =?utf-8?B?a0ZhWTNlazNNdWRVczlaKzlsYVBhRGRlVXN6a2s5NlJkT0RPVHF5WDZ3cWVD?=
 =?utf-8?B?TmNkTklERE1YTmk1MlF3b0owbkNhTTc5MTRSdHlUT1k5NUtiRlFqaDFZUEcz?=
 =?utf-8?B?cXpicnoveTFYMHdFSTJ6NDBLT3NPM2NYUXIyZnRoM0ljOVJBV3Nhd2NNc3Fm?=
 =?utf-8?B?QWtSV1V4NEhES3I0azdvM2hxdWVUMEZhaFFtTWVHT2V3NGtUeTc5MWk3T3V5?=
 =?utf-8?B?c0FvZUx1RW9tUlVEVDJPdHpsYVk2d2JhN01UNVlwUG1PV0xkTS8yOEJnNzlJ?=
 =?utf-8?B?c3dnSTgwb3Q2eEpOZk9QaDExOXlnZWhndk42akU4bkdrSWZFTWpsTU5qZk9E?=
 =?utf-8?B?VXNGMDBkNVNMR21VMnR4bmhUTzFITzByUUNETW1yTVBZbUtGWmRhT1pia25Q?=
 =?utf-8?B?NmEzd3QyTkl3ZUk2aHNxQ3grVnRpRkFyUXpTME5JQmRiWEc3bDkyd0o1V1ZK?=
 =?utf-8?B?WU4rdzZSQ2wrY0VLbWdlNDJmOW45N0FxejFKakN3d3VXQ2RFYmdDbVJYc0l6?=
 =?utf-8?B?TXh4UE1PcnNBdDcxVG16RVFmTFlZMFNSNkw1Qis0NkNKRE1WTEdOUnErUlFY?=
 =?utf-8?B?TXUvV2ptTVV2NExtNnppUlhON3ZQYVhzNnplcTRkR0lseC9naGJwZ20xS1lD?=
 =?utf-8?B?cjc3WEFVUStiYURjUkNWOGVjN0RCYnJ1ajBiQkNOOWlYOFlqY2h0RSswdm9X?=
 =?utf-8?B?U1k3WnRDVEs3bnUxT2x0TnF1bWRQdFY0SVM2TTZhR3BlakY0RmtVNGtjbko4?=
 =?utf-8?B?YlFKSlJoUDNjQ2NPbGlsbDBUWituVkcrdWdQMVllRmpYd0tIZG5qQXJiN1ZF?=
 =?utf-8?B?c3NYay9iU21IWGdXTkJSMkpodFlBRnRmNFJJVjBSNzJhRkxpaytkZ2VxQ1Y3?=
 =?utf-8?Q?o1Ai/fbzkI4Hly7XD2lyFeI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2387A89626EC694099DB35A01FCFDE8C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abaec06e-ee8c-4818-7e45-08dba59be62a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 18:48:40.2904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nD1SOD4w0OiT6kf4R4I5EH6KZ2Hgr1PFcJWY2ylYcShhzGeVyMTMv5PIEqv1YYpyNDdh5aSEmPe/cjL4GBwfDPGaWjtH9PWvdqydynQIsTdKr8SLLh6NUGngmSIHR7A6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGFnYWluIFJvZHJpZ28gZm9yIHJldmlld2luZyBhbmQgYXBvbG9naWVzIGZvciBteSB0
YXJkeSByZXBsaWVzLg0KV2UgYXJlIHN0aWwgdGVzdGluZyBvbiBzaGlwcGluZyBwbGF0Zm9ybXMg
YW5kIHRoZXNlIGxhdGVzdCBwYXRjaGVzIHNlZW1lZA0KdG8gaGF2ZSByZWR1Y2VkIHRoZSBmcmVx
dWVuY3kgYW5kIHNvbHZlZCB0aGUgInN5c3RlbSBoYW5ncyIgd2hpbGUgc3VzcGVuZGluZw0KYnV0
IGl0cyBzdGlsbCBjYXVzaW5nIGlzc3VlcyBzbyB3ZSBjb250aW51ZSB0byBkZWJ1Zy4gKGlzc3Vl
IGlzIHRoYXQNCml0cyBydW5uaW5nIHRob3VzYW5kcyBvZiBjeWNsZXMgb3Zlcm5pZ2h0IG9uIG11
bHRpcGxlIHN5c3RlbXMgYW5kIHRha2VzDQp0aW1lKS4gDQoNCltzbmlwXQ0KDQo+ID4gQEAgLTY5
Myw2ICs2OTMsOCBAQCB2b2lkIGludGVsX3VjX3N1c3BlbmQoc3RydWN0IGludGVsX3VjICp1YykN
Cj4gPiAgCQlyZXR1cm47DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICsJaW50ZWxfZ3VjX3N1Ym1pc3Np
b25fZmx1c2hfd29yayhndWMpOw0KPiA+ICsNCj4gDQo+IHdoYXQgaGFwcGVucyBpZiBhIG5ldyBq
b2IgY29tZXMgZXhhY3RseSBoZXJlPw0KPiBUaGlzIHN0aWxsIHNvdW5kcyBhIGJpdCByYWN5LCBh
bHRob3VnaCB0aGlzIGFscmVhZHkgbG9va3MNCj4gbXVjaCBjbGVhbmVyIHRoYW4gdGhlIHByZXZp
b3VzIHZlcnNpb24uDQphbGFuOiBpbnRlbF91Y19zdXNwZW5kIGlzIGNhbGxlZCBmcm9tIHN1c3Bl
bmQtbGF0ZSBvciBpbml0LWZhaWx1cmUuDQphbmQgdGhlIHZlcnkgbmV4dCBmdW5jdGlvbiAtPiBp
bnRlbF9ndWNfc3VzcGVuZCB3aWxsIHNvZnQgcmVzZXQgdGhlIGd1Yw0KYW5kIGV2ZW50dWFsbHkg
bnVrZSBpdC4gdGhpcyBpcyB0aGUgbW9zdCBhcHByb3ByaWF0ZSAibGF0ZXN0cyBhcw0KcG9zc2li
bGUiIHBsYWNlIHRvIHB1dCB0aGlzLg0KPiANCj4gPiAgCXdpdGhfaW50ZWxfcnVudGltZV9wbSgm
dWNfdG9fZ3QodWMpLT5pOTE1LT5ydW50aW1lX3BtLCB3YWtlcmVmKSB7DQo+ID4gIAkJZXJyID0g
aW50ZWxfZ3VjX3N1c3BlbmQoZ3VjKTsNCj4gPiAgCQlpZiAoZXJyKQ0KDQoNCg0KDQo=
