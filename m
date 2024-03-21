Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACAF885C14
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 16:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3420F10E222;
	Thu, 21 Mar 2024 15:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/M7yoZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C178710E399
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035454; x=1742571454;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dOYNT79qk9MioScuYTUeX2HdGhASPtDv2e6R6SOo5sY=;
 b=k/M7yoZcStmlUl1EvcUA1Tx88+UN/l8BQ9vCSHTCwK7DSYx+4eBu7bOQ
 NtCVBKkVLHwSIPDsQO+IfzT8IUeW742u9syhO2ydSHSgtFsYRQ4qxbUew
 0kTsfachbOPCmej+eOnuY9TDowEWpY9HPxPQLaNLE7KcysKzZGJttj9DX
 GVm9oR1htYzGQUzce5p9L4AiNpSC+KsJbweAZR+2GpFi74uxiWSH+mMQ0
 qCY968uBNC4CgqgV/vri2hV+9ejlWH4K4h2O3XD1pSM4OKgymxVnjn2vR
 fYj7udPhIhU8+ZFV87ejAI9DUapZgIZADLe+V873SToizgVUgElxz8VID w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9836966"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9836966"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="15198266"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:37:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, javier.carrasco.cruz@gmail.com,
 skhan@linuxfoundation.org
Cc: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix duplicate C declaration warnings
In-Reply-To: <20240321115738.51188-1-amogh.linux.kernel.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240321115738.51188-1-amogh.linux.kernel.dev@gmail.com>
Date: Thu, 21 Mar 2024 17:37:25 +0200
Message-ID: <871q83mw96.fsf@intel.com>
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

On Thu, 21 Mar 2024, Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com> wrote:
> Fix the duplicate C declaration warnings found on
> Documentation/gpu/drm-kms.rst that was found by
> compiling htmldocs

Please paste the warnings here.

BR,
Jani.


>
> Signed-off-by: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 13d3627d8bc0..a4145f391e43 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -357,9 +357,6 @@ Format Functions Reference
>  .. kernel-doc:: include/drm/drm_fourcc.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
> -   :export:
> -
>  .. _kms_dumb_buffer_objects:
>  
>  Dumb Buffer Objects
> @@ -458,9 +455,6 @@ KMS Locking
>  .. kernel-doc:: include/drm/drm_modeset_lock.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
> -   :export:
> -
>  KMS Properties
>  ==============

-- 
Jani Nikula, Intel
