Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DD41DC1C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C889D6E416;
	Thu, 30 Sep 2021 14:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829046E416
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:16:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id s24so4803856wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F0klS6Mh+ZU3zeDcki3mSRyrj0mwVR8r91ODxy9hdaI=;
 b=Oe+pHiBT3XrgkwFn3i2mzuCDPZI1u9ibvw4IV6w9wweo6qNa/xORjQpoBjxWAw9VYU
 3PZxeExCgy2w437FrpZE8RCpB+vHlqFbx0ZK9Zxb3mWFNCQuXj+CLNS8qbtlFXNEsYi+
 tjT26X1GlQYK5Xjuha3cYcdbxGo9EmlnENAnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F0klS6Mh+ZU3zeDcki3mSRyrj0mwVR8r91ODxy9hdaI=;
 b=ddC7GruE3gL5evN+dgIu7JWfAWKTlMeVmbbxw0zeQiHbr17TIepPQnXqjbpuKatZSD
 EJmvRLFiS+v6WBDp0sopL0lMPVPe8ty2RXB8+APRTXxbNLLlXrT34OME1rMv90xSB4LZ
 8pjS/h28Ffqeps5thvHDAaTzWG2T8tLPakGSgp3UaB+RRBKWSqG/v7+QXGxHLoJQMwdJ
 tu5R1S7mqpc7opPqfc9jwSNzI1wSqnmLUUY9V2AAOotroL9MHmJKjt5/cY77CoP9e7d8
 +dRUb0Xh9iUDulBx+H/fE0IHYYPMg24inKcTFV3o+P4YwV7loclStmRbD7h+hEUUZwr2
 bNiQ==
X-Gm-Message-State: AOAM5325dM9ZgqMqGiUajpWODZWtLxSvsf9B8jSH82p7VgPXioPtbtvb
 Js69PwYgoLq0xFrdAu+7KGrO4w==
X-Google-Smtp-Source: ABdhPJz5iqbqEADdElpUyqtKkJ0bRRhChgQTcNFJzmddUuouPRvFNYK3YDqIVGDjTlZCe3bt8QQH4g==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr5743735wmc.98.1633011359070; 
 Thu, 30 Sep 2021 07:15:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d1sm3671688wrr.72.2021.09.30.07.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:15:58 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:15:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: gbefb: Only instantiate device when built
 for IP32
Message-ID: <YVXGnDtL68MMTiFp@phenom.ffwll.local>
References: <20210921212102.30803-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921212102.30803-1-broonie@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 21, 2021 at 10:21:02PM +0100, Mark Brown wrote:
> The gbefb driver not only registers a driver but also the device for that
> driver. This is all well and good when run on the IP32 machines that are
> supported by the driver but since the driver supports building with
> COMPILE_TEST we might also be building on other platforms which do not have
> this hardware and will crash instantiating the driver. Add an IS_ENABLED()
> check so we compile out the device registration if we don't have the Kconfig
> option for the machine enabled.
> 
> Fixes: 552ccf6b259d290c0c ("video: fbdev: gbefb: add COMPILE_TEST support")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Stuffed into drm-misc-fixes, thanks for the patch.
-Daniel

> ---
>  drivers/video/fbdev/gbefb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
> index c5b99a4861e8..6b4d5a7f3e15 100644
> --- a/drivers/video/fbdev/gbefb.c
> +++ b/drivers/video/fbdev/gbefb.c
> @@ -1267,7 +1267,7 @@ static struct platform_device *gbefb_device;
>  static int __init gbefb_init(void)
>  {
>  	int ret = platform_driver_register(&gbefb_driver);
> -	if (!ret) {
> +	if (IS_ENABLED(CONFIG_SGI_IP32) && !ret) {
>  		gbefb_device = platform_device_alloc("gbefb", 0);
>  		if (gbefb_device) {
>  			ret = platform_device_add(gbefb_device);
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
