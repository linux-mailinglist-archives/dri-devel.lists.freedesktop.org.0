Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5D8A5208
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 15:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAB31125A5;
	Mon, 15 Apr 2024 13:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGkvilIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1189E1125A5;
 Mon, 15 Apr 2024 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713188682; x=1744724682;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rsGdx6yD3BC7fZxSgiVyOAwMhw2H2rbVRG7Vf/53Ayw=;
 b=EGkvilIeZntLG1ZT6TdJ66cBqUHjG0AOAO6tfsG157aKF3D+YhD/dRC2
 VnYvgrwL61lMaivh5UvABe0Ab+CEB3d/CybtjmKIGtFvr3gLILv2rtEeG
 hErEd/F+TFs8FbxLrhOHv/DyKar8P+LOyrOYINX265rDJId9x28i9Gcsa
 VrFqZxAwaBiAiwoNdeWUIsnjiR6FdfaJ7PIo7BJ51xgU6xuZcDE8zIlgn
 Sz7/WUdbjagbI3qW4hsVmK9pZBMHMqlikLWmsmGSLN9pi3HiM6kf8U8tm
 K3/yvCv9sESlUGgHHHQDs1XGC3b+5F6DKRswzjG2hyQtUWT9uclTHQgA4 w==;
X-CSE-ConnectionGUID: B683LIwfSYuHAygPFQG4Sg==
X-CSE-MsgGUID: f9zIxNDeQvGPqAFwdr749A==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26036650"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26036650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 06:44:41 -0700
X-CSE-ConnectionGUID: sCH522LETumbe32L0tZunQ==
X-CSE-MsgGUID: j2W0Qo42QvSt1OwF3UI/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22394590"
Received: from lcariou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.121])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 06:44:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/7] drm: debug logging improvements
In-Reply-To: <cover.1712568037.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1712568037.git.jani.nikula@intel.com>
Date: Mon, 15 Apr 2024 16:44:29 +0300
Message-ID: <875xwi3flu.fsf@intel.com>
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

On Mon, 08 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of [1], dropping drm_mode_print() stuff altogether, and switching to
> DRM_MODE_FMT/DRM_MODE_ARG() in a separate patch. Also add a few more drm
> device based logging conversion patches, so the last patch makes more sense.

Thanks for the reviews, pushed the lot to drm-misc-next.

BR,
Jani.

>
> BR,
> Jani.
>
> [1] https://patchwork.freedesktop.org/series/130881/
>
> Jani Nikula (7):
>   drm/probe-helper: switch to drm device based logging
>   drm/modes: switch to drm device based error logging
>   drm/sysfs: switch to drm device based logging
>   drm/client: switch to drm device based logging, and more
>   drm/crtc: switch to drm device based logging
>   drm/crtc-helper: switch to drm device based logging and warns
>   drm: prefer DRM_MODE_FMT/ARG over drm_mode_debug_printmodeline()
>
>  drivers/gpu/drm/drm_atomic_uapi.c    |   6 +-
>  drivers/gpu/drm/drm_client_modeset.c | 129 +++++++++++++++------------
>  drivers/gpu/drm/drm_crtc.c           |  38 ++++----
>  drivers/gpu/drm/drm_crtc_helper.c    | 100 +++++++++++----------
>  drivers/gpu/drm/drm_modes.c          |  40 ++++-----
>  drivers/gpu/drm/drm_probe_helper.c   |  39 ++++----
>  drivers/gpu/drm/drm_sysfs.c          |  20 ++---
>  7 files changed, 193 insertions(+), 179 deletions(-)

-- 
Jani Nikula, Intel
