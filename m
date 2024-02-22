Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11AA86045C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E31710EA74;
	Thu, 22 Feb 2024 21:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrLU0xxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E422D10E4D9;
 Thu, 22 Feb 2024 21:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708636070; x=1740172070;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4IvJCF5Aq0TRw9lTN5U4M088kq9B9+GmnbzPDyMZyUA=;
 b=WrLU0xxisspsK4XZ53pC9x3TEgAHKdp0tjwBtjf0Ll2Bllmp85tTBFVk
 GN8zJNPY7ydR3lMFOG5VFO4HaaAoNF0SqiE4/EX9zWfsrgKVeAzXE5/Kz
 +UJll20Hxjd1vwTy0u44Tl9skMdrOqKO6h3nYH5+w5QcVSqSAGgj9U07d
 cKzwbceD4GSQzjHFS+F5a964FMkF5hztF5xbc2FDeNKT93yCY6tf3BphE
 Hbq2tlI8lnyZSC+5Mo4E+n4B70mOJb3ZRvlvxxIpSCBujIl74lte//3Nr
 pHLy2z/+dvS9R79jDGx+SmxIP4GjBor3Ki+vUg/DxLbO/8n2GAbxtgSBM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14030375"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="14030375"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 13:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5800491"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 13:07:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:07:48 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:07:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 13:07:47 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 13:07:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GylvaS6IZVxOgDnggXBxuPZV0LUB3eAVD5b6GfAhyMFsFhtx5Z+mzkEQLR+LTmhXZ+IgBAMiZnK9XMbhj8DG+sV0Qbk2Tg6IZQvHBuMjjhrttaE/jFv9G/87JEQhZgba+57OW/p0hkCmqn5QuitrHYAb0MbylBJJxownnmL5zK6d9Jg75PEgCqDT0ZxCvQzuYnWyfil3MOyOP1ff7/a72HWmqHLDNrLK8M34SWrxgAyJBi/7IAYHJv49lGuX9FUNcGKnNfWlJrBVWVSvaKdgWF02ibVa7H/3djYJ/oD789miNAvOJ56UORifkZ9L54+mnJPsS8yJMTU6Yuo+2NG0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RM0+wpzkvDVSsDT98SxdgKM0dOV8Fa6VAzkRAG75hZY=;
 b=QaZo0eAYHPXZ/Kxz5upc7ZgbjFzGsiuIeEDa5O5iTqogcWI+zh3jP/NVTJrsZOZypph598s1SxX+fAtVZMqeFKxhtf7nB51o1UXkdFbai8qQHSGBp+iCHC/X7qlU3iPWyFHbqz9Z4OyuLj6wGxOpV8n5Z46M4zIUo1pi0/HPi5TvhlTeTU2tqiqJX1K2OKFtqI1OrdoN8PBYguUkII6ZT/xMp6PQMQWZRt0q5NIqyeRthNI0voywwVyRjkjjhZfxOvYwBfOf4sypRDnJBB8uT7LW+biE0Q/za504pxxg8tCUkI/gHlqi2Ac2OxWc5q2d1odEm7lfMTFYwS9RoOhpmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 21:07:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 21:07:44 +0000
Date: Thu, 22 Feb 2024 16:07:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH 2/2] drm/i915: Support replaying GPU hangs with captured
 context image
Message-ID: <Zde3nGm2xFPRivuB@intel.com>
References: <20240221142245.2331484-1-tvrtko.ursulin@linux.intel.com>
 <20240221142245.2331484-3-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221142245.2331484-3-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f320be-40b0-49e9-0f1a-08dc33ea507a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twIXGCyESTrxpGzvxWaH/gZDYeRydaDvSi2uRl9VFOxUbGz54O3deBYeALGE0uAZGpXtorsIbe4V4NuBeItQNU4Ixp0OeYmbMatmNvdOYfdrnWSBM6+xYqz46dY5DP58uHRXsC01IESqMTjz/pweUqAyXINrOP+KNxCGj8c/MPg4+FXEZGTjtJhXOtiNim8yFRnm6eD15H8MXuZWVlGscPVlPyFvKl2omh5JxrNZCeztOlxiLYH/yPgnwxLKOArlOInVTteev1AvPATmLB2aUZrxDOM5ndhfCAXWtQLBqBlYBFvi6GD/Bolj+lNgUvQT6UZIy91ZyxD1bkzgUseIQkdn8PKSnZrs40qOYuoF1Ti6JaEcKOejV1nzSM5QIbZGDtX+wqOJP6hFitc6GFBbAIVsCVNwjAwn9Q3D6TBOzhSZluHjYadiaadGPWjuvLhJ4QkViJL0X/l3N6egG7Cs4cRNdH3hcjIo+LTWLuYwVAHKSAWxvw1YmxWAVzWwf+JgLOok/JhwksR3ijMVqBmu4131GjFVAbZ1/T0j/S1Ofn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?41U6dCihlUmd9IS/O8jrQXUMPXIrMI/f2E4h/TLohsUmvKhH5QK+mLUp2N/G?=
 =?us-ascii?Q?qvAz7qjJTDJwGBvnAJYf+zAd4Q+H3oZ3wth3jLpTYuBrD9/3QHxj69PgiuWx?=
 =?us-ascii?Q?n97Z23fuod9uJT+LrkEaw0m7x1krAlkEZxStLdPj1OZOqNDhTkKTpt8sEn3I?=
 =?us-ascii?Q?AuQ+imjX8S9haBXHraQl/j6BS+CPbwbFyIVzZHLLAuL++9HhS1Hz1095tvvO?=
 =?us-ascii?Q?H+LI1oP69JmlwPOrpp5IOLm6KmYyIAdifxNTjKITCtnLzk/6EVCpsiHcxTKQ?=
 =?us-ascii?Q?91DZaMjPDnAun2m4U28ccy+Ksm+nLlbVPgTQURQ8aDyK5nLUBKFIhXTVm8HP?=
 =?us-ascii?Q?Ni8j4lOrI5fOEdUiP1QE+PR8P6GNfJedbq45lTYvnMtFDyLj1EBt5GErqy4F?=
 =?us-ascii?Q?GX0AJ1mmOTvxImEmAth3NDP1GCBtOFbNuOdD+jXufGboul52vaCd1veE904s?=
 =?us-ascii?Q?KPPVFLUloK+QxvKs5hg3MOXLNEXGw1QPe5uvOh0QgcbjZjDb83QZ7ioPubgH?=
 =?us-ascii?Q?w0GzZO9pjuOysnDeEG0I5l2u8bdZFgBBCh9FEqwnnWkH9KYbOWBUUKXKN6H9?=
 =?us-ascii?Q?ADrhwnQVqUNXI3ZelBwa2SJsiyA6cqkseuaqtYp9UOGOHOwELYvOmwEmuCd+?=
 =?us-ascii?Q?pa3JfWJaXsBR3fYLfMxrTHz1MQBqoph2BtpTzUu3mJ19opdjgBeFwhur64q+?=
 =?us-ascii?Q?M0N6UH6fz5VB6zWJBa8NTl0HK/z8CxQ4m0b6WaqWk5UHtRo3A7YrsXr04K0Z?=
 =?us-ascii?Q?ICH5PLep54syvVSai+sw2Q3YvzmV0rpSwHjmSFHgP0JWoqtPYi+OvTU9TNdX?=
 =?us-ascii?Q?hvDbhLCJQpqJvZi9oObeH45C2tdh7JHgOByTUxqN1cVLZ1xb5+eyzxn6PzG0?=
 =?us-ascii?Q?p189GLhDPUbDCzTfAb7Ly0ZJBvB1L2aVcTVGZiwlLcTAJXKVmBhzTsFMJlWG?=
 =?us-ascii?Q?8bPCMBJljQbzIGPAPk4m84yphlGLJiaM2TLu8/tRiSbRspwhK+mB9gdNe1HL?=
 =?us-ascii?Q?0USkGOCzWUX55PZkcB03i0e551fiGTBdjcQfGL6BLVUKPMfBbnFZzldUkzMR?=
 =?us-ascii?Q?sPjy5Aym9AjpxFe1Pa6USBhvJ0cM8bboVx0e/eGanYiO3FvGyJfXWicz+mFW?=
 =?us-ascii?Q?EJVrCABz0BAyh8lHSWRsPCZT3r6iYe1NbBUd6aMmVPvIQWaf0rjwwR13PE3s?=
 =?us-ascii?Q?j9IFcwUFCsVlLAMah7YAQapAx2O7GzjiRleWkVEnamc3qYI8i6EmM2LRUKGv?=
 =?us-ascii?Q?dJZfcIK9f//ev59hSiHvbWFral1tJ29nCnKcCiZOmwAn5yeazFiAQQEX3e0D?=
 =?us-ascii?Q?lFIrGTLo0lwbEckKLA5wrA53OZTvbOtiYrEyYwNLhgtYnmioKLkNhlC+3ctx?=
 =?us-ascii?Q?HK7NwhYw9+NAononv+sfNYDhEqJCVRycgOLAxvZAMh1s0CRUfd/5A6lYlOsK?=
 =?us-ascii?Q?lHSqfA8qnHdQr1JQhyTm4MU5si2xbSgZdquwCvSq8YsgHtuGDWBHT8wrHykP?=
 =?us-ascii?Q?kwdEYJvB/e8QtcgBpWp17FOZaELvnv7sflAtLt0UI39C5y6wN5AnBjqCjjWf?=
 =?us-ascii?Q?Z1QLQnEXIcLWc+CriLu3pcaIf2WgpiKf/08mBJv9pMd3SJudgfRr/9vL6g1d?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f320be-40b0-49e9-0f1a-08dc33ea507a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 21:07:44.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhRgpRD7P78F/+1wrJ9vE1rL/w8y1aauN7UxATws9kL4a9IiivnreS4NwrswSdQAq1ErRRQB4oCdRG7Yz1o6xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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

On Wed, Feb 21, 2024 at 02:22:45PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> When debugging GPU hangs Mesa developers are finding it useful to replay
> the captured error state against the simulator. But due various simulator
> limitations which prevent replicating all hangs, one step further is being
> able to replay against a real GPU.
> 
> This is almost doable today with the missing part being able to upload the
> captured context image into the driver state prior to executing the
> uploaded hanging batch and all the buffers.
> 
> To enable this last part we add a new context parameter called
> I915_CONTEXT_PARAM_CONTEXT_IMAGE. It follows the existing SSEU
> configuration pattern of being able to select which context to apply
> against, paired with the actual image and its size.
> 
> Since this is adding a new concept of debug only uapi, we hide it behind
> a new kconfig option and also require activation with a module parameter.
> Together with a warning banner printed at driver load, all those combined
> should be sufficient to guard against inadvertently enabling the feature.
> 
> In terms of implementation we allow the legacy context set param to be
> used since that removes the need to record the per context data in the
> proto context, while still allowing flexibility of specifying context
> images for any context.
> 
> Mesa MR using the uapi can be seen at:
>   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27594
> 
> v2:
>  * Fix whitespace alignment as per checkpatch.
>  * Added warning on userspace misuse.
>  * Rebase for extracting ce->default_state shadowing.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Carlos Santa <carlos.santa@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1

still valid for v2. Thanks for splitting the patch.

> ---
>  drivers/gpu/drm/i915/Kconfig.debug            |  17 +++
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 113 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
>  drivers/gpu/drm/i915/gt/intel_context.h       |  22 ++++
>  drivers/gpu/drm/i915/gt/intel_context_types.h |   1 +
>  drivers/gpu/drm/i915/gt/intel_lrc.c           |   3 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |   3 +-
>  drivers/gpu/drm/i915/i915_params.c            |   5 +
>  drivers/gpu/drm/i915/i915_params.h            |   3 +-
>  include/uapi/drm/i915_drm.h                   |  27 +++++
>  10 files changed, 193 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 5b7162076850..32e9f70e91ed 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -16,6 +16,23 @@ config DRM_I915_WERROR
>  
>  	  If in doubt, say "N".
>  
> +config DRM_I915_REPLAY_GPU_HANGS_API
> +	bool "Enable GPU hang replay userspace API"
> +	depends on DRM_I915
> +	depends on EXPERT
> +	default n
> +	help
> +	  Choose this option if you want to enable special and unstable
> +	  userspace API used for replaying GPU hangs on a running system.
> +
> +	  This API is intended to be used by userspace graphics stack developers
> +	  and provides no stability guarantees.
> +
> +	  The API needs to be activated at boot time using the
> +	  enable_debug_only_api module parameter.
> +
> +	  If in doubt, say "N".
> +
>  config DRM_I915_DEBUG
>  	bool "Enable additional driver debugging"
>  	depends on DRM_I915
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index dcbfe32fd30c..481aacbc1772 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -78,6 +78,7 @@
>  #include "gt/intel_engine_user.h"
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_ring.h"
> +#include "gt/shmem_utils.h"
>  
>  #include "pxp/intel_pxp.h"
>  
> @@ -949,6 +950,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -2092,6 +2094,95 @@ static int get_protected(struct i915_gem_context *ctx,
>  	return 0;
>  }
>  
> +static int set_context_image(struct i915_gem_context *ctx,
> +			     struct drm_i915_gem_context_param *args)
> +{
> +	struct i915_gem_context_param_context_image user;
> +	struct intel_context *ce;
> +	struct file *shmem_state;
> +	unsigned long lookup;
> +	void *state;
> +	int ret = 0;
> +
> +	if (!IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API))
> +		return -EINVAL;
> +
> +	if (!ctx->i915->params.enable_debug_only_api)
> +		return -EINVAL;
> +
> +	if (args->size < sizeof(user))
> +		return -EINVAL;
> +
> +	if (copy_from_user(&user, u64_to_user_ptr(args->value), sizeof(user)))
> +		return -EFAULT;
> +
> +	if (user.mbz)
> +		return -EINVAL;
> +
> +	if (user.flags & ~(I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX))
> +		return -EINVAL;
> +
> +	lookup = 0;
> +	if (user.flags & I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX)
> +		lookup |= LOOKUP_USER_INDEX;
> +
> +	ce = lookup_user_engine(ctx, lookup, &user.engine);
> +	if (IS_ERR(ce))
> +		return PTR_ERR(ce);
> +
> +	if (user.size < ce->engine->context_size) {
> +		ret = -EINVAL;
> +		goto out_ce;
> +	}
> +
> +	if (drm_WARN_ON_ONCE(&ctx->i915->drm,
> +			     test_bit(CONTEXT_ALLOC_BIT, &ce->flags))) {
> +		/*
> +		 * This is racy but for a debug only API, if userspace is keen
> +		 * to create and configure contexts, while simultaneously using
> +		 * them from a second thread, let them suffer by potentially not
> +		 * executing with the context image they just raced to apply.
> +		 */
> +		ret = -EBUSY;
> +		goto out_ce;
> +	}
> +
> +	state = kmalloc(ce->engine->context_size, GFP_KERNEL);
> +	if (!state) {
> +		ret = -ENOMEM;
> +		goto out_ce;
> +	}
> +
> +	if (copy_from_user(state, u64_to_user_ptr(user.image),
> +			   ce->engine->context_size)) {
> +		ret = -EFAULT;
> +		goto out_state;
> +	}
> +
> +	shmem_state = shmem_create_from_data(ce->engine->name,
> +					     state, ce->engine->context_size);
> +	if (IS_ERR(shmem_state)) {
> +		ret = PTR_ERR(shmem_state);
> +		goto out_state;
> +	}
> +
> +	if (intel_context_set_own_state(ce)) {
> +		ret = -EBUSY;
> +		fput(shmem_state);
> +		goto out_state;
> +	}
> +
> +	ce->default_state = shmem_state;
> +
> +	args->size = sizeof(user);
> +
> +out_state:
> +	kfree(state);
> +out_ce:
> +	intel_context_put(ce);
> +	return ret;
> +}
> +
>  static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  			struct i915_gem_context *ctx,
>  			struct drm_i915_gem_context_param *args)
> @@ -2144,6 +2235,10 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  		ret = set_persistence(ctx, args);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
> +		ret = set_context_image(ctx, args);
> +		break;
> +
>  	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
> @@ -2488,6 +2583,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_ENGINES:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -2600,5 +2696,22 @@ int __init i915_gem_context_module_init(void)
>  	if (!slab_luts)
>  		return -ENOMEM;
>  
> +	if (IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)) {
> +		pr_notice("**************************************************************\n");
> +		pr_notice("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **\n");
> +		pr_notice("**                                                          **\n");
> +		if (i915_modparams.enable_debug_only_api)
> +			pr_notice("** i915.enable_debug_only_api is intended to be set         **\n");
> +		else
> +			pr_notice("** CONFIG_DRM_I915_REPLAY_GPU_HANGS_API builds are intended **\n");
> +		pr_notice("** for specific userspace graphics stack developers only!   **\n");
> +		pr_notice("**                                                          **\n");
> +		pr_notice("** If you are seeing this message please report this to the **\n");
> +		pr_notice("** provider of your kernel build.                           **\n");
> +		pr_notice("**                                                          **\n");
> +		pr_notice("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **\n");
> +		pr_notice("**************************************************************\n");
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index a2f1245741bb..b1b8695ba7c9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -27,6 +27,8 @@ static void rcu_context_free(struct rcu_head *rcu)
>  	struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
>  
>  	trace_intel_context_free(ce);
> +	if (intel_context_has_own_state(ce))
> +		fput(ce->default_state);
>  	kmem_cache_free(slab_ce, ce);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 25564c01507e..9f523999acd1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -375,6 +375,28 @@ intel_context_clear_nopreempt(struct intel_context *ce)
>  	clear_bit(CONTEXT_NOPREEMPT, &ce->flags);
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)
> +static inline bool intel_context_has_own_state(const struct intel_context *ce)
> +{
> +	return test_bit(CONTEXT_OWN_STATE, &ce->flags);
> +}
> +
> +static inline bool intel_context_set_own_state(struct intel_context *ce)
> +{
> +	return test_and_set_bit(CONTEXT_OWN_STATE, &ce->flags);
> +}
> +#else
> +static inline bool intel_context_has_own_state(const struct intel_context *ce)
> +{
> +	return false;
> +}
> +
> +static inline bool intel_context_set_own_state(struct intel_context *ce)
> +{
> +	return true;
> +}
> +#endif
> +
>  u64 intel_context_get_total_runtime_ns(struct intel_context *ce);
>  u64 intel_context_get_avg_runtime_ns(struct intel_context *ce);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index b179178680a5..d91b33c3664c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -132,6 +132,7 @@ struct intel_context {
>  #define CONTEXT_PERMA_PIN		11
>  #define CONTEXT_IS_PARKING		12
>  #define CONTEXT_EXITING			13
> +#define CONTEXT_OWN_STATE		14
>  
>  	struct {
>  		u64 timeout_us;
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index d4eb822d20ae..1038659754f8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1173,7 +1173,8 @@ int lrc_alloc(struct intel_context *ce, struct intel_engine_cs *engine)
>  
>  	GEM_BUG_ON(ce->state);
>  
> -	ce->default_state = engine->default_state;
> +	if (!intel_context_has_own_state(ce))
> +		ce->default_state = engine->default_state;
>  
>  	vma = __lrc_alloc_state(ce, engine);
>  	if (IS_ERR(vma))
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 8625e88e785f..72277bc8322e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -569,7 +569,8 @@ static int ring_context_alloc(struct intel_context *ce)
>  {
>  	struct intel_engine_cs *engine = ce->engine;
>  
> -	ce->default_state = engine->default_state;
> +	if (!intel_context_has_own_state(ce))
> +		ce->default_state = engine->default_state;
>  
>  	/* One ringbuffer to rule them all */
>  	GEM_BUG_ON(!engine->legacy.ring);
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index de43048543e8..afd95b2b7e4b 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -134,6 +134,11 @@ i915_param_named_unsafe(lmem_size, uint, 0400,
>  i915_param_named_unsafe(lmem_bar_size, uint, 0400,
>  			"Set the lmem bar size(in MiB).");
>  
> +#if IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)
> +i915_param_named(enable_debug_only_api, bool, 0400,
> +		 "Enable support for unstable debug only userspace API. (default:false)");
> +#endif
> +
>  static void _param_print_bool(struct drm_printer *p, const char *name,
>  			      bool val)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 1315d7fac850..e2cdf12ce611 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -64,7 +64,8 @@ struct drm_printer;
>  	/* leave bools at the end to not create holes */ \
>  	param(bool, enable_hangcheck, true, 0600) \
>  	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
> -	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
> +	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0) \
> +	param(bool, enable_debug_only_api, false, IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API) ? 0400 : 0)
>  
>  #define MEMBER(T, member, ...) T member;
>  struct i915_params {
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 2ee338860b7e..e194d17c3568 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2154,6 +2154,15 @@ struct drm_i915_gem_context_param {
>  	__u64 value;
>  };
>  
> +/*
> + * I915_CONTEXT_PARAM_CONTEXT_IMAGE:
> + *
> + * Allows userspace to provide own context images.
> + *
> + * Note that this is a debug API not available on production kernel builds.
> + */
> +#define I915_CONTEXT_PARAM_CONTEXT_IMAGE	0xe
> +
>  /*
>   * Context SSEU programming
>   *
> @@ -2549,6 +2558,24 @@ struct i915_context_param_engines {
>  	struct i915_engine_class_instance engines[N__]; \
>  } __attribute__((packed)) name__
>  
> +struct i915_gem_context_param_context_image {
> +	/** @engine: Engine class & instance to be configured. */
> +	struct i915_engine_class_instance engine;
> +
> +	/** @flags: One of the supported flags or zero. */
> +	__u32 flags;
> +#define I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX (1u << 0)
> +
> +	/** @size: Size of the image blob pointed to by @image. */
> +	__u32 size;
> +
> +	/** @mbz: Must be zero. */
> +	__u32 mbz;
> +
> +	/** @image: Userspace memory containing the context image. */
> +	__u64 image;
> +} __attribute__((packed));
> +
>  /**
>   * struct drm_i915_gem_context_create_ext_setparam - Context parameter
>   * to set or query during context creation.
> -- 
> 2.40.1
> 
