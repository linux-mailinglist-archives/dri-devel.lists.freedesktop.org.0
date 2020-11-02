Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AFD2A3553
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAAE6E12B;
	Mon,  2 Nov 2020 20:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147196E12B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:45:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k10so14806777wrw.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EgDmDTAHNRERIs1Qs6LxMsm9Fp21ADMmVjMM6KY2P3s=;
 b=kn/DKBq0Q1vnClQs8a/dzgTgzU6mqAHIQ8ESwR1ILI7ZtARyZWQGzIlcUQL9O4e71l
 e9wkmkwhsOIPx9f4wez814UgbGn96ufN3czHU3BQ6kQ1Yq8uvRXHYyIox1Z86SK2nKII
 696fLNztQrqJqia3nP8/8zb2tw102/kRShweE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EgDmDTAHNRERIs1Qs6LxMsm9Fp21ADMmVjMM6KY2P3s=;
 b=B3IThqVyeaP5uiAgL8faCReZNMKlLTbDqM7CulLMSw3Qb6GAOZhYC6zy7KTliZ4e8t
 RbEEahEVEV9Tq1+JqQyoKxomWer6pl2CuU2Wsg5573+FDTX3lKyMNiMq2T/9MLB6yGrO
 97NxMN2ME+q4N0UC1mXzUBgI+aF1BA4w0ubnEueJUbn/S28QJdbxu4rUqLcKYw514IvT
 xjdRvzkSZI/yAVbULemIIT+6wnDqFOMmKpCxSPR7Q4yyf3NJeKOaBEdkXzh7aMxQzmLW
 dzN+m+ZL/X0vrmTfHVr8Na5Xk70EafG7ehtvKM4gk2y0iCpzT8x1OATWMLop8S9AQxgZ
 VufA==
X-Gm-Message-State: AOAM533GMsn/j1WuoMmFKq0ZhftPwsqQwXVSquT5VsTEUJmU6AMfc/JF
 xhobzS35mrfSgsgNIuWygSmUfw==
X-Google-Smtp-Source: ABdhPJym+XlhC8lAm6/tK8SspATK+4kWruY344HqZKeJ1DmuzprOLaLMIeODvnJnRfetmqJjQWH8dg==
X-Received: by 2002:a05:6000:1252:: with SMTP id
 j18mr20945406wrx.18.1604349941828; 
 Mon, 02 Nov 2020 12:45:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g138sm615943wme.39.2020.11.02.12.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 12:45:40 -0800 (PST)
Date: Mon, 2 Nov 2020 21:45:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: drv: Remove unused variable
Message-ID: <20201102204538.GV401619@phenom.ffwll.local>
References: <20201102162908.1436567-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102162908.1436567-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 05:29:08PM +0100, Maxime Ripard wrote:
> The commit dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state
> objects") removed the last users of the vc4 variable, but didn't remove
> that variable resulting in a warning.
> 
> Fixes: dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state objects")
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 08c1cc225045..2cd97a39c286 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -307,7 +307,6 @@ static int vc4_drm_bind(struct device *dev)
>  static void vc4_drm_unbind(struct device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(dev);
> -	struct vc4_dev *vc4 = to_vc4_dev(drm);
>  
>  	drm_dev_unregister(drm);
>  
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
