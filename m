Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6F9FAD4D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA5810E51B;
	Mon, 23 Dec 2024 10:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DCueIyqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF50788867
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 10:51:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so4603388e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 02:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734951103; x=1735555903; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PysGQXFhFIaY82I36Y7kVr5DOhB1P1lEm8vqt8odrR0=;
 b=DCueIyqo3C2W0/pRlxUr/+bDf5XLYhOSY69hwuyQ9R2xBFNCA54+NKi/s0M3sb8B38
 7H9J4K3V5pY5WcEYyCG0dOl/Yh1iGKtR+0yZYwaS+Y6a9ar8S5NhEGCJSFppgBX66vnb
 GdvcaMRqfQngANYDsCHtx7gYFb9UvGpzvvF5rIt1elQsixqO1qL5TzGDgFyHAKU9DkvT
 721wSFEvGCJ//TehEgkqrds2EdOk94p/b5tG32m07kfA7ihZbAgEh9qECAJNdEpsusX2
 5s0lEPfyX3ly6YVy5OHHjNknRgxX082NNERmmNKc6MIBklPDMGek66QC3wQrTqK+8wKD
 5IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734951103; x=1735555903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PysGQXFhFIaY82I36Y7kVr5DOhB1P1lEm8vqt8odrR0=;
 b=fBh2mm1Hf5AMY45jcJ0OT4ZnbM83r3d6hsccWNgQmvZqdpH8gaLnUn8VWLHz4u30Dk
 ruhdP+GhQNE/6TYb05toG2ZHTPZlsVwgQelwabGblmUDF0iiN3IHwI7hGEpjDSJVpBhS
 TiXXrFrcA8FsOfVG3LEqxuVyv6zOlPpkcYyW+bZMi17daTNTrGgTxb74mH2yQPrw69Tm
 kyWvQc7IWOI35/rrWgsc675EJbwEFseoLbxu/luEUeim/eFf8hivD3gEqJkkMvCOtCyv
 NIKeyj+9Usykk/uaMoXnwD9P7K5GHOqoniZRzu3NeBlT7OtzLrs+isSyrE+ICE1YPcNr
 eHdA==
X-Gm-Message-State: AOJu0YzUp++JL9WrhSyarQLcEQjnYSnZ44MJoawgn38kdp2id8t7/CJF
 qk7m6Zcdj6mIUKQyd2jr7KilML3cGzQn6gJW7G19i0umVT4yFugucYOwCnklGpU=
X-Gm-Gg: ASbGncumGF5F+MUv0QEbkyYM/znr0RGmn8lJJ5FZ/PlNvyMgK5u8U3EKfSpUcoXD6iN
 gx9/Mbq6LjSZQ6S9U6juFy07mzDKieaZxJIgBhFp1PC4fIjoHQ5RPymNBkZctIWstMucv7/8kRc
 iJkzf/dHZyO9JGnw28cUzYfFKxZA8KlkKLi534NN1CexSZKlMc4fqCfZuhzlF4ZTtewv2EuQ2On
 WLxuMvcQ+AGeoFTC4pbYwhDb5P/PNtr946Z1FNOISD0glRjYpXBmWQ94p0xwoTU2praUR5lwi+j
 i+nL/OIm72SbbWoG2r13xm3BJ6Cdx/UFDKfZ
X-Google-Smtp-Source: AGHT+IG+15flgGLqsMrZ5BL4gMnDHWQG9KiSz+F4gPV4kBjlj5dHbyvd5yf8E3fFs/QR/3iviG06Bg==
X-Received: by 2002:a05:6512:1150:b0:541:cdef:7ca3 with SMTP id
 2adb3069b0e04-5422953c1a8mr3075505e87.27.1734951102906; 
 Mon, 23 Dec 2024 02:51:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238216c0sm1231593e87.218.2024.12.23.02.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 02:51:42 -0800 (PST)
Date: Mon, 23 Dec 2024 12:51:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <6mhlb26vdfc7v3jmb7y3tlcuo336x7vkblbkzd5sosd6urirou@bbfalnfisdij>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-10-victor.liu@nxp.com>
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

On Mon, Dec 23, 2024 at 02:41:37PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The FrameGen driver, TCon driver and display engine driver
> are components to be aggregated by a master registered in the upcoming
> DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.

Unfortunately no. Your instances are compatible on the hardware level
(at least they were with the previous versions, I don't think that
there was a silicon change).

> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
> * Select REGMAP and REGMAP_MMIO Kconfig options.
> * Fix commit message to state that display engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
>   KMS routine to initialization stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.
> * Add dev member to struct dc_tc.
> 
>  drivers/gpu/drm/imx/Kconfig     |   1 +
>  drivers/gpu/drm/imx/Makefile    |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig  |   7 +
>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>  drivers/gpu/drm/imx/dc/dc-de.c  | 153 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  29 +++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 378 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 142 ++++++++++++
>  10 files changed, 810 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 

[...]

> +
> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	void __iomem *base_top;
> +	struct dc_de *de;
> +	int ret;
> +
> +	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
> +	if (!de)
> +		return -ENOMEM;
> +
> +	de->id = (enum dc_de_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base_top = devm_platform_ioremap_resource_byname(pdev, "top");
> +	if (IS_ERR(base_top))
> +		return PTR_ERR(base_top);
> +
> +	de->reg_top = devm_regmap_init_mmio(dev, base_top,
> +					    &dc_de_top_regmap_config);
> +	if (IS_ERR(de->reg_top))
> +		return PTR_ERR(de->reg_top);
> +
> +	de->irq_shdld = platform_get_irq_byname(pdev, "shdload");

Nit: shdload or shdld? Which one is used in the documentation?

> +	if (de->irq_shdld < 0)
> +		return de->irq_shdld;
> +
> +	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
> +	if (de->irq_framecomplete < 0)
> +		return de->irq_framecomplete;
> +
> +	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
> +	if (de->irq_seqcomplete < 0)
> +		return de->irq_seqcomplete;
> +
> +	de->dev = dev;
> +
> +	dev_set_drvdata(dev, de);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	dc_drm->de[de->id] = de;
> +
> +	return 0;
> +}
> +

[...]

> +
> +struct dc_de {
> +	struct device *dev;
> +	struct regmap *reg_top;
> +	struct dc_fg *fg;
> +	struct dc_tc *tc;
> +	int irq_shdld;
> +	int irq_framecomplete;
> +	int irq_seqcomplete;
> +	enum dc_de_id id;

Why do you need to store it? This patch makes use of it just for the
registration.

> +};
> +

[...]

> +static int dc_fg_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	void __iomem *base;
> +	enum dc_fg_id id;
> +	struct dc_fg *fg;
> +	struct dc_de *de;
> +
> +	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
> +	if (!fg)
> +		return -ENOMEM;
> +
> +	id = (enum dc_fg_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
> +	if (IS_ERR(fg->reg))
> +		return PTR_ERR(fg->reg);
> +
> +	fg->clk_disp = devm_clk_get(dev, NULL);
> +	if (IS_ERR(fg->clk_disp))
> +		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
> +				     "failed to get display clock\n");
> +
> +	fg->dev = dev;
> +
> +	de = dc_drm->de[id];

This depends on a particular order of component's being bound. If the
order changes for whatever reason (e.g. due to component.c
implementation being changed) then your driver might crash here.

This applies to several other places in the driver.

> +	de->fg = fg;
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
