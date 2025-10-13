Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CC6BD5DFD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E4210E4EF;
	Mon, 13 Oct 2025 19:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGBqkNcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C4210E4E5;
 Mon, 13 Oct 2025 19:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760382351; x=1791918351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c2VntTJ1TtuaCS2xiIj5IvQZU0l/zbfsAb4MGz9PM+I=;
 b=hGBqkNcbHRgLttcxvLCPnyEBxOdU9lxIiSWoxf7tRDF/QdfQf3KXKtVb
 9gpzcI0QLGwb3fjnU0MRr1X/ge81fT27OJydPjkkCVOVCXxUgPF23CrFs
 TeUYdFkjncp5UxzDjYiRs9Okw+u+3xvMGF6xCjzi2k12Uk+/shKRrHdWr
 0vHJvChjLmDIpZnDInqUWYWV4KFDcXdeWCGnqNySDQ73eI3u7jw8gcaRD
 GVbu5/pipIN7CirxNLCDxMOGeLmCeGR3KIvcTFww4VtKVoXb9c7wc6jUC
 /XFC8Yc+uZRXLT6p9UnUyUqcd8e//jdGEekOQf4DXKE2JuxcT9oN7Zyff w==;
X-CSE-ConnectionGUID: kl9/9GoQS2C5DRm7lxdjgA==
X-CSE-MsgGUID: IHGH3CQ5RqOs94UlEZxeqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62424108"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62424108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:05:48 -0700
X-CSE-ConnectionGUID: jfxecflmRh6LzxiufQUgjQ==
X-CSE-MsgGUID: yU41R+NGTHaCFqVN/pCg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185927023"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:05:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:05:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 12:05:44 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:05:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJzGAZ/ZPejnKOe07+ECNLxW6sAwzpeYc0gRztedYz9+9IVRk4xLFt+yRornz4pXfODR++OQIHSIUpgkCzYExCLXCN5TrAU+/jCxSsubdQ762xCa249Ms/5w5zjSEaS3DDLWAsjT7VCmh59MxdWf5MYmTM2cGEY24XJZ3xjF+v9H7p1IlleNzXOjsjRYWGvh3i9Ennyoi2kpkknkiMDb/kuL8ET2LjxMxoY7dzMRLpQP0c033r5pwadc8sIPadDaDClQSTS6mDekVl+6gWJ2AHEJAlElU/NOxTyBNxWcexd9mMVGFZ29izt/j2JZd5nGvVOU6RM9zJKwUGjqQlsQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0e060gdpASoFlj4rF2Bfp/UMr5vReWTyUxO7QZm2Is=;
 b=aY0omBcv2WFm2LQrnfh0hArGSxb3KOrE76IpsF2/v24NSPYuCQuLAyteK5GqA0Nc4841nKZvqwH5ZmuIr0nkAexR7FnT5jYT1kb66UJGhvhNBRKeoE2084jtvheuIT58RABdfeIB3erP+fr6koH4Zh/NhIGox27GknhGiSBP+xJe3LWkt+ZGNbWauFZ9xlpEcaYSDJaNEhzHDdTvmvi3JfiTl4hp9ep4B0CKDEy/ReniPGTjtMYoSMxzt5nuayqMtpSWRgNj0wFsRc1HEfH8m3y7B1uX5IYOvRhwZFzU9uJybZEkgQBIAIVshyyFMW3Dq+Wltotm4+b+btJZ1QxoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 19:05:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:05:42 +0000
Date: Mon, 13 Oct 2025 15:05:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marlon Henrique Sanches <marlonsanches@estudante.ufscar.br>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gem: fix typo in comment (I915_EXEC_NO_RELOC)
Message-ID: <aO1NgjjpgUmUoVAn@intel.com>
References: <20251013183123.438573-1-marlonsanches@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013183123.438573-1-marlonsanches@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: 182b935d-d4cb-4453-b8e3-08de0a8b8149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S+0ClRUdRZfptCaQSGnf9gGW7piRmRusvrPzEAvSH3UePTC3k56NlJFkdn88?=
 =?us-ascii?Q?d6m3LUoEFssIFEdM8rE71735ZccAQSmejt5iWnme3kmpAePy+LdPnnQ6VXUq?=
 =?us-ascii?Q?wjowXxblOtYhS4VtqjKzsTjGr0mG8p0IYCnOsEm/vVW9ZHUTbvVl6Thwrylf?=
 =?us-ascii?Q?WvdZSTA+FoygdI5K5QxPMsmYn+XLd/E/4np+AXo8ZMbVJNFyAW5NiZEdjein?=
 =?us-ascii?Q?FkJk9BScptEySmiNEpklv9fUfIflFYWw334imejvWW5DE2pR840oUgdy3mYu?=
 =?us-ascii?Q?3kVLBdpVc5xQZFENJ7m+Fbw2f2jcHZNqu0Fhsitu3N20F2Pt9aHteVwUkVHs?=
 =?us-ascii?Q?RkxQai1u7dzgfo2xIIvShIPSziutLEOpCKI6mMsrCZHaHzfWPvenuIJ5wdu/?=
 =?us-ascii?Q?GvxFpFM3ObM96a8ZXGiEYUT4YxmXsltuV3wNz9cG9i0B0njvORaOXco8AKf4?=
 =?us-ascii?Q?vfn8AXyLSgd2w3kZJEGr0dGpNL+3WVmIKg9TLzDuOjplk631X/6yXQWYUl4G?=
 =?us-ascii?Q?XDaXtUezX8XDL7YadnHCw53O5j+Mu0GBjHoR1xdK8PCbzkJ1HmvPYiCsF2dT?=
 =?us-ascii?Q?nTy/YuAvHK3GaLowRzNjWyN8Ij0OP3IAEA0A3e7wKnBeeOCxVBabiwoeDXjZ?=
 =?us-ascii?Q?j02pFHGZVEU248oL9oyww2tw+Z9i5AXljdkCZt7OFeMizhC14kDLN5Gd3wcG?=
 =?us-ascii?Q?JzlqJUiZeGVUqL/9LK3aUihT9Qe4UvdR0F0rkSANBW209LPrszBuczvvta7q?=
 =?us-ascii?Q?tPoE/zUoTjo9p10B6toxYQP+FUQ4i37bwpzN3NgIgE5OOM9AGs25Y0e6TSJ5?=
 =?us-ascii?Q?e1dfvICRhMDi7+gWXpiwByMKzoWwkdF/CBMoMOrm/khEVIXeGhBs745m3nsi?=
 =?us-ascii?Q?PKqwswgNqVWAvBUbS4k3PXvzCtknbG58eSy1UGnSFVdBsT1ef8Dah1M+0EUH?=
 =?us-ascii?Q?lPUVda5uGS/Wp8LQP8cacS0v516PhuH4g1R69NohplIh86A1UVae5YZEhChj?=
 =?us-ascii?Q?/TM7vd6JKp3LING64b12j67Bu5HqFKH4G4DfrcZnlgwpNCvQJfA2w8ibzBnO?=
 =?us-ascii?Q?A/uMfdt2FG9CgN04MsauCPmQKDQadbv2XgzNgTbWRv91Ef3RGO6xlUjATF7f?=
 =?us-ascii?Q?Y86vP9/Kj6k8kCuD08n+tXvPoZOnyNVgKseft5d8sVArGPU6lE/TUy05pYDz?=
 =?us-ascii?Q?BDjkbhBg7jLf/fDdety5Mq7rEBqY9J3cVAHcYrw6q76vbHiR/vPtK8SOl6NX?=
 =?us-ascii?Q?BrA1mZrYZ2XRBN1xrEgrMAU8RCA5U07edwdQAvIwuNU0YCV8wWWuYHR9wkf8?=
 =?us-ascii?Q?WaYWg4ft/MkIdmfPGRryY+oYtLNgjrywfPVqRsXHay5Ix9GrncXrbcFQixkF?=
 =?us-ascii?Q?oarQyF//+Edl2VVxhaauda4V/HJ+4HS/7qxyhOI2ljsG9wIjoq6tjQ7RthW8?=
 =?us-ascii?Q?i7uTYRJE3HBF/GEFU+6HYALzM0FdW29l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sCaryIcNd8zaN6twQpPLWhaYHutVxpIX34skgWXHccfoa0Yw4EY4q5vitg+7?=
 =?us-ascii?Q?aGG++hd5L6RahB1iDPjOhep7/WpCCMmz58gu2ZlnsyWpYWndX7lQImy9zDn1?=
 =?us-ascii?Q?+eZZQqy3XL4kxbTA9U+9r+sAb2UHikB8VmTTTk73jZJ9eXGdCNZ3Bn/PH3J7?=
 =?us-ascii?Q?tyTZzBnJi1Hn1PJZFBTF96x8COkuNRh1Puv5xD+WA7Y1bSIPCBJdH4i2PGCQ?=
 =?us-ascii?Q?yLK7l+FSvG2bL/tKuEUo9r02W4Ubf6eJvxDS1Cqe/Dbyb+z/pUlX+CUzmeGN?=
 =?us-ascii?Q?FS9aA8u8X+0cnJKjniYuqNopMKhSZGZUQfS5vxTVZ9+rIhxuekTJhphStzH0?=
 =?us-ascii?Q?XBUSZj3l0Z3FhLjPI8kA7XNVfJxXYUIC9Zv1xmhRFOJRvGknb1fB4vqyHhKm?=
 =?us-ascii?Q?kTy8Nxg3K5XAmOORR2XXNn+wk/Kj/3mga3jHjeb8Nuzn8SiWe6rNFBLxPEfn?=
 =?us-ascii?Q?SxuevNexX3wCaJFOI5PLu3yZ3Q9P3f+EGBesSBPWuw9Q0CxYhF9gA51jkY5+?=
 =?us-ascii?Q?fgdSPKMbDUUKGErK6SCU3DT+dx7fOc8GLpMLGPPDrx6upwT3sJQTuroKCKW/?=
 =?us-ascii?Q?WShziWWgLSHu4CaFLknHIHfY7bNYYjSw7DlTnJMLoQtyCJ3BHvJwSPg8UjsH?=
 =?us-ascii?Q?GKhMdsy1NL5VjlXkK+4zqXCRWO27RFhNlfyD+eQmV+3WXk6d1s6AEHwJ/ZiY?=
 =?us-ascii?Q?hb/Xn9NIRgi+pcKJS9IXjg72g3cWxgd33bZsY/uOql67eYCuWehPv3oUIam6?=
 =?us-ascii?Q?QCdsd61UdFhjCWF6O353OIdxApwAhQaeY7w84HMgtjhDI1ss9ytBUvU1XdD4?=
 =?us-ascii?Q?DKsSaVnv0BcpEL0Z9b3TgtKpde2dOTQ4sL8FXSbSQ5rlSaNN9atxMLKwBNoJ?=
 =?us-ascii?Q?s7vL04M1WFXIqNr1KCU9fT/ff68bGdoN48tmv+GSkZAGIXkhJDPIYmUDo4Np?=
 =?us-ascii?Q?TJonnBeCz1BrNBICkP13D/tWzs7DJiz9tA27IbwNoQ7M1WO6GOmf1V5YAxYo?=
 =?us-ascii?Q?ylnNOvPE63gljC2UJHZe6d1I1rf9gILYlX+cAiOoUuZdlh11rHf8pGsIKYNU?=
 =?us-ascii?Q?4xx3IWg3lJ7wIvQn1l+wFv4mIDQQ7buPHvdIo9wWZuQ9r6ZmiLURiLdMOUcw?=
 =?us-ascii?Q?Zgzi6iRkArbXwe6KIQROLOZO9wr5E6/+dVYDyt7ygsSlyVW/dxCWTZNrK8hT?=
 =?us-ascii?Q?2FDZSM1nMZcgXxSFMgT+ZtDHwycyZ/vIwrJBkdZ9yARRRn47K3cAvEVo/mb4?=
 =?us-ascii?Q?hGBZdPi4C8CeCf5W1Ef0l0+2ecmlzypk3jonRtawUYEHHP9ukfbe7HdrBEts?=
 =?us-ascii?Q?DaHc7kNzH+9DySc1ByRXkYIaku/zStdlb+Woi90Ls5xcfsVE5TOE3Ipc06/+?=
 =?us-ascii?Q?C/ELSHtXmC9rrLMdj8EpyABJFymoidOfn/vnTF4F+20U3TrpNznp8yljwd5O?=
 =?us-ascii?Q?CYNHK8AOUmHfDGEtR8RcFR1ebDloQ4IHIkr8JfMwJhhN7oFhUsIpYElWg5gN?=
 =?us-ascii?Q?KXJaVG4wKKWEPeUOC3EQm2AgNOPeCeJbzbddhE/2Z4pG9wMLXais5Tf7d+06?=
 =?us-ascii?Q?nw/ys6vYq5L1fK98d5EgFkWOSSYG3uGHObsZmwLzl6nyvoBi4YQ5NFjOHZEl?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 182b935d-d4cb-4453-b8e3-08de0a8b8149
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:05:42.1350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtRf6caJf4qmuaPdNbEFDNnQEBxIIMYzi2EZPDHHXHxCyBOI/GyFsaJbQOuyKM82P40DXdqhdiPtXQ/0H6+Lgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
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

On Mon, Oct 13, 2025 at 03:31:23PM -0300, Marlon Henrique Sanches wrote:
> The comment referenced the flag name incorrectly as 'I915_EXEC_NORELOC'
> (missing underscore). This patch corrects the spelling in the comment
> only; there is no functional change.
> 
> Signed-off-by: Marlon Henrique Sanches <marlonsanches@estudante.ufscar.br>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon to drm-intel-gt-next

Obrigado!

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 39c7c32e1e74..7a0dee4111cb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -142,7 +142,7 @@ enum {
>   * we want to leave the object where it is and for all the existing relocations
>   * to match. If the object is given a new address, or if userspace thinks the
>   * object is elsewhere, we have to parse all the relocation entries and update
> - * the addresses. Userspace can set the I915_EXEC_NORELOC flag to hint that
> + * the addresses. Userspace can set the I915_EXEC_NO_RELOC flag to hint that
>   * all the target addresses in all of its objects match the value in the
>   * relocation entries and that they all match the presumed offsets given by the
>   * list of execbuffer objects. Using this knowledge, we know that if we haven't
> -- 
> 2.34.1
> 
