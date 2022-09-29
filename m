Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7755EFEED
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D525210E00C;
	Thu, 29 Sep 2022 20:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F7B10E00C;
 Thu, 29 Sep 2022 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664484966; x=1696020966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gz8vo1nRZmkO+SbD8huE1pYE5nOFGqNmowPzPQ6lcRg=;
 b=GMFVXItQPIeAi+91m/yFokHcC3lLgxNVwu1kKaovbFAeoBhQkYyeTSkr
 Y7GKDovmx/Vgfn1XvbEVZoSV3g4MJyWvKBfyf/DXG0I9+/8OKoRRoo8IZ
 fNUcVI6H5X2Mqp7sdHjZ2QLOlDT0rDYmg3LWSaQlTRh6+y11x1HxuKEug
 6R9BL3f6ZLI7/aZp007r5HU4kDbd4w48HL8hETAp0hJx+jRNMa2Tgilns
 N2VA0Qz5bcmalk0F/elAxPq2Tyr82qcXJF93RC5fYDjsibdkEEur4AZY7
 s/CFTYEBHuXXybn3ZERX/B5l81wbSGPMBXwZuioZJVdww4gk/QUNTCeD2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="281732884"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="281732884"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 13:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="624729066"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="624729066"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2022 13:55:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 13:55:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 13:55:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 13:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiuWc4BLl8XhPXBd8JzJx1ktOsxzAmqw0lattGOvwvA3PSmZLJkyYsuLzXCXc+KqeHR4jYXDl6PZ6BuwDUzQpdKnfkYCxGTNxCzada/TnUmrITG9mcWsKWjvduKQ7/TLkTJV5tKnkISbqfkGvtEFChSiZ89asc+bqxXHNUGuqSi9BeZYjhQtrci5ISY9IWaX2ySVFwSTGtNxDccGAla6XbFy1MvNm1upoDGG8+rVPfI4I/il3AYW1A1DSLnmrEBsP9yrxWRMFz3/ngf59IFKu3CwlSf82I86UijKGMY2eZfgUec7kZQwMuBoz025fQXXHD8sKCKAVct9bueLvuiH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY++ifomLVPdr6RV11xdWzW2VEbjR8LZIP1QM0zowdo=;
 b=lXl3RbODkSmD4NtOCk0g3D7BeC7jFWWy7kLglP3tiIK56yadQzL4vuw1Etm3dttQC1nK6joD/Dr5Ea/ehvgZOHDoqZ+sCxS84gYjQnafaxRDDaVpZdzEsae+muHuUZKmRhsG5m2cJ8qs2E0Ej5xEHWgXJOmU967mqfoFhFxK7+VVgAlVl0e6SvDrm+cuHqWUbm5VVYUvfubYrQ/+uXiGzVP0ed8FSGy5f+IwY/OprBzk3pF2oHeT+DN0smlSHisuTUDOxDjOxpq1dar3IJ55G/dB3YnDneU4lERxfmRy3SvhriXQfBAmLKAZQdumGPfROTjV7SPha/OxTU/Pder1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 20:55:47 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 20:55:47 +0000
Date: Thu, 29 Sep 2022 13:55:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH v5] drm/i915/mtl: enable local stolen memory
Message-ID: <YzYGUa3FT5HnxEBY@mdroper-desk1.amr.corp.intel.com>
References: <20220929114658.145287-1-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220929114658.145287-1-aravind.iddamsetty@intel.com>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: d5732b09-fbdd-426d-3f53-08daa25cfc1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yr537kIocfFe983ZA/6/emBglV2CgRJVJ/IIYs8jW7Bs4SCw+Y915L8MpA6W4YjRrqcd9yNltMRwEvdmNruwVR/1SmMBJpIhIx6gxvNV47M7IXr/Y3RyjIMmAc3LQn7GBLcmjnai4/IqzCyvn1NFy49T7+JJFLmM/BoBEfnuDM93alL9EI2ARRTd4ZiOQlLiRX0NVH5pIaYw3lJzBFhPVafYkFgrUcFAKetsDKPlITjrqEhF2t42kLCJrJ3+m/YacX9egQ0t+CR5gtAPBjVXEpU61wt2cm2SCNmGWT8EQoP3hDWl1JlCQRuz8YL3hl8H3of8nGCoHuo5F3Pfa541CI44+6m6ict9SBupoj1q+omzQxpGqkluDs636Soq8PEcvZrP5shYYh7GxVbvkUmF4GzQ9fS3Oc9zY3YywphQjoxdUszuWmPz3AD/7cnF0Gumoz4MjW1WhqeRJUZ7IWk1dIk6FD/M8oSVWHGzEzFWuM11cKJXAculq+Z2h7LoeGgZ1ZPzE5JxuWKlFYPP7Edk9ZCYxjuWwh2F4QV/xjVguq4bEb/zEQ3epAW9mVOc7I/atawPJxrA5Puc6Da1Wvvnc/bRhWp+HvLRNNB+yGlDZYheHg65apICBfZoI+w3li6i65AXIgmglxmddr8qy88093z9uMpMGIaW/dk1dgtEVaGxF+aMlLhD4VYB/NfyBE3a5soITX1uhGWsolcRaLe1qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199015)(6506007)(26005)(6512007)(478600001)(83380400001)(2906002)(8936002)(6862004)(54906003)(66476007)(316002)(6636002)(6486002)(66556008)(186003)(8676002)(5660300002)(41300700001)(4326008)(66946007)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3pq+JGxjJr3vk3ObontLUCRGZh+bhKrWLiBGbgrznJT28jrjtCHuUGAUH0+U?=
 =?us-ascii?Q?s7VBwMb/ME8CU+VmHrjAN98bYnrPvbzVjDlMTJnhGf6VoZwk39OJ+VPHt2Sm?=
 =?us-ascii?Q?P5uL7L5z5F/h/l+lk2jVyjZXma/SXzHTObEwoU3UMz9frtUjm9tROGELOQFn?=
 =?us-ascii?Q?8w5vrQRaXZBumx+NvIh5yXyVZxDh8zJQ28VRog7fiwDOAOGIhOavm71SoPoJ?=
 =?us-ascii?Q?UC6wZaibTnLmF2QixDXSOiMiuXNNoU/h7wywXkhL5Uvsj/risyFK0lVldamT?=
 =?us-ascii?Q?kCtHl9yZKorjE925j4PcRmX+82BiuBIu+mzTWLXAxb8aFGoD9UZEv8+1rR9c?=
 =?us-ascii?Q?77j+WsuiL/gL9ZQFfFWl4gWmtnsoFsydlsEc8jKbo6Je91HjNvFIE5JN9o+6?=
 =?us-ascii?Q?5lIQgDPsQh92Fwhzpp13uMgtpt7OpUNc9GukpGTUQsODid3DwhmQIEnuSoSI?=
 =?us-ascii?Q?1iMC0OSmXDLJXlhdpAcgWQHfSui6av8TO+qDSzH5TX9K9iC3yTeh/KMLszLq?=
 =?us-ascii?Q?aX2U8EtxZEz4/G4UtWEAYb/ipQZVv7mxHNjLThseJWKykuc7taubdLyOFa5q?=
 =?us-ascii?Q?nM2OqpJJISRLByo3ka1mr7C8piGF6GgwnYS371kO4Jom7p1IqyLlyOuF6y3C?=
 =?us-ascii?Q?TIutczm7bp3ORNplCs5nPSrM6RTwVb/mEnPFwuXr+WPiIc3JKs4A8+VmXXar?=
 =?us-ascii?Q?nyQ1dYSDhb4U4kX0zSJKgYyZpg/PTNQ1rDWTs8YBfBQegHj1mqd9+pD5sPBK?=
 =?us-ascii?Q?h8Zv96SPGFH3KH/vAqa6kyhbRHjCfl/DBFaDfMWRxM1pVCrxfmSz1CGG/720?=
 =?us-ascii?Q?cTrF0++mtHAm9s9ImrIJG+8QoSiGRRBxzx7USnSJzp2HbyBiE7O3OO/EF9uP?=
 =?us-ascii?Q?7Jh3kVQcaUqQoVTB7CDjGh9Z0xnxWVsYBd5M1ZouUCJ1bKcYHc32D42TrUvr?=
 =?us-ascii?Q?LiCAwO7wngSYxEu1mLaoGhQfszKzcoDvj905paCsiYjlyr8eZh/gu6GOU0Ne?=
 =?us-ascii?Q?EltzoJMRmdgtQ9Lcnv/XM8IhhIQbkx7D5CMfnU7nv9E4EfhSv0VcyrXQu9xJ?=
 =?us-ascii?Q?CPBQPFYp8Y21+/UDBHwtSR89N23PRSJwrEt799/TkX/gadaiJMgGLbiFnQZl?=
 =?us-ascii?Q?muy54AhaikIMlgNl8oNYFV3BaQw2nJDPKYXCqTK6L+ebVR26V4QXFR15baPF?=
 =?us-ascii?Q?an52owbG+jygIBs+0wH0WsN009HST4LwYKvN+N+IHWPBTxCWbg012gEiYN0o?=
 =?us-ascii?Q?EdBoGNUtsKOwT16mo4ZgyQv1TAPrfCZvhEkVBTQ9Ww62nZSJxkqlDjzsD09V?=
 =?us-ascii?Q?+VIO++GeHtWC2TaWScvcqEuGRk+DpObwK1k78T7divferlFb+3BDfc7i2leA?=
 =?us-ascii?Q?EyAAnNO0YwpHp0H2vd7QOZAqNjyW8+uJVlNu2hQBvDrAJJ8tapOzHpg/l0Zp?=
 =?us-ascii?Q?fJlYc9LQg/V5i9oRUYWz55JnQTwEoxpBM9oVxHo0z0o/u7IjtaKQZU3X7fEk?=
 =?us-ascii?Q?EyvkT1hr2dCSyNrCqR1PlgZd5TvTWmQ9woqBvrRRusmv0dW6OcD81vtXJmWS?=
 =?us-ascii?Q?tLt29eFWJ739VYZ6djADVLCH9WVJKwM2/DUoG+wPLX0KjPT/PbcoI9vMm9OA?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5732b09-fbdd-426d-3f53-08daa25cfc1b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 20:55:47.7931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlHGtmBzukujAZLnPhhu9lnKacM/RUUu9uWE+AWwbXiSecLHjwaqcyDGd8R7itpgRK2bG2XetIvyX4+1JnAUfS3FeJskBBSYXQ0Amgn5V+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
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
Cc: anshuman.gupta@intel.com, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 05:16:58PM +0530, Aravind Iddamsetty wrote:
> As an integrated GPU, MTL does not have local memory and HAS_LMEM()
> returns false.  However the platform's stolen memory is presented via
> BAR2 (i.e., the BAR we traditionally consider to be the GMADR on IGFX)
> and should be managed by the driver the same way that local memory is
> on dgpu platforms (which includes setting the "lmem" bit on page table
> entries).  We use the term "local stolen memory" to refer to this
> model.
> 
> The major difference from the traditional BAR2 (GMADR) is that
> the stolen area is mapped via the BAR2 while in the former BAR2 is an
> aperture into the GTT VA through which access are made into stolen area.
> 
> BSPEC: 53098, 63830
> 
> v2:
> 1. dropped is_dsm_invalid, updated valid_stolen_size check from Lucas
> (Jani, Lucas)
> 2. drop lmembar_is_igpu_stolen
> 3. revert to referring GFXMEM_BAR as GEN12_LMEM_BAR (Lucas)
> 
> v3:(Jani)
> 1. rename get_mtl_gms_size to mtl_get_gms_size
> 2. define register for MMIO address
> 
> v4:(Matt)
> 1. Use REG_FIELD_GET to read GMS value
> 2. replace the calculations with SZ_256M/SZ_8M
> 
> v5: Include more details to commit message on how it is different from
> earlier platforms (Anshuman)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> 
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Original-author: CQ Tang

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 83 ++++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
>  drivers/gpu/drm/i915/i915_drv.h            |  3 +
>  drivers/gpu/drm/i915/i915_reg.h            |  4 ++
>  4 files changed, 76 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index c5a4035c99cd..910086974454 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -77,9 +77,9 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>  	mutex_unlock(&i915->mm.stolen_lock);
>  }
>  
> -static bool valid_stolen_size(struct resource *dsm)
> +static bool valid_stolen_size(struct drm_i915_private *i915, struct resource *dsm)
>  {
> -	return dsm->start != 0 && dsm->end > dsm->start;
> +	return (dsm->start != 0 || HAS_BAR2_SMEM_STOLEN(i915)) && dsm->end > dsm->start;
>  }
>  
>  static int adjust_stolen(struct drm_i915_private *i915,
> @@ -88,7 +88,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>  	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>  
>  	/*
> @@ -135,7 +135,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>  		}
>  	}
>  
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>  
>  	return 0;
> @@ -149,8 +149,11 @@ static int request_smem_stolen(struct drm_i915_private *i915,
>  	/*
>  	 * With stolen lmem, we don't need to request system memory for the
>  	 * address range since it's local to the gpu.
> +	 *
> +	 * Starting MTL, in IGFX devices the stolen memory is exposed via
> +	 * BAR2 and shall be considered similar to stolen lmem.
>  	 */
> -	if (HAS_LMEM(i915))
> +	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>  		return 0;
>  
>  	/*
> @@ -385,8 +388,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>  
>  	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>  
> -	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
> -
>  	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>  	case GEN8_STOLEN_RESERVED_1M:
>  		*size = 1024 * 1024;
> @@ -404,6 +405,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>  		*size = 8 * 1024 * 1024;
>  		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
>  	}
> +
> +	if (HAS_BAR2_SMEM_STOLEN(i915))
> +		/* the base is initialized to stolen top so subtract size to get base */
> +		*base -= *size;
> +	else
> +		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>  }
>  
>  /*
> @@ -833,6 +840,29 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
>  	.init_object = _i915_gem_object_stolen_init,
>  };
>  
> +static int mtl_get_gms_size(struct intel_uncore *uncore)
> +{
> +	u16 ggc, gms;
> +
> +	ggc = intel_uncore_read16(uncore, GGC);
> +
> +	/* check GGMS, should be fixed 0x3 (8MB) */
> +	if ((ggc & GGMS_MASK) != GGMS_MASK)
> +		return -EIO;
> +
> +	/* return valid GMS value, -EIO if invalid */
> +	gms = REG_FIELD_GET(GMS_MASK, ggc);
> +	switch (gms) {
> +	case 0x0 ... 0x04:
> +		return gms * 32;
> +	case 0xf0 ... 0xfe:
> +		return (gms - 0xf0 + 1) * 4;
> +	default:
> +		MISSING_CASE(gms);
> +		return -EIO;
> +	}
> +}
> +
>  struct intel_memory_region *
>  i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  			   u16 instance)
> @@ -843,6 +873,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  	struct intel_memory_region *mem;
>  	resource_size_t io_start, io_size;
>  	resource_size_t min_page_size;
> +	int ret;
>  
>  	if (WARN_ON_ONCE(instance))
>  		return ERR_PTR(-ENODEV);
> @@ -850,12 +881,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>  		return ERR_PTR(-ENXIO);
>  
> -	/* Use DSM base address instead for stolen memory */
> -	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
> -	if (IS_DG1(uncore->i915)) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915) || IS_DG1(i915)) {
>  		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> -		if (WARN_ON(lmem_size < dsm_base))
> -			return ERR_PTR(-ENODEV);
>  	} else {
>  		resource_size_t lmem_range;
>  
> @@ -864,13 +891,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  		lmem_size *= SZ_1G;
>  	}
>  
> -	dsm_size = lmem_size - dsm_base;
> -	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		/*
> +		 * MTL dsm size is in GGC register.
> +		 * Also MTL uses offset to DSMBASE in ptes, so i915
> +		 * uses dsm_base = 0 to setup stolen region.
> +		 */
> +		ret = mtl_get_gms_size(uncore);
> +		if (ret < 0) {
> +			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
> +			return ERR_PTR(ret);
> +		}
> +
> +		dsm_base = 0;
> +		dsm_size = (resource_size_t)(ret * SZ_1M);
> +
> +		GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) != SZ_256M);
> +		GEM_BUG_ON((dsm_size + SZ_8M) > lmem_size);
> +	} else {
> +		/* Use DSM base address instead for stolen memory */
> +		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +		if (WARN_ON(lmem_size < dsm_base))
> +			return ERR_PTR(-ENODEV);
> +		dsm_size = lmem_size - dsm_base;
> +	}
> +
> +	io_size = dsm_size;
> +	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < dsm_size) {
>  		io_start = 0;
>  		io_size = 0;
> +	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + SZ_8M;
>  	} else {
>  		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
> -		io_size = dsm_size;
>  	}
>  
>  	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 30cf5c3369d9..b31fe0fb013f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	unsigned int size;
>  	u16 snb_gmch_ctl;
>  
> -	if (!HAS_LMEM(i915)) {
> +	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>  		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>  			return -ENXIO;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 84a2f6b16f57..90ed8e6db2fe 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -974,6 +974,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  
>  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>  
> +#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
> +				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +
>  /* intel_device_info.c */
>  static inline struct intel_device_info *
>  mkwrite_device_info(struct drm_i915_private *dev_priv)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 5003a5ffbc6a..2126e441199d 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7967,6 +7967,10 @@ enum skl_power_gate {
>  							   _ICL_PIPE_DSS_CTL2_PB, \
>  							   _ICL_PIPE_DSS_CTL2_PC)
>  
> +#define GGC				_MMIO(0x108040)
> +#define   GMS_MASK			REG_GENMASK(15, 8)
> +#define   GGMS_MASK			REG_GENMASK(7, 6)
> +
>  #define GEN12_GSMBASE			_MMIO(0x108100)
>  #define GEN12_DSMBASE			_MMIO(0x1080C0)
>  #define   GEN12_BDSM_MASK		REG_GENMASK64(63, 20)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
