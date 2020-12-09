Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67762D37F4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5836E204;
	Wed,  9 Dec 2020 00:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED4A6E204
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:48:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a12so160631wrv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ox5zQISWwNrJYCnv3rEN+/KGNGz8F1piSUSaeuA2Q3I=;
 b=bHVjRyMZ0VeHC3si/pP0OMe1oFzKs7I81FuHfido5pN9wn7PUofGne0IIZaH5o2sab
 pwTIwHSE6jd3pHBOzv6zK3g1CWJRy89bx4omDlpbn0puAvI+gBVm+Gz+0RvFbriXhPep
 9XnGYaRlinXQos1aTJUEktZUSASEVqaczsfJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ox5zQISWwNrJYCnv3rEN+/KGNGz8F1piSUSaeuA2Q3I=;
 b=YSb07ramsjvegDCBeKvZzw2eZ3Gy3cZ5BXG0tYS7g68a2mM2la0Y1jRBQNH7jNpnb5
 6RP8O3zfIPhTmowpdg9bvfoxoSDEe39TxPsnirwv7TqiUmds2ILjOYAG+ivCvvtBG9AI
 C9UU+A4ZoB+9R4hX2f38+KmHxrno2UAemmbWiDYwjleEkvD4ylsEbe1YqgpTyodquS6O
 CfUPmvTbRvkg7Qcl1/rQy2QVlnGjzD4lq/0USP98ci5w9gshXG4uvAlhJe/ZqnOo2mOZ
 m/WNAzgD8I/xIjLqVzRMMVShO2q8RYGcMoQcd2zwGGfGSeV7rt124e9/TzBvgjcLwfRC
 uNyg==
X-Gm-Message-State: AOAM5308Ui8FKagMsS8DZNc2uI3VlpmUMGYWfUjfAzJ1WFoGbD3iHerf
 D5eZEKsJrj5OSHJdTojDap/kZw==
X-Google-Smtp-Source: ABdhPJxjYKFlYhgRqAuYOJzeTr0t8VSptE8fmun+bTU5dmoGdI4m4RkmTn2+EqqMXWSAK9EO+5qJ3Q==
X-Received: by 2002:adf:f0c3:: with SMTP id x3mr668795wro.327.1607474911289;
 Tue, 08 Dec 2020 16:48:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm18206wmd.12.2020.12.08.16.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:48:30 -0800 (PST)
Date: Wed, 9 Dec 2020 01:48:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/tidss: Use the new api devm_drm_irq_install
Message-ID: <20201209004828.GN401619@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, jsarha@ti.com,
 tomi.valkeinen@ti.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1607413859-63365-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607413859-63365-1-git-send-email-tiantao6@hisilicon.com>
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
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, jsarha@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 03:50:59PM +0800, Tian Tao wrote:
> Use devm_drm_irq_install to register interrupts so that
> drm_irq_uninstall is not needed to be called.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

There's another drm_irq_install in the error path. But I'm not sure this
is safe since you're chaning the order in which things get cleaned up now.
So leaving this up to Tomi.
-Daniel

> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 66e3c86e..48e1f9d 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -173,7 +173,7 @@ static int tidss_probe(struct platform_device *pdev)
>  		goto err_runtime_suspend;
>  	}
>  
> -	ret = drm_irq_install(ddev, irq);
> +	ret = devm_irq_install(ddev, irq);
>  	if (ret) {
>  		dev_err(dev, "drm_irq_install failed: %d\n", ret);
>  		goto err_runtime_suspend;
> @@ -219,8 +219,6 @@ static int tidss_remove(struct platform_device *pdev)
>  
>  	drm_atomic_helper_shutdown(ddev);
>  
> -	drm_irq_uninstall(ddev);
> -
>  #ifndef CONFIG_PM
>  	/* If we don't have PM, we need to call suspend manually */
>  	dispc_runtime_suspend(tidss->dispc);
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
