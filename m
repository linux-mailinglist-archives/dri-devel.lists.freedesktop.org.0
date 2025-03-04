Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7480A4E257
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737E310E60F;
	Tue,  4 Mar 2025 15:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePro3jBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEB110E606;
 Tue,  4 Mar 2025 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741100845; x=1772636845;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gmfKXi/uN3J4Ca0e1IycQih3FSNe9qGMMSDN6vut8QM=;
 b=ePro3jBFl6n2Gu1cxhKIkkD582ZcJ4ejgnN3LpnUFYrJ+EaSARYMumTi
 6DTPy6DdesdyADwXRet8huR7kT6bWEIWj+DkTV8ObVscoNbU6A5l77pm1
 c/auSHq3XgR+n1bvxFxwKtQDHjp7QrWtY1Rk6kTt2vYG4dYPVk6VMB+hQ
 vJySvruTrpUmSbcUvq/7NR4q5Gl1eGyLwWmvjG4Iz2RN7JxlmCITkIubC
 cBxkSnxy8s4u0YoJQUZcDkZC1/KGuJSShDIiybslYezA0AhNHGV6nvdIj
 AmAhsv3SNscZ6+uyFxH4ej0OuyXTv8IvFr5Rzzrb+E2yiQ+Uyp7ih7UN0 Q==;
X-CSE-ConnectionGUID: D1FdZQz2SAylZZ4/ogUhHQ==
X-CSE-MsgGUID: ferqeCtXSUK9kYyfKvl90A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42215858"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="42215858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:07:12 -0800
X-CSE-ConnectionGUID: XjB+V/IwTDWa1v8K59n8yw==
X-CSE-MsgGUID: Kl6qXE/8QHC+782psMCL6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123600755"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:07:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm: strict type checking for drm_device based
 logging helpers
In-Reply-To: <cover.1737644530.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
Date: Tue, 04 Mar 2025 17:07:07 +0200
Message-ID: <87eczczvfo.fsf@intel.com>
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

On Thu, 23 Jan 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> Fix all cases that pass something other than struct drm_device to the
> drm_device based logging helpers, and add strict type checking.
>
> Gustavo Sousa (1):
>   drm/print: Include drm_device.h

This was pushed earlier, independently.

>
> Jani Nikula (4):
>   drm/mipi-dsi: stop passing non struct drm_device to drm_err() and
>     friends
>   drm/rockchip: stop passing non struct drm_device to drm_err() and
>     friends
>   drm/sched: stop passing non struct drm_device to drm_err() and friends
>   drm/print: require struct drm_device for drm_err() and friends

Series pushed to drm-misc-next, thanks for the reviews.

BR,
Jani.

>
>  drivers/gpu/drm/drm_mipi_dsi.c                | 12 +++---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   | 16 +++----
>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 16 +++----
>  drivers/gpu/drm/scheduler/sched_entity.c      |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 20 +++++----
>  include/drm/drm_print.h                       | 42 +++++++++++--------
>  6 files changed, 58 insertions(+), 50 deletions(-)

-- 
Jani Nikula, Intel
