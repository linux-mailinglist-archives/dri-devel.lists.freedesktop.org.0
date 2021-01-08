Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D802EF41E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83A56E157;
	Fri,  8 Jan 2021 14:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01166E157
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:45:48 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id c124so7975853wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 06:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nHZfmrLsnCXU18P2naZwZ/rk6gM2XqRiNjrN0fvyktI=;
 b=aKFaDhyA2RcZhDG52kY8ATxpamcGN/eDNi7Vbe1TQe0T4tDcd/HefsMQ1nkVR+21+I
 nau/AVOiziFGCjzSyHvbbF9zvOd5ZXB3rD90v9+3wS0zRzq7yqVGC3ZNpWqyBNmbe0Al
 xA1qoClAZdaMsHpketUzfz2Iteo2ZJgWFzUcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=nHZfmrLsnCXU18P2naZwZ/rk6gM2XqRiNjrN0fvyktI=;
 b=U+TqadDOXuqgMiTLFpTUNxxyBQDevxd71zeJblZYJyISl3bGH8sWlo7Tp25R+At++x
 S9GBreae9g5SkWqvAIwpQHGuZEqkC+Vpwvpv1/f0fRt4IadmCY8rMcTlYRHnAx76yp7m
 0cm0NRPmYHAkqoM1nHTRZA9RAuN8lrw5kzjexYWYYgyIFRadkBW2NQAw1CuxTSk5xMxg
 de4t6bP8Fvrkm0iS2Pad4JRnijNuMrs4p6mOUA633rdx2Oca15X/8huBIuz5lbIUv3uv
 PGaZ2IELUxvzn0ZYVfRU8GsXU3oW6Kpk0EwThJ/M+Q7E5t1Rmnvr2pIhIv2mhI6f47er
 YJDw==
X-Gm-Message-State: AOAM5309gRbppS0+wCHh5PFJDlNC+/ywkJ6BpBLk4ydCh0g47feTmKTY
 4HZxFpYwWYSEAhgmCle+oMmrWA==
X-Google-Smtp-Source: ABdhPJx9bsKSk3qdvWYUOz7Vz9aIwqpXCI4fvqlSKmubOv9ofxQQ02mrBxPZp+5JbuiSp2vd9T01NQ==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr3426381wma.84.1610117147582; 
 Fri, 08 Jan 2021 06:45:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c4sm15815677wrw.72.2021.01.08.06.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 06:45:46 -0800 (PST)
Date: Fri, 8 Jan 2021 15:45:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/hisilicon: Delete the empty function mode_valid
Message-ID: <X/hwGbCQ8mM4W4Dl@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
 tzimmermann@suse.de, kraxel@redhat.com, alexander.deucher@amd.com,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 xinliang.liu@linaro.org, linux-kernel@vger.kernel.org
References: <1610102465-36501-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610102465-36501-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 06:41:05PM +0800, Tian Tao wrote:
> Based on the drm_connector_mode_valid, if the hibmc implementation
> of mode_valid only returns MODE_OK, then we can not implement the

s/can not/need not/

> mode_valid function.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index c76f996..c74a35b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -43,12 +43,6 @@ static int hibmc_connector_get_modes(struct drm_connector *connector)
>  	return count;
>  }
>  
> -static enum drm_mode_status hibmc_connector_mode_valid(struct drm_connector *connector,
> -						       struct drm_display_mode *mode)
> -{
> -	return MODE_OK;
> -}
> -
>  static void hibmc_connector_destroy(struct drm_connector *connector)
>  {
>  	struct hibmc_connector *hibmc_connector = to_hibmc_connector(connector);
> @@ -60,7 +54,6 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
>  static const struct drm_connector_helper_funcs
>  	hibmc_connector_helper_funcs = {
>  	.get_modes = hibmc_connector_get_modes,
> -	.mode_valid = hibmc_connector_mode_valid,
>  };
>  
>  static const struct drm_connector_funcs hibmc_connector_funcs = {
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
