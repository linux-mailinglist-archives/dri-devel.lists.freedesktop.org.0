Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 200327B9A24
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 05:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A0810E15D;
	Thu,  5 Oct 2023 03:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436B810E15D;
 Thu,  5 Oct 2023 03:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696475178; x=1728011178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XsYYqwB7jSURFixsXD3j3zzUY3h4KTZRcxPbUjVvCy8=;
 b=RTiEz/DqwYR9Ksus5O8vo0oCYjoMpqR2k6Ja3+w3hYGBkRRJckKFWJJ5
 6PRtkR9BNtNKF4IOX9J7hqotG5CUK8Sfr7QZssUSpiejSymZG/9S82fD3
 XtwqHp51ErlB7LArtOtrtvJZ7jOkOqobzx/4+iaLTxLjrXcgzfrzggun2
 IBf/vWIYq8k7keQgDOuhbLKm2IlK4jidaVmXnD7H97VTJ4Qz4oatNY75A
 Id1voytmKPPJeV5KMuMRDHuCnsz/BqU17+RKgh7xbXVRbYKlD1scen16J
 Wn/ysSDVWzAOUnFfO76paP0jrZEYUeemH8Aa2KYiuiTO8WDrI6Yv04p/f Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373734541"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="373734541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 20:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842197897"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="842197897"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 20:06:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 20:06:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 20:06:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 20:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0TFPWHbEjA0EgdVYdnO1+rbSS8297/So2Ez42XOfvECdRaDYveBlA/kkijTDN+mQNp5pctX8i1x3OqNkOWgCk6sCqP047/Wg6NP3f5xKxcxkMU3sdKuk0xVkwINwbeZtLySNn+mANd6NN1Wb6ImiQQN5glgvtFAP39CsV6S0khyeaEVDRMCNFGO6jINKwZaAv4uKt2gwOP7z51H3TzjCGzAjuMgus17V/goSIMWvkImiMQnT3kx25xgK1Qq8D9lmHCFZeslW1/YwVZeECXvqG2yVTjScfatRH7qIKSlPx7vAguJAP89sPwKk/Uv8KR+QfrAKmAXbOPUmw719B/JLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsYYqwB7jSURFixsXD3j3zzUY3h4KTZRcxPbUjVvCy8=;
 b=jLwIJ/fucMH4fQTalMBdAPlcXlaeYTa1VTmdlfuhEIvyKvcT6k3gjlIoKZWd4ov+KNn1f+nem4TfOzEn7956+y0wWbJM5tdpzwEDaQM37QgOHh22Mnc0xkLbIeu+4PBYEx48e9Q3WNI/dlyO8j3ZX7OEMFQJ9xr815uPSZcWcsMMC9SdRHt9nIlsKTC+w604OQ3aKBIeeV5nFtbfvZD49CZi0+w3sIDNvtg3ZH2Tf48U2z+/RwK8W4ketHeXsEDuM+HOVdDsqaMWSILjTCrAOAbmer5EO+sB0ChXOitZUTPYy6i9jTFGs7Y1aVDDapIVR/aMFPKCA1l3bbXtVwUjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM4PR11MB6213.namprd11.prod.outlook.com (2603:10b6:8:ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 5 Oct
 2023 03:06:09 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c%3]) with mapi id 15.20.6838.027; Thu, 5 Oct 2023
 03:06:09 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Subject: RE: bulk_move in ttm_resource manager
Thread-Topic: bulk_move in ttm_resource manager
Thread-Index: Adn2ctIrdkmtsoIjSwiVZseTI8cRhgAIAkyAAAtuJAAAHByEwA==
Date: Thu, 5 Oct 2023 03:06:09 +0000
Message-ID: <SA1PR11MB69910DFDF67D636FF859D4EB92CAA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <d29ad7b31b39e95280cc96ad93613967467721bb.camel@linux.intel.com>
 <a657c5d1-e5ef-446b-9481-c55f2c59c20b@amd.com>
In-Reply-To: <a657c5d1-e5ef-446b-9481-c55f2c59c20b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM4PR11MB6213:EE_
x-ms-office365-filtering-correlation-id: e34ebaac-b77f-40ee-6e72-08dbc5500668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4u+cW+lbi7EQksn4FwnA39JLw6c/zL2RVg9zbUUE87URuhXZuugOj1e2JWoknBvy3bvWIgUBEM6sOE2XwB8z4UcrVtl+KnyYWwYts4FopSSfeb6KsJ8YT8DM8XkXARmeYC5EHwNcBTX7Dn6YTyNJhi1cFZF4qtIG9N+P3fEQdLkl+P8mjd0WaF4/4xq8+OY3uJ2nHJJ5CpBImnaTBbNWjpRD3lpScVXN2Y7d3BM1i0D3HvLjY0F+/wZcjrJN2JY48F4yzyEmkOJ8QHDcmcDwFX64XikG9b0vowpP9TnL6fuBzbzoKFtLNJJnZJe/iwbX0UDlUR7pM6ub5TEWjdyAUmFh9jFHR8D+KLe0s2fC/OaM37DcSxEq85hY+oO/m5SKyFd2e9RjefRgAEZ+91HKqV+ZHipDUUnV50OVaFtvhRdoWluWPr3HPWN6OfV/2szx5zKORxpvZBNAQzJQf9eNDOJkfuWkihAhbXDORd7VVqDNS4GoSPKzrwv2aOd0IyPIWGUrmn9ItanBspsNZn/k5dg2+gTsmDOGReM9/5Tp6gg8rV42YxIbEMtZ8UOtxYPtvZvjWzxzAGSF4sj1q0k9oQPHdyILXBFqDyz7yAKa4rL9QYAMkkqOLJfjxnCgGH9ySY8zK9i2kETXEVf4ksr95g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(7696005)(53546011)(9686003)(6506007)(478600001)(966005)(71200400001)(76116006)(83380400001)(4326008)(2906002)(5660300002)(54906003)(64756008)(66946007)(110136005)(66476007)(66556008)(66446008)(8676002)(316002)(52536014)(8936002)(26005)(41300700001)(66574015)(55016003)(33656002)(38100700002)(122000001)(86362001)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1Q1NXNlWTB6SEQ1L0dFbUQ3dmc4WlQ3TVdCc2tHZGhOMHVOalpNTDZGTzNu?=
 =?utf-8?B?OFRkLzBNK0wzWS9lSWprK2tyazVZNGU4RytvdGNzbDZyNWZJVWlwMGgxbExh?=
 =?utf-8?B?RlE5TnpMMFkyRTZnbkthT0wrLy9ZS0F4SThVTnhlUzZKdWo2bTg4ZDJoWEs0?=
 =?utf-8?B?Q2dvTGlTRiswU3RiTXJaVmtoTXk3OXV0N2lackRjd3RhU21mOGZETDFLLzgx?=
 =?utf-8?B?eURRNjdZM2w5d2dXRzZCak55UXlWeHNkRThjNzFIQnJScm8yQ1ovNTBDN3Jk?=
 =?utf-8?B?K2J5N2M4UERqQ3B4NU1MS0tSc1ZvMjBkL1l5d3AyMy9BOW5Nb3V0d1dCeTVq?=
 =?utf-8?B?b09EMmJjcnV6Y3gyUnVvOHhsKzFzUFRNeWs5Q3I5Y3lJaDZkZ2xYRWw3WVRE?=
 =?utf-8?B?VTFMSHBUV2FjeTVJaXVlOWFFZldKeTgySXFFVDhEM2ZSQldLL3BZaVd3NU1y?=
 =?utf-8?B?c0lwYm9Mc1NpZnRjTjRkblJ1ZG9uOGRXdGV1TFM4UjloczZSMTV5bG9yekVP?=
 =?utf-8?B?ck12cjkxTXFyUG1JQzBpZnM3TWtFS3NnR0NTWUlqc0pkeEdMV1VuS2Y5dVVJ?=
 =?utf-8?B?TWRwSnpIcE8rRlhBMU1wbGdnbGF6ankrWWhFSlNRZXZORzJPVW5pb1BidXZO?=
 =?utf-8?B?WU1SR0hVYjhRWHYxNXZYVm1JU0dNVG1mNDV6d1RheGoxVlFnWUp2eFROOGlO?=
 =?utf-8?B?OUZWeEJpclo1MjdpQUNCMWF5Zklpa0c4WUhQTkorQVBzRWRTRXl3L1M2MlBV?=
 =?utf-8?B?NmxzNEw1a1NTT0I1eDV4d2JTTzg5VW5LVmM5cjcxVmVwNTBoNmtuQ3J6YUJH?=
 =?utf-8?B?UTEzWExKQ3RCWWFwa0VSUm5adVhBTHovOVBSSHh0MWtYazFlcVpBK0paZkUy?=
 =?utf-8?B?cXlLZkozWklJMkZvaURFaHhRU0hiWnpza3A0V3Q3ZkNxVUx1RHoyWW5mQ2xv?=
 =?utf-8?B?WjB3aWxVQTl3MGJISTN0cHFiWStpSnJEblR4RGFhTGV4emF6SzNoU2pvVzlw?=
 =?utf-8?B?TENoUlo4ZjRyZHVMNFEwY2lmcEdwc29IUVhVL2NqUWJURC9tM2ZMVGdTSjRO?=
 =?utf-8?B?bm9MckNSNE8vUWRlZXhoZkcvVHZ3cXhNL1hMU0RxU0FvSElxVVNyeXcwcldx?=
 =?utf-8?B?WFhQb3o0SzBvVkJUaUlBQmIyQkpIYkxoOTZ1ZjIwQXltRkRuY1JtQmoxaUtX?=
 =?utf-8?B?QmNHeXplQVFtYUxGVkxaVDc5cXFtVCtqUGlSSWRYVWVIamE5bHFjamxFNnFI?=
 =?utf-8?B?NTdaQUcrdjFmeWR6MVkvbXpzaGxoRldYZ0lSSzBPRThmbVVyYThSN25mWTAx?=
 =?utf-8?B?SllwMyswaWpXaUg1LzNKMVZlT1A3eHJ3VTY3NzFwekdNbytUUWdtWU8wbWpI?=
 =?utf-8?B?ZlNuWUtjN01XRVhjM0JWUEd2WHl4dGsrQWFJSVREWHRGcjhuWldENUNoQUdE?=
 =?utf-8?B?dTRYenQxdkZUT0YvQmlXRTNhbTFMREFEMlpFOXgrNWl0djFEZHB0bFV0ekRN?=
 =?utf-8?B?NC9PSERSZTk3UGpIMW93RWpsTVJpeHBYMGJDVFlRNzBueGRzdGVZcFBhczNa?=
 =?utf-8?B?QXlHNzJxRDl5S3FZbkZOM1BaNERza0F3dVRkbUlsNWxNVnZnM0JZOE9KQTlv?=
 =?utf-8?B?YkRQWTB5WG1ZWktGRHdxT29BOUxiV0dYY0p6RS80WDhNRmQvV1hqNlVHUXF3?=
 =?utf-8?B?WlpYRDl6c0syU042SGdPbUYxMTVqUEhhSjlSSm5uR3luWStVZXA4b0IwR1pG?=
 =?utf-8?B?TEFFMkx4RHk5SXN6VUp1WVVLSzdhV3hmcU4vSzNFeXVndndPeEp6TUNVQmlk?=
 =?utf-8?B?T1dWa3hqSm1SUlF2QmwycUEvbzFxbmFDQ0NnSGJJU3cxcHVwZTJGdnJFMUg5?=
 =?utf-8?B?eVJUaUVwd1YrOThVSnpVY2VEdHV6ODZDWmpzMk1JUS9iUGk4ZFJrOXVWbTlJ?=
 =?utf-8?B?ZG1wZnhFalZYSkFoNHFlLzZXUjFjTDFXMGovWkkyWXZDK2J2UlJ0OS9xNmhF?=
 =?utf-8?B?SnlNMFkzbWduRHlhQkdrVmJqVlU4eXhJN2lLeExTZDhYQW9xSEFsY0xqMFFN?=
 =?utf-8?B?NWYzN01nemJYcERJK3NSd21WdnRQVGREWjhDZmYxa3pVWEVrU05qaDFHYkFz?=
 =?utf-8?Q?viyw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34ebaac-b77f-40ee-6e72-08dbc5500668
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 03:06:09.8042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VmNpUOSNUBuw4vpjjmR2CsWHyDT5gG2XtljOiXh/kJNWu5nDZvQbee+Lz4jQNv3dV6lrr+N4G48Nx/6TDF+Rqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6213
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDQs
IDIwMjMgODo0NSBBTQ0KPiBUbzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21A
bGludXguaW50ZWwuY29tPjsgWmVuZywgT2FrDQo+IDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+IENj
OiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IGJ1bGtfbW92ZSBpbiB0dG1fcmVzb3VyY2UgbWFuYWdl
cg0KPiANCj4gQW0gMDQuMTAuMjMgdW0gMDk6MTcgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bToN
Cj4gPiBPbiBXZWQsIDIwMjMtMTAtMDQgYXQgMDM6NTIgKzAwMDAsIFplbmcsIE9hayB3cm90ZToN
Cj4gPj4gSGkgQ2hyaXN0aWFuLA0KPiA+Pg0KPiA+PiBBcyBhIGZvbGxvdyB1cCB0byB0aGlzIHRo
cmVhZDoNCj4gPj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzQx
MDc0MC5odG1sLCBJIHN0YXJ0ZWQgdGhlDQo+ID4+IHdvcmsgb2YgbW92aW5nIHRoZSBscnUgb3V0
IG9mIHR0bV9yZXNvdXJjZV9tYW5hZ2VyIGFuZCBtYWtlIGl0IGENCj4gPj4gY29tbW9uIGxpYnJh
cnkgZm9yIGJvdGggdHRtIGFuZCBzdm0uIFdoaWxlIGxvb2sgaW50byB0aGUgZGV0YWlscyBvZg0K
PiA+PiB0aGUgYnVsa19tb3ZlIGluIHR0bSByZXNvdXJjZSBtYW5hZ2VyLCBJIGZvdW5kIGEgcG90
ZW50aWFsIHByb2JsZW06DQo+ID4+DQo+ID4+IEZvciBzaW1wbGljaXR5LCBsZXTigJlzIHNheSB3
ZSBvbmx5IGhhdmUgb25lIG1lbW9yeSB0eXBlIGFuZCBvbmUNCj4gPj4gcHJpb3JpdHksIHNvIHR0
bSByZXNvdXJjZSBtYW5hZ2VyIG9ubHkgbWFpbnRhaW5zIG9uZSBnbG9iYWwgbHJ1IGxpc3QuDQo+
ID4+IExldOKAmXMgc2F5IHRoaXMgbGlzdCBoYXMgMTAgbm9kZXMsIG5vZGUxIHRvIG5vZGUxMC4N
Cj4gPj4NCj4gPj4gQnV0IHRoZSBscnVfYnVsa19tb3ZlIGlzIHBlciB2bS4gTGV04oCZcyBzYXkg
dm0xIGhhcyBhIGJ1bGtfbW92ZQ0KPiA+PiBjb3ZlcmluZyBub2RlIHJhbmdlIFtub2RlNCwgbm9k
ZTddIGFuZCB2bTIgaGFzIGEgYnVsa19tb3ZlIGNvdmVyaW5nDQo+ID4+IG5vZGUgcmFuZ2UgW25v
ZGU2LCBub2RlOV0uIE5vdGljZSB0aG9zZSB0d28gcmFuZ2UgaGFzIGFuIG92ZXJsYXAuDQo+ID4+
IFNpbmNlIHR3byB2bSBjYW4gc2ltdWx0YW5lb3VzbHkgYWRkIG5vZGVzIHRvIGxydSwgSSB0aGlu
ayB0aGlzDQo+ID4+IHNjZW5hcmlvIGNhbiBoYXBwZW4uDQo+IA0KPiBUaGF0IGNhbid0IGhhcHBl
bi4gU2VlIHdoYXQgdHRtX3Jlc291cmNlX21vdmVfdG9fbHJ1X3RhaWwoKSBkb2VzIHdoZW4NCj4g
dGhlIEJPIGhhcyBhIGJ1bGsgbW92ZSBhc3NvY2lhdGVkIHdpdGggaXQuDQoNCkkgc3BlbnQgbW9y
ZSB0aW1lIHJlYWRpbmcgdGhlIGNvZGVzIGFuZCBJIGFtIGNvbnZpbmNlZCB0aGUgY29kZXMgZ3Vh
cmFudGVlIGFsbCBub2RlcyBpbiBhIGJ1bGsgbW92ZSByYW5nZSBhcmUgYWxsIGJlbG9uZ3MgdG8g
b25lIHZtLiBZZXMgZWFjaCB0aW1lIHdoZW4gd2UgYWRkIGEgbm9kZSB0byBidWxrIG1vdmUgcmFu
Z2UsIHR0bV9yZXNvdXJjZV9tb3ZlX3RvX2xydV90YWlsIChhbmQgb3RoZXIgaGVscGVycyBzdWNo
IGFzIHR0bV9yZXNvdXJjZV9hZGRfYnVsa19tb3ZlKSBtb3ZlcyB0aGUgbmV3bHkgYWRkZWQgbm9k
ZSB0byB0aGUgdGFpbCBvZiBidWxrIG1vdmUuIFdoZW4gdGhlIGZpcnN0IG5vZGUgaXMgYWRkZWQg
dG8gdGhlIGJ1bGsgbW92ZSwgdGhlIGZpcnN0IGFuZCBsYXN0IHBvaW50ZXIgb2YgdGhlIGJ1bGsg
bW92ZSBib3RoIHBvaW50IHRvIHRoZSBzYW1lIGZpcnN0IG5vZGUgLSB0aGlzIGlzIHRoZSBpbml0
aWFsIGNvbmRpdGlvbiB0aGF0IG5vZGVzIGluIGEgYnVsayBtb3ZlIGFyZSBub3Qgc2VwYXJhdGVk
LiBFdmVudHVhbGx5IHdoZW4gbmV3IG5vZGVzIGFyZSBhZGRlZCwgd2UgYWx3YXlzIG1vdmUgdGhl
bSB0byB0aGUgdGFpbCBvZiB0aGUgYnVsayBtb3ZlLiBTbyBhZnRlciB0aGUgbW92ZSwgYWxsIG5v
ZGVzIGluIGEgYnVsayBtb3ZlIGFyZSBzdGlsbCBub3Qgc2VwYXJhdGVkIChieSBub2RlcyBmcm9t
IG90aGVyIHZtKS4gDQoNCkkgZG91YnQgd2hldGhlciB0aGlzIGltcGxlbWVudGF0aW9uIG9mIGJ1
bGsgbW92ZSBjYW4gYWN0dWFsbHkgY3V0IExSVSBtYWludGVuYW5jZSBvdmVyaGVhZC4gRXZlbiB0
aG91Z2ggd2UgY2FuIG1vdmUgYnVsayBub2RlcyBhdCBvbmNlIGF0IHRoZSBlbmQsIGJ1dCB3aGVu
ICplYWNoKiBub2RlIGFyZSBhZGRlZCB0byBMUlUgb3IgbW92ZWQgaW4gTFJVLCB3ZSBtb3ZlZCB0
aGVtIHRvIHRoZSB0YWlsIG9mIGJ1bGsgbW92ZSByYW5nZSBkdWUgdG8gYWJvdmUgYnVsayBtb3Zl
IHJlc3RyaWN0aW9uKHdoZW4gYnVsayBtb3ZlIGlzIGVuYWJsZWQpIC0gdGhpcyBpcyBhbHJlYWR5
IGxpbmsgbGlzdCBvcGVyYXRpb24uIFdoeSBub3QganVzdCBhZGQgbm9kZSB0byB0aGUgdGFpbCBv
ZiBMUlUsIG9yIGp1c3QgbW92ZSBub2RlIHRvIExSVSB0YWlsIHdoZW4gbm9kZSBpcyB0b3VjaGVk
IGJ5IEdQVT8NCiANCj4gDQo+ID4+DQo+ID4+IE5vdyBpZiB3ZSBwZXJmb3JtIGEgYnVsayBtb3Zl
IGZvciB2bTEsIG1vdmluZyBbbm9kZTQsIG5vZGU3XSB0byB0aGUNCj4gPj4gdGFpbCBvZiB0aGUg
bHJ1IGxpc3QuIFRoZSBscnUgYWZ0ZXIgdGhpcyBidWxrIG1vdmUgd2lsbCBiZTogbm9kZTEsDQo+
ID4+IG5vZGUyLCBub2RlMyxub2RlOCxub2RlOSwgbm9kZTEwLCBub2RlNCwgbm9kZTUsIG5vZGU2
LCBub2RlNy4gTm93DQo+ID4+IG5vdGljZSB0aGF0IGZvciB2bTLigJlzIGJ1bGtfbW92ZSwgdGhl
IGZpcnN0IHBvaW50ZXIgwqAocG9pbnRpbmcgdG8NCj4gPj4gbm9kZTYpIGlzIGFjdHVhbGx5IGFm
dGVyIHRoZSBsYXN0IHBvaW50ZXIgKHBvaW50aW5nIHRvIG5vZGU5KSwgd2hpY2gNCj4gPj4gZG9l
c27igJl0IG1ha2Ugc2Vuc2UuDQo+ID4+DQo+ID4+IElzIHRoaXMgYSByZWFsIHByb2JsZW0/IEFz
IEkgdW5kZXJzdGFuZCBpdCwgd2l0aCB0aGlzIGlzc3VlLCB3ZSBvbmx5DQo+ID4+IG1lc3MgdXAg
dGhlIGxydSBsaXN0IG9yZGVyLCBidXQgdGhlcmUgd29u4oCZdCBiZSBhbnkgZnVuY3Rpb25hbA0K
PiA+PiBwcm9ibGVtLiBJZiBpdCBpcyBhIHJlYWwgcHJvYmxlbSwgc2hvdWxkIHdlIG1ha2UgdGhl
IGJ1bGtfbW92ZSBnbG9iYWwNCj4gPj4gaW5zdGVhZCBvZiBwZXIgdm0gYmFzZWQ/DQo+ID4+DQo+
ID4+IFRoYW5rcywNCj4gPj4gT2FrDQo+ID4+DQo+ID4gRldJVyBJIGhhdmUgYSBwYXRjaCBzZXQg
dGhhdCBjb252ZXJ0cyB0aGUgVFRNIGJ1bGsgbW92ZSBjb2RlIHRvIHVzaW5nDQo+ID4gc3VibGlz
dHM7IGEgbGlzdCBpdGVtIGlzIGVpdGhlciBhIHJlc291cmNlIG9yIGEgc3VibGlzdCwgYW5kIHdo
ZW4NCj4gPiBwZXJmb3JtaW5nIGEgYnVsayBtb3ZlIGVzc2VudGlhbGx5IHRoZSBzdWJsaXN0IGlz
IG1vdmVkLiBCdW1waW5nDQo+ID4gcmVzb3VyY2UgTFJVIHdpdGhpbiBhIFZNIHdvdWxkIHRvdWNo
IG9ubHkgdGhlIHN1Ymxpc3QuDQo+IA0KPiBUaGF0IHNvdW5kcyBsaWtlIG15IHZlcnkgZmlyc3Qg
YXR0ZW1wdCBhdCBidWxrIG1vdmVzIHdoaWNoIHdlIGFiYW5kb25lZA0KPiBmb3IgdmFyaW91cyBy
ZWFzb25zLg0KPiANCj4gVGhhdCdzIGVhc2lseSA+NXllYXJzIGFnbywgYnV0IHRoZSBoaXN0b3J5
IG9mIHRoYXQgc2hvdWxkIHN0aWxsIGJlIG9uDQo+IHRoZSBtYWlsaW5nIGxpc3QgaWYgSSdtIG5v
dCBjb21wbGV0ZWx5IG1pc3Rha2VuLg0KDQpTbyBmb3IgbXkgcmVmYWN0b3Igd29yaywgSSBwbGFu
IHRvIGRvIGl0IGJhc2VkIG9uIHRoZSBjdXJyZW50IHVwc3RyZWFtIGltcGxlbWVudGF0aW9uLiBJ
IHdpbGwgcmV2aXNpdCBpZiB3ZSBlbmQgdXAgdXNpbmcgdGhlIHN1Ymxpc3RzLg0KDQpSZWdhcmRz
LA0KT2FrDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4gDQo+ID4NCj4gPiBDdXJy
ZW50bHkgZnVuY3Rpb25hbGl0eSBhbmQgVFRNIEFQSSBpcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBi
dXQgd2hlbg0KPiA+IGV4cGVyaW1lbnRpbmcgd2l0aCBMUlUgdHJhdmVyc2FsIGZvciBleGhhdXN0
aXZlIFdXLWxvY2tpbmcgZXZpY3Rpb24NCj4gPiB0aGlzIGNvbmNlcHQgd2FzIGVhc2llciB0byB1
c2UuIEFsc28gaG9wZWZ1bGx5IHRoaXMgd291bGQgcmVkdWNlDQo+ID4gZnJhZ2lsaXR5IGFuZCBp
bXByb3ZlIHVuZGVyc3RhbmRpbmcgc2luY2UgYSBzY2VuYXJpbyBsaWtlIHRoZSBhYm92ZQ0KPiA+
IGNvdWxkIHJlYWxseSBuZXZlciBoYXBwZW4uLi4NCj4gPg0KPiA+IExldCBtZSBrbm93IGlmIEkg
c2hvdWxkIHNlbmQgaXQgb3V0IGFzIGFuIFJGQy4NCj4gPg0KPiA+IENvZGUgaXMgaGVyZToNCj4g
PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tDQo+IC9tZXJn
ZV9yZXF1ZXN0cy8zNTEvY29tbWl0cw0KPiA+DQo+ID4gL1Rob21hcw0KPiA+DQo+ID4NCj4gPg0K
PiA+DQo+ID4NCg0K
