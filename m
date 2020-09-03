Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C025BD9F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1246E1B3;
	Thu,  3 Sep 2020 08:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316586E1B3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:45:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w5so2247255wrp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=w/8hEgczsSwA5siMShAWCRj+Fa/wWaouVqRmrq4savc=;
 b=JEyxJJHSiduf3Z20lir53f8KwZEdsX/lWxPlh0m/E79yi9SQq9SA7WUsImF68DPkQM
 b0IHTMLspzmTMB6GkKRN/v2KGeohNti5YY4toHZT//MtRFLu4vYWlhJ45glSoq1iq3PP
 dO4dT7hCYUobXhNoukuhIXto9eNKIeUTGsPzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=w/8hEgczsSwA5siMShAWCRj+Fa/wWaouVqRmrq4savc=;
 b=sZg+YTxiH4wiY+WN4wNoMoVCzcMqWIXPzsaFykCmDSy4zXMivXNovfSzXFV0IJsIRA
 WEKfAm7bQAkm0dfwuBB72yl9JBO5hRl9ABq0L8ggmBvwEaaKA8l/a9UeAJA7tb0pV1cq
 wXcCNn25CbCOZcEZHeaS6eOU2BnCMdeTDzNnolwQ3RCBM6WuspX4lW5f6jXbN3SlFTAt
 hrD59LSR5Stp35gjOTtNd6flP435E24hVShieOX1TGkTe+loFxok/+CntIA6lNps7xbK
 GzRTjXORu504E+yY6XR1wj5ku5ZMORiEnpX15NIJelVxwWomWDpH+YOCYwgACsgSt6zM
 xDSg==
X-Gm-Message-State: AOAM532S9E41hRD4f2ScUWppZWSM8bE+85YsuXWkSgqswvdfyXbt2r9A
 kJ4rkOfuUNoDCmu+PRFTYOdqZA==
X-Google-Smtp-Source: ABdhPJx30EL7M9pGuMwPSxIVWHfLkpax1C49r8vzGrTW34Tl1cKNPRCQWUvi96dX0LLOKxnVGLLT0A==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr1188595wrn.45.1599122734444; 
 Thu, 03 Sep 2020 01:45:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g7sm3561732wrv.82.2020.09.03.01.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 01:45:33 -0700 (PDT)
Date: Thu, 3 Sep 2020 10:45:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bernard <bernard@vivo.com>
Subject: Re: [Re-send][PATCH] gpu/drm: remove drm_modeset_lock protection for
 drm_error
Message-ID: <20200903084531.GJ2352366@phenom.ffwll.local>
Mail-Followup-To: Bernard <bernard@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <ADIABQBNDXyW8X9QUmo2xaoL.1.1599052622252.Hmail.bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ADIABQBNDXyW8X9QUmo2xaoL.1.1599052622252.Hmail.bernard@vivo.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: opensource.kernel@vivo.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 02, 2020 at 09:17:02PM +0800, Bernard wrote:
> In function drm_atomic_helper_shutdown, maybe there is no need
> to protect DRM_ERROR log in DRM_MODESET_LOCK_ALL_BEGIN &
> DRM_MODESET_LOCK_ALL_END. This change is to make code run a bit
> fast.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

This is only run at driver unload, so really no need to optimize anything
for speed. And I think this change makes the code less symmetric, so not
really worth it imo.

Similar with the via change, drm/via is very very legacy code where the
next step will be to just outright delete it all.

Thanks anyway for submitting the patches, in other places such a change
would indeed make sense I think.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 85d163f16801..8902fd6316fc 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3100,12 +3100,10 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
>  	int ret;
>  
>  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> -
>  	ret = drm_atomic_helper_disable_all(dev, &ctx);
> +	DRM_MODESET_LOCK_ALL_END(ctx, ret);
>  	if (ret)
>  		DRM_ERROR("Disabling all crtc's during unload failed with %i\n", ret);
> -
> -	DRM_MODESET_LOCK_ALL_END(ctx, ret);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_shutdown);
>  
> -- 
> 2.17.1
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
