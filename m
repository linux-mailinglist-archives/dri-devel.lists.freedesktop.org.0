Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F9339000
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFF46F628;
	Fri, 12 Mar 2021 14:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6426F628
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:28:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d15so4917213wrv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LgovJKPPJ6bQZV7sOVEHkbNnVIkYF/5J/yRIABEwqDY=;
 b=jZolAUIp21cJyqOLO2iFNDO8o4ChclOSlIo4hKZm/QhgYJEZrFVUUXa3OVtejX50jm
 m9DgejRTIG+X7SWoTQEuWrvHRuDShUPnTcMEgw84SH6lw8e66lqUxAkZYTSRpwsX4iwl
 CVkKCtqpzJf6RzsCkVc76hWKd7nIw6VcDbEho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LgovJKPPJ6bQZV7sOVEHkbNnVIkYF/5J/yRIABEwqDY=;
 b=AH9elT9UKXFnROHGu0ai6eWIGlBckGB9GX7itPVsfFRsC02KmEsFWJ9eaohvhWlbv+
 u2YNc3Zq2RMZmHO1aQRMVP9RTm1DnbnX5a2F6gtvk/RbKAm04CcwEODyB59VijiitL4x
 oizRGDrBPHaph+7Dz6x0fDMzL4ZUIefy5Jgz0Qrg5r0nCyPM28sN6SHYDLIo86nTu70c
 9CeceRnXiIO13QxwGONraR/J5OHuviNK1KBJd2jNxvR2ey0WtNLy0XiN6L7qHwpUKcSm
 nAIyY2eiqmuh85WXUkslJhGYIdUqrdpptN+l6k90FmKos9CnqWPQL9PinaTia3s0Vf8o
 57Tw==
X-Gm-Message-State: AOAM530nwsEsC2YwgmLouR5rx2uPt1CgCYEViKgMZTYJ9mV3HgRVUiUC
 dNciez0rF3Oy1non8PtzrOM9CtqGvf0GU6Cd
X-Google-Smtp-Source: ABdhPJw08lWW9qkTpIeKAbJtOkXwTCpWvDYLnG2s5ETAqlVwAJg48SkruhTI2iVDAe7EHiBxrjPdxg==
X-Received: by 2002:a5d:4686:: with SMTP id u6mr14206501wrq.60.1615559290521; 
 Fri, 12 Mar 2021 06:28:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm2671458wmd.41.2021.03.12.06.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:28:09 -0800 (PST)
Date: Fri, 12 Mar 2021 15:28:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/exynos: move to use request_irq by IRQF_NO_AUTOEN flag
Message-ID: <YEt6eM1EW1VZdFAK@phenom.ffwll.local>
References: <1615549385-33784-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615549385-33784-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, krzk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 07:43:05PM +0800, Tian Tao wrote:
> After this patch cbe16f35bee68 genirq: Add IRQF_NO_AUTOEN for
> request_irq/nmi() is merged. request_irq() after setting
> IRQ_NOAUTOEN as below
> 
> irq_set_status_flags(irq, IRQ_NOAUTOEN);
> request_irq(dev, irq...);
> can be replaced by request_irq() with IRQF_NO_AUTOEN flag.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

To get all your nice cleanups land faster I strongly recommend you review
other people's small patches. And then ask them to review yours in return.
You have already drm-misc commit rights, so should be all ready to go and
do lots of great stuff!

Cheers, Daniel

> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 7 +++----
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 1f79bc2..f530aff 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -775,8 +775,8 @@ static int decon_conf_irq(struct decon_context *ctx, const char *name,
>  			return irq;
>  		}
>  	}
> -	irq_set_status_flags(irq, IRQ_NOAUTOEN);
> -	ret = devm_request_irq(ctx->dev, irq, handler, flags, "drm_decon", ctx);
> +	ret = devm_request_irq(ctx->dev, irq, handler,
> +			       flags | IRQ_NOAUTOEN, "drm_decon", ctx);
>  	if (ret < 0) {
>  		dev_err(ctx->dev, "IRQ %s request failed\n", name);
>  		return ret;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 83ab6b3..fd9b133b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1352,10 +1352,9 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
>  	}
>  
>  	te_gpio_irq = gpio_to_irq(dsi->te_gpio);
> -	irq_set_status_flags(te_gpio_irq, IRQ_NOAUTOEN);
>  
>  	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
> -					IRQF_TRIGGER_RISING, "TE", dsi);
> +				   IRQF_TRIGGER_RISING | IRQ_NOAUTOEN, "TE", dsi);
>  	if (ret) {
>  		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
>  		gpio_free(dsi->te_gpio);
> @@ -1802,9 +1801,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  	if (dsi->irq < 0)
>  		return dsi->irq;
>  
> -	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
>  	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
> -					exynos_dsi_irq, IRQF_ONESHOT,
> +					exynos_dsi_irq,
> +					IRQF_ONESHOT | IRQ_NOAUTOEN,
>  					dev_name(dev), dsi);
>  	if (ret) {
>  		dev_err(dev, "failed to request dsi irq\n");
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
