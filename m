Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695379FAD92
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 12:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2A410E503;
	Mon, 23 Dec 2024 11:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pT/+xDIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E90F10E503
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 11:15:45 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3035210e2d1so35473231fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734952543; x=1735557343; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3mo6MP2QToWKxW6CHGPpfwk7yms3zeJ7L1O8Z7JM6ls=;
 b=pT/+xDIZLh3UVL9DGk3omwzIDdYBmZ3gYY31bYwa/sn6+WMxaq56yuQ9P0CCPC6QB5
 6vAo3c2LV4gU9Lv86SKXZb+BWubLxWaPsHBKJvepAIPTd80xNWkpuuMYnh8ayICKVigK
 djf5qNCdhet97cDbujK9BFsHdgfDvfCoQS8HrVGniGWUbGPzZWb194duYwzHWuj8rGLq
 747+oemC3/mTSAwepdASr7MlC7xMS73xy99fxxDJiOQTug5qDQ2ij3hRYFRLyPwNndHB
 zZqB5o3PaKb5LSAQ5+QnwKkwspiupYSpkE1TAsBRRhGsHk+YfLDVpj2Ftqpura8WFt9J
 DT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734952543; x=1735557343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mo6MP2QToWKxW6CHGPpfwk7yms3zeJ7L1O8Z7JM6ls=;
 b=jZYvA97U7s762Q5FnLW3wf+iOmr/7anQwSzf0HCEAxbGrOxEGZoTE1KZFoQLDuHANi
 1nmeGsn2q7VYbm757cnmAwNFvzE2RBdh9SMIEM0J/LeIhe7qR4lNhAQr/lGBXiKHUtl5
 WEYyOMoheYYSLEYrJT/QgHUc5lg2cQF28ZEUR4scHqDjjq0a2l9syB4YztnGc68K5ZGn
 UsPd0n3BUPz0P9PHP/70OxwcXoU69w3Tpw++Z2JCjTMz+3gOwnhGQHDvTSRMvvRhc0Ki
 I0BjSTkxPs9NFNxTMgOUHbwYUz2GlTB0LsPn7+siuSU7y5rL6LVx6yNvut12kB4crr1e
 BjGQ==
X-Gm-Message-State: AOJu0YxWm2cVWAtkbQ9I+rYzlLjZILUopIQosQXKLa5NBXgGPQODpVFG
 RnUFvKZtG6p2Tp09xk9QMi+T8IOTNZBxyRTWaLEbaZQEpGOxCPKWw2O0Hi5ubvYbJyR+7bO238k
 m
X-Gm-Gg: ASbGnctnAt6BwM4GxfS24cJ3bjl0Xn8hOLUYb04KoBGa8a8IDejSmv6426MDZHFdvuX
 YZV/u/Vyn0Wpy+IXJxuVS0Y11OvtHYSbdp4fQXV++KYoIUOx2i7xGKWIhk8yyu8aNBLuBT6l/c5
 qvI2u50gtD9z7cKTT1q3oTzGD2MZLOuTRa+bQ7FPxtmNDCTOTV62FqdF0mo3F8LuJFIuKmIfmyb
 6bJMSNAP+j5bm+N8UNto5H3DhEPhP8ydK9kFX/OvqTREuEvb25OX7zw3ynDDEao7RbU+zCgoY/i
 MyyxKsb5YbTSPUgZ9iOZ4WXCm479kr6krPwH
X-Google-Smtp-Source: AGHT+IEgmX/5ATGHYxkBwsAFplT1zESRogm6vsP2Mbb2JNoPZ4jUEIIAF7+Dio6FJRuZVz2+3nzV0g==
X-Received: by 2002:a05:651c:b0a:b0:304:4cac:d8ef with SMTP id
 38308e7fff4ca-304685487c2mr37661981fa.7.1734952543223; 
 Mon, 23 Dec 2024 03:15:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083e92sm12807641fa.116.2024.12.23.03.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 03:15:41 -0800 (PST)
Date: Mon, 23 Dec 2024 13:15:39 +0200
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
Subject: Re: [PATCH v7 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <7k2jqpkpagm3x7shywgzvtst364f6dmmhuz2covpbvghoa5rzc@3dvlbdgtnjck>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-11-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-11-victor.liu@nxp.com>
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

On Mon, Dec 23, 2024 at 02:41:38PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver and those unit
> drivers are components to be aggregated by a master registered in
> the upcoming DRM driver.
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
> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * Fix build warning by expanding sizeof(fu->name) from 13 to 21.
>   (kernel test robot)
> 
> v5:
> * Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
> * Fix commit message to state that pixel engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_lb_blendcontrol() function call from KMS routine to initialization
>   stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.

Carrying several comments from previous patch:
- shdld vs shdload
- use of indices in the compat strings
- bind() behaviour depending on the particular order of device bindings

> 
> +
> +void dc_fu_common_hw_init(struct dc_fu *fu)
> +{
> +	enum dc_fu_frac frac;
> +	int i;
> +
> +	dc_fu_baddr_autoupdate(fu, 0x0);
> +	dc_fu_enable_shden(fu);
> +	dc_fu_set_linemode(fu, LINEMODE_DISPLAY);
> +	dc_fu_set_numbuffers(fu, 16);
> +
> +	for (i = 0; i < ARRAY_SIZE(dc_fetchunit_all_fracs); i++) {

for (i = DC_FETCHUNIT_FRAC0 ; i < DC_FETCHUNIT_FRAC_NUM; i++) ?

> +		frac = dc_fetchunit_all_fracs[i];
> +
> +		dc_fu_layeroffset(fu, frac, 0, 0);
> +		dc_fu_clipoffset(fu, frac, 0, 0);
> +		dc_fu_clipdimensions(fu, frac, 1, 1);
> +		dc_fu_disable_src_buf(fu, frac);
> +		dc_fu_set_pixel_blend_mode(fu, frac);
> +	}
> +}
> +

[...]

> +enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
> +{
> +	return lb->link;
> +}
> +
> +void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
> +{
> +	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
> +	int i;
> +
> +	for (i = 0; i < fixed_sels_num + lb->id; i++) {

This function and the next one silently skip writing link ID if it is
incorrect. Can it actually become incorrect? If not, I'd say, it is
better to drop the loop and the array. If you are not sure, there should
be some kind of dev_warn() or drm_warn().

> +		if (prim_sels[i] == prim) {
> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
> +					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
> +					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
> +			return;
> +		}
> +	}
> +}
> +
> +void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
> +		if (sec_sels[i] == sec) {
> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
> +					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
> +					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
> +			return;
> +		}
> +	}
> +}
> +

[...]

> +
> +static int dc_lb_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	struct dc_pe *pe = dc_drm->pe;
> +	void __iomem *base_pec;
> +	void __iomem *base_cfg;
> +	struct dc_lb *lb;
> +
> +	lb = devm_kzalloc(dev, sizeof(*lb), GFP_KERNEL);
> +	if (!lb)
> +		return -ENOMEM;
> +
> +	lb->id = (enum dc_lb_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
> +	if (IS_ERR(base_pec))
> +		return PTR_ERR(base_pec);
> +
> +	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
> +	if (IS_ERR(base_cfg))
> +		return PTR_ERR(base_cfg);
> +
> +	lb->reg_pec = devm_regmap_init_mmio(dev, base_pec,
> +					    &dc_lb_pec_regmap_config);
> +	if (IS_ERR(lb->reg_pec))
> +		return PTR_ERR(lb->reg_pec);
> +
> +	lb->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
> +					    &dc_lb_cfg_regmap_config);
> +	if (IS_ERR(lb->reg_cfg))
> +		return PTR_ERR(lb->reg_cfg);
> +
> +	lb->link = lb_links[lb->id];

lb->link = LINK_ID_LAYERBLEND0 + lb->id ?

> +
> +	pe->lb[lb->id] = lb;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops dc_lb_ops = {
> +	.bind = dc_lb_bind,
> +};
> +

-- 
With best wishes
Dmitry
