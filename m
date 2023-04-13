Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD66E03F8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 04:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDB110EA03;
	Thu, 13 Apr 2023 02:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AE710EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:07:23 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 jx2-20020a17090b46c200b002469a9ff94aso11864943pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 19:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681351642; x=1683943642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BEy739Q6DzyPTPI+EMOV/uu+jSkhw/XJ8H+BPcHU6Bs=;
 b=YABSAzecJklqy+eOR5eewLTULsC0NynzfDE9O0fbd42ALSZM+w+gf4McrSErgoyYaK
 Fsnz+P7cNCAKB6FN4O1oatl3SbLvcJW0n4yEcX3KBvmQAOJUyEFssVz+xa4BXuzRBUt6
 zzcSd+nq2FL3bbLR5+tgRXfrbeOgRhnzscVlurEfwPgIU9CXuREmCFZhvruyOhfvWaO+
 VX/NvzU2baoHrG0KY9uHtl7JRkcuuCXJrc6L7bXh8k+4wTki4//kNKgofyHJS5d8aKPC
 lBVmNG5TkTc6pN2SCood8G6R/Q5jxVOEcf+3HY1QpIkQeGZE8e164CmoH9SudD2Dlh7c
 mMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681351642; x=1683943642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEy739Q6DzyPTPI+EMOV/uu+jSkhw/XJ8H+BPcHU6Bs=;
 b=Uud1sne9fwNTkf6vTxzRk+89UVRpBRYJlb4NQZDsCAFJyYy2KBOKRoH7NWTl4eo6Cr
 vEJW7Lel6hnPdOPTt6FJm0ilRIyy8pGmcLUKhGo+IbSo1APj1vuPfTYL4bxXmTEaKbbJ
 kPB9NRnAkCqVDhYeeZ86qk9a7ihwfGqGjdEz/+dwLyn1bMWK4rI5hHKubiuT+6zjVuzB
 ECjSNhJ3q0uLl22qxDTRZvk+q4M0TIJbqxctQNRTYMM6tI1t0+BWq96Puwv9JB9H6j0m
 Hhr3QIWPDNXLZDErbmQoc8M8kz2tigfakmDVOwhrfuJdle6QpXSBBuCdyiWenqDQXDjQ
 sb4w==
X-Gm-Message-State: AAQBX9dDoWUhSDjA1EefkAOX1RfxbYUMYHYCM/1CVOmiZsHqCegX21LM
 NFIf44rAOGmq+MnkcbWuMVM=
X-Google-Smtp-Source: AKy350bRu/BzSqanT7tkZ7WazrwfBESoI0yWMZiJHdyKwePaMYz7NCCNIjcPK2NWOPsAetiGcY7GXQ==
X-Received: by 2002:a17:90a:b005:b0:23d:16d6:2f05 with SMTP id
 x5-20020a17090ab00500b0023d16d62f05mr212424pjq.22.1681351642301; 
 Wed, 12 Apr 2023 19:07:22 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902bd8f00b001a67759f9f8sm239125pls.106.2023.04.12.19.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 19:07:21 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:07:15 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 4/5] drm/panel: nt36523: Get orientation from OF
Message-ID: <ZDdj04+RiBcOP9z0@Gentoo>
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
 <20230412-topic-lenovopanel-v1-4-00b25df46824@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412-topic-lenovopanel-v1-4-00b25df46824@linaro.org>
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

On Wed, Apr 12, 2023 at 09:46:01PM +0200, Konrad Dybcio wrote:
> Some bright vendors mount their display panels upside down. Add the
> required pieces to allow for accounting for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index 3c81ec014eef..db4b4af13ec1 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -31,6 +31,7 @@ struct panel_info {
>  	struct drm_panel panel;
>  	struct mipi_dsi_device *dsi[2];
>  	const struct panel_desc *desc;
> +	enum drm_panel_orientation orientation;
>  
>  	struct gpio_desc *reset_gpio;
>  	struct backlight_device *backlight;
> @@ -674,11 +675,19 @@ static int nt36523_get_modes(struct drm_panel *panel,
>  	return pinfo->desc->num_modes;
>  }
>  
> +static enum drm_panel_orientation nt36523_get_orientation(struct drm_panel *panel)
> +{
> +	struct panel_info *pinfo = to_panel_info(panel);
> +
> +	return pinfo->orientation;
> +}
> +
>  static const struct drm_panel_funcs nt36523_panel_funcs = {
>  	.disable = nt36523_disable,
>  	.prepare = nt36523_prepare,
>  	.unprepare = nt36523_unprepare,
>  	.get_modes = nt36523_get_modes,
> +	.get_orientation = nt36523_get_orientation,
>  };
>  
>  static int nt36523_bl_update_status(struct backlight_device *bl)
> @@ -784,6 +793,12 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
>  	mipi_dsi_set_drvdata(dsi, pinfo);
>  	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
>  
> +	ret = of_drm_get_panel_orientation(dev->of_node, &pinfo->orientation);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +		return ret;
> +	}
> +
>  	if (pinfo->desc->has_dcs_backlight) {
>  		pinfo->panel.backlight = nt36523_create_backlight(dsi);
>  		if (IS_ERR(pinfo->panel.backlight))
> 
> -- 
> 2.40.0
> 
