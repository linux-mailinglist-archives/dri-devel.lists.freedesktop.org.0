Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A2C3780A
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 20:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F4510E380;
	Wed,  5 Nov 2025 19:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/ZNb2KS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC8510E385;
 Wed,  5 Nov 2025 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762371383; x=1793907383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YVyY7/mtqQzmMAO+8ilmuB9VqfUXwmUPT8C3Q//h4W0=;
 b=n/ZNb2KSd/fYsSRDlnBzVaI02Qw4eICFeEWpyQJ2Y23xJE7cCbMuCtL/
 RaGs56o7evVlMtUlG7MLNbZwXD2zxEACw5a+j/B7fudr1LHcEELgXnCEI
 Kski/dJxqKErOTZeLy+aYld4vVGqtzd4xMrec6IM1jiU8O8WE7dpiMYvZ
 A9x3K0aV6wxOwn03a6dZ4RB9Ob1CU2SbCU7/XuFmoPXDf+bwqRHXQOGR6
 tz2ngCae544LI/A7i0VAulxtfwybQ97muy7jaIvPcKm+/qvW0+aawxMp7
 kz0cTMpa5rsIIhqu2zVoINZYjuDmtgTnMbnZnQY3pPSVhNAh2hJgjHooR g==;
X-CSE-ConnectionGUID: xZWGhAmzRsiTBU6ak//uag==
X-CSE-MsgGUID: QrQVmsa2Qj2O9mNv5+kupA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75850583"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75850583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 11:36:22 -0800
X-CSE-ConnectionGUID: j4l8gS1gRfqFId1KUjy6CQ==
X-CSE-MsgGUID: tLro3t6SREWEubfXetlywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187994449"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 11:36:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 11:36:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 11:36:21 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 11:36:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMiHniyBLTCznX0b2BHeZdyEUiEVaUs50bzUaR75K/rlNKuUI6eLq+qcOuDnExRRq3jJXyNqaUCPC5baCr6ZT04RFxYX5zWVnY1WM4QrpDa8Zpr0KSnBc3kVdeCoiYlqIhUsQp2T5WYXXBgzjkXSu8oGYWmmoIHwOQ9kL9hhuEgdIDwtElev3C7bNpDy0oifxtwUq6nU2OrB22hQ1opEGJ8fp+ufak64SE/aA7kZtzN6WhlWLQrBVTpBXegpiTfjfetoY+slUrxXQ4nS/6YyTLrY9kImkRV+4uuCVGnAEKt1Ur6u45knZpeghI1oUTjyJZrmxb9/QMXaphsn2TCvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue/0b+9TDa4CqvZqr42oJfZ/vJIE1paj2UOzZpH7IZc=;
 b=gs4M+BOG2BGCAxvGVBheNumE5mpGaFnVVutGkEg8fziWCoKuGGdpyORe3YBUHVLo7E/T1KGjpZ4D14NQEXkzT35YJK2G/aBU0mTimS0siAVgduR2eVIg6PfxABUkzhbMrJFMYzYu/m4BrNKbzca/1b7KaObUrPaynThSvvag1UteiMRE0f0+oqPzY2PA0xcdzp8thL7Em71nMG5osQX+TO3LXW27NJKeRA0XS2JyIhIU/fBKvfnCpu70XZ/AA1KbKbjfuk9Q4s25VCIphSWvXbSk6GJL+6O5nwuCHxMmb6ft7OiKvgrsQVSp6BKqrpNos/WrAO4V/QGOtnSOhUvuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 19:36:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 19:36:19 +0000
Date: Wed, 5 Nov 2025 14:36:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <alok.a.tiwarilinux@gmail.com>
Subject: Re: [PATCH next] drm/i915/dmc: Fix extra bracket and wrong variable
 in PIPEDMC error logs
Message-ID: <aQunL66v3HLWAMEo@intel.com>
References: <20251103132337.762156-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251103132337.762156-1-alok.a.tiwari@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c871d95-aead-4c2d-ad7b-08de1ca297e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XfsORxXX7UjSvKP147Gk/nUh03TGOPk4Pq18TYTMUwTSJ9OJU8W6SYIWprWj?=
 =?us-ascii?Q?NVQbSbAaFvw65EE0N8FBtxJDpeqmgZQzfYI5P6FlSnjFQceC7v0ToTBbCgsG?=
 =?us-ascii?Q?KH5EIFZyFEK3I91/JEkmRd7ze4EsDlTLlnnKvRWiKUdJT5jnxFw8QuHFrXsk?=
 =?us-ascii?Q?JM7nKjg49lD7BfkGrjIO8VNKAGm6SSbxoqLHkNRI2GcNZXCu6cAMAp2g5ZCJ?=
 =?us-ascii?Q?ARD5YgC9pKkGybKh2zErTDm1PzHDtB8vogfuSBwjE5YDUsmJgFNHG3blvQDH?=
 =?us-ascii?Q?zsNC1KiNrX7wrTUBQvkW5a1uTVXggWWtxVGskNTujPInggyvb8AXbmPVgdS+?=
 =?us-ascii?Q?5d/6ehuLmuZR6N6CFMaa9iyJoYP9sGanXnx3tnFt6GQn1n+Hrs83DrQbTz79?=
 =?us-ascii?Q?y6nzMobF9Yx/Xq8MNyKWpoTUDIH/zdsOvr8bf3khpbL2Lu546GanvgV2hVGt?=
 =?us-ascii?Q?xeagfp5dY/v0qvAkWBMnSuoyMlYEjauLolm79dH8BAG+s6rVgvdywtuzjpeo?=
 =?us-ascii?Q?Rv5sQSudlRmRvx+P+xDY7362IqiGYQr7KjxFNGOpT8BbC1Va7Aq0fFti6N5S?=
 =?us-ascii?Q?4DqPQ2n8N0HtZOFxCi9eXL7N6bfnlyfG+NkJuoR1wRnsGEcFhDbgVMPQtkk1?=
 =?us-ascii?Q?UKxR7pk+NOPZcehRECRfJTFvWdTRNvj2IiA3NgJGTJ9noMJwhkLhLDHGEcgJ?=
 =?us-ascii?Q?sAUnU3iE89Itq+7tIqU0XDmCQINmGtjwnnx3MTp+Lokv4KdMr/ewW/HTqj/r?=
 =?us-ascii?Q?ifo6durBaoGpRsERUX8IfIH3wgaeViV92Y8HEv12yB+A/cDM8PaGzYnFcV1Y?=
 =?us-ascii?Q?oPccYF66aq+GA+Xg9MXT+pf8BXoM1xLGZp1v+MM6U90OqJEjWRy/mQuJSjzx?=
 =?us-ascii?Q?pN8XrHW43zyiQXys9TyRiuUz/MHxWql5sBN8w18boqEp6gw1SpgibFYJ7FfB?=
 =?us-ascii?Q?T+KGcvm5F/ojvN9gMvwK/vQUf+CBpVY8+UiAqUgwY1grK/G5d8ACv/Ceaxjj?=
 =?us-ascii?Q?lR2hwHzSGlswJ9EaGMsaAdG5CRJW8AFaUH5BOuK2eNu5/CIWBZ64/zkRqYDA?=
 =?us-ascii?Q?CNDO58zAaIOm9JU+jRy6zjzeqLzWbA8/fY4fB+Eo4dNxRF9ls4C9N9uRe5Gr?=
 =?us-ascii?Q?7o0Y4J+plBWYcaeku/L9sXfSw1N23FFJuk3IKDBniDMxSSk6EozGR9jQMBBA?=
 =?us-ascii?Q?2QACKkfgY6XKNtS11BHIyGz5v9DBAlNsQZxC81M9fVhfuF6p8u4hIIpEoCpw?=
 =?us-ascii?Q?7B4Y2zOlAMynJ5hop829g/UNQbecJbH99eRUaUMCpYBpDu/PkSjnF0ewEu3M?=
 =?us-ascii?Q?MMJcvXFWaAZgLBVC2PwzF1ZEg5LsYHDf4ucWayd3aq2CcB1KYDiqnNHMnYzw?=
 =?us-ascii?Q?Odb5i1NtEd4JRMfU6sWXWD+Q4Vdksr5VkyKiae59gzKp+4PwnFRNCeevsSnq?=
 =?us-ascii?Q?pDQyY0FLHHIMBpkrbPHiLKsXbvHgKEhN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXdkVXfwnm22idTmNn/FKJYcmE+kjl2b78/f8UuZXoJRQ6zHTaCOk5bjPIqZ?=
 =?us-ascii?Q?CK4e3olBQcizfdW1pj3bKVfQjKBmezXci8iWPN4wqBpxvDp/KllNSYNZsNSB?=
 =?us-ascii?Q?UbLzyERIhO0WBxHHiRYrIWgNy3DX3bWnaFbhndow1Vm2lLz+g21VPsZGPKaV?=
 =?us-ascii?Q?C1uHSNO62sDylZL/87IDJZZeEi4TO8hIP+bhk3aH6YypL7a4Ce3+8Smh3wyJ?=
 =?us-ascii?Q?ThkCFlf20fEClJjV46lTr82ah5cFhwqPcnUT2SLMuZKTN6u97mYvMVX3PDw9?=
 =?us-ascii?Q?revXEiCpUooUXkg8uecAQ4oBeDSIgj4Jj8PNGnLlmbFTDZEIe0FAnyafaHUc?=
 =?us-ascii?Q?6aiW62iD//gmNnGw/o6PDSYaDvwSFAeHxYQWu6oZOeDBTEqkLem46+dGX06j?=
 =?us-ascii?Q?/femKlJhkei3lFLxLfVSd3Ss4d6uklxZ6W2VjFeW0D3mvgCWfaBICAk5F5uk?=
 =?us-ascii?Q?5TpvIaYTiDhR1be+8ClEpQ7FwlDR5IVvkuPnKLkBAcKjps7G3x0PM/iRbXHy?=
 =?us-ascii?Q?kcjwRGP+tET4XYxPKvIi52zZcOn32Jy999XN+PoZW6TJ5I0oTtauZ/AW/b6X?=
 =?us-ascii?Q?M0rNUtoVJUAZ7sRevk3Y0fhNBs5TzRah8x7IJ+bJlnurTmDAFh3Jtto0VfmU?=
 =?us-ascii?Q?kiKW4AaMINj0gCsGZCDk/50TcWFfC7s3vCHiSBA1/0Sw+Atr4emQoxoU1+2p?=
 =?us-ascii?Q?dbjIXQJPbuPnSc8jZxqdBAaqQ6ta4CwQMmlDdZp1OD/lVL+fms8G6rmlYKqh?=
 =?us-ascii?Q?DIyQ/HMLBswlyPn7Eiof7gb07mpeNq/Txy+wcsDQDLHnZj+PcyUdMNUkS/mr?=
 =?us-ascii?Q?pOu6PLYOI2bfR1Mp9O9iOev078J+8dAuc5w1CPz4SCEUBtQk06gRrQYHPJJB?=
 =?us-ascii?Q?ZVNflef7pkJ6TXm7O8f4ndasBNNZNCBDRSMP6lqZisiwyoPA9MiN36bLZuRU?=
 =?us-ascii?Q?Rl6zEQF5LVTYjMwoyzLZPdmDhTM/NomGwnCopIeDbGwy7s12ZHH8JnZnp7Z0?=
 =?us-ascii?Q?MTbShI5QtjbLHixWqm5uAJWO5x7uoZQEZUm1z6y5e7OwuLbP4POJmL7wsicN?=
 =?us-ascii?Q?xFYT1/T3CRr4H89G/6wGYJz1H0afL8huGClTIhgB84+yz91vMVhrwpu+vQer?=
 =?us-ascii?Q?+F7dUeM6MCYSiay+1xR28QEvGLYlZrkMFW847BazWIn/5P6NJxAJR1ZA3AXH?=
 =?us-ascii?Q?j7x8KWYpkCEo/1IM/fOiOiqNZWtC1MiQ0pTs3v2yX0MH728wfxP/4ingzO/Z?=
 =?us-ascii?Q?DG73MiqYjtXgFTFMnN1JMkSS5mbv5roOCMgxVcE7Q+Hjls/+2upEO8XIYTdj?=
 =?us-ascii?Q?i3WYP/Uwuu1QuQfVJqyZeRi5iWx7cxWZIMB2HhvwK2GmP+Ru2WHjc/yzFNni?=
 =?us-ascii?Q?np2OsGsON8iqGjpULcY+Rxx4yGuBaHC1fqcu5ux/QV0rTYMyHAvuH5zLamFB?=
 =?us-ascii?Q?f9xB1uNFkgT2ep7VYoKJYS9LzNs75vFxnVkOPNiPcrQ49kdCmkAtNNO8Wprh?=
 =?us-ascii?Q?lM+TpoM/saG8UhQ1Z8QYRZD+uXHYeAOea/W8CVrm2/L651hjzStuIZYjzFjH?=
 =?us-ascii?Q?ycvTg4Uva30f+Ofeaar19Df0nfdZO/FSW62V7gDY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c871d95-aead-4c2d-ad7b-08de1ca297e8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 19:36:19.4805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S64MMqJ20trc7S01B26hcgz92RPhMciHd06xReWTa+4JuO0Ca8c9M1bYQdVNWjkAJeLstJeM3HrSIdFPev8Obg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

On Mon, Nov 03, 2025 at 05:23:31AM -0800, Alok Tiwari wrote:
> Fixes two issues in intel_pipedmc_irq_handler():
> - Removed an extra ']' in the PIPEDMC error and interrupt vector log.
> - Corrected the interrupt vector log to print int_vector instead of tmp,
>   as tmp will be zero in this case.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-intel-next

thanks for the patch

 ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 0bddb20a7c86..f47b57568a75 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1712,14 +1712,14 @@ void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe)
>  			drm_err_ratelimited(display->drm, "[CRTC:%d:%s] PIPEDMC GTT fault\n",
>  					    crtc->base.base.id, crtc->base.name);
>  		if (tmp & PIPEDMC_ERROR)
> -			drm_err(display->drm, "[CRTC:%d:%s]] PIPEDMC error\n",
> +			drm_err(display->drm, "[CRTC:%d:%s] PIPEDMC error\n",
>  				crtc->base.base.id, crtc->base.name);
>  	}
>  
>  	int_vector = intel_de_read(display, PIPEDMC_STATUS(pipe)) & PIPEDMC_INT_VECTOR_MASK;
>  	if (tmp == 0 && int_vector != 0)
> -		drm_err(display->drm, "[CRTC:%d:%s]] PIPEDMC interrupt vector 0x%x\n",
> -			crtc->base.base.id, crtc->base.name, tmp);
> +		drm_err(display->drm, "[CRTC:%d:%s] PIPEDMC interrupt vector 0x%x\n",
> +			crtc->base.base.id, crtc->base.name, int_vector);
>  }
>  
>  void intel_pipedmc_enable_event(struct intel_crtc *crtc,
> -- 
> 2.50.1
> 
