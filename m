Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21D6E03EB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 03:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74BA10E08D;
	Thu, 13 Apr 2023 01:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0182010E08D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:58:28 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so16584201pja.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681351106; x=1683943106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f3FTM3P0d0Yu5XkpwXvscwyTC9to58Zm82Hu9n7W5lA=;
 b=Nk6f9Pe/mKe1sUmRoEDXBv3+WBVPk4QiJmvSEpW13PD898AB4RFv6CZD+dydHcB5pM
 pwPWnq5590ybVEuMMwMIxhmODHzbxOXEF8vu4DEy9TSj+rW6Ok8lRhbeiXzkw8MTSHhZ
 e1WPeyeDEELmtnM5EcpyPAqkjuOFe+BbCX+jO3WcJqPuSuUBE/64MO7OIVCva4yncij+
 M8z7DGVI06S+w5FhTeSakc96krHNJVhBdPrO79vt2r2vymL5yUCU9fHRcmXa7nDx4ykW
 ArA40m5hEMchG1LljJAWYJg/cfb3qH37Ks1o0dFyMHhFd3gv27W2nm9ZcaNRZOEBD8iR
 N5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681351106; x=1683943106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3FTM3P0d0Yu5XkpwXvscwyTC9to58Zm82Hu9n7W5lA=;
 b=YeubylfCTvvhnVln3vzgVpPWRZN5fM79XzHzUcWWicRPJl/zyW83dX+L7MbZj+0nj3
 LcG7ZWHJtIUg2GisbanaRuxbD55YXN1tvvxjcPWGxa8blZWhCRKAcdshbANHTdsjW4QV
 JFZ2DVPq/NzkVlUG6R1DTU4/bD8W+aq88BLyl2GpDYabvGQTNr5FFvcp1gVSwxDDD0qc
 hDyWr3yVpKo1c8TVNlwnhXI3TQZwscggNv/Dyo9spnA7LWeRPZs29/KoKK8ilrQzqqE7
 6z+Cav7gKA0JODq6qzWm2jSbTA6lK2Cc/hdyzUfduQqKJt6yOxJDWVrs7kXagEYg+OPG
 Lm0w==
X-Gm-Message-State: AAQBX9fVwcD3786sep3EravV/NL30ajVCeSojJfYlujNT6KX1HheCLvC
 M7nYOGmX92C168pzxUNtF8pTTFk0fEYpGw==
X-Google-Smtp-Source: AKy350YsWsIxmIbxe78NeEUCc7ewzT0hAu7KlLpKz2CX1dJIn1A+N/1pK2r/hfg6GpSJqsUg8+QgWw==
X-Received: by 2002:a17:902:d0d2:b0:1a5:2b9b:67f7 with SMTP id
 n18-20020a170902d0d200b001a52b9b67f7mr310775pln.46.1681351106540; 
 Wed, 12 Apr 2023 18:58:26 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1709028c9400b001a63deeb5e2sm231190plo.92.2023.04.12.18.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 18:58:25 -0700 (PDT)
Date: Thu, 13 Apr 2023 09:58:19 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 3/5] drm/panel: nt36523: Add DCS backlight support
Message-ID: <ZDdhu3OprlFNyUO4@Gentoo>
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
 <20230412-topic-lenovopanel-v1-3-00b25df46824@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412-topic-lenovopanel-v1-3-00b25df46824@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 09:46:00PM +0200, Konrad Dybcio wrote:
> This chip supports controlling the backlight via DCS commands, on at
> least some panels. Add support for doing so.
> 
> Note this may only concern the NT36523*W* variant. Nobody knows, really,
> there's no docs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 67 +++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index d30dbbfb67b1..3c81ec014eef 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
>   */
>  
> +
[..]
> +static struct backlight_device *nt36523_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 512,
> +		.max_brightness = 4095,
Please set the missing scale property of backlight. Daniel said: "Unknown is never correct for
new drivers."
See https://lore.kernel.org/lkml/Y6SIWoVFX%2FOlNO0n@aspen.lan/

Otherwise,

Reviewed-by: Jianhua Lu <lujianhua000@gmail.com>
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &nt36523_bl_ops, &props);
> +}
> +
>  static int nt36523_probe(struct mipi_dsi_device *dsi)
>  {
>  	struct device *dev = &dsi->dev;
> @@ -730,9 +784,16 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
>  	mipi_dsi_set_drvdata(dsi, pinfo);
>  	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
>  
> -	ret = drm_panel_of_backlight(&pinfo->panel);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to get backlight\n");
> +	if (pinfo->desc->has_dcs_backlight) {
> +		pinfo->panel.backlight = nt36523_create_backlight(dsi);
> +		if (IS_ERR(pinfo->panel.backlight))
> +			return dev_err_probe(dev, PTR_ERR(pinfo->panel.backlight),
> +					     "Failed to create backlight\n");
> +	} else {
> +		ret = drm_panel_of_backlight(&pinfo->panel);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +	}
>  
>  	drm_panel_add(&pinfo->panel);
>  
> 
> -- 
> 2.40.0
> 
