Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FFA84489E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 21:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B3610FCC3;
	Wed, 31 Jan 2024 20:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6D010FCC3;
 Wed, 31 Jan 2024 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706732234; x=1738268234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zowjdgeq48ly6DGfx73QrDC0xPSo9UygSmzma8iUZRI=;
 b=PgS1Bx1cV0MjXMqI0wor4nRNE/AA7qom+MaP1xA8kQD8AeR36/sEDCLP
 I3b0dsiNciEHrDRk3IBggu5nlTnF7rh8jnCzXiMQBmokMB0ppDmBDSNJq
 xDiANYYM4UuyNtQ0LIpzDsr066iP5TTHOoQvh5svYHeY62mVA4/APEaM8
 HKZXgv5XDGWwcMYuaicpD+NPBSRVS1OJHY+FO8HmzmbLcGziOiGA23Kwg
 Ll2PC6A7uPdyioUs7GCuGF1DOxeOwe1QKdpRe14Gf47ekxb6WVloxx1pd
 x4mlRDnjyecmAeT9YNvOZAvxx3pAXBan77pXiq3rCH2TLdC1SSNPAuUw/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11093473"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="11093473"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 12:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911887857"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="911887857"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 12:17:08 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:17:08 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:17:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 12:17:07 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 12:17:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcBFoKSu6o9J+YIpQunReLShfJJegBg9wzvsTPUNTPCZQ2eZyszJxnJzMpsg00R3F2Yfmdc2NVCIlG9rZOLpx1SqkvypWv8Jj1aGNq+++dOIMg3wK6a2ficpshF4fc6zv/KNKwbl/gTVd0meYDsdRSsblm5vcjhAPypAHEcvkXZKo8bioi+DoC0MQHOCmuOg26VJCrfij6/KSAiboCUNBBBUoJwbqZEL4+89rjb5eUD9mkTeFkh9yn8126Xo9kG1qsnpH0YUZ/e/g5Y7QeiVn/EQp8v39eWQylS9FIYJvTmjeyqRxExuFlntiQ61rRJGMoHg/QLcSFitr4Q7OS4gtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zowjdgeq48ly6DGfx73QrDC0xPSo9UygSmzma8iUZRI=;
 b=KCKqpGlQEIacAaZqtb9Q2pqgi+X5t8L/qt5RMc2LDtqE4Q6qGEdaG2Ne7qYrITjgB+hfOtcncBAcTy/CXlt5G+ZqInGdfJIHbCnRfR1WvM5y0UL1T1pJrm+Jhk6ZLzYQoPl720ZMq5A302EF59PRqisAi0cCGT1KNuxlRnNirSJBDhv2cZisBhAL5Jc6zwIsbhOW3+ZS7f8W6Q/d4vWAsI58ScRT/x1cGG58o48+2Qo+kjSaFXAHRNKqn70zJED48WIxAJCMDLv23/3aRdb4Kx8gbyuwDyhzum+XgE+19LBw2FJdqGYqIs/6lzZM/cc14D+Ua+bU4ENpB13d/E0BgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Wed, 31 Jan
 2024 20:17:04 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 20:17:04 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@redhat.com>
Subject: RE: Making drm_gpuvm work across gpu devices
Thread-Topic: Making drm_gpuvm work across gpu devices
Thread-Index: AQHaTas285rAdrskSkySwbywxZaZP7DnPvcAgAA/1GCAASXNAIACOegAgADnfwCAAEunAIAA341QgAOsxICAANzFcIAAmaUAgADmLLCAAA2/gIAAqE2AgACvtgA=
Date: Wed, 31 Jan 2024 20:17:04 +0000
Message-ID: <SA1PR11MB69910A237BF3666C8D798AFA927C2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
 <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
 <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <801c3357-d49b-4505-a1a4-ef2f36ba63e0@amd.com>
 <SA1PR11MB6991E4CF9949916C6290C232927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAMwc25pzC4PTFwXLo4304vcbFVvxjDPi7Pd1ASBVQ1t8QqizdQ@mail.gmail.com>
 <ZboPlUgU6A-9rMvP@phenom.ffwll.local>
In-Reply-To: <ZboPlUgU6A-9rMvP@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB8239:EE_
x-ms-office365-filtering-correlation-id: e370dbec-598c-43db-99ad-08dc22999783
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PiLfjpdxK6ulp9chInzOQKwBbsy39WTX41sgtwRF0L5X69Zn+ycWWuSaymVj5LDKvWyfHyKx8tTBppWVeJPqxlDNrvqTJ8HKwhc+ZDk4I/GvrmOFV/i/7A+tO88LEe0RGfnNql6/uGxd0Od/qtfJ6UNp30fx+DRYYYhD8vG5kw1ta2/DFgxz0CV2OyKDw5a4OFEZ8dDprYFN5C0w+go4r6UtTJ5tAUIrxk3T1zGjEYRXHwk8QntYizNdDudll5Pm8L81OSCG+ut3IQhD5xRLqgIaDG6/arL+HY3G6m3FYjBJgL4FSNfDc2QWl4lP7f2ARct0gOYnCLwBLWYEx36HDgTb0MC4k+Tulg7AiTUwM+hng85FL7Oc2qYrvIJ8662muTUCiPgjxE5MobnonZOm0Hk3UcVfk3WvCzbYkhBC3uXYKN8Nosvftdf3wgi5CQRnrKLANaTFBqBzvGDAlj09KOPi41BB8I0vGWleJ/2QAn71L7yJB1cBq1iA5SGvxRVmcyzL8OO6CnkweJEctdhi+N2hOV+63oE3XxJIGOBI74dKq7oJQGVepmEFuQsTm+pXVbfwrcfPKX2qjq7wWXcD0eapfL/+eaTk8pDeAMw7UGk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(55016003)(66574015)(26005)(966005)(38070700009)(71200400001)(9686003)(53546011)(478600001)(7696005)(83380400001)(6506007)(38100700002)(82960400001)(122000001)(316002)(76116006)(33656002)(86362001)(7416002)(5660300002)(66946007)(66446008)(54906003)(66476007)(66556008)(64756008)(110136005)(8936002)(2906002)(52536014)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEJCZWxMcFpTTDJHRDZNRDZUczRTeWhxbDNqdmJ5c1BDMGJsaXNueEFXb3ha?=
 =?utf-8?B?L2l1c1R1eHN4cEFoVXNiOTRJWFhRWHhVeHdYVE5BU2cxT1RQL1owOUtLT1pu?=
 =?utf-8?B?WXdTT2tyazd0U1dEQW55OTV6dGM0Mnh2aW1DVjRiM1ZrODY2NFZmbHRJOFNq?=
 =?utf-8?B?L1BJa1BrRVFUbUNxMWdSWGMwR21ici8xbHY3QTd0TGowZVQxbUhRUUZNaU94?=
 =?utf-8?B?cmtUT2hydXJCcElSWmVWbFJqRGlKQkhQY3dVMmJ3WVZYRXVoYWhhOFVZQU5E?=
 =?utf-8?B?NTZtTkZ1Nit2Ui9IVUR2Rjc1c1gvY05VK0hNQjZyaU5zb3lBWlJwbloyK0xa?=
 =?utf-8?B?WVBxYVowSTB6UTB6d0dMMkxuOVlIdkFZaHk5U1ovRm5ZREUwSHlBTzlUTENm?=
 =?utf-8?B?VjliTytodDlBT1BwTEZjWjZZVFBaSGY1TGdlOFBLcDVNdUR2Ulp1N3pLeVo0?=
 =?utf-8?B?UDlac3pCWEtMUy85bGlGNjhSK3hXaXdtZkZuUjZ2R0ZCTmQ4VmtQcTFwZm5F?=
 =?utf-8?B?ZmQ1dFB1QjNUSDd5YTA3L1ZoRENVVWZqWDdWTU0yb1hiNWtzNEg0U3B2Z2E0?=
 =?utf-8?B?VnNjek54NXVIQ2lJYkFtV2RrbzNZQzhiL0Y5SDUxb3JkalVyY1BMQ1FsSzVO?=
 =?utf-8?B?OG1JOVdpdlFOc3d3K1FyNGFrQVNuMGc0ekdPclZZSmYrUStjNHMrTUhxcHhr?=
 =?utf-8?B?TTN3dVdLbmw1SmFDRUozUVZoWFFsUjJPS09mblMvRzdiL1Q4RjJpMVBIbGc0?=
 =?utf-8?B?L3BhUnI5UlVSazJ0N2RLTzlTUFNvWFFVQUFlN21TR3ZSYit6TEVvNkoweVdy?=
 =?utf-8?B?ZUhES3V5eDl3VmxWdEJCVCt1SVJhbTJub2k0UVlzS1lpeWRvNEZyY0U4djg4?=
 =?utf-8?B?NnhpamVXK3Znb2MxZ3NXOVB1U3diK3pmUFZ2R0ZEQWpOWGI0YTQ0WTZOT2ho?=
 =?utf-8?B?a3BqcHJpRUVOVkhBRGtzcDN0RnhDbDJOWkhITStWbW14cnNkMm1zU1hqa3dL?=
 =?utf-8?B?VlVyRytsc0t6OWZxUnNaRzltTXF5eWFVN09hbWgvV1E2MnpVZXpVYmNZcElW?=
 =?utf-8?B?MStIajZUdldLV0hlRkNBMlZZdGdBZ0VDdE9DWU5iajF1aG9XQnU2Qkp3MWIw?=
 =?utf-8?B?bVZpZ3Y5R2ZxcW9wcFNPZXdJSmdQQWw0MlJKZmowWUpSWXpYV2tqcXRabmtD?=
 =?utf-8?B?UGlzdGdveEFiN24zMHVOb3pxZUpOREd2Qm1IVS9qZmlYYit2WWZ5Y0gzTEVr?=
 =?utf-8?B?Y0hya282SVN4TExVdjkzbFpmTXdCMVlOWXF3S0J1eE14NlV6T0RuVGt1TzFN?=
 =?utf-8?B?QkUramVFYko2cUt0RmIyQnUrV3RKR0ttelpObmZSbWk2U0R2UWlmb0N2RWpn?=
 =?utf-8?B?cVBJUGxaYk10RCtwUFdaOERyZFhwbFhZdE5PWFNiam1rdVgzMytLdi82bUNl?=
 =?utf-8?B?RHV6ZXpncWx6TGVudDFBRHZKV1FGcjdCTlVBUWVKRWRXS1pLclRxdThVa21k?=
 =?utf-8?B?aFRDUlN3azlRazJxd3JHM3dEbjM2VDZXU2IvSndnMlA2Wk9VYTZTemp0OE5o?=
 =?utf-8?B?ZDhUb21jZWpiRWJBdnIzR085R2J2Q2FDYzhyb2J0c3llRVNNVFlwYkpyYjVQ?=
 =?utf-8?B?RVYxN1hjNFRtaURnSEdOQVRyODkzQm5tVllXVXF2bWpldTlpWjdkN0hVcE5q?=
 =?utf-8?B?cnNzWWlLWFpiSkZlS1BUTzNzdW9GYTByUE1DTkkzd0IyelNBS3QzVm12OGlJ?=
 =?utf-8?B?NG5EemZRV0hSNitVTXBZUGx5bGtrU05wMUxHVmovQjdaQmYySys2ZmsrcW5W?=
 =?utf-8?B?TXdHejd1Y29uc0FMWFFvWGI1cnQrOURZSUgvVll5dXZIcitla1RMVTVraE1Z?=
 =?utf-8?B?RHd3VUNMQzQ4YnljRW53NFlUendLQnFyWm5OVEV4ZGZtMk9ndXFPaENkd1Bn?=
 =?utf-8?B?K1lBTHVMR2VOOTR6YzBEWHBvd1YzZFVLZkE5akFiRzIxNGd2RTNOaVN0RjhV?=
 =?utf-8?B?TXJNYy8yL1haUFNISWhpaldHRGcraUYxc2FlNmhyV282MjNGcVp5SXFrZUQ4?=
 =?utf-8?B?SWhNSjNNZzlROXI0cnJ2SVRDQmFkZEZyU1ZyL0xLVDg2WVpkN0l6Sys5UGJD?=
 =?utf-8?Q?VFoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e370dbec-598c-43db-99ad-08dc22999783
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 20:17:04.6884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: va/kvgL9rTMEfCmQmmWUw/up0uY6v2VS56hv+iWV85Godcx30B+hoTSjRE70UVoR39VYFj3ptEDnZmi6a0E1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu, 
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ltYSwgRGF2ZSwNCg0KSSBhbSB3ZWxsIGF3YXJlIG5vdXZlYXUgZHJpdmVyIGlzIG5vdCB3
aGF0IE52aWRpYSBkbyB3aXRoIHRoZWlyIGN1c3RvbWVyLiBUaGUga2V5IGFyZ3VtZW50IGlzLCBj
YW4gd2UgbW92ZSBmb3J3YXJkIHdpdGggdGhlIGNvbmNlcHQgc2hhcmVkIHZpcnR1YWwgYWRkcmVz
cyBzcGFjZSBiL3QgQ1BVIGFuZCBHUFU/IFRoaXMgaXMgdGhlIGZvdW5kYXRpb24gb2YgSE1NLiBX
ZSBhbHJlYWR5IGhhdmUgc3BsaXQgYWRkcmVzcyBzcGFjZSBzdXBwb3J0IHdpdGggb3RoZXIgZHJp
dmVyIEFQSS4gU1ZNLCBmcm9tIGl0cyBuYW1lLCBpdCBtZWFucyBzaGFyZWQgYWRkcmVzcyBzcGFj
ZS4gQXJlIHdlIGFsbG93ZWQgdG8gaW1wbGVtZW50IGFub3RoZXIgZHJpdmVyIG1vZGVsIHRvIGFs
bG93IFNWTSB3b3JrLCBhbG9uZyB3aXRoIG90aGVyIEFQSXMgc3VwcG9ydGluZyBzcGxpdCBhZGRy
ZXNzIHNwYWNlPyBUaG9zZSB0d28gc2NoZW1lIGNhbiBjby1leGlzdCBpbiBoYXJtb255LiBXZSBh
Y3R1YWxseSBoYXZlIHJlYWwgdXNlIGNhc2VzIHRvIHVzZSBib3RoIG1vZGVscyBpbiBvbmUgYXBw
bGljYXRpb24uICAgDQoNCkhpIENocmlzdGlhbiwgVGhvbWFzLA0KDQpJbiB5b3VyIHNjaGVtZSwg
R1BVIFZBIGNhbiAhPSBHUFUgVkEuIFRoaXMgZG9lcyBpbnRyb2R1Y2Ugc29tZSBmbGV4aWJpbGl0
eS4gQnV0IHRoaXMgc2NoZW1lIGFsb25lIGRvZXNuJ3Qgc29sdmUgdGhlIHByb2JsZW0gb2YgdGhl
IHByb3h5IHByb2Nlc3MvcGFyYS12aXJ0dWFsaXphdGlvbi4gWW91IHdpbGwgc3RpbGwgbmVlZCBh
IHNlY29uZCBtZWNoYW5pc20gdG8gcGFydGl0aW9uIEdQVSBWQSBzcGFjZSBiL3QgZ3Vlc3QgcHJv
Y2VzczEgYW5kIGd1ZXN0IHByb2Nlc3MyIGJlY2F1c2UgcHJveHkgcHJvY2VzcyAob3IgdGhlIGhv
c3QgaHlwZXJ2aXNvciB3aGF0ZXZlciB5b3UgY2FsbCBpdCkgdXNlIG9uZSBzaW5nbGUgZ3B1IHBh
Z2UgdGFibGUgZm9yIGFsbCB0aGUgZ3Vlc3QvY2xpZW50IHByb2Nlc3Nlcy4gR1BVIFZBIGZvciBk
aWZmZXJlbnQgZ3Vlc3QgcHJvY2VzcyBjYW4ndCBvdmVybGFwLiBJZiB0aGlzIHNlY29uZCBtZWNo
YW5pc20gZXhpc3QsIHdlIG9mIGNvdXJzZSBjYW4gdXNlIHRoZSBzYW1lIG1lY2hhbmlzbSB0byBw
YXJ0aXRpb24gQ1BVIFZBIHNwYWNlIGJldHdlZW4gZ3Vlc3QgcHJvY2Vzc2VzIGFzIHdlbGwsIHRo
ZW4gd2UgY2FuIHN0aWxsIHVzZSBzaGFyZWQgVkEgYi90IENQVSBhbmQgR1BVIGluc2lkZSBvbmUg
cHJvY2VzcywgYnV0IHByb2Nlc3MxIGFuZCBwcm9jZXNzMidzIGFkZHJlc3Mgc3BhY2UgKGZvciBi
b3RoIGNwdSBhbmQgZ3B1KSBkb2Vzbid0IG92ZXJsYXAuIFRoaXMgc2Vjb25kIG1lY2hhbmlzbSBp
cyB0aGUga2V5IHRvIHNvbHZlIHRoZSBwcm94eSBwcm9jZXNzIHByb2JsZW0sIG5vdCB0aGUgZmxl
eGliaWxpdHkgeW91IGludHJvZHVjZWQuIA0KDQpJbiBwcmFjdGljZSwgeW91ciBzY2hlbWUgYWxz
byBoYXZlIGEgcmlzayBvZiBydW5uaW5nIG91dCBvZiBwcm9jZXNzIHNwYWNlIGJlY2F1c2UgeW91
IGhhdmUgdG8gcGFydGl0aW9uIHdob2xlIGFkZHJlc3Mgc3BhY2UgYi90IHByb2Nlc3Nlcy4gQXBw
YXJlbnRseSBhbGxvd2luZyBlYWNoIGd1ZXN0IHByb2Nlc3MgdG8gb3duIHRoZSB3aG9sZSBwcm9j
ZXNzIHNwYWNlIGFuZCB1c2luZyBzZXBhcmF0ZSBHUFUvQ1BVIHBhZ2UgdGFibGUgZm9yIGRpZmZl
cmVudCBwcm9jZXNzZXMgaXMgYSBiZXR0ZXIgc29sdXRpb24gdGhhbiB1c2luZyBzaW5nbGUgcGFn
ZSB0YWJsZSBhbmQgcGFydGl0aW9uIHByb2Nlc3Mgc3BhY2UgYi90IHByb2Nlc3Nlcy4NCg0KRm9y
IEludGVsIEdQVSwgcGFyYS12aXJ0dWFsaXphdGlvbiAoeGVuR1QsIHNlZSBodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwvWGVuR1QtUHJldmlldy1rZXJuZWwuIEl0IGlzIHNpbWlsYXIgaWRlYSBvZiB0
aGUgcHJveHkgcHJvY2VzcyBpbiBGbGV4J3MgZW1haWwuIFRoZXkgYXJlIGFsbCBTVy1iYXNlZCBH
UFUgdmlydHVhbGl6YXRpb24gdGVjaG5vbG9neSkgaXMgYW4gb2xkIHByb2plY3QuIEl0IGlzIG5v
dyByZXBsYWNlZCB3aXRoIEhXIGFjY2VsZXJhdGVkIFNSSU9WL3N5c3RlbSB2aXJ0dWFsaXphdGlv
bi4gWGVuR1QgaXMgYWJhbmRvbmVkIGxvbmcgdGltZSBhZ28uIFNvIGFncmVlZCB5b3VyIHNjaGVt
ZSBhZGQgc29tZSBmbGV4aWJpbGl0eS4gVGhlIHF1ZXN0aW9uIGlzLCBkbyB3ZSBoYXZlIGEgdmFs
aWQgdXNlIGNhc2UgdG8gdXNlIHN1Y2ggZmxleGliaWxpdHk/IEkgZG9uJ3Qgc2VlIGEgc2luZ2xl
IG9uZSBBVE0uDQoNCkkgYWxzbyBwaWN0dXJlZCBpbnRvIGhvdyB0byBpbXBsZW1lbnQgeW91ciBz
Y2hlbWUuIFlvdSBiYXNpY2FsbHkgcmVqZWN0ZWQgdGhlIHZlcnkgZm91bmRhdGlvbiBvZiBobW0g
ZGVzaWduIHdoaWNoIGlzIHNoYXJlZCBhZGRyZXNzIHNwYWNlIGIvdCBDUFUgYW5kIEdQVS4gSW4g
eW91ciBzY2hlbWUsIEdQVSBWQSA9IENQVSBWQSArIG9mZnNldC4gSW4gZXZlcnkgc2luZ2xlIHBs
YWNlIHdoZXJlIGRyaXZlciBuZWVkIHRvIGNhbGwgaG1tIGZhY2lsaXRpZXMgc3VjaCBhcyBobW1f
cmFuZ2VfZmF1bHQsIG1pZ3JhdGVfdm1hX3NldHVwIGFuZCBpbiBtbXUgbm90aWZpZXIgY2FsbCBi
YWNrLCB5b3UgbmVlZCB0byBvZmZzZXQgdGhlIEdQVSBWQSB0byBnZXQgYSBDUFUgVkEuIEZyb20g
YXBwbGljYXRpb24gd3JpdGVyJ3MgcGVyc3BlY3RpdmUsIHdoZW5ldmVyIGhlIHdhbnQgdG8gdXNl
IGEgQ1BVIHBvaW50ZXIgaW4gaGlzIEdQVSBwcm9ncmFtLCBoZSBhZGQgdG8gYWRkIHRoYXQgb2Zm
c2V0LiBEbyB5b3UgdGhpbmsgdGhpcyBpcyBhd2t3YXJkPw0KDQpGaW5hbGx5LCB0byBpbXBsZW1l
bnQgU1ZNLCB3ZSBuZWVkIHRvIGltcGxlbWVudCBzb21lIG1lbW9yeSBoaW50IEFQSSB3aGljaCBh
cHBsaWVzIHRvIGEgdmlydHVhbCBhZGRyZXNzIHJhbmdlIGFjcm9zcyBhbGwgR1BVIGRldmljZXMu
IEZvciBleGFtcGxlLCB1c2VyIHdvdWxkIHNheSwgZm9yIHRoaXMgdmlydHVhbCBhZGRyZXNzIHJh
bmdlLCBJIHByZWZlciB0aGUgYmFja2luZyBzdG9yZSBtZW1vcnkgdG8gYmUgb24gR1BVIGRldmlj
ZVggKGJlY2F1c2UgdXNlciBrbm93cyBkZXZpY2VYIHdvdWxkIHVzZSB0aGlzIGFkZHJlc3MgcmFu
Z2UgbXVjaCBtb3JlIHRoYW4gb3RoZXIgR1BVIGRldmljZXMgb3IgQ1BVKS4gSXQgZG9lc24ndCBt
YWtlIHNlbnNlIHRvIG1lIHRvIG1ha2Ugc3VjaCBBUEkgcGVyIGRldmljZSBiYXNlZC4gRm9yIGV4
YW1wbGUsIGlmIHlvdSB0ZWxsIGRldmljZSBBIHRoYXQgdGhlIHByZWZlcnJlZCBtZW1vcnkgbG9j
YXRpb24gaXMgZGV2aWNlIEIgbWVtb3J5LCB0aGlzIGRvZXNuJ3Qgc291bmRzIGNvcnJlY3QgdG8g
bWUgYmVjYXVzZSBpbiB5b3VyIHNjaGVtZSwgZGV2aWNlIEEgaXMgbm90IGV2ZW4gYXdhcmUgb2Yg
dGhlIGV4aXN0ZW5jZSBvZiBkZXZpY2UgQi4gcmlnaHQ/DQoNClJlZ2FyZHMsDQpPYWsNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPg0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMzEsIDIwMjQgNDoxNSBBTQ0KPiBU
bzogRGF2aWQgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+DQo+IENjOiBaZW5nLCBPYWsgPG9h
ay56ZW5nQGludGVsLmNvbT47IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT47IFRob21hcyBIZWxsc3Ryw7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IEJyb3N0LA0KPiBNYXR0
aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IEZlbGl4IEt1ZWhsaW5nDQo+IDxmZWxpeC5r
dWVobGluZ0BhbWQuY29tPjsgV2VsdHksIEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+OyBk
cmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR2hpbWlyYXksIEhpbWFsIFByYXNh
ZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT47IEJvbW11LCBLcmlzaG5haWFo
DQo+IDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT47IEd1cHRhLCBzYXVyYWJoZyA8c2F1cmFi
aGcuZ3VwdGFAaW50ZWwuY29tPjsNCj4gVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFu
amFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgRGFuaWxvIEtydW1tcmljaCA8ZGFrckByZWRoYXQuY29tPjsgU2hhaCwgQW5r
dXIgTg0KPiA8YW5rdXIubi5zaGFoQGludGVsLmNvbT47IGpnbGlzc2VAcmVkaGF0LmNvbTsgcmNh
bXBiZWxsQG52aWRpYS5jb207DQo+IGFwb3BwbGVAbnZpZGlhLmNvbQ0KPiBTdWJqZWN0OiBSZTog
TWFraW5nIGRybV9ncHV2bSB3b3JrIGFjcm9zcyBncHUgZGV2aWNlcw0KPiANCj4gT24gV2VkLCBK
YW4gMzEsIDIwMjQgYXQgMDk6MTI6MzlBTSArMTAwMCwgRGF2aWQgQWlybGllIHdyb3RlOg0KPiA+
IE9uIFdlZCwgSmFuIDMxLCAyMDI0IGF0IDg6MjnigK9BTSBaZW5nLCBPYWsgPG9hay56ZW5nQGlu
dGVsLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSGkgQ2hyaXN0aWFuLA0KPiA+ID4NCj4gPiA+
DQo+ID4gPg0KPiA+ID4gTnZpZGlhIE5vdXZlYXUgZHJpdmVyIHVzZXMgZXhhY3RseSB0aGUgc2Ft
ZSBjb25jZXB0IG9mIFNWTSB3aXRoIEhNTSwNCj4gR1BVIGFkZHJlc3MgaW4gdGhlIHNhbWUgcHJv
Y2VzcyBpcyBleGFjdGx5IHRoZSBzYW1lIHdpdGggQ1BVIHZpcnR1YWwgYWRkcmVzcy4gSXQNCj4g
aXMgYWxyZWFkeSBpbiB1cHN0cmVhbSBMaW51eCBrZXJuZWwuIFdlIEludGVsIGp1c3QgZm9sbG93
IHRoZSBzYW1lIGRpcmVjdGlvbiBmb3INCj4gb3VyIGN1c3RvbWVycy4gV2h5IHdlIGFyZSBub3Qg
YWxsb3dlZD8NCj4gPg0KPiA+DQo+ID4gT2FrLCB0aGlzIGlzbid0IGhvdyB1cHN0cmVhbSB3b3Jr
cywgeW91IGRvbid0IGdldCB0byBhcHBlYWwgdG8NCj4gPiBjdXN0b21lciBvciBpbnRlcm5hbCBk
ZXNpZ24uIG5vdXZlYXUgaXNuJ3QgIk5WSURJQSIncyBhbmQgaXQgY2VydGFpbmx5DQo+ID4gaXNu
J3Qgc29tZXRoaW5nIE5WSURJQSB3b3VsZCBldmVyIHN1Z2dlc3QgZm9yIHRoZWlyIGN1c3RvbWVy
cy4gV2UgYWxzbw0KPiA+IGxpa2VseSB3b3VsZG4ndCBqdXN0IGFjY2VwdCBOVklESUEncyBjdXJy
ZW50IHNvbHV0aW9uIHVwc3RyZWFtIHdpdGhvdXQNCj4gPiBzb21lIHNlcmlvdXMgZGlzY3Vzc2lv
bnMuIFRoZSBpbXBsZW1lbnRhdGlvbiBpbiBub3V2ZWF1IHdhcyBtb3JlIG9mIGENCj4gPiBzYW1w
bGUgSE1NIHVzZSBjYXNlIHJhdGhlciB0aGFuIGEgc2VyaW91cyBpbXBsZW1lbnRhdGlvbi4gSSBz
dXNwZWN0IGlmDQo+ID4gd2UgZG8gZ2V0IGRvd24gdGhlIHJvYWQgb2YgbWFraW5nIG5vdXZlYXUg
YW4gYWN0dWFsIGNvbXB1dGUgZHJpdmVyIGZvcg0KPiA+IFNWTSBldGMgdGhlbiBpdCB3b3VsZCBo
YXZlIHRvIHNldmVyZWx5IGNoYW5nZS4NCj4gDQo+IFllYWggb24gdGhlIG5vdXZlYXUgaG1tIGNv
ZGUgc3BlY2lmaWNhbGx5IG15IGd1dCBmZWVsaW5nIGltcHJlc3Npb24gaXMNCj4gdGhhdCB3ZSBk
aWRuJ3QgcmVhbGx5IG1ha2UgZnJpZW5kcyB3aXRoIHRoYXQgYW1vbmcgY29yZSBrZXJuZWwNCj4g
bWFpbnRhaW5lcnMuIEl0J3MgYSBiaXQgdG9vIG11Y2gganVzdCBhIHRlY2ggZGVtbyB0byBiZSBh
YmxlIHRvIG1lcmdlIHRoZQ0KPiBobW0gY29yZSBhcGlzIGZvciBudmlkaWEncyBvdXQtb2YtdHJl
ZSBkcml2ZXIuDQo+IA0KPiBBbHNvLCBhIGZldyB5ZWFycyBvZiBsZWFybmluZyBhbmQgZXhwZXJp
ZW5jZSBnYWluaW5nIGhhcHBlbmVkIG1lYW53aGlsZSAtDQo+IHlvdSBhbHdheXMgaGF2ZSB0byBs
b29rIGF0IGFuIGFwaSBkZXNpZ24gaW4gdGhlIGNvbnRleHQgb2Ygd2hlbiBpdCB3YXMNCj4gZGVz
aWduZWQsIGFuZCB0aGF0IGNvbnRleHQgY2hhbmdlcyBhbGwgdGhlIHRpbWUuDQo+IA0KPiBDaGVl
cnMsIFNpbWENCj4gLS0NCj4gRGFuaWVsIFZldHRlcg0KPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24NCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gNCg==
