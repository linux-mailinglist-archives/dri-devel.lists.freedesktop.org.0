Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8EAC46BD
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 05:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001FC10E156;
	Tue, 27 May 2025 03:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEU6VIB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB4810E031;
 Tue, 27 May 2025 03:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748316415; x=1779852415;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gLcIp+i9g4fBelbZdcfMHODoLi3vFL5f9LzBNC6HIs0=;
 b=DEU6VIB6Al7Xg8Lwcg9ueimWY65U8DCjjsfD4U9apmYFJzzbdOOZKAAb
 PiQ+82P7JlyaZByKKNBuuxpPjYTsXe1jnW7s5VrWWwz27OFz7c522rJmd
 TtWE1MX/ZIxu4f6x+98ZPMP04wSh2xDs3u1H5WkdQxY7b44EdlnK6akOa
 22zAiHuaRiADvVIiG3A48AM8PWEf0WD71Cd6+Ee3mLK41Q5d0cZCZ4IcS
 GOIkH8icqvg34vhhmtOoBtzwe2J2mu0F6UZ0lGayKaqugR2oCZmr+AImB
 voX7AYoGxVLt1ZPuxsQoI17eNdw6uZ6uVHjNV5uUqdoOSn6WkA/4Ua55Y g==;
X-CSE-ConnectionGUID: 6JHiEvh+T72q8v2Er+uzuw==
X-CSE-MsgGUID: fSylpdabQF+KhYfaYvHB7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49540409"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="49540409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 20:26:49 -0700
X-CSE-ConnectionGUID: kN2/96xlRheonAnzVELjkw==
X-CSE-MsgGUID: is17agOBS4ukhKi44hRpiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="147770982"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 20:26:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 20:26:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 20:26:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.58)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 20:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njfsNorRO8KeSm/qWjFYC49h3nhIpFcTYyGzKo0apTbEJcyYZH3CB6sNaVcE9yPH205Uq9Y/19pSLa3beIi6bGOuTbMzhH8TfG5qrSOKL/bUIGG+U7j943dF3DaP0HfM4Ang2w1AUhrC5Nistkq7ZujTZu2JMBsfoy+KbbXOZHK+y2TyQnx6DEhzwfmAAqxjigvPLqzoDq/+frP+iHb1mBMKHjoG7Z///+Zrp4jqkRbfnmfO4K/SgvXnU7q3SQIfzi+siGDcjeODSrYMUq0fplVYnJG8QCtU0XBvmY5mv4FZU+tn6Fbb7hxsVMtYMaVSMNktc1fkGFpylM9fy0U30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/T/gMKI659CN6JUsiUcZsXCaNUDgoistfad7Go90tA=;
 b=w+5Vq4j6cK+6VDm4mJR4RQhOehVDptE0C90EynPE45ePX2w+XGPoC/NfnNVd9UnsqmexewE42HG6VkDn2S8TOmY+WfvTTJX6lfseNIOPUuW3aO/vcLHW25bfahEZMMBMxSZVIKSrg17u01uXE2OW4CXiMmf7UhslBYg/ovifvgsQwZN8RYuF/ymv2N2mKqUJ4cqZ/y38lVilw2zNPryZ1fmyjYemfc6KKuec5hOftzL0Yt1teeup1qAidOT3CyMDVv9HnJEcNTifaFlTDjDz4YG5gsOhqskzfuNCuQm0Arubg8d1I9U/joMhjOMJdJbWtcB6ZJ3ZKamcl9wjpvgqUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.22; Tue, 27 May 2025 03:26:37 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 03:26:37 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 04/10] drm/i915/display: Add filter lut values
Thread-Topic: [PATCH 04/10] drm/i915/display: Add filter lut values
Thread-Index: AQHbyLoKAQJ2KBZU+kKowCHRaxNrRbPZ5kOAgAv2WAA=
Date: Tue, 27 May 2025 03:26:37 +0000
Message-ID: <IA1PR11MB646733E7EDFCABD190BB9D46E364A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
 <20250519122644.3685679-5-nemesa.garg@intel.com> <87ecwkvkfc.fsf@intel.com>
In-Reply-To: <87ecwkvkfc.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|DS0PR11MB6350:EE_
x-ms-office365-filtering-correlation-id: 3d362509-c893-4c08-cd49-08dd9cce4a0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gXqWIErfla597OAixuoLzlecPkZXnQgasHvS/H3CfFF7m55FzD8mLNj6qN3O?=
 =?us-ascii?Q?UBAjqmwv8PsS472mLGOxCV/C5w9kb4Sykp0dQSe7upoUalkafKW7WOr0t4wC?=
 =?us-ascii?Q?NLswak1SHrjh8ztIeB09iPEgvRaCnnonc51zkcwBdQjyH+YxQfWxJFTli/Iw?=
 =?us-ascii?Q?ge2VWQLkrMDhFK4kLauThmwELgq7hHGA0cvW1vDkQzE/1ijivEzASlTEajcl?=
 =?us-ascii?Q?zU2cRK6IF7+EaCe1JALHceJ3S2x6C1J23aM1LQCvSOzAmNk4VMTVjA+K4MSR?=
 =?us-ascii?Q?dNIJmyilXmzRqyiFN8v9N3tMdnqtX/klTCN8gpi3upwOPeCfUsNOKvJqG8Jy?=
 =?us-ascii?Q?X0yo45rMHTjn/wHQI4jMphRxVAa6djMKfL1yw062GS1m8AHU8krwJiarPVJP?=
 =?us-ascii?Q?ufxQ4goZYAIQ/EXlgnpL+/7Hodp4MUvxVSnANr5L+7mWoJUeSu231dgmR0v7?=
 =?us-ascii?Q?+fxW0BvKidsWdEN+Cwf8bEneyAkj3r0V5m7KGk0jm36yH6P1LwskP2SMBzd1?=
 =?us-ascii?Q?vYkPvNAqKs40cG9+v2qpMWMNL52vjgHD5I7R2JB53VOXRBJJg1Vq1K2e8ckr?=
 =?us-ascii?Q?wGcMpW+X+MDoZDQGZM0F8GbwR5wjlLPqSe9YmDpnaIOOf2AiyJcO3t8dk6fR?=
 =?us-ascii?Q?L4YMCRVOqkV3hwldb2GbGoWtmt/KC9PoJK5xbBxn2wIa0TV9c2b2UbpP1jNV?=
 =?us-ascii?Q?pXp9v4yjUPIcXBXTmsvZ/s1elstZDzXilDlnM3DAac5YBMBGzRLqyc6vk0F3?=
 =?us-ascii?Q?P/qPBRQtVkpPZAchBjgWTbAQdGSXFJj0jdvCESeVk1pehyVwQklQBoBjUj/k?=
 =?us-ascii?Q?/1wz4DJfSeY4Q5iBPJohf9hmGY52DCecUgnM5tFc+G4v11zOLoVgtUh8UkqU?=
 =?us-ascii?Q?HPGqOEhT73IwaSN7aQGIBbN8iNOWKcqvpvZo4oPMdXXb4roPEZ5aZaC6o0Wb?=
 =?us-ascii?Q?LmydhfLNt/kZEEm8jo+8cAGqJEtF8HI62lXiZfJ9ktI4x+kX6lNK98Sxy7qk?=
 =?us-ascii?Q?rCTQjT0KFey+e9Am+pGD7QGaj2GV1b1SCH5zfGAxp5t67ALYDUTjNcYzyGS/?=
 =?us-ascii?Q?B+Iri2XNIJaECqwjmNC+3z3/Ko9to9KdlmV7CutmwXq2lWbnu2dzwqNFY3CH?=
 =?us-ascii?Q?IniRt01TmhkiuIneHlsoDsd/NJFMGpMUGlwzhCOSXtZn/Z94ImSv6RB20gvu?=
 =?us-ascii?Q?i0esveSYuQSY+maXv9RMMxHlPS/LLNyF52C3UCuuGa12ujcaAi4l16iP1Yl0?=
 =?us-ascii?Q?7Tq8wSnols2oIAPHPpJUEQKA5SKUpG3Vo+nPe4BF4kT8MLaS93+GHQNfCkai?=
 =?us-ascii?Q?RfAe3c5bDWDIHf30qJnLL/1RJaXWnbwzQljcOfspcxW23/0pHIUlMlw6sQZK?=
 =?us-ascii?Q?DTwEZPB6LVL/Kzf+f8VwaYR7SlgCQU0xj3OwiG2lFxmrjo6y4JfJXxdB+SZH?=
 =?us-ascii?Q?cXu4LMnIyd1QhgSsijo5BR3yt6ZekDy15xnPb9MZF9FLh75r4jmk3Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WqmiKZLOudZlrg7mJWT3ZovKIXGNMXE7klyqcqmfkjcY1FFJLNx/LRnduR6y?=
 =?us-ascii?Q?BbkHkVIcrSeHgXXODc50kx2wgreYcer3CkhZZUP6Vxh0Ub7u/PMvLg/1D53j?=
 =?us-ascii?Q?TpL8Jj6vJlfdRt/sVRimMM84Z0qmmd5VUIvj6n1nxGwqMuJoM4PxL06bgpx5?=
 =?us-ascii?Q?KZHpkOR5W53XYO1MT4NUBUOuHh0lfnPOWDR4PAPnoP3IO2d107/oXIiSnrot?=
 =?us-ascii?Q?+LUBDuc/XHODT5wUCBnBVHD+hv93LNEV1r9pPKIoKxnnw413pQH0wj/3thCJ?=
 =?us-ascii?Q?e3uDxAVzRp5ud5VXljywIUYmvCaO5BiSjNMqotmMNR5LhwuparyXgStd9i7A?=
 =?us-ascii?Q?bRs4nB7rYJmbxzFm+HPIXYDfpDCQJSwifAifyNlRDzETg4Roatwv2BQvBDxq?=
 =?us-ascii?Q?vxQF1/V/3y1uER+ZWJF1a+ZTntmSPRDBfyBuz8wT2x8PR0Ar92+qMqlKht11?=
 =?us-ascii?Q?rgwt6ORTydv5drEw/6wvQ43remsgsig/mwj5s2Ms8jofcaWXFfwelDGhyu7Y?=
 =?us-ascii?Q?9XNDvV7pqgjYcwyIXeOoog+yM/GSdD9aYTgesJFj6Oma9Qkun+z90A+t8KAS?=
 =?us-ascii?Q?VL2jhSc0kVXMWJYkd/nI+rEsP1qMkS4CK6sIvhrZLj57tomgKgiJMppN5w69?=
 =?us-ascii?Q?KGSIFPPNCpIaPqrCIQSJx+hNgdhDmL30T4Bsmd7ynew4Z/LDm5/EILKlycGy?=
 =?us-ascii?Q?jGMM3YWML7kT8SfqTRhxunRh/THqdyv0nnNcurrJ4rrni42zb8bNa7Bey/UE?=
 =?us-ascii?Q?w5ITY4zOr/IjF5SdvLEY455GjcJ0RCIPirqnwYf+MeZLt0vY2ER7PZ1OQPJW?=
 =?us-ascii?Q?ZV7Aw5+xSxxITryr6+ECW3qxG8LAMAn50qIfWRuk3XFeRXZ/fARF20rQf6Fe?=
 =?us-ascii?Q?YnOQz/dnRccaPD87pjA5VLohRJcVMmAmSVkb9xIpvmggR4L3QsRscFMQsWbt?=
 =?us-ascii?Q?diJWPeTqHkNNmCv6dctY2hGCb4ukwf7eX4V8wcfxHEHXkmSntUI3H7xPTmuA?=
 =?us-ascii?Q?BQVYUu1t3oAeWEUSYvO+4PsJwccOPch01YCgBUt5sG6w0ceYQG/3HRX91GX2?=
 =?us-ascii?Q?n9ZuBleRcdYRcmy9SH6B7VXDHFFtoruAAHnLk4X//LfsTPahCA0kU7kgzRxV?=
 =?us-ascii?Q?vP+TQ+vkZ3WzAu7hbY1yklqUDOw6q3s/2n8dLe5dm4h7pPKOWOCX9PJE5Q21?=
 =?us-ascii?Q?zXCVV+YurpnUIn1txX+v0fsN5h5R1ltzlR8t73zepRQbOfwvi4uS2bIGZOA+?=
 =?us-ascii?Q?CGYHraeoeCuDZTQblgbsNmJhWKJXco37lhEPS3JTGwam38Ec15T7hJycEy0w?=
 =?us-ascii?Q?8iPNRK9fFYudzWOP78vUxspVunKebCcOWK8/5HfZzHmuWe2ZQodhThG7IpqT?=
 =?us-ascii?Q?2sYDa2kuhs1cr7ifAU2ZhuC0BD1sInB2hxLtu3JYG7VLTdEG6tBSSnJgDuVL?=
 =?us-ascii?Q?Z1Swi5InlWEZ6m0J3aEdT/tom8TCodkqWC2fTU4RsVsW2bAz6V4jEAuL0JgQ?=
 =?us-ascii?Q?Fbs/tVVjN5gt3LWucgg78JtMrKxIVHvMQoFt4W8bhGqzBNVqS7K+Ip3BgJ1q?=
 =?us-ascii?Q?k12gxV9FNfvzHd3Kap7/n74z9Z/z4CtjleKjGwtq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d362509-c893-4c08-cd49-08dd9cce4a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 03:26:37.5570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2e11mg3l4sxNXL9N/N0L+ScJR+mKeHFPZ4ogPTDH5Wnc3PvwL7rdCbdhnSdyMhWcotxhKWG1ksDP78fk9H6WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, May 19, 2025 6:15 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: Re: [PATCH 04/10] drm/i915/display: Add filter lut values
>=20
> On Mon, 19 May 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> > Add the register bits related to filter lut values.
> > These values are golden values and these value has to be loaded one
> > time while enabling the casf.
> >
> > v2: update commit message[Ankit]
> >
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_casf.c     | 22 +++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_casf.h     |  3 +++
> >  .../gpu/drm/i915/display/intel_casf_regs.h    | 11 ++++++++++
> >  3 files changed, 36 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_casf.c
> > b/drivers/gpu/drm/i915/display/intel_casf.c
> > index 314d3fe19884..6dab67eb77ab 100644
> > --- a/drivers/gpu/drm/i915/display/intel_casf.c
> > +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> > @@ -30,6 +30,28 @@
> >   * original image.
> >   */
> >
> > +/* Default LUT values to be loaded one time. */ static const u16
> > +sharpness_lut[] =3D {
> > +	4095, 2047, 1364, 1022, 816, 678, 579,
> > +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> > +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> > +	73, 60, 48, 36, 24, 12, 0
> > +};
> > +
> > +void intel_filter_lut_load(struct intel_crtc *crtc,
> > +			   const struct intel_crtc_state *crtc_state)
>=20
> Everything else in the file is prefixed intel_casf_, why is this called
> intel_filter_lut_load()?
> Will change to intel_casf_lut_load().
> > +{
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> > +	int i;
> > +
> > +	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
> > +		       INDEX_AUTO_INCR | INDEX_VALUE(0));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(sharpness_lut); i++)
> > +		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
> > +			       sharpness_lut[i]);
> > +}
> > +
> >  void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
> > {
> >  	struct intel_display *display =3D to_intel_display(crtc_state); diff
> > --git a/drivers/gpu/drm/i915/display/intel_casf.h
> > b/drivers/gpu/drm/i915/display/intel_casf.h
> > index 83523fe66c48..80642809c08b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_casf.h
> > +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> > @@ -9,9 +9,12 @@
> >  #include <linux/types.h>
> >
> >  struct intel_crtc_state;
> > +struct intel_crtc;
> >
> >  int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
> > void intel_casf_update_strength(struct intel_crtc_state
> > *new_crtc_state);  void intel_casf_sharpness_get_config(struct
> > intel_crtc_state *crtc_state);
> > +void intel_filter_lut_load(struct intel_crtc *crtc,
> > +			   const struct intel_crtc_state *crtc_state);
> >
> >  #endif /* __INTEL_CASF_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > index c24ba281ae37..b96950a48335 100644
> > --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> > @@ -19,4 +19,15 @@
> >  #define   SHARPNESS_FILTER_SIZE_5X5
> REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
> >  #define   SHARPNESS_FILTER_SIZE_7X7
> REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
> >
> > +#define _SHRPLUT_DATA_A                        0x682B8
> > +#define _SHRPLUT_DATA_B                        0x68AB8
> > +#define SHRPLUT_DATA(pipe)             _MMIO_PIPE(pipe,
> _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
> > +
> > +#define _SHRPLUT_INDEX_A               0x682B4
> > +#define _SHRPLUT_INDEX_B               0x68AB4
> > +#define SHRPLUT_INDEX(pipe)            _MMIO_PIPE(pipe,
> _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
> > +#define   INDEX_AUTO_INCR              REG_BIT(10)
> > +#define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
> > +#define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK=
,
> (x))
> > +
> >  #endif /* __INTEL_CASF_REGS__ */
>=20
> --
> Jani Nikula, Intel
