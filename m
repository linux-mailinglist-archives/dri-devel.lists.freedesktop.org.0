Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367518CF603
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 22:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAFC10F63D;
	Sun, 26 May 2024 20:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bzHlSJPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF5810F63D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:47:33 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e95a60dfcdso31840471fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 13:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716756452; x=1717361252; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xUNdaUpczqWjYKFL6mjsCYM10st8i6fklZ84b9FNQNs=;
 b=bzHlSJPLY518os9pyMnQLbOhI3M3WpC4jmiJbUD+iaUCMWqTdawu/qyl20mWMA6GVI
 e/4Fq1cvcGNBlSYvyfwWTJ3w6TTZpdJNSGBsP4+WHI26MDR9zWbmRbD6CC4THOEItMCW
 N5nR2TNv9t92mGkViWpmIHbFR8SRuCB1U2bsK0fbCMz84bXTepU0hyjcC1M2GdfUvEGv
 2e56r2LHpJTHb0fWS9bZaMYFY4vdXwZyLxu4HUTG0ioO8nxlJgfhzlCS2CeMi5TNosjr
 bQoPTHw/U2rDmeFleLtfx9566QtL4DihRiDS7zensvJuN1ZCGAON1z5I9qJ/Aj51zHka
 9UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716756452; x=1717361252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xUNdaUpczqWjYKFL6mjsCYM10st8i6fklZ84b9FNQNs=;
 b=dw+pjFh0VRlcEF5ZLprb/RbQMVbz409bySGkzRw8ZWP5xapsBAkjxRdmqLtF+aJjTA
 D/UfwtgP/NZw8AkbAZGpJab5Jbu+uOUbAQBBZXLzZcZjm5O8VYTi4YndP+uFgCpiQ4Dq
 FiiBgDNkgfsoAXuVApDwBAfeqqn+QlqirfTOGfk7do79ievfqRwBa2rJGd0f8chr063O
 QUvmMTD4GEY2MPxNd+m+5gUVDR2WSOhJjvfj5MRUtDbzBu9RyxOBk11s6VHHdQtYU/pv
 TysfDzNXea7f8fkxDfg0VbiNP4d0x1EdBwZQv4ivQM82jQKIhLc7kdDxl0C52jjpoOqp
 0qhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq1+kw3BgkkdLdfxedbnDYRPyl7XiW9WHo6R0cY4kaSjGq1k/KkX3dIRB70JKNt/wiAlsBCg6qGnbMOMYeeJNSgBTW1GgqHQav8j3KuYuC
X-Gm-Message-State: AOJu0Yzy/fpb/IlJMgHEFxra8pFlZ4AaFUeVGPv7A7zQYq44KImrnA00
 4ZjxC+yEglFa5/zK2M7/D3hqS33I9IlDat5wADHIuUz81jBlN9wZjlLcuLT5yts=
X-Google-Smtp-Source: AGHT+IEEXhwP+qIOwKK1tFTRNk3B1C8k2M0WmwWkOiqLG+CYudMn2XQVaIgWUbkjv81/5YhQq3lqOA==
X-Received: by 2002:a05:651c:2041:b0:2d3:4b73:7b40 with SMTP id
 38308e7fff4ca-2e95b1cc4c6mr46374631fa.17.1716756451582; 
 Sun, 26 May 2024 13:47:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcc4962sm15862611fa.11.2024.05.26.13.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 May 2024 13:47:31 -0700 (PDT)
Date: Sun, 26 May 2024 23:47:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2 1/3] drm/loongson: Add a helper for creating child
 devices
Message-ID: <wupp3362ym5nkemlry2b7nmnj4gu5mfnjtry5vznn2q56uwpew@topd2a2uhw54>
References: <20240526195826.109008-1-sui.jingfeng@linux.dev>
 <20240526195826.109008-2-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526195826.109008-2-sui.jingfeng@linux.dev>
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

On Mon, May 27, 2024 at 03:58:24AM +0800, Sui Jingfeng wrote:
> In some display subsystems, the functionality of a PCIe device may too
> complex to be managed by a single driver. A split of the functionality
> into child devices can helpful to achieve better modularity.
> 
> Another benefit is that we could migrate the dependency on exterinal
> modules to a submodule level with the helper created. For example, it's
> not uncommon that some exterinal module will return -EPROBE_DEFER to our
> driver during probe time. KMS driver has to tear down everything when it
> receives -EPROBE_DEFER, the problem is that it's completely not necessary
> and rising cyclic dependency problems if not process correctly.
> 
> Add the loongson_create_platform_device() function, which allows the KMS
> driver to create sub-devices for it. The manually created decice acts as
> agents for the principal part, migrate the potential issue to submodule.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/loongson/loongson_device.c | 42 ++++++++++++++++++++++
>  drivers/gpu/drm/loongson/lsdc_drv.h        |  6 ++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
> index 9986c8a2a255..b268549d643e 100644
> --- a/drivers/gpu/drm/loongson/loongson_device.c
> +++ b/drivers/gpu/drm/loongson/loongson_device.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/pci.h>
> +#include <linux/platform_device.h>
>  
>  #include "lsdc_drv.h"
>  
> @@ -100,3 +101,44 @@ lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip_id)
>  {
>  	return __chip_id_desc_table[chip_id];
>  }
> +
> +int loongson_create_platform_device(struct device *parent,
> +				    const char *name, int id,
> +				    struct resource *pres,
> +				    void *data,
> +				    struct platform_device **ppdev)
> +{
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	pdev = platform_device_alloc(name, id);
> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	pdev->dev.parent = parent;
> +
> +	if (pres) {
> +		ret = platform_device_add_resources(pdev, pres, 1);
> +		if (ret) {
> +			platform_device_put(pdev);
> +			return ret;
> +		}
> +	}
> +
> +	if (data) {
> +		void *pdata = kmalloc(sizeof(void *), GFP_KERNEL);
> +
> +		*(void **)pdata = data;
> +		pdev->dev.platform_data = pdata;
> +	}
> +
> +	ret = platform_device_add(pdev);
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ret;
> +	}

Please use platform_device_register_resndata().

> +
> +	*ppdev = pdev;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
> index fbf2d760ef27..a2c6b496a69f 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.h
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.h
> @@ -47,6 +47,12 @@ enum loongson_chip_id {
>  const struct lsdc_desc *
>  lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip);
>  
> +int loongson_create_platform_device(struct device *parent,
> +				    const char *name, int id,
> +				    struct resource *pres,
> +				    void *data,
> +				    struct platform_device **ppdev);
> +
>  struct lsdc_kms_funcs;
>  
>  /* DC specific */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
