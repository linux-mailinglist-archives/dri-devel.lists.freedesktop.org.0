Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49FA729C9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 06:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F6A10E851;
	Thu, 27 Mar 2025 05:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZKyZ9CD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A833610E850;
 Thu, 27 Mar 2025 05:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743052249; x=1774588249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nkd3zF/bDhLC+wDe8Dq8coStqeRyUisRZ9cFE3su81Q=;
 b=nZKyZ9CDBD37dBI44mX8EE2TWM/iG+jpxtfBJCfmU8Mogyj5zCXGZ70c
 3Vfu9v66h8cS+HXcso4+0rYI1vdmBmyw5E/JWR8ebYupH/Wdj6Ta2gJXX
 N/C5JwFhfAm9m2Kaen4Ghl/ian7U+cYuETyeSEVJLV5cDWAh5rDiQqQ3e
 taMYUrutDAtm6lS0oRKXHUsBkfTrtBGdlDIWRTRSTcRAaq+QlJO9fv9Hs
 xOs2R0cQFWWP991kuxwIn+xRLdcTdeYulBD/Pbi0fnMjTYT5G4ioAiYY+
 +6SjaxyWKG8YIAMlv00iPGuBHw6a/RS+yif9LrZu2Xh6V9XNsjBvVem3D Q==;
X-CSE-ConnectionGUID: b94rxWBBTHGYxdBVYR9Lmw==
X-CSE-MsgGUID: L/J46KxSSBWFLxH0tXmE6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44551760"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44551760"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:10:48 -0700
X-CSE-ConnectionGUID: mmxFz48QRu66w2GpR4FsMQ==
X-CSE-MsgGUID: zIFsD01TTBicKPcVlH5Tow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="124820643"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:10:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Mar 2025 22:10:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 22:10:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 22:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enRhy1AIvt7OeamonKIYyVXgBIV80GFNlIi4Ed2jruNa07CjyA4EdcdHmuk/L4xgw8K/IGT6xgQx+lQfXRIvUCFh5t9oQyIiGuXNfEod9WGKjtymss9ZNkIRlev0ioAJ70W+BUNTePvQK0HVezrNz68XNd9yt/p33zzczL6qJEyW+5Z+nv8xli4fjeSZExvbe3tKAUnlcaUvAWh8X/OCpd3upJIRFYXex5DC9Bvif0acFBHDiT0ajeHAeSoe8NR2Qf8XmC3WVAGtoXD8NzshEUnQ7LlRJfNYOn09dyykMgng2QNE0SQvUneDDHdI/xwr6ITJoqKzkVoeRPHMdas+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+BCSNgoGaix+JlkwI42jKaxIuFh+7xCxWGzDALf+L0=;
 b=B/TEcqY4NqyrQApEx9n8I17VCeQTqXzRMjHdLdD6DIbVSp8ZLYJg/GTxgyMETmkEK3vA62jB1qrq6r/FETKfREvoFLCKa0svqs5DWowPFaKlKgbQOGwEwDX3Pj1DVTA7uYAsrt9baQwTkrstO5h/9+VFrINt9Qypv7ApyEPmYpnF3gAEiAoGwhYHSokWks2x5ss3Q29IXYKVBA4uba7KBqNWb5dEzC5EenPbP8DSjny5vaz3sZJhY+Apl65F1E6p4SW7rFrzG8RhgkDktevag788aFK+aN27Rjdc/2Ra90WvVagMnMPdkk64/ZHRUB0rZCY2PPFBsbJ0qi6Kl1jddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM3PPF807974CA6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 05:10:26 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 05:10:26 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH v9 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
Thread-Topic: [PATCH v9 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
Thread-Index: AQHbmLxC6jZkQKzW1UqRVmMQUhCzErOFtU+AgADEpjA=
Date: Thu, 27 Mar 2025 05:10:26 +0000
Message-ID: <IA0PR11MB7307AA362ABA233DA3679F09BAA12@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250319-asyn-v9-0-629d1ece63e7@intel.com>
 <20250319-asyn-v9-3-629d1ece63e7@intel.com> <Z-Q3ZXym8Rxyl7r8@intel.com>
In-Reply-To: <Z-Q3ZXym8Rxyl7r8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM3PPF807974CA6:EE_
x-ms-office365-filtering-correlation-id: 891fe1f6-7685-4f2f-45aa-08dd6cedaf94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?0QCmVlTpZghug1D0TBgoS5uAUGwX1yrxyyCaOwaMSFHxJKF+Ben7VFfD+Z?=
 =?iso-8859-1?Q?d/3kJFFnsz7JxLnPBgVIyqIFNCEXVVqrNf16ivzyMqVKi86MoEfF334rTL?=
 =?iso-8859-1?Q?0rATIHKaSGswD3xXVsHN0p+VGwJ/bzwqDdC7mgFyPS2GdgcgVZCSejbuP1?=
 =?iso-8859-1?Q?DtMrZl/ydTPmt3OJ4GE7AH+5l0iZO+J1Hs4dzme2vyygD4X+07B7wQoN0r?=
 =?iso-8859-1?Q?hq5ORICiWHmS/Uyzi9N0PC5iyhu9DJLFMLwhX745SlOX64aH2di+79MqBb?=
 =?iso-8859-1?Q?+aDRfJckry4BTPMFIPDydXWFQ2THW1rXhMnDANrjxOBcu/TXDuRm5iJ6Q+?=
 =?iso-8859-1?Q?V5YgyR657SYFT7EpBrYRcnT9e4PZ/MP7GF9/m68yNk7e98L+q8h80m0rMR?=
 =?iso-8859-1?Q?SadzSNvj31gESlKdw71AhXfKAh1GhRFbyFkX8Aqc9mDYR2PB7XkOfLKZoW?=
 =?iso-8859-1?Q?1TuScAIhGa5F/1cT78XRia2mmhXWl93croa7xLWKCPI8XN3gatIgjb3cz1?=
 =?iso-8859-1?Q?Xawi3XI713s1ayyIsiSggziFYVWm+vV0OvK6VZhDZR8mAem25XkWPubLha?=
 =?iso-8859-1?Q?uW8FMfGj2Z9qnvo/TxVHZ/j43j9AL/3f0KE2pzGZjkYJNfae/sks7qD0yp?=
 =?iso-8859-1?Q?g1pLubBAyDbDjx+3LOwa9/U/A4Zae6yuvkQv2RR/F+t5TWxVfD+XwyY3L+?=
 =?iso-8859-1?Q?9iAfnoev/mSHnYPk+yWusjmkhqd/yEfizOAwqyhdGGHAttVohoPwn//O9s?=
 =?iso-8859-1?Q?TRYkPLLXBvULyy19rw35rH0iVtJW6SJMEfybkhC+DVSQPchfq2paGmJ0RE?=
 =?iso-8859-1?Q?lI3LIBmtJu3Rp6xzm1R2bUPStzn0jSVFSsBYaLec2AAFyTk6YFuyHKIknF?=
 =?iso-8859-1?Q?owQXSNm9VdEI94OYDx+d+sXjk663PrJu9TpWbkbsZbO3KjGhBNWktNCimx?=
 =?iso-8859-1?Q?FdyXCcFvuiRKE3BPDm1nRK3Vg2kaqggv4XvsiNlEa0I69tmqD/6O2ySKke?=
 =?iso-8859-1?Q?RFMldt3tGzuz0EF3nfCV5E0wHUPz+7CY/c0VA7Q/wAECbDUSYf+bjH0OvL?=
 =?iso-8859-1?Q?w3tWTFdjW6hLLrKUO81iyVjQDrlFbCSapZZ09QatrTEz6jca4qwzgLILgu?=
 =?iso-8859-1?Q?VZQ/P8rUZCn+yvQM1BxPWfYojpR6KSRZpxTHAbW527Lj0p8qL9KllCSoQf?=
 =?iso-8859-1?Q?RnQ2x3p+GQ55hR6J6HIY81zdUcok8IK+4oadtRf3YwYt7+h3yOe1LICuqx?=
 =?iso-8859-1?Q?/ytEEr6Q+CHspfmALRhJrsCWoNJXNvIAk0giOkW+o63gZyMB1B3KBBlSWQ?=
 =?iso-8859-1?Q?Ew+9v2DWT5M7CgPv7siaILbk5xxQTSwTAfhK8zUtqfeA5q+OTkk1iso+29?=
 =?iso-8859-1?Q?U6Z/C/1IMyDomPsbWcuZh3vQYn5lpSm5G3DIuxr71yovcbAqexMdbjACVn?=
 =?iso-8859-1?Q?xpHYSFmSd3Kd5vPVmZ6Bg+fEtsw0Xksd9EFlH7OLxvQL2ahsu21c8szSO6?=
 =?iso-8859-1?Q?6y71CgY7Hhcg3Nk1SmJ9CB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4+dYQ6wUzCEJ6phMM52JahinnRS0ZprysEnnxFa1Cijqftf2M1hNZdeTPE?=
 =?iso-8859-1?Q?jjx2WGpALcnIBddZIvvrzRvblGi8m0vjaN3pyPA+JAOoUVOej7XFweOldG?=
 =?iso-8859-1?Q?pUWYVHlaOqEwnuL+6N3POKqM0rdHzV3c2ok3eBcMf3WAynpaAZbsn+tRTu?=
 =?iso-8859-1?Q?oUq5Md2S7uiJHPxQskNERW9K+pr3j7VL/C6MeT27ar5zuGZQR+1JAOQdXL?=
 =?iso-8859-1?Q?1l28BB3W/5MTNswL/zSALRtMQaSFAs+Nj9dF/3LLZZQuqMxcKZnyy9K48l?=
 =?iso-8859-1?Q?CkAhZIvYSO0JiMZp7PmH0+4hTHbvwYWbFpKOFWAobHzGhX5/Lt504hyVW1?=
 =?iso-8859-1?Q?R3YxMv8YE3AgWtRLfOXKUz98BaROVgCR79mN14jZVYXCzz0g7aRijtr2YF?=
 =?iso-8859-1?Q?rieh3vzG1atGRN1/ktZ6PnVpyQAiL48VGAfUgPBw5vRprVE/piTRVjchg2?=
 =?iso-8859-1?Q?SCMszYUogLRzj523oKYLQqCJAeBgKkQrlyBXIQQzBQDD37ReawLDj1aC0M?=
 =?iso-8859-1?Q?K9olq4VdX+L+jMzli9f1gEJ9PaDNBl17qTQGtgCIfnI3YCD1yuwvxA7oqi?=
 =?iso-8859-1?Q?QofWkn1sMUYKUqAjLu3X0V+734hpre7FWWxJ1ukydcJ1mvSZVphj57lZDi?=
 =?iso-8859-1?Q?RES+MA8CZ1j4Dd4+RVchmg1F4sbR7yTg6nvwMHDcOTd9RDKiLxNybtp3Q/?=
 =?iso-8859-1?Q?Uz364orjJYThF93FOpPUUJkYPTjRSgzf9/dyXtFq8cWeZmyGk8gaYm4Anj?=
 =?iso-8859-1?Q?7Xb7lX/4MDhw9VZS+MajBerYjJHKHr7ByhxtRmd7/jsfHgpTMnAmo5bRN+?=
 =?iso-8859-1?Q?ZNxCN4pDGl16JrTir2lBab8fTtKowb47ijjjogTbyC1j0AVd/1M2j/w6pt?=
 =?iso-8859-1?Q?laeJusxd5DTeBiywLwX9LgQkzWp4RFbbfZZJoQYlGMrcKk8vpdotljMOFb?=
 =?iso-8859-1?Q?9w0SNofY16wwwV9JSXLxZ1zOYEgpXcPtLDx4HKV8XAyEhggt4LLyWXJI4P?=
 =?iso-8859-1?Q?T1E2gQ48TZ0f4AgweQrm4d3NYocbQ3Bzfu9I3CL1PEXYW4odiREjNfM55L?=
 =?iso-8859-1?Q?ehg00YTDBRRTEBSv254gAacSnx+Y3dPFnM4emk26qlWIlNZQw3n0okDrLi?=
 =?iso-8859-1?Q?8NTbEKJmFYFjj2rKb24YBaiwGPDNkjjfGHyzFNjqvmzFJiMC3cb+CNVeOo?=
 =?iso-8859-1?Q?kbwZtHtzggj5I/nGLN4QD+pglY/9DcoFqmxLeqYFUqEdHL6OeTB8HVQCl4?=
 =?iso-8859-1?Q?RfXtrcvGfcmKxkj7rW+H/SYd0JKdbptYzTk0i25lYaVGltPXUc+Zp+DutZ?=
 =?iso-8859-1?Q?F+N29DJMnhiyDB/VVEvrOtQGaKjsHsNnPwlerFhSiiAtA4djIPlhG+V77Y?=
 =?iso-8859-1?Q?ln7pKsWtTleGAGzB7yjwTfD5ZUvHkwLKNCBxc03ByJWsHnBPzAb/am2uS8?=
 =?iso-8859-1?Q?gFtL18zJgsmkC+a2cYycVOj7C9FGyGMXhE/eUqVuH7FDi1+05Vkhg6+9EN?=
 =?iso-8859-1?Q?XR+gcAjF8buStzBp8d4t/ChMoIIrtJWDfcTn0m6Nphe8HDnKPJ9DIQPi9P?=
 =?iso-8859-1?Q?5XFMSaccXYnfo/At4F58oGKRLlKGj1vrBAW0SOUBo7qYO1vGqEskOoSJ9o?=
 =?iso-8859-1?Q?4aNTOfUWspDkewQqESOT9JkK/C0Wr+SkO9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891fe1f6-7685-4f2f-45aa-08dd6cedaf94
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 05:10:26.4771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yq/nIxB2l+aKR6c92f9C7l+vxu9zaXQpKQdm4rCjNya6tHkuB9QjsL1Xys1OBQ6ACdKmdvq42H0HxjVLNQg9tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF807974CA6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Wed, Mar 19, 2025 at 04:02:17PM +0530, Arun R Murthy wrote:
> > Hook up the newly added plane function pointer
> > format_mod_supported_async to populate the modifiers/formats supported
> > by asynchronous flips.
> >
> > v5: Correct the if condition for modifier support check (Chaitanya)
> > v6: Replace uint32_t/uint64_t with u32/u64 (Jani)
> > v7: Move plannar check from intel_async_flip_check_hw() to
> > intel_plane_format_mod_supported_async() (Ville)
> > v8: In case of error print format/modifier (Chaitanya)
> > v9: Exclude C8 format as its not supported by hardware
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++--
> >  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 32
> > +++++++++++++++++++++-
> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 +++-
> >  drivers/gpu/drm/i915/display/intel_display.c       | 14 +++-------
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 +++-
> >  5 files changed, 48 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > index
> >
> 013295f66d56ec5e919b3a0c904034bf7985986a..6bd09adb8a30ba002ef3342
> 61d76
> > 38f398587a3e 100644
> > --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > @@ -820,7 +820,7 @@ unsigned int vlv_plane_min_alignment(struct
> > intel_plane *plane,  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >
> > -	if (intel_plane_can_async_flip(plane, fb->modifier))
> > +	if (intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return 256 * 1024;
> >
> >  	/* FIXME undocumented so not sure what's actually needed */ @@
> > -844,7 +844,7 @@ static unsigned int g4x_primary_min_alignment(struct
> > intel_plane *plane,  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >
> > -	if (intel_plane_can_async_flip(plane, fb->modifier))
> > +	if (intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return 256 * 1024;
> >
> >  	if (intel_scanout_needs_vtd_wa(display))
> > @@ -889,6 +889,7 @@ static const struct drm_plane_funcs
> i965_plane_funcs =3D {
> >  	.atomic_duplicate_state =3D intel_plane_duplicate_state,
> >  	.atomic_destroy_state =3D intel_plane_destroy_state,
> >  	.format_mod_supported =3D i965_plane_format_mod_supported,
> > +	.format_mod_supported_async =3D
> > +intel_plane_format_mod_supported_async,
> >  };
> >
> >  static const struct drm_plane_funcs i8xx_plane_funcs =3D { @@ -898,6
> > +899,7 @@ static const struct drm_plane_funcs i8xx_plane_funcs =3D {
> >  	.atomic_duplicate_state =3D intel_plane_duplicate_state,
> >  	.atomic_destroy_state =3D intel_plane_destroy_state,
> >  	.format_mod_supported =3D i8xx_plane_format_mod_supported,
> > +	.format_mod_supported_async =3D
> > +intel_plane_format_mod_supported_async,
> >  };
> >
> >  struct intel_plane *
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > index
> >
> 7276179df878658b7053fe6d8dc37b69f19625e3..ce6bf6fe8f241a9517e8f74fb
> 002
> > b835c3f0853a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > @@ -174,11 +174,41 @@ bool intel_plane_needs_physical(struct intel_plan=
e
> *plane)
> >  		DISPLAY_INFO(display)->cursor_needs_physical;
> >  }
> >
> > -bool intel_plane_can_async_flip(struct intel_plane *plane, u64
> > modifier)
> > +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> > +				u64 modifier)
> >  {
> > +	struct intel_display *display =3D to_intel_display(plane);
> > +
> > +	if ((DISPLAY_VER(display) <=3D 14 ?
> > +	    drm_format_info(format)->is_yuv :
> > +	    intel_format_info_is_yuv_semiplanar(drm_format_info(format),
> > +						modifier)) ||
> > +	    format =3D=3D DRM_FORMAT_C8) {
> > +		drm_dbg_kms(plane->base.dev,
> > +			    "[PLANE:%d:%s] Planar formats do not support
> async flips\n",
> > +			    plane->base.base.id, plane->base.name);
> > +		return false;
> > +	}
> > +
> >  	return plane->can_async_flip && plane->can_async_flip(modifier);  }
> >
> > +bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
> > +					    u32 format,
> > +					    u64 modifier)
> > +{
> > +	if (plane->funcs->format_mod_supported &&
>=20
> We always have that.
>=20
Ok will remove.

> > +	    !plane->funcs->format_mod_supported(plane, format, modifier)) {
> > +		drm_dbg_kms(plane->dev,
> > +			    "[PLANE:%d:%s](format %p4cc) modifier 0x%llx not
> in universal list\n",
> > +			    plane->base.id, plane->name, &format, modifier);
>=20
> This is going to create tons of unwanted spam.
Ok will remove this!

Thanks and Regards,
Arun R Murthy
--------------------
>=20
> > +		return false;
> > +	}
> > +
> > +	return intel_plane_can_async_flip(to_intel_plane(plane),
> > +					format, modifier);
> > +}
> > +
> >  unsigned int intel_adjusted_rate(const struct drm_rect *src,
> >  				 const struct drm_rect *dst,
> >  				 unsigned int rate)
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > index
> >
> 6efac923dcbc757e6f68564cbef2919c920f13cb..512c251cc153753a4808cf177c
> 8b
> > cce2178bb862 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > @@ -21,7 +21,8 @@ enum plane_id;
> >
> >  struct intel_plane *
> >  intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id
> > plane_id); -bool intel_plane_can_async_flip(struct intel_plane *plane,
> > u64 modifier);
> > +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> > +				u64 modifier);
> >  unsigned int intel_adjusted_rate(const struct drm_rect *src,
> >  				 const struct drm_rect *dst,
> >  				 unsigned int rate);
> > @@ -87,6 +88,9 @@ void intel_plane_init_cursor_vblank_work(struct
> > intel_plane_state *old_plane_sta  int intel_atomic_add_affected_planes(=
struct
> intel_atomic_state *state,
> >  				     struct intel_crtc *crtc);
> >  int intel_atomic_check_planes(struct intel_atomic_state *state);
> > +bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
> > +					    u32 format,
> > +					    u64 modifier);
> >
> >  u32 intel_plane_ggtt_offset(const struct intel_plane_state
> > *plane_state);
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index
> >
> 3afb85fe8536dfffd55dbaa07f6727112cc876b7..5d0bab1f8ff8294716ca5843c8
> 56
> > 032d2b9ccd5b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -6005,22 +6005,16 @@ static int intel_async_flip_check_hw(struct
> intel_atomic_state *state, struct in
> >  		if (!plane->async_flip)
> >  			continue;
> >
> > -		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb-
> >modifier)) {
> > +		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb-
> >format->format,
> > +						new_plane_state->hw.fb-
> >modifier)) {
> >  			drm_dbg_kms(display->drm,
> > -				    "[PLANE:%d:%s] Modifier 0x%llx does not
> support async flip\n",
> > +				    "[PLANE:%d:%s] Format %p4cc Modifier
> 0x%llx does not support
> > +async flip\n",
> >  				    plane->base.base.id, plane->base.name,
> > +				    &new_plane_state->hw.fb->format->format,
> >  				    new_plane_state->hw.fb->modifier);
> >  			return -EINVAL;
> >  		}
> >
> > -		if (intel_format_info_is_yuv_semiplanar(new_plane_state-
> >hw.fb->format,
> > -							new_plane_state-
> >hw.fb->modifier)) {
> > -			drm_dbg_kms(display->drm,
> > -				    "[PLANE:%d:%s] Planar formats do not
> support async flips\n",
> > -				    plane->base.base.id, plane->base.name);
> > -			return -EINVAL;
> > -		}
> > -
> >  		/*
> >  		 * We turn the first async flip request into a sync flip
> >  		 * so that we can reconfigure the plane (eg. change modifier).
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index
> >
> 70e550539bb21393c7173c7b3904e7790eab25f4..f61e1eff30bb4820ccb17daa
> 5d4b
> > 2b073a5d4078 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -601,7 +601,7 @@ static u32 tgl_plane_min_alignment(struct
> intel_plane *plane,
> >  	 * Figure out what's going on here...
> >  	 */
> >  	if (display->platform.alderlake_p &&
> > -	    intel_plane_can_async_flip(plane, fb->modifier))
> > +	    intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return mult * 16 * 1024;
> >
> >  	switch (fb->modifier) {
> > @@ -2666,6 +2666,7 @@ static const struct drm_plane_funcs
> skl_plane_funcs =3D {
> >  	.atomic_duplicate_state =3D intel_plane_duplicate_state,
> >  	.atomic_destroy_state =3D intel_plane_destroy_state,
> >  	.format_mod_supported =3D skl_plane_format_mod_supported,
> > +	.format_mod_supported_async =3D
> > +intel_plane_format_mod_supported_async,
> >  };
> >
> >  static const struct drm_plane_funcs icl_plane_funcs =3D { @@ -2675,6
> > +2676,7 @@ static const struct drm_plane_funcs icl_plane_funcs =3D {
> >  	.atomic_duplicate_state =3D intel_plane_duplicate_state,
> >  	.atomic_destroy_state =3D intel_plane_destroy_state,
> >  	.format_mod_supported =3D icl_plane_format_mod_supported,
> > +	.format_mod_supported_async =3D
> > +intel_plane_format_mod_supported_async,
> >  };
> >
> >  static const struct drm_plane_funcs tgl_plane_funcs =3D { @@ -2684,6
> > +2686,7 @@ static const struct drm_plane_funcs tgl_plane_funcs =3D {
> >  	.atomic_duplicate_state =3D intel_plane_duplicate_state,
> >  	.atomic_destroy_state =3D intel_plane_destroy_state,
> >  	.format_mod_supported =3D tgl_plane_format_mod_supported,
> > +	.format_mod_supported_async =3D
> > +intel_plane_format_mod_supported_async,
> >  };
> >
> >  static void
> >
> > --
> > 2.25.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
