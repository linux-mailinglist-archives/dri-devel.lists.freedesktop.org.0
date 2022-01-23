Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A8497619
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 23:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E9310E554;
	Sun, 23 Jan 2022 22:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABFE10E148;
 Sun, 23 Jan 2022 22:45:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6358FD89;
 Sun, 23 Jan 2022 23:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1642977909;
 bh=Tpd2xJOyPUYI9Yn817WlPsinNuoRZkReK2xzPz5Iv2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jg+2+jLNXiq4Q8S/HfrbfExWW9Pzdl4nt5YHUe4P+NC3z3LMcaSgqtpgwljZSTd4I
 R6DOvk3xa6aAc9HhxoKyUi6jQh3Xv6+aRjrIvZnyiqD10dioGmArr3NnRKCCBeIefx
 xzYp0RAAKqcrdCREPNF4P/yFmEw9GsNLSPus8fPQ=
Date: Mon, 24 Jan 2022 00:44:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [RFC PATCH v3 3/3] drm: remove allow_fb_modifiers
Message-ID: <Ye3aZHFQQux4brrc@pendragon.ideasonboard.com>
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-4-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220114101753.24996-4-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Esaki-san,

Thank you for the patch.

On Fri, Jan 14, 2022 at 07:17:53PM +0900, Tomohito Esaki wrote:
> The allow_fb_modifiers flag is unnecessary since it has been replaced
> with cannot_support_modifiers flag.

The new flag is fb_modifiers_not_supported, not
cannot_support_modifiers.

> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  drivers/gpu/drm/drm_plane.c                      |  9 ---------
>  drivers/gpu/drm/selftests/test-drm_framebuffer.c |  1 -
>  include/drm/drm_mode_config.h                    | 16 ----------------
>  3 files changed, 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 5aa7e241971e..89a3d044ab59 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -288,15 +288,6 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  		}
>  	}
>  
> -	/* autoset the cap and check for consistency across all planes */
> -	if (format_modifier_count) {
> -		drm_WARN_ON(dev, !config->allow_fb_modifiers &&
> -			    !list_empty(&config->plane_list));
> -		config->allow_fb_modifiers = true;
> -	} else {
> -		drm_WARN_ON(dev, config->allow_fb_modifiers);
> -	}
> -

Shouldn't we keep a sanity check to ensure that drivers setting
fb_modifiers_not_supported do not pass modifiers ?

	drm_WARN_ON(dev, config->fb_modifiers_not_supported &&
		    format_modifier_count);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	plane->modifier_count = format_modifier_count;
>  	plane->modifiers = kmalloc_array(format_modifier_count,
>  					 sizeof(format_modifiers[0]),
> diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> index 61b44d3a6a61..f6d66285c5fc 100644
> --- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> +++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> @@ -323,7 +323,6 @@ static struct drm_device mock_drm_device = {
>  		.max_width = MAX_WIDTH,
>  		.min_height = MIN_HEIGHT,
>  		.max_height = MAX_HEIGHT,
> -		.allow_fb_modifiers = true,
>  		.funcs = &mock_config_funcs,
>  	},
>  };
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index da82f45351c7..5001bda9f9af 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -917,22 +917,6 @@ struct drm_mode_config {
>  	 */
>  	bool async_page_flip;
>  
> -	/**
> -	 * @allow_fb_modifiers:
> -	 *
> -	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
> -	 * Note that drivers should not set this directly, it is automatically
> -	 * set in drm_universal_plane_init().
> -	 *
> -	 * IMPORTANT:
> -	 *
> -	 * If this is set the driver must fill out the full implicit modifier
> -	 * information in their &drm_mode_config_funcs.fb_create hook for legacy
> -	 * userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
> -	 * broken for modifier aware userspace.
> -	 */
> -	bool allow_fb_modifiers;
> -
>  	/**
>  	 * @fb_modifiers_not_supported:
>  	 *

-- 
Regards,

Laurent Pinchart
