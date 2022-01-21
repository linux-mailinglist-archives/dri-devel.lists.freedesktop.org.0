Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D23495CBC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 10:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8407410E9A5;
	Fri, 21 Jan 2022 09:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BBD10E9B1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642756943; x=1674292943;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yFEgTvrmIGJ6x1xe+adHTWkOvIDQuYBUOh2IRBFVbsQ=;
 b=MdFs72AGbd5Ho03OpNg08x90Tp3EZl+2dgRdWmYeXo5CadnIm+XlI/YL
 x13vEoUXSRv3DQ1ju391zHWwiXz7mOwff9z2219b3+eVd+sLEncvm5dm7
 NnG8/P5pHaD21/iTjZTKn4v/VBApVuBB+BMdOjBvFhdUIvfjwl8nQ0MMg
 OaLfVWqD0qNfRxazhzj5GEkttJZj03EKF4BsIBit8Qzo0EA6JlOOAeUGV
 dRLJvWtcO16I9w8DGh+M5Es1jCTGGEslFJKrz9K1ZLXL0j7WP35mIkgfp
 Oi1dNxRzxWn4TfDpDopg0YJa7UmmnUvluIIJvCtDX4tGxIpdR4Spu6lE2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245830544"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="245830544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:22:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533202503"
Received: from chandra2-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:22:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH] drm: Update docs after moving DisplayPort helpers around
In-Reply-To: <20220120113647.22484-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220120113647.22484-1-tzimmermann@suse.de>
Date: Fri, 21 Jan 2022 11:22:13 +0200
Message-ID: <878rv94f5m.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> DRM's DisplayPort helpers moved into the subdirectory dp/. Change
> the documentation accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Thanks.

Tested-by: Jani Nikula <jani.nikula@intel.com>

I didn't actually check the generated html, but the errors are gone. ;)

> ---
>  Documentation/gpu/drm-kms-helpers.rst | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 5bb55ec1b9b5..c3ce91eecbc1 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -232,34 +232,34 @@ HDCP Helper Functions Reference
>  Display Port Helper Functions Reference
>  =======================================
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp.c
>     :doc: dp helpers
>  
> -.. kernel-doc:: include/drm/drm_dp_helper.h
> +.. kernel-doc:: include/drm/dp/drm_dp_helper.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp.c
>     :export:
>  
>  Display Port CEC Helper Functions Reference
>  ===========================================
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_cec.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_cec.c
>     :doc: dp cec helpers
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_cec.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_cec.c
>     :export:
>  
>  Display Port Dual Mode Adaptor Helper Functions Reference
>  =========================================================
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_dual_mode_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
>     :doc: dp dual mode helpers
>  
> -.. kernel-doc:: include/drm/drm_dp_dual_mode_helper.h
> +.. kernel-doc:: include/drm/dp/drm_dp_dual_mode_helper.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_dual_mode_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
>     :export:
>  
>  Display Port MST Helpers
> @@ -268,19 +268,19 @@ Display Port MST Helpers
>  Overview
>  --------
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :doc: dp mst helper
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :doc: Branch device and port refcounting
>  
>  Functions Reference
>  -------------------
>  
> -.. kernel-doc:: include/drm/drm_dp_mst_helper.h
> +.. kernel-doc:: include/drm/dp/drm_dp_mst_helper.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :export:
>  
>  Topology Lifetime Internals
> @@ -289,7 +289,7 @@ Topology Lifetime Internals
>  These functions aren't exported to drivers, but are documented here to help make
>  the MST topology helpers easier to understand
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :functions: drm_dp_mst_topology_try_get_mstb drm_dp_mst_topology_get_mstb
>                 drm_dp_mst_topology_put_mstb
>                 drm_dp_mst_topology_try_get_port drm_dp_mst_topology_get_port

-- 
Jani Nikula, Intel Open Source Graphics Center
