Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0E63FC98
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 01:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB0D10E698;
	Fri,  2 Dec 2022 00:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0E10E698;
 Fri,  2 Dec 2022 00:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669939905; x=1701475905;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JRq9zEfkvOd09yZs94MJo5OpzcxYBuUfBqa7SjDfr8A=;
 b=dVRgdGCyDxiC0n3qV8lqUAnXKr9aAwDVtgxt5vaDk43yIR2ZF3IJN6tA
 TTXGZnImwAYUoUL04lQIZr66HGwarbdWnB0v56bgU4CRwf8N6c9jRZx3F
 Ld1geL13vPKeECBJ4o0FaTH2sNTm2ECTP26vV5+HZe/oU5kQE2sy/KcJE
 enkn5qFVo0FK2HWa58a//MNfYAc1Kvvl3ZQfujcPOkVQmW+sYmX0LSflI
 5MYc57nFW8O4YOLrNdgSM0tmADtBP8ajhTicJZzPyEAuAlSyYO4bMhPb9
 7WXY1WIDuUSE1y92rh3T+XhtspujcT0S2OccbB7+YxYs84wtkAfXkwJUg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="295527010"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="295527010"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 16:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="675636257"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="675636257"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2022 16:11:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 16:11:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 16:11:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 16:11:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YK294iTgs3WLkjM5Y21khsGNh62memMdKkMMSSr83TRJY4Sn1Naf98dCu3WGlUvv8nDDgde21+MvyHtDZyVx8oAJvdFBuPISUFSZ7ze9hn0M2wA9mWzQhSChbKwOatqbX5H9WpS0ysgtg0IzKng9inFlQAbEwkQti6KaHnjVk2Qr4XAWIpsfP3kYikrjdiCBvrnjLDnyzPZoOymPUaTUtWbmCk9QzA+taBbfrOxFcSJkVGTO5D4RP31YOaaukwrGqI/PGGKo2N4sAvVpEP6KgqnmblopTxTTFBo2YEF5gfm55+UEjpcm+LtMNP5jC9JSTFGAUOArCmz8x0kXvO2zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRq9zEfkvOd09yZs94MJo5OpzcxYBuUfBqa7SjDfr8A=;
 b=QoKPMHZztNxH8+jl+N9rJ6eIuOP1LnYOhbnkVkd8StCLxqtpw8DiDYpv8LRPogc5TdEGwtXyv8JEJiaJk4bM4QxEoHjzurt2ODsqGBsIUvzk8wpAewA1vuiTr12JtYdwKx5bMx7X57CHLhvPwEySiASUyXOtkCTy7rvKcfQ3WtMIT0UTgK6KeDBZtc4GVYm7mluiswS+6ARAWmHvdIGOF4cwQXbk321oEdZkVqNR+O3BFkckD4uDujETSt8oTzpg2e+SlSGznDlUknTd/JeMkpEgUfimfCHPJsCsxCvqJfRS/T9IXJ2ZJfoqiBOTM9EK//Q1lupuRegbewA796wjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH3PR11MB7676.namprd11.prod.outlook.com (2603:10b6:610:127::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8; Fri, 2 Dec 2022 00:11:42 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 00:11:42 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v6 1/1] drm/i915/pxp: Promote pxp subsystem to
 top-level of i915
Thread-Topic: [Intel-gfx] [PATCH v6 1/1] drm/i915/pxp: Promote pxp subsystem
 to top-level of i915
Thread-Index: AQHZBF+GpXTTTK3BYE6Y7lb4YlTCSK5ZuNWAgAAEbYA=
Date: Fri, 2 Dec 2022 00:11:42 +0000
Message-ID: <e6193b1b542f8c83a03c1e3d8811c4a8b5c8225c.camel@intel.com>
References: <20221130020245.3909555-1-alan.previn.teres.alexis@intel.com>
 <897d34b8c97fe4f4ffa65d08f88a9582f0ccb822.camel@intel.com>
In-Reply-To: <897d34b8c97fe4f4ffa65d08f88a9582f0ccb822.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH3PR11MB7676:EE_
x-ms-office365-filtering-correlation-id: 93032188-c0a0-4c12-99a0-08dad3f9ca87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tZOlA1IRvDN9HgpMVVn8qs0Z5+UkJ9K8LnWAHuCDRYNRR/x3CUo8WjtEuLQPkCY79bjAqiABYf8FJxA2mwNYxVuSOqlbfs2X8epsGr7hWMqlTE8NU28vbnxA0eRlZp4e4RxBNa4ASACtLrPi0jcB/zIdxgUX9YTMcMWjpj71EjwFeBxQjigSj89N0aa/A+294ftDsb6qe4ZzsYFs3okHVOQtHzQzyMtPI+5TvkH1rIHqZBxULZ2E6igJ6JgIf7rHUn2tF5yFXCzFPov7/ntVOhbSOFitoQNcF1NDJXv3dPxT3X2q77a4HXIpjMDDCS+q91+kHrCHQrp8vmZlt3Jnzj79IWTDerP3mqjerqDnr8prCb7UVOhKIn2Uqzgmiq7OJbyiSANrO3z+8Udsdr4FAIhTpVIEmxbVd8zkM4bnlLltntkmyTk0wWlqx/fNO9Hb8V10qevJJX7WWSPx2QaW3dB0vAQHWTP89NVYiIKzE1UYynrmB1/Rc/nFahRtTyyWwUCP/M3ZDjJbWYQVKpkhE8SGr4AXClnRJgVCxRNTVjslgR1d+JexZL5LaeAvU1moPREisIDCkn4VBM5UZIFBvun4fcOuhRUfpMzUHaHrxZAh8V4s1WCfz1mWUCkX4te4t+lbiFZLQVqdqE6OWhZKiZHRVUR1ICI/KxLcaWWHom8xBGVKWL28vf5YmOjsjOJ2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199015)(38070700005)(82960400001)(36756003)(86362001)(54906003)(6916009)(478600001)(316002)(6486002)(4001150100001)(450100002)(8936002)(66446008)(64756008)(4326008)(91956017)(5660300002)(66476007)(71200400001)(76116006)(66946007)(66556008)(2906002)(8676002)(38100700002)(6512007)(41300700001)(122000001)(83380400001)(107886003)(26005)(6506007)(2616005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGl0OHVnUUt0MGRJTGF0SU9UMVVoMTBFNGxXUlIxRjFGYU82ZnFTSG5ocjAx?=
 =?utf-8?B?UFFhYmIwZ0x0VGFpRXBLRjlXd1d2N1I4RkQ4U0VvMlFsNUFkVVpKeloxWWtp?=
 =?utf-8?B?dE1IYytsaS8wY2Z0MDlHZ3UzZ01yZm9qejRlaENFMnpYZ3RtcWJJbmZQOHJa?=
 =?utf-8?B?bFltVUk0MFNTMVhjWGtqNVhyL3o2NHVaM1R5aXh4Q3k2L2hxTklIenVXcFpp?=
 =?utf-8?B?NEk3VHZzT0J3b2wxcy9MU1hjVE1ZZ09YY0J6WWVhNlpJRlp5ckhyNHJxbmor?=
 =?utf-8?B?Qmdaenlodmc1VGE4Q1pMbHdUTVlrTWxadHZSQ0JSZ0JGdkxlcjVwZmZIVFlM?=
 =?utf-8?B?bk53QWZpZXV1TXRpRXdkR0FvRWtEcXExOCt3NnBBMjI5NlJVQVAybEJsOW42?=
 =?utf-8?B?ZkM2TkNJREJwMGNtcXUzQ3JmTXIvb0ZxeHNFTXYvazUyazFQQjY1MEE0U3Iz?=
 =?utf-8?B?bFpuSnRwYUJwRWhqdDZ6eGU3cWdHRG03UTBzTkE4eTNPcVFsUmJpOGZyd2Uy?=
 =?utf-8?B?RkZXTUtPUGlMcnBoWVZ0UnJzaEtNUW1YTEh6VFBJVTgxWHgzQi9wSThPaEVx?=
 =?utf-8?B?L2Z1Q1Fod2xIaU12TzA3YnFYK1g2WWwrQjlIVDEzNE1DZ3lNcS8zNWF3UDA3?=
 =?utf-8?B?bS81L2JqamVuemtzcy9NNHU4SUo0U0VRV2pONCszbzNjWEN4d2R4dHE3L0ls?=
 =?utf-8?B?cWZZSXdwRmZCNy9nR3hNa0VkRU1EZGZHeU43dm1HT0M3VVZXKzJ4cXo1QXpT?=
 =?utf-8?B?cmJKMnZTRHpTeHQwY3I0RURQR0VZeUpYWXFvU1dHMFB3RFRtSXNGOHZGckVq?=
 =?utf-8?B?cW1uZ012MWd5Y1JFV25aN0VLOFZwUHU3RmpIbVhrTHJ1Ykp3VWZ3dlFNU1dJ?=
 =?utf-8?B?Tm90c1FlbmhicHVBbmxYSlNKeUErZTU2NDJtSEVFeWw4N1VJd1Nmb3hjTk9o?=
 =?utf-8?B?SDhDdFIzR3BLZE1JdUZkSEpBUFZFUFBjTHlSekdIRDlWZDBoZHIwZit1MlJU?=
 =?utf-8?B?RkxReVZPV1NkOVRRQUx1ZnpCb2F1SW02UUJGQk50enJMdE05WHNLMXlGeXRM?=
 =?utf-8?B?dmdNaGgrRlQzeW5uMloxTmVXTGtrb3NyREtrU0VhTkRCQmExUGZKVkJveXpE?=
 =?utf-8?B?UWpaWnFndFNmK3NxU0hnZzQya1d5NmZrWVd6NGpNcyt6TzBiRGVpS0JhNExN?=
 =?utf-8?B?QnZMbFdKeHZoa2NwejRoMWFGd1crTFRGTXVjWHA5Q2pqV1pUWmJGVUV3c1lP?=
 =?utf-8?B?SDRpc3dHWnBpYWtuTnc0TnJIRGl2Q25oWGQ3bEJzaXFVZlZTdVcvczA5TDA4?=
 =?utf-8?B?VG9UaHVEZG5UUzZoeFFCL0YrYWc5dmROdTJtVWdjRVFJUm5DaEYrR1RvMGQr?=
 =?utf-8?B?TERMT3Z0L0dBQUlYVWE2a0FqNVI5ai82UUw5Ull0SVNpNzFDaXZJY1pYL1Fl?=
 =?utf-8?B?dXhSUk1PdzRZTEU1djhFZHowRHFOaDg5VEhxV281SHlBVXliN0Zrc1Zhc2pU?=
 =?utf-8?B?aGx3dno3c3pTVENHRXNHWFBsNEVoZ1pRVGQrNHRWeWFhVnZ0NDdaMHZyNlRM?=
 =?utf-8?B?YUdzcnBFS1dxMkJjNmJWQlZEU2RBdWJWK1YyOHJzTjVodzNLZy9VdS9QOWtM?=
 =?utf-8?B?T2hyQ0EydmRaTHp3cHpUM3Bkd2pNNjVZQTJvWTRyNndqWTVPR1o2S293cmcz?=
 =?utf-8?B?R3g1YTUzNUFSVWZVeXZZN1MyYkFMeVpOWEVWYlc5RUMxaDdjb2dKN1c3N2lr?=
 =?utf-8?B?SW5oSHZVOHQ3KzRVYUNwN2NJOW8zUUV4KzJ1MGI3ZnlERU5WN3ltMXdJcWJJ?=
 =?utf-8?B?emE5SFhBY1VoRk03Y1g3eTNDWXVkUll6a3orVmJCTjg0U1ZEREJwQk9RaDZP?=
 =?utf-8?B?RTBEdzVIZGxWUUZKYW96Z0l5SlErSjRnK1MzTTFQWjNMVlJmdXZCT1haZmJy?=
 =?utf-8?B?VTIyNmpRRlpLZU5XTnh6dG1KY0dWMmthTHlYbjN0cVBvTm0wMGkrN1RNNFRz?=
 =?utf-8?B?dHhBUVdzd2RhaUFWL2pueWpCNmlsWmlZYzY3dHQ1d3laWStKK0NMZ29NZ0dG?=
 =?utf-8?B?OU9vMkNlcHI0TmVvUHU1YWR5aXBHNEI2ZlZFVVpBK2x5RXNRVENxRlVmeWxv?=
 =?utf-8?B?VU01dmpoT3BVZ0lCMXIxbEREMHR2QVNSa2dTSHNBektYd2M4YW02dTY1b1l1?=
 =?utf-8?Q?5R5q3s5FOYSAKhsO07+SJ+4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <717C5257E810944C9FE7AAE7B895063B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93032188-c0a0-4c12-99a0-08dad3f9ca87
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 00:11:42.4235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t9FS/8Qtt7uUyM3p1Wm+7ig4E6X/WBLROLJOIVEO6KC/23w24Xb0eO8hOpxjXcWQB+S47hmZFV72h5W2/Am0Njjir/7BpXIfdJjhoGLmbd2ZEGYhGTQYCukMmtbsVQYo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aSBqdXN0IHJlYWxpemVkIG5vdGhpbmcgZXh0ZXJuYWwgdG8gUFhQIGlzIGNhbGxpbmcgSEFTX1BY
UCBzbyBJJ2xsIHByb2JhYmx5IGRyb3AgdGhpcyBtYWNybyBhbmQgY3JlYXRlIGEgaGVscGVyIGZv
cg0KcHhwX2RlYnVnZnMgKHRoZSBvbmx5IGNhbGxlcikuDQouLi5hbGFuDQoNCk9uIFRodSwgMjAy
Mi0xMi0wMSBhdCAyMzo1NSArMDAwMCwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gDQo+IE9uIFR1ZSwgMjAyMi0xMS0yOSBhdCAxODowMiAtMDgwMCwgVGVyZXMgQWxleGlzLCBB
bGFuIFByZXZpbiB3cm90ZToNCj4gQWxhbjogW3NuaXBdDQo+ID4gKwluZXdweHAtPmN0cmxfZ3Qg
PSBweHBfZ2V0X2N0cmxfZ3QobmV3cHhwLT5pOTE1KTsNCj4gPiArDQo+ID4gKwlpZiAoIW5ld3B4
cC0+Y3RybF9ndCkNCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gPiAgDQo+ID4gIAkvKg0KPiA+
ICAJICogSWYgSHVDIGlzIGxvYWRlZCBieSBHU0MgYnV0IFBYUCBpcyBkaXNhYmxlZCwgd2UgY2Fu
IHNraXAgdGhlIGluaXQgb2YNCj4gPiAgCSAqIHRoZSBmdWxsIFBYUCBzZXNzaW9uL29iamVjdCBt
YW5hZ2VtZW50IGFuZCBqdXN0IGluaXQgdGhlIHRlZSBjaGFubmVsLg0KPiA+ICAJICovDQo+ID4g
LQlpZiAoSEFTX1BYUChndC0+aTkxNSkpDQo+ID4gLQkJcHhwX2luaXRfZnVsbChweHApOw0KPiA+
IC0JZWxzZSBpZiAoaW50ZWxfaHVjX2lzX2xvYWRlZF9ieV9nc2MoJmd0LT51Yy5odWMpICYmIGlu
dGVsX3VjX3VzZXNfaHVjKCZndC0+dWMpKQ0KPiA+IC0JCWludGVsX3B4cF90ZWVfY29tcG9uZW50
X2luaXQocHhwKTsNCj4gPiArCWlmIChIQVNfUFhQKG5ld3B4cC0+aTkxNSkpDQo+ID4gKwkJcHhw
X2luaXRfZnVsbChuZXdweHApOw0KPiANCj4gSSByZWFsaXplIHdpdGggcmV2NiBub3cgaGF2aW5n
IHB4cCBhcyB0b3AtbGV2ZWwgYW5kIGRlZmluaW5nIGN0cmxfZ3QgcHJvcGVybHkgaW4gdGhlIGhl
YWRlciwgaXRzIGFjdHVhbGx5IHRoZSBjb3JyZWN0DQo+IHRpbWUgdG8gc3dpdGNoIEhBU19QWFAo
aTkxNSkgdG8gSEFTX1BYUChweHApIHNvIHdlIGNhbiBjaGVjayB0aGUgVkRCT1ggbWFzayBvbiB0
aGUgY3RybF9ndCAoaW5zdGVhZCBvZiByb290IGd0IGFzIGl0IGlzDQo+IG5vdykuIFRoaXMgYXNz
dXJlcyBIQVNfUFhQIGNvbnRpbnVlcyB0byBiZSBhIGdsb2JhbC1tYWNybyBhcyB3YXMgaXQgd2Fz
IG9yaWdpbmFsbHkgaW50ZW5kZWQuDQo+IA0KPiAuLi5hbGFuDQoNCg==
