Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8639E331A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 06:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A4A10EBE6;
	Wed,  4 Dec 2024 05:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGXMX9Fu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E6710EBE3;
 Wed,  4 Dec 2024 05:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733290411; x=1764826411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FJIFc5sa7qplhP1ZsCGWeFdKdaOozIcejaxDxTr3r8M=;
 b=PGXMX9Fux7A+GkIM2SsG8BNWxRzZ6i7iRrGh1ir9LvXLdY3iP4rcVu12
 egF6b7qJUO0XRht9GycJ0AVa6tc9zj9WTQlPyhAyKyQ7iUelzqu11C+Y+
 ImH3qsYxeCCiBbIi+ZeqH2sImffKi7e0gCqCXG9u6HlHPxha9jzPImLlu
 u+hh23D5cUUiY6fTMbEglfhtkjrkYT/PQ6AJEY2BXP89yxLKkADNV1fI1
 axfoYfeG1uENKFG1OnJaEIgTx5NCx5s3C557iFMR8NIKharh4z5P6RBjT
 NDUOI6Z+SR629bRDPWmpnyXYDX74iLJyb2oCEteMdt3ThPbXnCY4/CdTA A==;
X-CSE-ConnectionGUID: WIw1ObFdSyG9Zb5LWe9SLA==
X-CSE-MsgGUID: URSLl+IkSpeAbuvJO+4X2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33670537"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33670537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 21:33:30 -0800
X-CSE-ConnectionGUID: 9MJ5g2r5QROjjaGCIlU03g==
X-CSE-MsgGUID: zL0h8yp4RmKgPHCPyvrC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98646171"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 21:33:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 21:33:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 21:33:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 21:33:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnpyx6itPGvQ72ObRqiVi9a3IWgfb3LGkKwB7NElyF9fD3oHOAqF5aIBDGc1wxKLs1aL5/oLqRqfRRUpB3gjPr+ZKRKPsOgm/xqZbomo+IuS75egboGFeUmlMMfx4+AezJVOuEumdiFqSHFHTByVg/Qmq6bDPXhGeuzaxPk8AgeWAcaYp17R++0osJeiBapP3MBU6VxaKbwIJUVUo6t+xJE2yD4FKcUheJg93gYPx9pXW/qZqq7gQJASbd1EOYEhdQ5GrnX6ME6yCS0CKEbpIWUFzoRDdBWQTtIb+EEzVAgRVegOrdMavkfbbYYGPK5P4S4nDm6J3/1T1V+VMjZKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t07ydkATrnH395F5r3WXPQKSDwp0YEKWEemDF0BV2Nk=;
 b=TWtGvJsLGsKQiUpWPG/fwXe0VIbqDsdl9Ta/qBjNX6JEXt8uIdzcNfWxoSdcxF5DGWw3b5HQrAhj0MAssm8CXDcepXnjtGXmz+j8pVELBv5BeEIzpg2eB3LOPSIpU82uYrRMY2h3dG8GZ5oiNzCRv+3HaTNBffGKWiVQzQOK82v1y7l0cLXcSJjVQy+zS4GURC7ytZQ04bFIgd+xK/rFcnsd4trDM868XuMWEzPKJkAax3kD+Y24BFyhZE87CAEWyA+NafZnkRF8pxLB9XsSc4B1tOVWcnSQcz+36163v5P955at2Z9YyPtgucOr8kqQT+LDLkepasRsIQ1YNWdnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 05:33:26 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:33:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 07/10] drm/i915/display: handle drm-crtc histogram
 property updates
Thread-Topic: [PATCH 07/10] drm/i915/display: handle drm-crtc histogram
 property updates
Thread-Index: AQHbRUlgIv7cd6Cxo0mv+s/NQbcYZrLVkLbA
Date: Wed, 4 Dec 2024 05:33:26 +0000
Message-ID: <SN7PR11MB6750409CF7DCF37F07F2513BE3372@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
 <20241203055520.1704661-8-arun.r.murthy@intel.com>
In-Reply-To: <20241203055520.1704661-8-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB7442:EE_
x-ms-office365-filtering-correlation-id: 74679930-9ffb-4490-6570-08dd14252d7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xETkaJ6RB0DBbivnlKHbt8Zl9UPn+54NnPGJXqjH1QPTmxLhw5l/27U+93TE?=
 =?us-ascii?Q?w1rHOUhoYnQu+4A/zgMv2pfe7ZfGFfZ752vdDUBpq2EhiF0Yyun6CYpZiONk?=
 =?us-ascii?Q?oTM2X+Hg6sHdG3l6/bpLAemlDt8EcDFp57PyKrxxTLxcZ4bYVuWmCgEwWtH6?=
 =?us-ascii?Q?aj2xISngerD2mxsKGlkN52YqjQ6qOtu93hOvlvx53DMFIV2EtV36tH20inMH?=
 =?us-ascii?Q?B2rFkKes+pNcsLe3QDcjVu0wvvvS36Mq3qofqTfHHz0WbPBEhYb7R7dV4P/v?=
 =?us-ascii?Q?JjvAfi9qrErHiU7NqeWDkBRj6KViASix2DMQ7AE/Y+i46AKhhWqgae3HVlgJ?=
 =?us-ascii?Q?iCAgKWpgAoOChKlBaYnnzlz2JlDtNDuKw/c7lLFnzpUe6n5w4ecCbhtk1B+Z?=
 =?us-ascii?Q?axRUnwunmI+YrpP2m/lZczBP6HoQtDDxIUGBXM0QE5BD/B0gj96hmr2YWZor?=
 =?us-ascii?Q?I6pWv9lFrn1gNl161ja/1hDDijzuYVG9EsEi7CgBZVzes6n9r/ugrwdBT+qE?=
 =?us-ascii?Q?ZosNHKPHpLDPGYbAfaQ0dm3bOKyuUeWV1iasSIuQ3Z+ba7wtU2EsGHPNiUVD?=
 =?us-ascii?Q?m7OTuA78GsDTnKzWJgND3mlFZAEwrWFKMs4+Nsb9M5S5LMnCM47zvtbnqhVd?=
 =?us-ascii?Q?knrANAZVzXj6JIxnFuWh+p45Iw/cyY8OCqFRNyFtHuq9vfceHNa+9qZpQh0P?=
 =?us-ascii?Q?B8jnxWuzjUq9V1BUqILzuSHkc2J93MZQxp9kmXHFFe3Y485ZZ1I8xgVXvObS?=
 =?us-ascii?Q?NMIenkKkREb/+1lpCO6lNfBczIb9/O8YLEdUFGAF5xm1PVGdhnzNUEx7A8aw?=
 =?us-ascii?Q?abDyMBIumAx2mvY4N0B8ggDmr5Ul+/QtEeq/HJ8eG+w1kO2ZuUxxbCy4E+2V?=
 =?us-ascii?Q?/CMbnw66jWOl/bPAgHvbPx3nPF9sHr5s+zarF1BtmO3MtyNkJeRGTgIx3V7m?=
 =?us-ascii?Q?/70DMxEX/jsAsSBekghk8uADDuhdj8L2LRFMdRShvhT5566y4eEz3y330qtf?=
 =?us-ascii?Q?X5skPSGCqXuuBjsTG/2RhE3geDn61mqkVxUjO2a7TXd72rBpI0oKrg3SnAbE?=
 =?us-ascii?Q?hFYI8z2krzmIFPcshZFZMEkv2PA0RZ4CZMe19qTmwb0bnPjykCRo8yX/v+w0?=
 =?us-ascii?Q?NOGfoOfAdnkU30pFSJedF1DlvDYUOrYdhxAqY9XV3KWV26vxmmz6Inj23d5u?=
 =?us-ascii?Q?in/5soaQzRrbCodMY3flwyJp3mOhIe9waLHJXJDFKv+cEIZzdGty+N+g5pf5?=
 =?us-ascii?Q?nMiG1vMAo3PmzFpoAxyI69js4zcXK7l6mCp01n0uhs2fJXfkhs5AA9KEqqZg?=
 =?us-ascii?Q?o1PsDadvWJ3J95+HAIg0mVArXkPopEHAzPR4KGmG5aLslwiqEQSyDI9n6hIB?=
 =?us-ascii?Q?E27rrAf/nsfkRI6SgcMH8BWZ4T1RokQrbAHPjkX4dQw4lh5g6A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NElDCU10cAbIeJkRZzcrI5sjYUXDPIC4QRCYUTGn+HpYhIQxfxQTNCylLJXb?=
 =?us-ascii?Q?swDsPkZ/LpthunpIjieJxEjHPAiUGR0BL+WkCd9N6SC+y/NB1oMcDMRgAOT6?=
 =?us-ascii?Q?0P1h+h44/yqRxXOgQBxFiunrwLJCGp0VmY4KtamnoM7dTHTnrc9ufGAlg6vj?=
 =?us-ascii?Q?p9V9cqV2oU4bMiV6FPWapsiC3FYCAWu7RSguwI0E510IiCCrDko+zppY3CKD?=
 =?us-ascii?Q?JkoR6Q5mMcffU5E61AiCB7mljYWT+CZ4WScZ6HRDI27GEApdwQApQVMPi9rg?=
 =?us-ascii?Q?5NbOffVombqvFYTvO8jrRW+8LAynJgoOLkdiRkh0n4JSrm5eo8hzdihaVi2t?=
 =?us-ascii?Q?VN+OPyyHwOdM3Twp+lc1rQYUcGR7tyvNpC98BtBU+BQ+YieV4cYKA53dDrtQ?=
 =?us-ascii?Q?71eQik/uCR6O9fRffpZOCbvNM5LHQwfl0wSifhm4ckXJdcKefFYx4/i6ThlY?=
 =?us-ascii?Q?5DUTM2edOyaIX5qBtzNnWjF0t5Hq72eg35JldKoBUTpJW7iOuKi57ZqIPjQA?=
 =?us-ascii?Q?fxP/ZHzHR/62RYqSf9I3N0KmcI+cIAHxG+suhFyBro70r+OaEsUKimlfJzxK?=
 =?us-ascii?Q?nP34J2bTLTT6P64hMZkG38Vid3iaSbKjgRN5O6gC89kRwLfC8PxSMayOhY4E?=
 =?us-ascii?Q?VkprVxu5FQf9rZWlzjrKByi5Er9xJPhjuwBgiwlShrq+WaW5Zv3kxmfGEIzn?=
 =?us-ascii?Q?O4eLfyNBskuDpEDae2zcBwg4LYpaA76x2CxjtmBfyqthGCWI0qa1uX7wpmIJ?=
 =?us-ascii?Q?uYwZWDF/iELb6xfSM444prBDWs8ViebDqjfQEOX4mG499diva8unUTSSo37Q?=
 =?us-ascii?Q?o9GNgBBj+48ocdjhLkDB7SCvipsla1TYRelnThwtwvJdl+E8dMIvGIH8tYi9?=
 =?us-ascii?Q?WVjTZRRKnH7RmAmR5LpONuxD6vbwsmnQC7opUEIscGI4i5OOeLRdLXlK30xp?=
 =?us-ascii?Q?3xygT1PXO94uANUmrXFGBJ1n+aUhCv/b5p5nd2df3CxtpvdjL7RsY+ntuP7b?=
 =?us-ascii?Q?EzIKPx2k0zC1v4JlcYmBK/n3E7wN7qqryQgsK5LS4s7I5mHoAzs6R/KluaIY?=
 =?us-ascii?Q?lOyhPATNRq255/bH4ra7ChUsbHSuOe+CjtHBmwfu7l4Y3XxR59L2eooHn3NI?=
 =?us-ascii?Q?/svoeUr6TfOB+k8O8LPxjA8ALJzcQ1YKrBnegYYM3r+MFoO40lZNqlL3vMBA?=
 =?us-ascii?Q?aPLUNpflUJ+VPq/drLkT8TFE2CY9T+Xzj+3IVBv9aFvq4wH0dSquU/toOQda?=
 =?us-ascii?Q?HtoMcIqamS/Q/iIYI/WG7qxBS987AgwPgEStZopckB7Gkzu2WjX99EDysOaC?=
 =?us-ascii?Q?78r0Y7ynLK/QMvJTsY7N6n+EJmZ9K8eN7KfTH9my73yrncHKgRoww+FMT1mE?=
 =?us-ascii?Q?JXgM3L5hAvDcRHVuCcMTovN+EWMkPMwGTre5+zjKzpPrqjEnYMJCITvaI709?=
 =?us-ascii?Q?8lpVw2Thun4vu+bWm21T8dO/T7NOGcbTgNDJnF3h5rt37a53PHM3P5sYtuPK?=
 =?us-ascii?Q?E9F2UXK+fwoiBMjuaLvsAtzsGQbe1PohziyF5osMRQlsq8VNZXG0tCgmqOmI?=
 =?us-ascii?Q?KaPu3q4BgYBkrTsMIops0PxN8tPfZzCJtok8YOtp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74679930-9ffb-4490-6570-08dd14252d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 05:33:26.5586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tH9hYeoD8zwwEetY5v2ze7287BKgb5FmOQn5sEHB98VNx56OghR51kC6t4c51stVDPD1DN219ZPZ4hdW5nc82Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Arun R Murthy
> Sent: Tuesday, December 3, 2024 11:25 AM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH 07/10] drm/i915/display: handle drm-crtc histogram proper=
ty
> updates
>=20
> Check for any updates on drm_crtc property histogram_enable and
> histogram_iet_updated and call/act accordingly to update histogram or
> update the image enhancement LUT data API defined in i915 histogram.


Mostly looks good to me a little Nits here and there
First would prefer to have the subject as "*Handle drm-crtc ...."

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c   |  1 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     |  7 +++++++
>  drivers/gpu/drm/i915/display/intel_display.c  | 17 ++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |  2 ++
>  .../gpu/drm/i915/display/intel_histogram.c    | 20 +++++++++++++++++++
>  5 files changed, 47 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 03dc54c802d3..dff130b3565a 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -278,6 +278,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->dsb_color_vblank =3D NULL;
>  	crtc_state->dsb_commit =3D NULL;
>  	crtc_state->use_dsb =3D false;
> +	crtc_state->histogram_updated =3D false;
>=20
>  	return &crtc_state->uapi;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c
> b/drivers/gpu/drm/i915/display/intel_crtc.c
> index a2c528d707f4..0c8741ca9a71 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -27,6 +27,7 @@
>  #include "intel_drrs.h"
>  #include "intel_dsi.h"
>  #include "intel_fifo_underrun.h"
> +#include "intel_histogram.h"
>  #include "intel_pipe_crc.h"
>  #include "intel_psr.h"
>  #include "intel_sprite.h"
> @@ -210,6 +211,7 @@ static struct intel_crtc *intel_crtc_alloc(void)  sta=
tic
> void intel_crtc_free(struct intel_crtc *crtc)  {
>  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> +	intel_histogram_finish(crtc);
>  	kfree(crtc);
>  }
>=20
> @@ -380,10 +382,15 @@ int intel_crtc_init(struct drm_i915_private
> *dev_priv, enum pipe pipe)
>=20
> 	BIT(DRM_SCALING_FILTER_DEFAULT) |
>=20
> 	BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
>=20
> +	if (drm_crtc_create_histogram_property(&crtc->base))
> +		drm_err(&dev_priv->drm, "Failed to initialize histogram
> +properties\n");
> +
>  	intel_color_crtc_init(crtc);
>  	intel_drrs_crtc_init(crtc);
>  	intel_crtc_crc_init(crtc);
>=20
> +	intel_histogram_init(crtc);
> +
>  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos,
> PM_QOS_DEFAULT_VALUE);
>=20
>  	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) !=3D
> crtc->pipe); diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 9db255bb1230..eeeb59fb39c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -93,6 +93,7 @@
>  #include "intel_fifo_underrun.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_hdmi.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug.h"
>  #include "intel_link_bw.h"
>  #include "intel_lvds.h"
> @@ -4612,6 +4613,12 @@ static int intel_crtc_atomic_check(struct
> intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>=20
> +	if (crtc_state->histogram_updated) {
> +		ret =3D intel_histogram_atomic_check(crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>=20
> @@ -6831,6 +6838,10 @@ int intel_atomic_check(struct drm_device *dev,
>  		if (new_crtc_state->uapi.scaling_filter !=3D
>  		    old_crtc_state->uapi.scaling_filter)
>  			new_crtc_state->uapi.mode_changed =3D true;
> +
> +		if (new_crtc_state->uapi.histogram_enable |=3D
> +				old_crtc_state->uapi.histogram_enable)

Shouldn't this aligned with the state brackets

> +			new_crtc_state->histogram_updated =3D true;
>  	}
>=20
>  	intel_vrr_check_modeset(state);
> @@ -7897,6 +7908,12 @@ static void intel_atomic_commit_tail(struct
> intel_atomic_state *state)
>  		 */
>  		old_crtc_state->dsb_color_vblank =3D
> fetch_and_zero(&new_crtc_state->dsb_color_vblank);
>  		old_crtc_state->dsb_commit =3D
> fetch_and_zero(&new_crtc_state->dsb_commit);
> +
> +		if (new_crtc_state->histogram_updated)
> +			intel_histogram_update(crtc, crtc->base.state-
> >histogram_enable);
> +		if (new_crtc_state->uapi.histogram_iet_updated)
> +			intel_histogram_set_iet_lut(crtc,
> +						    new_crtc_state-
> >uapi.histogram_iet);
>  	}
>=20
>  	/* Underruns don't always raise interrupts, so check manually */ diff -
> -git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 351441efd10a..2e8640e84e7c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1306,6 +1306,8 @@ struct intel_crtc_state {
>=20
>  	/* LOBF flag */
>  	bool has_lobf;
> +
> +	bool histogram_updated;
>  };
>=20
>  enum intel_pipe_crc_source {
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 57bb45b36a03..8f25cfe00ba5 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -68,6 +68,26 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
>  	for (retry =3D 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++)
> {
>  		if (intel_histogram_get_data(intel_crtc)) {
> +			u32 *data;
> +			u32 size;
> +			struct drm_histogram *hist;
> +
> +			size =3D sizeof(u32) * sizeof(histogram->bin_data);
> +			data =3D kzalloc(sizeof(data) * sizeof(histogram-
> >bin_data), GFP_KERNEL);
> +			if (!data)
> +				return;
> +			memcpy(histogram->bin_data, data, size);
> +			hist =3D kzalloc(sizeof(struct drm_histogram),
> GFP_KERNEL);
> +			if (!hist)
> +				return;
> +			hist->data_ptr =3D *data;
> +			hist->nr_elements =3D sizeof(histogram->bin_data);
> +
> +			drm_property_replace_global_blob(display->drm,
> +				&intel_crtc->base.state->histogram_data,
> +				sizeof(struct drm_histogram),
> +				hist, &intel_crtc->base.base,
> +				intel_crtc->base.histogram_data_property);

Can we move this into a single function then call it would it look neater ?

Regards,
Suraj Kandpal

>  			/* Notify user for Histogram rediness */
>  			if (kobject_uevent_env(&display->drm->primary-
> >kdev->kobj,
>  					       KOBJ_CHANGE, histogram_event))
> --
> 2.25.1

