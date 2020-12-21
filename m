Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715C2E0249
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 23:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3EB6E5CA;
	Mon, 21 Dec 2020 22:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656766E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:02:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d26so12600997wrb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 14:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BtRNJQl03YQa93lbsMKNmeY5lhd6PmTDGGRrAUJu3i0=;
 b=DgpOSlyqyBuI/HhQ38puf6PWlkon9uKqTd4E4l1MRj68/v1YnbUwXnd952gRRDTFYm
 1ZFMCYeC98etWDuDar7FvmdPePWWKcPkjG5B1JY09s+n0zx8VSmfRorss2/xybFcCeXI
 WKboaolyanDOHcSFebV8Oy4Ui7IdhrgzvQX/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BtRNJQl03YQa93lbsMKNmeY5lhd6PmTDGGRrAUJu3i0=;
 b=J29PM8jxfomSSv3vu+oP454eCTWOb44H3SIC9gg2e7zHjkRrieDjngZQ1FCmBenMFX
 i3tCsKTmiFO9ky8cotg01jF1u6COC+M91gM8CpyLelrrh085ryJLXOaGBJGW4HEFKn5X
 jzgMbrTdvL2gC49e9xxcIRWV2n/nP2T+g2n33DcLQf5IRDAyTrhDPWsBJXzFlaiJz8w1
 g6noE+Zy+M03Cnmh6H3r3jEFr1Fqr5N7rRa0UxMi1jQT+xxKvovZRm1psBFF1tQbQ316
 K545iV6vPyLFKpixY7Msk//5Cy6pLEv/+3cC2oFykJi9BV6orY+lsk0z8zX8fyx9ECJs
 v57w==
X-Gm-Message-State: AOAM530O0WDQq3i3OWljz2TaVUKHvDX/ES9eaCE/n/m0/qjJF7pISego
 f1i5gPpUlnJ7TtELrFoA69/bHw==
X-Google-Smtp-Source: ABdhPJxq54PA/gz0ZvMTsHMiMGuocL3cvAIkftNPh8DQXwzkoRBH4C0L32kfOtcX40N0bM23o7GbAQ==
X-Received: by 2002:a05:6000:368:: with SMTP id
 f8mr20858519wrf.150.1608588163092; 
 Mon, 21 Dec 2020 14:02:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h20sm30118270wrb.21.2020.12.21.14.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 14:02:42 -0800 (PST)
Date: Mon, 21 Dec 2020 23:02:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/hisilicon: Use pcim_enable_device()
Message-ID: <X+EbgCy17bUa8X1N@phenom.ffwll.local>
References: <1608511522-3100-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608511522-3100-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 kraxel@redhat.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 08:45:22AM +0800, Tian Tao wrote:
> Using the managed function simplifies the error handling. After
> unloading the driver, the PCI device should now get disabled as
> well.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 02f3bd1..7159018 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -329,7 +329,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  	dev->pdev = pdev;
>  	pci_set_drvdata(pdev, dev);
>  
> -	ret = pci_enable_device(pdev);
> +	ret = pcim_enable_device(pdev);
>  	if (ret) {
>  		drm_err(dev, "failed to enable pci device: %d\n", ret);
>  		goto err_free;
> @@ -338,7 +338,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  	ret = hibmc_load(dev);
>  	if (ret) {
>  		drm_err(dev, "failed to load hibmc: %d\n", ret);
> -		goto err_disable;
> +		goto err_free;
>  	}
>  
>  	ret = drm_dev_register(dev, 0);
> @@ -354,8 +354,6 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  
>  err_unload:
>  	hibmc_unload(dev);
> -err_disable:
> -	pci_disable_device(pdev);
>  err_free:
>  	drm_dev_put(dev);

The drm_dev_put here and in hibmc_pci_remove is wrong, devm_drm_dev_alloc
takes care of that already. I'm kinda suprised you don't have a refcount
underrun already - do you test module unload with KASAN enabled?

The pcim patch looks ok, so Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

>  
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
