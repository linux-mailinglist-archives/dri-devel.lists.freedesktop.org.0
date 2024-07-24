Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D993B396
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 17:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555C610E72D;
	Wed, 24 Jul 2024 15:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOL1l47/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6253B10E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721834903; x=1753370903;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0Dj1AKzynzsxk7yAML0UPq9lQgI1l/ahyV3qibSWO8A=;
 b=YOL1l47/GxMg8xnzZCZ/U8/ffRH+npQImEXKmfv0uBXMcWRcJDxg2o/j
 FK6HNkuzjdAR3y8h6CoMllN3T8ZP6UcWct5VeBEVzyfyr1VcQkWrconcR
 2NwfXdEO0tUYKSIqk+a3a9HP71qicH9jp4xfZH4ilFCSiCDmfpymuaOyt
 +S3SbVbwgtzboEc4xIQ/+D+RUyE3Nkp3V/NvFm3Q3INR+9da3ImoobXzx
 2shrewti44bjWSDiLTbUkq/yqaroSh8d5O7luYpOTiG1myOD0DBRGHlN5
 h+sn6Lm79WkQiEeZkaho9txSdSUDkzhDwEwy9BmadTkJqv5esZcP4bHez w==;
X-CSE-ConnectionGUID: OyX2huQKTNeDyEzrU0l4tQ==
X-CSE-MsgGUID: MZNpew7OT3yOmCresudnXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="36977066"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="36977066"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:28:22 -0700
X-CSE-ConnectionGUID: /qgORqtkS7CjoqsqbSHWNg==
X-CSE-MsgGUID: 5tISUXVfToiZqZe4+htJhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="57430010"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:28:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tejas Vipin
 <tejasvipin76@gmail.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: Add quiet member to
 mipi_dsi_multi_context struct
In-Reply-To: <20240724122447.284165-2-tejasvipin76@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
 <20240724122447.284165-2-tejasvipin76@gmail.com>
Date: Wed, 24 Jul 2024 18:28:04 +0300
Message-ID: <87a5i6kdx7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 24 Jul 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
> A "quiet" member is added to mipi_dsi_multi_context which allows 
> silencing all the errors printed by the multi functions.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  include/drm/drm_mipi_dsi.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 0f520eeeaa8e..75855c1c7dae 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -217,6 +217,16 @@ struct mipi_dsi_multi_context {
>  	 * end to see if any of them failed.
>  	 */
>  	int accum_err;
> +
> +	/**
> +	 * @quiet: Controls if a function calls dev_err or not
> +	 *
> +	 * Init to 0. When the value of quiet is set to 0, the function
> +	 * will  print error messages as required. If this is set to 1,
> +	 * the function will not print error messages, but will still
> +	 * change the value of accum_err.
> +	 */
> +	int quiet;

This is being used as a bool, why not make it a bool?

BR,
Jani.


>  };
>  
>  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"

-- 
Jani Nikula, Intel
