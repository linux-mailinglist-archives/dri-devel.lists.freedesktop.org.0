Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A32DAC6D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 12:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579646E311;
	Tue, 15 Dec 2020 11:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA0C6E311
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:57:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e25so18232243wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 03:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QoOPRl84dn2oKZTg+ZEq0t+AX/2LfZIV7tg2IP07IX4=;
 b=J1rTQ06yt+iQ25tLOMNHttJ09Z8xx8DNTvFK1z4BLc89vzZuLGMWt5B0Ph4cFTSjg+
 tnCfpVYNb/sDPw2CakPfq6GI4szOwjfnCGW4l+2ZuHVpr4KhKvCb2FOZKqIoR7hK1DdY
 22mA+odPuF0d9JzuR0408JDknj1khQP2OkIrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=QoOPRl84dn2oKZTg+ZEq0t+AX/2LfZIV7tg2IP07IX4=;
 b=eQDuvjTVYqUjG+/Ds6pPb6G9TFxYZAwG61+2cYFsvxbw+kXAE6VQZLQpfLzvhOLz6d
 zTjYyjO7t4ej/BSKKzfwshiLHeb+go5Hu/NZi9JVi2V7popLzhKqhJYImxHfHJcii11K
 E8Sd6IIlPPU+niHPLYoPkz0Ati3IlkmazC1VwszKESWGju3rUR3WxY5TBhpYmT6Lqylu
 BN4IVIrRWtNhm0gh0b9JzPkKAv9U/X3sSIoqkxzZIaiuvkQgxbOwIxHo148/qjZojY9b
 hsVCuChOEVaXTOesrmQx8IYNpT0DIvQW9n2TDDGDn3FtfiVZRalMt6b3mN07EkUrY7Xz
 wbPQ==
X-Gm-Message-State: AOAM530WlrkW2tcNtBHWWAA5iOShTY1aus6C6AcvXu0LqDkqp12fLD07
 Mp24C0VM8UGWhM9n9PgLhFRshg==
X-Google-Smtp-Source: ABdhPJxLhg5oDzaChXMtbZz1Fc1+4sstZfmn90NRubflR2wQ4hp27VDpAP4boTlNgJs3aXwIOEod2g==
X-Received: by 2002:a1c:2d92:: with SMTP id t140mr9936339wmt.114.1608033449070; 
 Tue, 15 Dec 2020 03:57:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m17sm40710713wrn.0.2020.12.15.03.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:57:28 -0800 (PST)
Date: Tue, 15 Dec 2020 12:57:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH drm/hisilicon 1/2] drm/irq: Add the new api to enable pci
 msi
Message-ID: <X9ikpqdJDgfulvL+@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
 tzimmermann@suse.de, kraxel@redhat.com, alexander.deucher@amd.com,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 xinliang.liu@linaro.org, linux-kernel@vger.kernel.org
References: <1608032933-50187-1-git-send-email-tiantao6@hisilicon.com>
 <1608032933-50187-2-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608032933-50187-2-git-send-email-tiantao6@hisilicon.com>
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

On Tue, Dec 15, 2020 at 07:48:52PM +0800, Tian Tao wrote:
> Add new api devm_drm_msi_install() to register interrupts,
> no need to call pci_disable_msi() when the drm module is removed.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/drm_irq.c | 33 +++++++++++++++++++++++++++++++++
>  include/drm/drm_irq.h     |  1 +
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 803af4b..da58b2c 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -246,6 +246,39 @@ int devm_drm_irq_install(struct drm_device *dev, int irq)
>  }
>  EXPORT_SYMBOL(devm_drm_irq_install);
>  
> +static void devm_drm_msi_uninstall(void *data)
> +{
> +	struct drm_device *dev = (struct drm_device *)data;
> +
> +	pci_disable_msi(dev->pdev);

This should be in the pci core, not in drm.
-Daniel

> +}
> +
> +/**
> + * devm_drm_msi_install - install IRQ handler
> + * @dev: DRM device
> + *
> + * devm_drm_msi_install is a  help function of pci_enable_msi.
> + *
> + * if the driver uses devm_drm_msi_install, there is no need
> + * to call pci_disable_msi when the drm module get unloaded,
> + * as this will done automagically.
> + *
> + * Returns:
> + * Zero on success or a negative error code on failure.
> + */
> +int devm_drm_msi_install(struct drm_device *dev)
> +{
> +	int ret;
> +
> +	ret = pci_enable_msi(dev->pdev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev->dev,
> +					devm_drm_msi_uninstall, dev);
> +}
> +EXPORT_SYMBOL(devm_drm_msi_install);
> +
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
>  int drm_legacy_irq_control(struct drm_device *dev, void *data,
>  			   struct drm_file *file_priv)
> diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
> index 631b22f..c8dff45 100644
> --- a/include/drm/drm_irq.h
> +++ b/include/drm/drm_irq.h
> @@ -29,4 +29,5 @@ struct drm_device;
>  int drm_irq_install(struct drm_device *dev, int irq);
>  int drm_irq_uninstall(struct drm_device *dev);
>  int devm_drm_irq_install(struct drm_device *dev, int irq);
> +int devm_drm_msi_install(struct drm_device *dev);
>  #endif
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
