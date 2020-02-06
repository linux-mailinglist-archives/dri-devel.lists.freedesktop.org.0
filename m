Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0411545A6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 15:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB4D6FA5A;
	Thu,  6 Feb 2020 14:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AEA6FA5A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 14:01:45 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id i126so5045969ywe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 06:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DRB074YSrrw/Ajxbs86TrGm+cCr0lMPv565TdcUESKg=;
 b=SNO7Opxbqqr4USlH83nYZoF8Y/k3VNM1/AJNyi744lvue8HQAM51fJoc9sEosvRjFg
 +c0VwftSCxrSYWER5VkCTAr0Cp7KG6d7nYGuIIxKGAqI6ZGBKo7ozDQJtTYjTi+DGKlm
 0rBl1XN6C7x96HGnj20QkKLpYjFIpo4atXb42xL1763ihEgyuOKUrjWnpyX3U8OUzNqU
 XGs69QadXJG9DpydCEOZVMCXzdJxlo5m6s4QNFnxlfglpt+ktXv5yjdu60b/9FUaW6gF
 sg6Sik5l1eiN65KhjjBywlodgftu087eQ1BUGc+m6Z4vpsdUGq7x2/FE6s7ulU5gqIij
 1YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DRB074YSrrw/Ajxbs86TrGm+cCr0lMPv565TdcUESKg=;
 b=s62u6100nQHyZWcyU0y0gAU2FIR96v4qSIdMvJgvd65dartztuIajuPwbszslyMvN+
 jimr+B9rpPHpdo+CL8qlwp+QUqO8/ZYFH0WIckvHVgklRrmE0w3kSL2impQtQsg/5t66
 +Eni3ZbsBQvtH2aVtlth2ZkHDTIzy7RH/ZzwCxLN1zc/lSyOiaTFtMaMeuPfv/PpK77T
 zw6GdHevi3ftR8MQT2/3oy2atiPRrDGcCT/7uWEwgkSrnZuRsOcmjgzgQUWsF9fFcyCW
 aFiWCw1VOTaJZekTS5XqWscduGXL6CMy9e4THwNHXjid7LnNxgq+NXHJMoOD6cDm/lpv
 qLRg==
X-Gm-Message-State: APjAAAXEcbfl2D9gkesINSBcRPGWjOJQSOlAcq2gG8Pt22fbAEHOJPop
 3HJ9qH9v3M+T8yFeRHHMdmoEqg==
X-Google-Smtp-Source: APXvYqxJ+qRIn5vw9ovBPy9eJ6PeFCEu6ye2FTwRuxN+5nN5TWx37YeBqVpz08U44oMti/32NqN4jw==
X-Received: by 2002:a81:37d3:: with SMTP id e202mr3220444ywa.292.1580997703374; 
 Thu, 06 Feb 2020 06:01:43 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id m137sm1471226ywd.108.2020.02.06.06.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 06:01:42 -0800 (PST)
Date: Thu, 6 Feb 2020 09:01:40 -0500
From: Sean Paul <sean@poorly.run>
To: evanbenn@google.com
Subject: Re: [PATCH] drm/mediatek: Ensure the cursor plane is on top of other
 overlays
Message-ID: <20200206140140.GA18465@art_vandelay>
References: <1580441226.9516.1.camel@mtksdaap41>
 <20200206065951.213862-1-evanbenn@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206065951.213862-1-evanbenn@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dcastagna@chromium.org, evanbenn@gmail.com, evanbenn@chromium.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, seanpaul@chromium.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 06, 2020 at 05:59:51PM +1100, evanbenn@google.com wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Currently the cursor is placed on the first overlay plane, which means
> it will be at the bottom of the stack when the hw does the compositing
> with anything other than primary plane. Since mtk doesn't support plane
> zpos, change the cursor location to the top-most plane.
> 
> Signed-off-by: Evan Benn <evanbenn@chromium.org>

Hi Evan,
Thanks for spotting the issue! I think this should probably be 2 patches, one to
fix crtc init and then the cursor patch on top of that. We generally try to only
do one thing per patch.

A few other nits below..

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 29 +++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..d4078c2089e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,21 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>  
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>  			     struct mtk_drm_crtc *mtk_crtc,
> -			     struct drm_plane *primary,
> -			     struct drm_plane *cursor, unsigned int pipe)
> +			     unsigned int pipe)
>  {
> -	int ret;
> +	int i, ret;
> +

extra line

> +	struct drm_plane *primary = NULL;
> +	struct drm_plane *cursor = NULL;

These should be on top of the int declaration

> +
> +	for (i = 0; i < mtk_crtc->layer_nr; ++i) {

We don't really do pre-increment in kernel for loops

> +		if (!primary && mtk_crtc->planes[i].type ==
> +				DRM_PLANE_TYPE_PRIMARY)

Line breaks should be around '&&':

                if (!primary &&
                    mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)

> +			primary = &mtk_crtc->planes[i];
> +		if (!cursor && mtk_crtc->planes[i].type ==

else if?

> +				DRM_PLANE_TYPE_CURSOR)
> +			cursor = &mtk_crtc->planes[i];


Since we can only have one primary and one cursor, the NULL checks on primary
and cursor are unnecessary, you can just blindly assign them when you hit a
plane of the right type. If the driver creates multiples the behavior is
undefined anyways.

> +	}
>  
>  	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>  					&mtk_crtc_funcs, NULL);
> @@ -711,11 +722,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
>  }
>  
>  static inline
> -enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
> +enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
> +					    unsigned int num_planes)
>  {
>  	if (plane_idx == 0)
>  		return DRM_PLANE_TYPE_PRIMARY;
> -	else if (plane_idx == 1)
> +	else if (plane_idx == (num_planes - 1))
>  		return DRM_PLANE_TYPE_CURSOR;
>  	else
>  		return DRM_PLANE_TYPE_OVERLAY;
> @@ -734,7 +746,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>  		ret = mtk_plane_init(drm_dev,
>  				&mtk_crtc->planes[mtk_crtc->layer_nr],
>  				BIT(pipe),
> -				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
> +				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
> +							num_planes),
>  				mtk_ddp_comp_supported_rotations(comp));
>  		if (ret)
>  			return ret;
> @@ -830,9 +843,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			return ret;
>  	}
>  
> -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> -				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> -				NULL, pipe);
> +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.25.0.341.g760bfbb309-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
