Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE58D1768C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F3510E475;
	Tue, 13 Jan 2026 08:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1rVjRMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5456E10E482
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768294549; x=1799830549;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FKsZ7/c2YYqd7B+iTZGZ/2CJD+QcEC6jH1mrDC+vkEI=;
 b=d1rVjRMk0eT0J1UfYLhQoAmoOaSiL4GPPkL8I/o+WGMvcXngeadzledX
 l7ee6IisWvVcy5so9ikRhnlwPApeZjwgvs9wGlrhByIIBacHRNyAJiRHk
 l0D9pPmSNeIxAwlSBFxFvDMe8ttAywiPqprBhoyIpHk/dwkY0HUvnxR28
 rQNesXjmZoIu2G9FXtkB/Hmjm5l3db+C6q82yElwEh2QPHYtVY7uiCos4
 vTqo86MfdSaf4Edq8jI7iz/tNaUPMqFqp2aUPXo5MLeZ3ANp2ax5ZypLe
 X+lv4TQFhDe64fCWTLMmwHdiKB07HwHi8ueCp9htX5mxg9lHg7Ua6d1dW g==;
X-CSE-ConnectionGUID: EZ9H06ATS9CxSsj4czagZg==
X-CSE-MsgGUID: ATPjEGpeTf2EAKJfghZL4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69734695"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69734695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:55:49 -0800
X-CSE-ConnectionGUID: gZemEsFaTnumJhnmSSZSTw==
X-CSE-MsgGUID: LN8Z9Q5OQaWqCYdJiPfE5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204413183"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:55:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: TrainedPro <hassaananwar12345@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, TrainedPro
 <hassaananwar12345@gmail.com>
Subject: Re: [PATCH] drm/display: Bump LSPCON mode switch timeout to 1000ms
In-Reply-To: <20260111180320.4047086-1-hassaananwar12345@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260111180320.4047086-1-hassaananwar12345@gmail.com>
Date: Tue, 13 Jan 2026 10:55:43 +0200
Message-ID: <4a61f6ec7ecb9e0c25ba657098377fb2d8bf6191@intel.com>
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

On Sun, 11 Jan 2026, TrainedPro <hassaananwar12345@gmail.com> wrote:
> The Parade PS175 LSPCON chip often requires up to 800ms to settle after a mode change, particularly during resume.
>
> Although the Intel driver (intel_lspcon.c) is aware of this 800ms requirement, it calls the shared helper `drm_lspcon_set_mode()`, which currently hardcodes a 200ms timeout. This specific implementation forces a 200ms limit, effectively overriding the driver's knowledge and causing the mode change to time out prematurely, which results in a black screen (never waking up).
>
> This patch increases the hardcoded timeout in the helper from 200ms to 1000ms. Since the function polls for the status bit, this change does not penalize faster chips but ensures correct operation for slower ones like the PS175.
>
> Signed-off-by: TrainedPro <hassaananwar12345@gmail.com>

Is there an existing gitlab issue with dmesg logs about the issue? See
[1] for how to report one.

BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



> ---
>  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> index 719da3610310f..fda3cb4966adf 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -495,7 +495,7 @@ int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapte
>  {
>  	u8 data = 0;
>  	int ret;
> -	int time_out = 200;
> +	int time_out = 1000;
>  	enum drm_lspcon_mode current_mode;
>  
>  	if (mode == DRM_LSPCON_MODE_PCON)

-- 
Jani Nikula, Intel
