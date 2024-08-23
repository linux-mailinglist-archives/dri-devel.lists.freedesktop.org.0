Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F423795D23E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC7910EC5F;
	Fri, 23 Aug 2024 15:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDKPf5tt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1457F10EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724428797; x=1755964797;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BrTD2koBEUbfxrau4zTlyemmxIt4YG+mE38UrWr6eFs=;
 b=lDKPf5ttQNUTnA5YDXktpegr6Rz8lJ4STF5eKPPmLuisJVNyvlHf36Tk
 hGSZ0TSG98OiISLIBDij/mWtaQWROaAcZ2Cp/wTwIsTlpezXcaPQo10r1
 RfSc4O0RMQihgSXVcgLR2s6q9M8piZpceoUiXJO6PHXTioFJ2Uf6Z0E9i
 NDCpIvKlMAdRH46tiDgsPUGe6zhwEIeGLKfGTTnYHakNpQvyMbrnIrvEj
 u8q7qGCbRTK+KtJd0BJ5xEiFlaUH06C/tS4KWRpVT/CHfF2eDwKeuMS9p
 sjmIOwpo2e11ikJTM9j+/sBkq+OVwr17ZLinNhley4PpuHynhIVeHCAhH A==;
X-CSE-ConnectionGUID: xyBmHI7RQfOmjLkX5ELYJw==
X-CSE-MsgGUID: 3UxTfdpESISQc4KzQmqN6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="13171480"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="13171480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:59:57 -0700
X-CSE-ConnectionGUID: kUn9wcutQ12dtU3VcJyeCg==
X-CSE-MsgGUID: r/r/i4wFQtCD4pv2y5GYpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66150671"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:59:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Derek Foreman <derek.foreman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, Derek Foreman
 <derek.foreman@collabora.com>
Subject: Re: [PATCH] drm/connector: hdmi: Increase HDMI_MAX_INFOFRAME_SIZE
 to 30
In-Reply-To: <20240823140308.384988-1-derek.foreman@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240823140308.384988-1-derek.foreman@collabora.com>
Date: Fri, 23 Aug 2024 18:59:48 +0300
Message-ID: <87jzg72psb.fsf@intel.com>
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

On Fri, 23 Aug 2024, Derek Foreman <derek.foreman@collabora.com> wrote:
> The DRM infoframe is 26 bytes, with a 4 byte header this gives us 30. The
> current limit of 29 prevents us from writing DRM infoframes.

Some more details would be useful. Which infoframe, etc.

BR,
Jani.

>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 +-
>  drivers/gpu/drm/drm_debugfs.c                   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 7854820089ec..cc7747d33fdf 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -521,7 +521,7 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>  
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> +#define HDMI_MAX_INFOFRAME_SIZE		30
>  
>  static int clear_device_infoframe(struct drm_connector *connector,
>  				  enum hdmi_infoframe_type type)
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..3439fd65275a 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -520,7 +520,7 @@ static const struct file_operations drm_connector_fops = {
>  	.write = connector_write
>  };
>  
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> +#define HDMI_MAX_INFOFRAME_SIZE		30
>  
>  static ssize_t
>  audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)

-- 
Jani Nikula, Intel
