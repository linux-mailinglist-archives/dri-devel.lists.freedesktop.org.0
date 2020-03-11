Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7A1823B3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 22:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234446E4FF;
	Wed, 11 Mar 2020 21:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA626E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 21:11:15 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z5so2040329pfn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NSfkleXDa5UPJsZWkmUSl1QpNzKwRs0wnvQ0H8hAcuc=;
 b=UgFFS3MautlLOAeYiAPLohAO7UDp9cITkh8tKbVU+R8+PzZ84LCRDmE4r6j88TS8VF
 TtV7+eFJOw1U6dwNTENpSlCfGxrz1XIuw061O6GtubW6D+lbVb/ki1tQmUyJ5Zi9Iubu
 l2GjAnAp2tk5nFCUnGm49gG98L4bLmg0KOAnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NSfkleXDa5UPJsZWkmUSl1QpNzKwRs0wnvQ0H8hAcuc=;
 b=EIJVcuNv+US5z+2+Qcl+gTZ3d0gBBFnkarFMYSzlU+DGq3GCIk6sXMn+3kzPskipuA
 U6XLr7+lhL3BgnqNJ/zm4xJ9U2EWfq1qP3VFSnHLOHV4lLpH1oLCE0yqxNzZ7S55m1P/
 esdk9BpQBq8Y8N5sFcaOpaRH8/+GXudr+Ox15WrVUNpAQhEoxI/u091AQub2lFdMuygV
 3PAOhUr6TjDxzG6wjfBUVqHN1Y2AsZdrWuOwvQ1yD+ZjXbs74tU0KgEWNbRfYNdENy8m
 L9GmhzlQhOvb/g87h1j02peX5mMMa0PdjEnpNyMh6bmCr5o+dLzjpPo6FwIJhUMWrv+Z
 Stdg==
X-Gm-Message-State: ANhLgQ1yy1tdYaYJdANBSBd15Bm7JMGKLJP24q7IIaYN6r3qFZQPv/4F
 7ZV2iDTY4iD19IQVpXE7Ut90LLe7aj4=
X-Google-Smtp-Source: ADFU+vvdn/plQdKp95zl7wL0YroSpLRU6DvjOwBhsyyoJR3bH/TAf4i7y2lkFOcgEOXSJin55tABKg==
X-Received: by 2002:a63:9d04:: with SMTP id i4mr4553990pgd.294.1583961075013; 
 Wed, 11 Mar 2020 14:11:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id u12sm51075103pfm.165.2020.03.11.14.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 14:11:14 -0700 (PDT)
Date: Wed, 11 Mar 2020 14:11:13 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v6 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200311211113.GC144492@google.com>
References: <20200311085807.21984-1-harigovi@codeaurora.org>
 <20200311085807.21984-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311085807.21984-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks for re-spinning!

One more comment inline.

On Wed, Mar 11, 2020 at 02:28:07PM +0530, Harigovindan P wrote:

> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..b226723a7543
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> ...
>
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_rm69299 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[1].supply = "vdd3p3";
> +
> +	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +			PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.dev = dev;
> +	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +		MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "dsi attach failed ret = %d\n", ret);
> +		goto err_dsi_attach;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		goto err_dsi_attach;
> +	}

the common way to do this kind of unwinding in the kernel would be to add
something like this before 'err_dsi_attach':

err_set_load:
	mipi_dsi_detach(dsi);


and then just do 'goto err_set_load' in the error paths.

> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		goto err_dsi_attach;
> +	}
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	drm_panel_remove(&ctx->panel);
> +	return ret;
> +}

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
