Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA6675A36
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B7410E377;
	Fri, 20 Jan 2023 16:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32F10E377;
 Fri, 20 Jan 2023 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232876; x=1705768876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cFOgIN4TKOaxwnx9TtvSoAFv9RfDRFb+UGW1ksLoSu4=;
 b=bFJpqK7u5csLnmdQvdquoBaf6OL6nfKdvHPo2SO7+NGCJmIIFiGHm+J8
 cpLPL1KeR4bxeZwgXKZFoIBoaw+OGpQ/k0V5MbGENmZn2Rdf6/6kF1xe5
 e340XsxeBog/fKQ/zaq81Fv7UQ/EjnEjmBSFwmL19sBkVxI3DJii+Ufz0
 ncXMqt1MnCxfNlrcUBxrGCkd5jnbArGxe/VyUIKRpT4IIUlIaVWxLiyxk
 whOQJl1aORHOzBNx9DfxeOIB6zdpwbx+hNHqejJZBXz6AAq7gyT4JLmVE
 bX/stR5lhRmzL91uh4SMkP7PI5FVU35nShMTZC6fwsOTUUwCCmntLtGkF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="326895918"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="326895918"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610528164"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="610528164"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 08:41:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 08:41:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 08:41:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 08:41:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 08:41:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV04OrLAALcCJ/0oKNm8grszx/Yg5LxHxM1MyXqrnsJFd/bjhypRmnCyL2Nm3mEMPbLQzDLOMDJ9+bWI4QubjU+lblkpcF3FXKutwLsrTPe/prsbux5AUz9C+YYwPY2f0nXMu4C57gV3xxkEnIyimzjf9WZCqCOaAfIjxA7bziGKYy6o6yV0yK9wQrbuyYQWXAxDDslMyGM9BaVxfguyClhGm2mD3whIWnPzItEkiSzoTzEpIA6SK89KPx2DS+FpskZ7hRAPjyyozmJxU7SNyYxwsDMchiym4XzMPjVVW2f8ZbLPal4yL95cgbG8aFv8j98vitkpUx31DVgGIgsh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFOgIN4TKOaxwnx9TtvSoAFv9RfDRFb+UGW1ksLoSu4=;
 b=FGcwrliuf9/KB9KbFUZnQ7ur8hVIEPj9jr3MruduvL9kC/7HrQmRGp3h2qEf42ZfDF8iS6hA0rLY1lrL5sYEJEQHlYo2W5+vzfyYEOYdlstqqARgYE4tKCtnzw2v/YQRzHqBBQHQPDll2zwCAuHydqFkCj1We+NkPP6SEqZA5F0FB+D8OXqw6tSyy2kNv/ilwf3nTY+vujW+MVaVnhugGTDbQZOctSK9zF9hYLz6CRUjRyQ6VCQz0M30TaecNCLXow3CeAdttpRFedNoFMkj3REtKcmBGUq+N7no/GHuT/tj0AasI/ExvrAZzYkopDiPFkiWotnEZc64ebZYeEexvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Fri, 20 Jan 2023 16:41:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 16:41:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR
 completion
Thread-Topic: [Intel-gfx] [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR
 completion
Thread-Index: AQHZLD82JYaug2aXxkqEzlhuyeoWTK6m+acAgACJzAA=
Date: Fri, 20 Jan 2023 16:41:00 +0000
Message-ID: <d8f38af2d1205dc14e34af3bdd5a44d9843cdf7d.camel@intel.com>
References: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
 <CY5PR11MB6211B8731BEFCDDD4A3F270B95C59@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6211B8731BEFCDDD4A3F270B95C59@CY5PR11MB6211.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB7318:EE_
x-ms-office365-filtering-correlation-id: b9727e60-7094-4cc5-66b2-08dafb051cba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f5ZUh+0F34kHl9JUnzOmxM5fOif7bJ6DhC9x2f+ibX6205kjJifOILXlx3/0dzX6sFdcYZsb5MbQ4i9/aWA3p9nEv74S8EU3lPrmSYGC3AngRKVG5XEx3Se9bslghmIRjqTW9NHoLwKmvr4VgMt4BAuvR9GPimQkpqvmUPshXvUwjnxuRJER5Zj7bBQfeM5YoN2N89yCEPq7qwMSW1UF4qoyePVLZXIU2ZLBo0PJGIe/6HUosvtm7JirNIZvdeFPvs1ftZUNgANKy2/T401r4ZAwgU2NjFqmP5Hdw906Xvgs7/pLJznfQ2voji0t2lUJZ52h5FDGQvF9LjoXGT7YeVVTz92MMG3AZuIWnbH3AjXlus9Qyn+30tqEkTdsIakzrPOYi4zifSgU386uVB8bix03XKGMPt9trGI4iKpZpUv8cm1x+sJtCF8F3+2Y19h2ygriUgeKfQkVp1bgXRZVWtZIvq1cBsbN839Vz0N6hQ19+8RZ9CpG4FWdGEoLjrssEG/33CiC2AGj3dVH2/ab7SDu7tYLobh0/M6/lnxuMfIpO0zclac1xIH0bpNvHG7A2F+EaaLDJGPCZe9Rs+fndQaFEv5V1QXxV4PxU+VxwzW5qBrRie5nPZo+6lOZMvizFcbcHc4wzkOPcSatIwjTHFzxZ1RG7jEw4ncrkzeOGuPF7N50Hgj+th6cnKzMcF4QqwkR+cYRO1HTp1jeXILCgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199015)(71200400001)(83380400001)(4744005)(107886003)(8936002)(36756003)(6486002)(110136005)(2906002)(478600001)(38070700005)(2616005)(5660300002)(122000001)(53546011)(41300700001)(316002)(6506007)(26005)(4326008)(186003)(8676002)(76116006)(6512007)(66946007)(66556008)(66446008)(66476007)(91956017)(64756008)(86362001)(38100700002)(54906003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlBWM0pVYWR0ZTJvVlhnalJrNlgvVng4NitFZnR1blR6OHVsWldOR0IxNUIx?=
 =?utf-8?B?UWRPSXFCT0p5ZUNKS01xYjN1K1BPc0I0Z09ra1pVRldWQTlVTTVRaUNQVGpD?=
 =?utf-8?B?RWd0ZUUvR1haZXF6WVcreTRLWHMzVTcyR0UxWUk1d3pJeU94eHJIaThQRFpy?=
 =?utf-8?B?N1ZGK2tzYnUrWmptTDN6a0lHU2lDcm0zYjlkKzEzRzhBVlBFcXNUMkE2WjN3?=
 =?utf-8?B?bGpaMm9EaWJvSmhHUHdESVQ2eTU2UXlWSG9CVmY2c1p0QldNbklsY0ExclZs?=
 =?utf-8?B?a2tUUUd6U09QN09FLytiZHJrV3poUk5BZnFwMUZTVzhRZW4vSjdCVjBESmp1?=
 =?utf-8?B?a2hiYXJhYVlmYWdNc3ZmL2MvZDZuWVVPbnVTOTI0MXBPUXp0VWZBQTZlQThi?=
 =?utf-8?B?Nm5oN016Wkk2ZjlqSGQ2TERhWE5scFdPNVJtVzBoK3RtKzZNL0lhR2FGdUJF?=
 =?utf-8?B?SVRqcUZkWWxhYk0wU245ZTJmTXFHMlJSSGhBZ2oyY29JSnBlYkFrMDNNZ2Nn?=
 =?utf-8?B?QWp0TnhTV1p2NThUc2JYZWlFN0RqNUk2VnQzeHk3ZGZ1STVrTnVhNE8wbi9p?=
 =?utf-8?B?MXg2a0hDUHcvUThZeDU2RVRVejJrOFBuZHpiL2lmYzJWUm1NLzFKbnlQeTJG?=
 =?utf-8?B?czZTK0Q3M1loWndPVDdiMytHSDUycCtGRmlSWjRtdnhlRmFFelVuNjRURDQ1?=
 =?utf-8?B?YWdOamxGZXc1cmIxZlVTYldiUFBoY29VVmdnNzh5Q2RQMXl4aUxnQ0NPWWR0?=
 =?utf-8?B?SEtEWlRlakxmMWwvUk9ZakxnTDRpQjdIN0Z3bWQ2ajFINUJSU2E0c0t4WHdF?=
 =?utf-8?B?a2NxVmxRNkZ0bGhTRkVDRElwMzFLWHg3dDljaks0WWM3MXVTaWZPczVTWnJT?=
 =?utf-8?B?WnN3bytTRGxRSlJGcWtDUkVGYTl5bHIxdW8xY0ZZOWNBUWVYSHlxQ0ZmWTlS?=
 =?utf-8?B?Ym1IeVFFaFZJOE5kdjV5RytEY0FaeVVBL1BXb0k1SUVmZy9iSW9pMWdVM2NZ?=
 =?utf-8?B?V0g5dlo2TWp4NWZLZWdWckNYQ0RsdGNzKzViemRTTmltcWgrZlowTExSd0Zj?=
 =?utf-8?B?c01CaTRuN1VuSEttbXNFakFDZE5YOVNDTS81Ti93S2dnUFFzQkltMVIyc2RX?=
 =?utf-8?B?aTh3bTQ0NEhpNmNkY2YyR2VZK1VxQzFkcHkyZHFIeXdyclk0b3JWNGhCM0xU?=
 =?utf-8?B?RzJiRm9yRHlRazlEZEFuV3NFOSswNWZUWU1uYlZRaVNlWTR6cCtxZW5zRFQ3?=
 =?utf-8?B?R2dhb2VtUFhGTXFXczcyTzBNVXJWeDNyY0xMdFNMTTdvamdERUxUckFWWXVT?=
 =?utf-8?B?NnJFYWFXcWRWeUNKVjkvbktleUdHMXhWNEsxLzB4dzVNc1ZvMWQ0bGU5ZHNR?=
 =?utf-8?B?RzJPTy9RV0R4NXZBZ1ZDR1FJcTRSTGt6NTVxZFE1MHBOOG9Ca3l3VlpOOTRW?=
 =?utf-8?B?ZmsyZVNRcUxzTzhFSjlOYUozN0cxaEtkN0lpQmt4M256Ykp0TmZiSksyMGpY?=
 =?utf-8?B?U0lLUE1DeUVLdmo4WlRJcXpzYzRzOVdPNnBQTlBzazJ1eGsxQTBRcjFIUHBj?=
 =?utf-8?B?bjFxRWRwZXFra3ZpUERXV08vYlY3YTYrQzFYVzRWaFQyMGR4UFhBdlNnNFBC?=
 =?utf-8?B?NzI2YU5qZXRXM1NNN3FoeXhtZzUrLzZvd0kxOGFaWGdFd3J6UnhkdDRzaW5n?=
 =?utf-8?B?QUpDa3A1NWh3dDBRQkF4KzQ4cVQyL0JWZGR2ME9VMlppNlJtY1gyVnR1Q2J2?=
 =?utf-8?B?SVN2ZDJGUTlseUx1N0RCRThzYm9XSmdBWlN6dHdOalR4d0lmaUZ4UXlvRHBL?=
 =?utf-8?B?bjB4cUdzRUtJKzRLQlozZXA5L3JiRlZ0V0IvQmRjVFprT2NOSDg4L3c3VTFY?=
 =?utf-8?B?OGVTVUFKRUFWakw0dldUWU9QSTlQUExVQUhHdUFDVkpWQnppZFVvQWprZnBL?=
 =?utf-8?B?NEdLaWZLU01mK2xTTUNlVVlDcUIxSW5iMUlrTFljeTNibDJNNW5ST3VmS1F2?=
 =?utf-8?B?VHB5OFFEcThXTGZzcGhicGxpdndmVEdMSVlDNHhvalJNSXNYcEc3ZW5tRWdL?=
 =?utf-8?B?U21QRU55dXJ0VFIzazFlbXRkUWkycnVyT0VvZEV3aWp0aHBITmNKamlZK1Iz?=
 =?utf-8?B?L3NWKytGQWdudkt0VGhSazZDTkRXL2l0U053SjhXendZQkV4emFSZ0I4N21I?=
 =?utf-8?Q?oYi13j3Pg63CcI7T17rYJ7Ro09oVffIQYz89p5ayIUh3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EAF46BD5B48C84383B60BF2C94F17D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9727e60-7094-4cc5-66b2-08dafb051cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 16:41:00.1420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lyTYjB+r83OLbapebvnihOiz5vNvSiJWkt1VwU1zdtm2j2yWw0ARAq3TMrMiLyATH10+6YaHg77A1ZLVh86WqL8SnYtDkUnul+ftS5gpSisV6hpMG6kpZHLbnsTk0iOT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
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
Cc: "Vivi@freedesktop.org" <Vivi@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTAxLTIwIGF0IDA4OjI3ICswMDAwLCBHdXB0YSwgQW5zaHVtYW4gd3JvdGU6
DQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEludGVs
LWdmeCA8aW50ZWwtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYg
T2YgQWxhbg0KPiA+IFByZXZpbg0KPiA+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyMCwgMjAyMyAx
OjIwIEFNDQo+ID4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzog
Vml2aUBmcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRl
cmVzIEFsZXhpcywNCj4gPiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGlu
dGVsLmNvbT47IFZpdmksIFJvZHJpZ28NCj4gPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4g
PiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggMS8xXSBkcm0vaTkxNS9nc2M6IEZpeCB0aGUg
RHJpdmVyLUZMUiBjb21wbGV0aW9uDQo+ID4gDQo+ID4gDQphbGFuOnNuaXAuLg0KDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgLyogQ29tcGxldGlvbiBTdGVwIDEgLSBwb2xsIGZvciAnQ05UTC1CSVQzMSA9
IDAnIHdhaXQgZm9yIGh3IHRlYXJkb3duDQo+ID4gdG8gY29tcGxldGUgKi8NCj4gPiArwqDCoMKg
wqDCoMKgwqByZXQgPSBpbnRlbF93YWl0X2Zvcl9yZWdpc3Rlcl9mdyh1bmNvcmUsIEdVX0NOVEws
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUklWRVJGTFJfU1RBVFVTLCAwLA0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxyX3RpbWVvdXRfbXMpOw0KPiBXZSBuZWVkIGFuIGVycm9y
IGhlcmUgaWYgYWJvdmUgd2FpdCB0aW1lb3V0IHRoZW4gYmVsb3cgd2FpdCBpcyBlc3NlbnRpYWxs
eSBhIE5PUC4NCj4gQW5kIGRyaXZlciBtYXkgcmV0dXJuIGJlZm9yZSBjb21wbGV0aW9uIG9mIEZM
Ui4NCj4gVGhhbmtzLA0KPiBBbnNodW1hbiBHdXB0YS4NCg0KYWxhbjogbXkgYmFkIC0gZ29vZCBj
YXRjaCAtIHdpbGwgZml4Lg0KDQphbGFuOnNuaXAuLg0K
