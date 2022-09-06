Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FA5AF479
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7AC10EA5C;
	Tue,  6 Sep 2022 19:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C3310EA72
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:35:29 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso10269007wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=K5a4rdpNmP2HcHAE9Js6L3SjKbeNDZRuab/4DMnyrFk=;
 b=L2Z/kATCbrWhHDLpBminmblTlmrZDOxhU3oUROWKfWTdKh+UQ0C/VgxvlyQr6dd6QR
 4P16upklaiUZ4o4t+rgbdX4p4RePQ3AS+3ABXc9G47FgGSMSSmbF9rlyyygidDU3iEqX
 MHhQiK1Bw9iiHUST/bETquGRoZ9sjYbfQQTk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=K5a4rdpNmP2HcHAE9Js6L3SjKbeNDZRuab/4DMnyrFk=;
 b=yVNo041uz9mdaj1iyFSPpPr2Q/DEYu4IcbhtvK8lEZZm0YqjmmgiZ+dR3DWFTfwon2
 af9P4rV7g/zAmwLwvN7FtYRlY3qXf1BfhZTyQE7heY2IIOFHDYpwH3CDuzZejF5GWQFN
 dje7YyMq9I7pu+C41unrISAYCHO/3tSQK7cgaV0cQfg0ZUHIFPCCdU30yQxljcC8Ql22
 UVTjEkJhDBwexE9vFafP0HCWkrDUjgGWb4neMzvyFGbqwHezh4UDLO0Phc3P9jjsVUso
 7iiTtyQEu/tSklkE5xK68LcmLpf182+jxxLj5FFTUYk+a23sCB+HwSRGwYzyV3Rp7+7m
 G04Q==
X-Gm-Message-State: ACgBeo0P73m/KDnRSDFUvGbkkn3yrfqP1cmtzGJCJnt/eTox9tFaAt5B
 ttcPUMsqOyURN+2GpBGiLxRGo+xexy1GEQ==
X-Google-Smtp-Source: AA6agR641lYXVWSD6/Snvi93hFcNEDrTezfNigJ6fG6b++10r2N3SWhfeeuc+A1OAxlCnucB5kzowA==
X-Received: by 2002:a05:600c:34c5:b0:3a5:fd9d:7b2b with SMTP id
 d5-20020a05600c34c500b003a5fd9d7b2bmr14727434wmq.1.1662492928199; 
 Tue, 06 Sep 2022 12:35:28 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 bz9-20020a056000090900b0022584c82c80sm14248513wrb.19.2022.09.06.12.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:35:27 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:35:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/udl: Enable damage clipping
Message-ID: <Yxeg/X7RNOpa58gg@phenom.ffwll.local>
References: <20220728074756.6108-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728074756.6108-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: airlied@linux.ie, airlied@redhat.com, sean@poorly.run,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 09:47:56AM +0200, Thomas Zimmermann wrote:
> Call drm_plane_enable_fb_damage_clips() and give userspace a chance
> of minimizing the updated display area.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index e67c40a48fb4..ce427128f034 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -479,6 +479,7 @@ int udl_modeset_init(struct drm_device *dev)
>  					   format_count, NULL, connector);
>  	if (ret)
>  		return ret;
> +	drm_plane_enable_fb_damage_clips(&udl->display_pipe.plane);

I'm assuming this passes with all the igts we have (I hope those finally
landed) and a damage-capable compositor doesn't go boom either?

Either way patch lgtm. Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also I wonder whether we should have a check in the damage helpers to make
sure drivers don't forget to call this function to set up the uapi ...

Cheers, Daniel

>  
>  	drm_mode_config_reset(dev);
>  
> -- 
> 2.37.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
