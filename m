Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAC462EA2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D5B6E0C8;
	Tue, 30 Nov 2021 08:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639796E9A0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:38:15 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o20so83077694eds.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=heplViuVuUTSUcpT2+Fmm0bTuboMvINSnURYbdaCaqQ=;
 b=B2KGp+GAMKVzg/2mSgXYjc7SNCvlVPjJ6amaerWAvXG4vPqiN3EV8sQTomgILduZ0p
 K7R8lIAwGoBgxBX7yW9Fn50vb++FmAbR+eR6tBHmPkELDy/5RQQyWkblmJSNtxhM/dWw
 KiTriQEbBAgobbow9MrcN82Er9dV8iYZhENpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=heplViuVuUTSUcpT2+Fmm0bTuboMvINSnURYbdaCaqQ=;
 b=0GF13Wbw9CPaS3jsZMKChnSCSlXMcAYKnOFNaGfawUyE+xBz0d7PT0ZTNtAxFtGr22
 6nZe6VrMiedjbFInRwRQBI16qsMy/S3ao6eC0q3VgPsrtm2k1eApwOr2zhTyEBrv46Qx
 d75i8Z1BX9gKoI0DUQKN2kbjmV0BEeonmjSxhc5b+4XX9EPNd/0PTx86GmCmG5E5qqP8
 Dt9ACMrb6BesBzLvV38VvlkUL1+vuXky9GoFfsvF1vYPJ6rVcBWvTGEZtv4kT7rq3WbC
 ycIQhbuxLbNIEU36MpGhf/fkFBIN66fKC0qKp2S/RRbKHLZ3E92yICOj//9NetvWmi3X
 f6nQ==
X-Gm-Message-State: AOAM531GbwUSOIqzOgkXVAC5cxnOojlYp+Dn3/dhHzTfhLOOQUyhJ9fG
 MdVv1Z6InJAMo5oiSEai7Af92A==
X-Google-Smtp-Source: ABdhPJzFUZPOd2k/BSSZubG9ypTkB/vBGosz5jOJWqwCksjMpY207KPkdXOtcPR7IDaf9jugoi6wzg==
X-Received: by 2002:a05:6402:2806:: with SMTP id
 h6mr80656862ede.120.1638261493998; 
 Tue, 30 Nov 2021 00:38:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x7sm12600105edd.28.2021.11.30.00.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:38:13 -0800 (PST)
Date: Tue, 30 Nov 2021 09:38:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Claudio Suarez <cssk@net-c.es>
Subject: Re: [PATCH] drm: fix error found in some cases after the patch
 d1af5cd86997
Message-ID: <YaXi803g7iv9MxWR@phenom.ffwll.local>
Mail-Followup-To: Claudio Suarez <cssk@net-c.es>,
 dri-devel@lists.freedesktop.org, 0day robot <lkp@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>
References: <YaC7zXW119tlzfVh@gineta.localdomain>
 <20211128142015.GB5295@xsang-OptiPlex-9020>
 <YaUpsaP7hng6zpFh@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaUpsaP7hng6zpFh@gineta.localdomain>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: 0day robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 08:27:45PM +0100, Claudio Suarez wrote:
> The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
> calls in drm core, files drm_a*.c") fails when the drm_device
> cannot be found in the parameter plane_state. Fix it.
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core, files drm_a*.c")
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index aef2fbd676e5..8bd4472d7949 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -312,7 +312,7 @@ update_connector_routing(struct drm_atomic_state *state,
>  
>  	if (!new_connector_state->crtc) {
>  		drm_dbg_atomic(connector->dev, "Disabling [CONNECTOR:%d:%s]\n",
> -				connector->base.id, connector->name);
> +			       connector->base.id, connector->name);

Can you pls split this checkpatch fix out?

>  
>  		set_best_encoder(state, new_connector_state, NULL);
>  
> @@ -805,6 +805,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					bool can_update_disabled)
>  {
>  	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_device *dev = plane_state->plane ? plane_state->plane->dev : NULL;

For real drivers plane_state->plane really should never be NULL, and
looking at the test report we blow up in an selftest. I think the right
fix here is to make the selftest more robust and also mock a drm_plane
(with a NULL plane->dev pointer, that should be fine).

Can you pls spin that and test it with the selftests enabled in the
config?

Thanks, Daniel

>  	struct drm_rect *src = &plane_state->src;
>  	struct drm_rect *dst = &plane_state->dst;
>  	unsigned int rotation = plane_state->rotation;
> @@ -828,8 +829,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  	}
>  
>  	if (!crtc_state->enable && !can_update_disabled) {
> -		drm_dbg_kms(plane_state->crtc->dev,
> -			       "Cannot update plane of a disabled CRTC.\n");
> +		drm_dbg_kms(dev, "Cannot update plane of a disabled CRTC.\n");
>  		return -EINVAL;
>  	}
>  
> @@ -839,8 +839,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
>  	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>  	if (hscale < 0 || vscale < 0) {
> -		drm_dbg_kms(plane_state->crtc->dev,
> -			       "Invalid scaling of plane\n");
> +		drm_dbg_kms(dev, "Invalid scaling of plane\n");
>  		drm_rect_debug_print("src: ", &plane_state->src, true);
>  		drm_rect_debug_print("dst: ", &plane_state->dst, false);
>  		return -ERANGE;
> @@ -864,8 +863,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  		return 0;
>  
>  	if (!can_position && !drm_rect_equals(dst, &clip)) {
> -		drm_dbg_kms(plane_state->crtc->dev,
> -			       "Plane must cover entire CRTC\n");
> +		drm_dbg_kms(dev, "Plane must cover entire CRTC\n");
>  		drm_rect_debug_print("dst: ", dst, false);
>  		drm_rect_debug_print("clip: ", &clip, false);
>  		return -EINVAL;
> -- 
> 2.33.0
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
