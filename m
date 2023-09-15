Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844167A253B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 19:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EF310E64A;
	Fri, 15 Sep 2023 17:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074E810E64A;
 Fri, 15 Sep 2023 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694800710; x=1726336710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Kj+1tt3Fhuu3T2y0eIG3Wyl9a9GYra979qIyad56yHc=;
 b=O0PoqSQMvnD8jP7aMMIlFHG4rj3J+X8c/ouWUlTtI5RZYJgIsLtCuvH9
 HkrP8i9Gq/1m0yzh/Gf5aHniD0x2ZNKFbtdfII3ClF2fOty+tbugdFvTV
 MAhydmVUPJk8G9cFiIe/kUlwteq3O9MpLJx2mhJ5hhSz+PZr0SS+7l6SR
 Pkd4AUO4jUs35L58dJag1joswZUUW6wXNSmpaG7HR6g7hJZmy2ak2MYS0
 B/nqP/fqNIyAtWX6EaffboTlvEbe53faWQe5wK8BWuDyKC0oRaZ6n8wkt
 nCnab7zUvMWl6e7U1659RReIPmuEPQa5n9J9ShvUupT2fOZoZxsUaVN+0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359562353"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="359562353"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="860257805"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="860257805"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 10:58:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 10:58:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 10:58:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 10:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKrmIT+EkW++IBF5L5Cy65Q2Ni8cJJE0a1LdCkiyd2GtIekyNyxzFVpyWibtSGRWugYFdDutRTkqWZulPdA8UlroA10tZYJCWu2Vrd6yTkgvexhgsST2pNzIzdK5PYJqtTxHafUO8cDDZBlZL0PNh7y3xG2ZKyN1IH/Fshiw0n1FGJxJn96TWGyvg14dgGoF+mlKJN97oGyOPcDPUEJBwBM+QdB9QTW5vsTdEP/iZvXThjDk/jfNWRCOEcC+W8PdJUn2Xj4YrY4/Nij3gkE9yhLSRGODMO1Ye5mntGOpCe2WVjHLyWrmZRTdp3oqY1CunPY1Ayv75Txb9lONsOBSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kj+1tt3Fhuu3T2y0eIG3Wyl9a9GYra979qIyad56yHc=;
 b=nqWfJODuvhr7jqZPdgX4y84kgEWAPDVqR9Lbn6nI3iG1Jqboi5PKU46ePADK3NX428839Zgk0TfPg5Jd9Tsxf1c4jcoQx+LWlNxRaSQyZXdW8hFytWp0wB3ix8TABH/Emh8hFn/lkQyvshAzs20F9TMwfhP7GhAd2lO9SK21wsy8hyC5PL0CSlGdDXC7IRFMif6X4aBzGHMb3PAR2mUQCbym4ZAoG82PSWRv758F8FBY43To8vX2kaPdr+2+CaoUmZvT4Ka+c0g8ec2dmaVea0yaNHbZmw5e8hloqBweBN9IN9Tf4Bhr7VAb6RXwLOPpZqojvuuznJSwA84M6FDxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 17:58:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 17:58:21 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Topic: [PATCH v5 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Index: AQHZ425qW/YZtkF9JUaGvyHjBmLjbrAcNY6A
Date: Fri, 15 Sep 2023 17:58:21 +0000
Message-ID: <fbcc03d0726ec9f0e594f87077c075d8dcb2e027.camel@intel.com>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
 <20230909223848.427849-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230909223848.427849-2-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB5888:EE_
x-ms-office365-filtering-correlation-id: 66db537f-206e-4b7a-a4c3-08dbb615597f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9i1B6qB0yWrs0897BlsyatVYLfi/tek311rQbhheAkFMXJS7QP0S8Oo/DI1EY6vBo2Wae/FYC79DKfOouuhHAKgHzEAqTtx3fQIHQT6yoSc4w2c9B+uLpRMSajI29TsThLCCqoF1QP4rjt3jJVYCs+ENVIhH6hAvu18A8Iwy4wsKYcYgSXHHGpBrxZ/N7fDp0aJrBl7FdZ6qXrn/iGx/oCMnmYpw04tEBwGGuprX7anayHSOswa0mQZmd4YRzMoqAZzgsW8Dfv5qxoWx+poDxcKelVkMiIpNqsw4iUkSo3/VB54jzZrZPO+hIV2scVTdBf2EzMJlr3svLNE83Y755f2ErkUpnEjDSVSlEok2wiQGIhvBYQM0y3B3hpYaWfPYoW77z0bzld3UzDwfOj17O/yd6yrhicfRUjgbzzXYZaN5q8zHTQL6kG617d2M9WYatHhXIP9RO9Kvp2RpziQE9EDsLh0zNtnqanZdZyMNNDXY9qhTWaIs98LmvClx+IewxiKb6BUm8Habe0Un5M62ivZ53FYd0zxmEbkA6ycoFcY9x5yUfFT2rhgEybONeqFxpdURIVPdBlG4Z/PKmaURfkbAszcQCrZz5YHofE4V5gc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(38100700002)(38070700005)(478600001)(71200400001)(107886003)(2616005)(26005)(122000001)(6486002)(6506007)(82960400001)(6512007)(86362001)(450100002)(316002)(6916009)(54906003)(4744005)(91956017)(64756008)(66446008)(66946007)(76116006)(66476007)(41300700001)(15650500001)(83380400001)(5660300002)(8676002)(4326008)(8936002)(36756003)(66556008)(966005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTgzYnVad0dmYmN5UnRZNVRZRjFJdm9RNUdGZFFZYjNqWkY3dFpLay8vVXo2?=
 =?utf-8?B?MENvR3NuSHFGNkZoZHp1cFF1M0U5QkJjMkVHam9oNU5Fa0psZ2ZqWUEwL05q?=
 =?utf-8?B?ak1IUFNBZVhHUDJtY1plcmdJMlRSM212RENiVS9JN3llbWhYaTE3UWVOUS9N?=
 =?utf-8?B?aDloakJuUHJ2d1hwTFJvY2hBM3c2RlBWT0t2TXlEYXlpaTRXaHJTNGxQYS84?=
 =?utf-8?B?MGQwaGN1VHVXalhhc0hEZFFiZkZiSkRNS2xmeFZ5K1hkZUxyMldEL3pFMndo?=
 =?utf-8?B?ZERtNzVtdEdlV1dJUW42OGZuWEQzSXJxMG9pSnJsZmNXQW1mVGpEM3FPV1lF?=
 =?utf-8?B?VFMzemNZSDN0cnNEWjAxcmd4ektkSURCWk5uTEhnTXA0ZXBvcmJkUWlORmcy?=
 =?utf-8?B?ZkU1Q0l6Z2NrUW9hQ05zWVJEeXJ6WitENWZYc0xXcWVtekE2MkNMYXc5OERJ?=
 =?utf-8?B?RGhhRFNodXdrSFlXdmZaeE5UOWkwWTdhRkEzQ0xnRC9CTHgreTlyV3hNZENS?=
 =?utf-8?B?VTNCL3JUOVVGRlZzblRzZnpkOE5tRTB1bFdkM21vUGVpWlMxM1dMV3pIMTE4?=
 =?utf-8?B?N0JXN1dYR3JyYnlIYXFCTXlXSDJKS0RVSW8wVkthUEwySDZxK1BpRGJDT3pK?=
 =?utf-8?B?RENhRkhHdTZjeUMyM0JFWktlS0R5bERaZnY1d05RaFhkNXRDWGNTcGJDSU9m?=
 =?utf-8?B?dzZEUmVzL1Jha1JzM2QrdDNYbkJlQUQrc2hZU3c4ZnlEUFJkRHJLakpzalY1?=
 =?utf-8?B?SUVUdHYyQUw3MkFManBNQzV1by93bE50ZGFwSlZvc3M0RGRJU1A3RUtpM3Z1?=
 =?utf-8?B?UFpSQ0RvTDZsMWt6WWRXWFBiOC9OM1JtL1hxY3VNSytYNkQxNmZidnpJM0lZ?=
 =?utf-8?B?OTFnQXpwWG91NUdPRm9FcEwzbEhNNk9hTjZnUGY3ZkNXK3htWWtFL05GYU5G?=
 =?utf-8?B?RytVRlVHUk5uWXZ6TnYrN0xHdzFkbk5iVlNUMEhyZDVwRVp5S204ZlMvTndi?=
 =?utf-8?B?Mmp4K3VCYnlEbXphKzlCL3BmcFMzVGJ5dEwzUnpEZ2wvTEUvMVVFR0ZOVnF1?=
 =?utf-8?B?UnRpQUZCQlBxdXBldmdhZFRFWkZlUUFLWkN5OEdQKzVTbmZHcmRKVVVEOGd5?=
 =?utf-8?B?UjBCNVhPTEpHRy9DMUpWMWVVaEwrTldvRUJSZlJHOXl0MVQzd0w2bklFUiti?=
 =?utf-8?B?ZFY2Ky9UeEJxM0daM09aMTlocHFTKzFNVGowUndBbVlVcTJNNG5IQllLbEcy?=
 =?utf-8?B?ZTZicUpsL2VXSHRIWjRyTVd1K2h4OUpsbStJaFFSbU9DSUFGODVMVEtLRndB?=
 =?utf-8?B?dWRzQzFhQmtIL1JRK0krT1RlTHl1bW1tV3dMRFl1Vk1HdUNRZmpSR1RlNVVT?=
 =?utf-8?B?eEtPaVdZWWtDbXFGWWR5dFZyRGtJNVBsckx3WlJ0MFlORDdQU25ocW9rUG9w?=
 =?utf-8?B?bVltcTNwVE9qamluKzdSMWlSTjM5dTdaVkZ6ZGF2em9uRlhoU1JIcDBiaFlR?=
 =?utf-8?B?SkxtM0V2R1ZUanRWSHJjcHBIVERHRFhYMVRuQ1dEZk10K1IyZG1OUU5xSkRh?=
 =?utf-8?B?Sng0V29naEN0b28xREFzcWlMcVQxeW9nUXN2VHZmS1E0d0MzS2tHZlRGU0VG?=
 =?utf-8?B?cHpZYkhrc1ZIeHpGN1hNdGx0RTFUVG4yMVVPVlMvQnR3NGFQWk1mTEJISSty?=
 =?utf-8?B?c240OFgxbHkrUFc1cDF1M1daVHo0M2N2b3dpWFhSTnNGOTJ4dlBVWGJSS2pR?=
 =?utf-8?B?NXplZTZKSUpub0xva3dCR3YySzMzdFgwbW82NmNRcWNnUlpHbEVWU1NoMmxx?=
 =?utf-8?B?ckpqWE1QMzR2d2xEVVladitxREY3UHhzdmFlL1lTME11WjVQbzNSdXNvVVo3?=
 =?utf-8?B?VkZBK1hJYXVld0VXUGl4WWkveEMwaVN0NmcyUDgyYnhWdjNzZXJnK0xiVUI4?=
 =?utf-8?B?dDRRRjRGL2hRcEhXZ01YaWsyM29lQzZQTkVzOGNxaFFFbFBTVXBSVThKdkhx?=
 =?utf-8?B?dDd5SkJKb0hLSnJpSXIwQWV0b09MODIzRm83OTdLdjdzZWhPdUVsNngvVzhn?=
 =?utf-8?B?K2tpbms5bkhheW53aWx0UzFWQm1JMzdEYUpqQlhRbDJYcEc0aTE2SksvM05v?=
 =?utf-8?B?Q3IxVmVoTFJ1VlRHZnZUTHJkSHNjR1pJdTVTNnkvT21pL296NTRBZkdtdVBC?=
 =?utf-8?Q?0cc95XVIpJAuecf3Dmu8Lvk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06FAE4E43116A74B8FB8F903F67DA284@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66db537f-206e-4b7a-a4c3-08dbb615597f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 17:58:21.4918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VrJxiRF2ADRj0dHD0C/X+CaemiAlOGWc3/ClMGf0xhT8jXhtxQLQMqHDPc4ze0vCBzcd9ZG2UhUmwcSftrbxmFQZtCvxEw8OKvRYXJ5qkKOc/4A0++HU3YkO4F4tI8xM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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
Cc: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTA5IGF0IDE1OjM4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBVcGRhdGUgdGhlIG1heCBHU0MtZncgcmVzcG9uc2UgdGltZSB0byBtYXRj
aCB1cGRhdGVkIGludGVybmFsDQo+IGZ3IHNwZWNzLiBCZWNhdXNlIHRoaXMgcmVzcG9uc2UgdGlt
ZSBpcyBhbiBTTEEgb24gdGhlIGZpcm13YXJlLA0KPiBub3QgaW5jbHVzaXZlIG9mIGk5MTUtPkd1
Qy0+SFcgaGFuZG9mZiBsYXRlbmN5LCB3aGVuIHN1Ym1pdHRpbmcNCj4gcmVxdWVzdHMgdG8gdGhl
IEdTQyBmdyB2aWEgaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1pdCBoZWxwZXJzLA0KYWxhbjpz
bmlwDQpWaXZhaWsgcmVwbGllZCB3aXRoIFJCIG9uIGRyaS1kZXZlbDogaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMjMtU2VwdGVtYmVyLzQyMjg2MS5o
dG1sDQp3ZSBjb25uZWN0ZWQgb2ZmbGluZSBhbmQgYWdyZWVkIHRoYXQgaGlzIFJCIGNhbiByZW1h
aW4gc3RhbmRpbmcgb24gY29uZGl0aW9uIGkgZml4IHRoZSBQQUdFX0FMSUdORUQgLT4gUEFHRV9B
TElHTiBmaXguDQpUaGFua3MgVml2YWlrIGZvciByZXZpZXdpbmcuDQo=
