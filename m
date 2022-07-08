Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D8B56B982
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 14:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6A112DE3;
	Fri,  8 Jul 2022 12:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A703112DE1;
 Fri,  8 Jul 2022 12:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657282944; x=1688818944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Z2RSw56qo8iTBsZTruTFPLHnJ8aXhMhpHhII/3JpoKI=;
 b=AaMVJH3yw4hVU5gRwa8nBjVM6v81xYECvXQGOHryqQ0R8l97exK7yyYB
 ZU16TP1xP//T3XB6tx4VKMSxbhpfImpD3pBS99NUmHjq2jPkaqeyj+88d
 AjUqJZKObVUO5uvIkhxOuTVcPbPTqiB4IPCv3LBAemjN1j1FpZRYh2vh2
 Wn4yi/IXMF8uP6t943X2GWWB9QPX86n+DF5A8OyHFxRjEq88QZ2ZLKRV6
 aNICuV9TtOL6Q40bNcj9hsia1L1TlUu3AymXPibZ8yeU6Hq63pn63+A7l
 BYCMh39By2blo3c4EPO7qKz5ONPNQYgJeG6vAzDiYbCMC0mOMqs2ifBth w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="309836146"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="309836146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="621197780"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2022 05:22:23 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 05:22:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 05:22:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 05:22:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZQg+N25qkt/vVr0pXBqCLykVzRfiwYuY2gMHadLMkIf+NXnwx+reAhJOU7tf74ksLUIaGu+n8yitWR02OCyrglMG9RWj8f/RZaQiPjT8uh4EnoYDlH9P+rZjLWDNhbFiJHPKzRemQI4M+3P6GsbD5Tm1U+zC+A7vLbCW2nTj8OzYaasdzdrjGgqrIaT5eGgEgVaymQNd2bGZsqPpAFWwiGPlpTtKHnwOr1KqJWJlig2LG2Mg+kdpPo2le3YGDJUiNACV9oPV0120MIzCdGX9+HO2LmME2L4mS99qSIPl9+VYF68T+SXTxzo8yhIqn4jR4a/8+c8SmEFrrv+wQpRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2RSw56qo8iTBsZTruTFPLHnJ8aXhMhpHhII/3JpoKI=;
 b=VCYh18t1+UxRhr5HN/sj2rwEzvwSi0nIzEsGfSmJkJ+PBHKIq2IlWjFct44uEWkq7336OSzGEuHq1jNii9UnR45yDevSczmIPY1PJfCAYGos66JCXUwei+wh050h0S6RDgjm8Eo992xKMg4auUbpqeeLpe3aRc7xs9pGdbpEyWdQNKtAeZZH1Nb2Lz2JWyiCUJsg+Edgol9NH2AWJ/MHdeaWW/oi/qB1yrEaRKoQ6eAmoL1/7q+QgUMmFooIyAtbYcp97i52ikXniaOyfyh5kL2hv0yLjLoU98HCC0zM+hAyvLvYVsjghgk5uYf6mOk0feXSYwwRjDoQ/28BG0S4WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 CH2PR11MB4424.namprd11.prod.outlook.com (2603:10b6:610:47::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 12:22:21 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd%5]) with mapi id 15.20.5395.022; Fri, 8 Jul 2022
 12:22:21 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 06/10] drm/i915/vm_bind: Add
 I915_GEM_EXECBUFFER3 ioctl
Thread-Topic: [Intel-gfx] [RFC 06/10] drm/i915/vm_bind: Add
 I915_GEM_EXECBUFFER3 ioctl
Thread-Index: AQHYjZ0ck2iBawi6b0isEsSmVE/frK1zBCuAgABS+YCAARheAA==
Date: Fri, 8 Jul 2022 12:22:21 +0000
Message-ID: <d1f8ca40c554c495dd05496343ff16b50404b1ee.camel@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-7-niranjana.vishwanathapura@intel.com>
 <b652db18dc2ea6724aae175420192a8fc4fe932d.camel@intel.com>
 <Ysc2S2UopeMDnImT@alfio.lan>
In-Reply-To: <Ysc2S2UopeMDnImT@alfio.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a976861-c8ae-4fd3-fe23-08da60dc8201
x-ms-traffictypediagnostic: CH2PR11MB4424:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2R96z8N4d6fMWyCuMrVqDSpLB6h7p86VFAq9sEo4huIMRKPHCwplN2MYSj7VIl5PCdMho8lQCw6wVFq5A7NNc5JgyOaEKdmLJDUT3M4S2XmU9dCG0ZOdBfPIAevt3LFOG1rc3LA+4D7vsUBHG7Jq+UGYLusemjlzPjRyq/UzkLzLi+1e7r1NirXL6n78wlT8KTNYXhEzBMlSwe+Tt0fKDUEJ+pHkaypwjvc9u3JN4kqntkg+bRFWXCTTjKkINQpKcQITo/vyuGQhrSquJQZiaBmqWkV6Ny+Mf4QwdJa6ODEnNY7JgOgwKqqP5zSuoGfw9MhWRaWfNlEQBkk3eV7UpovPnipFBr9JaaeeSVItlUon597DxC4qDQ7KtPMlOHAhzjC6sKEyClSN8Y18bErHOz2eVl/3D7KnJTrmEDbmgC9l3NZNL42YSFxT2SylV7nc0X6RfdXaxJJgi9whqetYl3916WCX/K9lbZaVFTAwwJ6WAZjCSJl2v66NUdjh2k3yBbfpHPZDpSi/tdLYSwKuEL4quGKAjDQLJpzDcuSKbLY1uWLR6LPtkus0sJFHl5eABp67oApSg0wsVGNj7SHfFbjQGxs5DHtJY4KPIdkEUPm6fL2vyUa2+OrcK1PY69g666O96yhW2I+bxbmA6w4FcR6d0b8cZMmeg8wlAAvFZC2tXI7pjzAedS3l33Qv3720fgD1ZDStVEirXDUuYr5Ke17+pOvkDUyjd/Q1iKDXs/UPRe+vHxHyweqAU13bSSWTjM+xDKLwsyOUwuOgVV7bgLyjs5VAXZ1RifGai4mAUBeBrB03/AjN4MAHfJFNGa4K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(366004)(346002)(396003)(136003)(54906003)(2906002)(5660300002)(186003)(38100700002)(316002)(2616005)(6916009)(6506007)(36756003)(4744005)(86362001)(66476007)(82960400001)(64756008)(91956017)(478600001)(71200400001)(6486002)(26005)(41300700001)(4326008)(66946007)(76116006)(66446008)(8936002)(66556008)(122000001)(6512007)(8676002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkF0SkNTc1ZCTTZ5K0xRZVB2RE9ud3kxeHV5VVRScUtkRE9VZWtIMkVseUF1?=
 =?utf-8?B?d3RqRjJWbFU1KzVTc0ZweENOWnpVUkdPbXR1bG9qWURYRTZKV1huUC9rZDlW?=
 =?utf-8?B?MFdKMFZlRjhzNUczcFoza0tDb25KeVRoYXNhMjZmbFZEOGVCZFNHTU93RXFO?=
 =?utf-8?B?NVFaaVhDRVkwVysyREpzMjk1Z3RmZ2I4ZjZkdEsra3JWdXRGY1E3cnpEMW1Q?=
 =?utf-8?B?V3N2V1FhK1pkcjJ3Qk5NN1paMGgrbGp0WUk4NmtOYjJQTXBXK2NiUXdRVERR?=
 =?utf-8?B?S3h2QklNR0FuSGs1SytXNzVUcmxReVFvUFcxMEViR0VXYk5UNnUxRDJ6TFdG?=
 =?utf-8?B?Zm04K3dkbUtEcTI0WkVQWnQ4QW1USjJmbmR0YVBicWFjR1ZSZ3lhbGZ3S2lH?=
 =?utf-8?B?N0QyWWdodUZJWGp1MWZiZ0U0TmxCS3ZXNE53WDVUKzMyaEdPUFJTMHlRN1Z5?=
 =?utf-8?B?T2VmZ0VFbC9pa0VCbzJ5RjBFazR5Ump1clQ5dUZ4Vi8ybXVXU1VCa2c2VTRt?=
 =?utf-8?B?TUsrQncvRDQzZXNMajRNbHh1VityclpycXVWUHM0RmpycVFRN1U0bnR5TXF3?=
 =?utf-8?B?UzBSbnVuTmtNTFcyK0FZZ0hQTWliUVdQSHg5ajJHdDR2bmkzN0FIdWh3WjYy?=
 =?utf-8?B?UEdUVjRYdUlicUR0ZlZlYURkTVJVTWFJb2xoOWZNakU5anY0NHhtWDIrWXc3?=
 =?utf-8?B?MHhSRjBNVGpacDQ5d05uaFdmQThNVGZaRnFLMnVDblhGZ21hZUZzdGw0MEdl?=
 =?utf-8?B?VzNjR3Z2ck1aR2UrTmJXaEd2dDFpb1FJRGxMdlZwcHNmVnY4ZGpTZUc4VnVT?=
 =?utf-8?B?cFhtL1M3WFhCd2hyejNhd2hsbDdlS2lWdFNUTkdaaW9XUERPSk9weHBJbDlz?=
 =?utf-8?B?cnBtYTZFUUdJdktOQmNkMzNZblRWSGFGU1R0Qk5ielVpelhsTHpnSlJhMDB6?=
 =?utf-8?B?QWk2bEpOMG1ZOTV5Ny9IN29HK3EzMndrZDZPTk9yQVh0WE54ODQ2YnlzNHRO?=
 =?utf-8?B?Sm1QR0xFWmkreHc3Y21uZzZxdXUrUDZqalpZU2Q2UzNXbjRVYVBIOFI2VVc2?=
 =?utf-8?B?MlBZMWZJM2EzVVRNZWlYYzhWbVBuNzZ4Z284R1VTSWRHQUxrbmJsbXljbjF3?=
 =?utf-8?B?YTBmaG1CYkc3czBJUjhNT0hMYzA3ZFhQaTBBWS9MRkxEalI1L09UVDU5bEdu?=
 =?utf-8?B?blVsVDlCeTJvcS9oM1hSRC9sd1JGVi9WakY2cmVrVTI0ZGhDOG9zbVNPcjNz?=
 =?utf-8?B?TDdTaWt4MlJTMjVYa1Z1Rnc4Qm5rV1ZvVElLa3RIS0xhTko3dmxuekt2cDVJ?=
 =?utf-8?B?K1drMGtYNStoNVZ5R1Q3dGVUYkFLSzZQbmlaLzQwaERhVndKeUwwT3V0SkMz?=
 =?utf-8?B?d1RYTTUrNWM1QjZGQTVpNFVDbVBvekFxT2ZoRCtsNTVFYmdjSXkvc1laR3lm?=
 =?utf-8?B?dDFvVDBtMUVvQUEzRnp0dGkxMFVBUWhUZkR1VU14dTBjalF2NWd6VkpFUk51?=
 =?utf-8?B?VVJMeXNuQmN0WlVJT3pTSWlnV1o4dGxhVTNUa1ZDSTNXbnVQUGwrNkJ3NmJr?=
 =?utf-8?B?MWVGN3hLWTdXTkxFSmZGelYzVEM1OEtDTStuWWdtWnZaZjhNbWYrWlBweEtZ?=
 =?utf-8?B?UGdiNU8zKzRIUEU5L2RtOXJSRnRVdHlGMHgyU1JDV0QzL0NXSExtSWdQNkps?=
 =?utf-8?B?Y01TVW1iQzB1d0Y3Z2VVeGJrMHB0NHVod1Z5NTZWUm11TlRaYjZZdkh4MThW?=
 =?utf-8?B?SUlmbDZoTWNNQ1o5K251K1FXZWVvQVlsTm5xZWJKZjFLSzExa3pmOUJsdS9R?=
 =?utf-8?B?SFFBMW9lQzkyZGdPSS9UWjNaRUNWSVh5MWFwVUpmVUdUeWVsbWx5ZGtxcGVn?=
 =?utf-8?B?MTlETk5zbk5XVy9vcGowTjhPNDhkVjdtS1ZSVHNuSkJhYVZoUkpCaXRjNUhR?=
 =?utf-8?B?OWh2YWVNMmhqaUlvRGp0cGNsVXdsc002bWJQcitOSTl2SURQcjJPOW8yeEtv?=
 =?utf-8?B?Qk1Cc2FZdjdGUlJNakEydTBueElxSVp4OXArYnpHQVF2aTFGYldOQzRUU0pH?=
 =?utf-8?B?RGpTSkRzb1NNT3V0QmlXci9PUUErRE1LdlVheEsvTnc3NWpZSUZrUkxQR3NR?=
 =?utf-8?B?YnNLRDNMNHV6WnVMeXh4RUw5RDJKaFVTOVYrWEpwV054dTI3Q09jSTJWbzZP?=
 =?utf-8?Q?vQ7rhxCl7TavIGKRNsm8ZF0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAC820FF653E94479FC40D6585419D08@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a976861-c8ae-4fd3-fe23-08da60dc8201
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 12:22:21.6430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhP/S5cYhD3ldnmo2ySV/7dJrRg45hhiq5s0zxjrAJcdGR2x534wX10bYlzs1ikeW92PhGLFWAN9Q7/qAPV4zHCwqiwdXAFVaR1+w6YZplE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4424
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA3LTA3IGF0IDIxOjM4ICswMjAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBI
aSwNCj4gDQo+ID4gSXQgc2VlbXMgd2UgYXJlIGR1cGxpY2F0aW5nIGEgbG90IG9mIGNvZGUgZnJv
bSBpOTE1X2V4ZWNidWZmZXIuYy4NCj4gPiBEaWQNCj4gPiB5b3UgY29uc2lkZXIgDQo+IA0KPiB5
ZWFoLi4uIHdoaWxlIHJlYWRpbmcgdGhlIGNvZGUgSSB3YXMgdGhpbmtpbmcgdGhlIHNhbWUgdGhl
biBJIHNlZQ0KPiB0aGF0IHlvdSBtYWRlIHRoZSBzYW1lIGNvbW1lbnQuIFBlcmhhcHMgd2UgbmVl
ZCB0byBncm91cA0KPiBjb21tb25hbGl0aWVzIGFuZCBtYWtlIGNvbW1vbiBsaWJyYXJ5IGZvciBl
eGVjYnVmIDIgYW5kIDMuDQo+IA0KDQpJbmRlZWQsIHdlIHNob3VsZCBhdCBsZWFzdCBhdHRlbXB0
IHRoaXMsIGFuZCBqdWRnZSB3aGV0aGVyIHRoZQ0KYXNzdW1wdGlvbiB0aGF0IHRoaXMgd2lsbCBh
bGxvdyB1cyB0byByZW1vdmUgYSBidW5jaCBvZiBkdXBsaWNhdGVkIGNvZGUNCndpbGwgaG9sZC4N
Cg0KL1Rob21hcw0KDQoNCj4gQW5kaQ0KDQo=
