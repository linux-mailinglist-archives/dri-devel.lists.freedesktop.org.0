Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31CB4497FC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9C66E056;
	Mon,  8 Nov 2021 15:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B276E056
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:17:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso87999wmh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hBEGhoX5YuNLFtwj0iZldxCPL/IU1JHW309UHcbi6N0=;
 b=L8/zB7BSBqyEz55VvZb2onr/HFN94h4kOWeL7YKHsOsT6aNM9jUhR/4oD9HwZJ4vNL
 CrsZGGjPrY/EtdG2BuMc6FD6fiT05/iN3LeAelAyxYKbBQigeQTjqjw9wGhX+50L0qz1
 MpjojiscjFDkUXddHTcuRAa2J1CAvkLAJWlMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hBEGhoX5YuNLFtwj0iZldxCPL/IU1JHW309UHcbi6N0=;
 b=Y2wBcLhUv3BIhbTqhpM2nKvvPIaKAwEPmRZsxNpaDm7vhh3/hCrZStV+ePB3AWZ8jV
 6LDdjCo6wBl5FB8DiSJcbzVHja9lX01hv020KQY5T9L+cw5KKsGj8pTyYQaNeNJAvG0U
 gTgFyOkLWS+avap+ESKv4DL9QOfdvm8NZ1dgqK+vUHR4s6tDRpsRkdEDFp0rE3qNVCqH
 +4yf2irPS6/bG3zFI6+3K02gI/LBPjJgqVeQA6itQ+m5++A92rqoJTFNW1Wd101F89Q2
 GrGcpx+cttoWEgIKeAAdOG8eggLQe1P5dskcEN7RWt8O1xTnVv9c7Stjs6RIQZNe4gr4
 XzZQ==
X-Gm-Message-State: AOAM530AtWLv+7l/RowkGay98XqHpmvVDCxSHcbYd1rwdimxC2mXDSBn
 EIDKjmXRlUGJXNTF+bVr3rbxJA==
X-Google-Smtp-Source: ABdhPJyp7OwRHBxwCBRfEWA+tElkasv2jnP+G3zoYuHxViLc/uz2nRtyKPxBmH9BvrPQOAu7OmBUOw==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr93457wmf.66.1636384656073;
 Mon, 08 Nov 2021 07:17:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm22202895wmc.40.2021.11.08.07.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:17:35 -0800 (PST)
Date: Mon, 8 Nov 2021 16:17:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
Message-ID: <YYk/jfcceun/Qleq@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107230821.13511-2-digetx@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 02:08:21AM +0300, Dmitry Osipenko wrote:
> Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
> adapter separately from the character device. This fixes broken display
> panel driver of Acer Chromebook CB5-311 that fails to probe starting with
> v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
> is never probed now using the new registration order because tegra-output
> always fails with -EPROBE_DEFER due to missing display panel that requires
> DP AUX DDC to be registered first. The offending commit made DDC to be
> registered after SOR's output, which can't ever happen. Use new helpers
> to restore the registration order and revive display panel.

This feels a bit backward, I think the clean solution would be to untangle
the SOR loading from the panel driver loading, and then only block
registering the overall drm_device on both drivers having loaded.

This here at least feels like a game of whack-a-mole, if like every driver
needs its own careful staging of everything.
-Daniel

> 
> Cc: <stable@vger.kernel.org> # 5.13+
> Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
> Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
> Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 1f96e416fa08..e0d675c7c2e5 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -532,7 +532,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>  	dpaux->aux.transfer = tegra_dpaux_transfer;
>  	dpaux->aux.dev = &pdev->dev;
>  
> -	drm_dp_aux_init(&dpaux->aux);
> +	err = drm_dp_aux_register_ddc(&dpaux->aux);
> +	if (err < 0)
> +		return err;
>  
>  	/*
>  	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
> @@ -585,6 +587,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> +	drm_dp_aux_unregister_ddc(&dpaux->aux);
> +
>  	mutex_lock(&dpaux_lock);
>  	list_del(&dpaux->list);
>  	mutex_unlock(&dpaux_lock);
> @@ -718,7 +722,7 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
>  	int err;
>  
>  	aux->drm_dev = output->connector.dev;
> -	err = drm_dp_aux_register(aux);
> +	err = drm_dp_aux_register_chardev(aux);
>  	if (err < 0)
>  		return err;
>  
> @@ -759,7 +763,7 @@ int drm_dp_aux_detach(struct drm_dp_aux *aux)
>  	unsigned long timeout;
>  	int err;
>  
> -	drm_dp_aux_unregister(aux);
> +	drm_dp_aux_unregister_chardev(aux);
>  	disable_irq(dpaux->irq);
>  
>  	if (dpaux->output->panel) {
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
