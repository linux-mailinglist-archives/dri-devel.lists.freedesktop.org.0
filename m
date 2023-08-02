Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C92476CD06
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D373410E161;
	Wed,  2 Aug 2023 12:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D4A10E161
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 12:39:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe2048c910so30847495e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690979951; x=1691584751;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tbhphQECHi5RNB4NwguVktSnKXWXwNKeOWGLodXN7ec=;
 b=VFHZtgQCV0pSPd0KU6ifIcy62cVPhG9i4d7qef4Gqgm6Q36Xsy4/yNNXHRDG0ovYlh
 tdD+Qf450D3gLRwHMtPcmDFi3Hzo0xt+Dv8wJquOvzOPWPCZiQJLFPZWPGiM6U3Yhr++
 j++rJz+cZVuIEV5Hlwvu13h2B89q77R/l+rzc+Mb+cfRVl+EWcNbQz3+snWyKnskzKBu
 UoyMZeBWBKkvb6nS6/VFAjVy5hcuEKnc5c/iclIkt/QUIUW5PX2IclKfAeL7FVBWuJVv
 sgtkDkBlI6TFn8tnK7q0v8fcNa0EA/CMHTmNKlhVNltB0IVoNROcSElt29j936sGx3hj
 HNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690979951; x=1691584751;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tbhphQECHi5RNB4NwguVktSnKXWXwNKeOWGLodXN7ec=;
 b=RwowhsyVuPzNn3dnPV3O7ZZJPCswo1WG8/VsqHLMGjx6jtWGtwN3cH1E0OpNrgQKJB
 a4UzcM0mYw6bwFhcO2KUe7BDkT60p/IPz88QwToww6satq6cUfQW7qOhvldsNPNfNkHy
 k3PRWQMbgLJ7Fpq8eK3g1Gd0FKaPa07niZn9CSBoRnsgl8KkGrp5BTk5eltwWhFB4U92
 QB5FIaB3HNnjFjLZA9SC5HOYmAdflxgzmlKrTykUMeTjr0yn3hmSmBuw+LX1Wu26cyfH
 YqRwnpeD4H28sDktDuBFS62ATgdXtM8NuJkRHO0YW2gR3rTbtMWgSYgaKnzMDz0jRC5r
 J3og==
X-Gm-Message-State: ABy/qLbzvdsQX4IGTRQuvMtc55y19kY48+h3LIrQj/jt7ZlxdfVrw/uc
 jb3T+fjBnsQ53OdcsOMnTLm1yg==
X-Google-Smtp-Source: APBJJlFoPoWS6AxIqRpmgQDiQxFwoRDTK3d+p2EupVUpKnirysa1JIs7sorMtcEn0WRNnTsXEXeWQg==
X-Received: by 2002:a5d:44c5:0:b0:317:5d3d:d387 with SMTP id
 z5-20020a5d44c5000000b003175d3dd387mr4442154wrr.25.1690979951204; 
 Wed, 02 Aug 2023 05:39:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adfe504000000b003063a92bbf5sm19129742wrm.70.2023.08.02.05.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 05:39:10 -0700 (PDT)
Message-ID: <1e538813-69d4-b3bc-47f9-1ea69d65ef00@linaro.org>
Date: Wed, 2 Aug 2023 14:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: sitronix-st7789v: add panel orientation
 support
Content-Language: en-US
To: Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Reichel
 <sre@kernel.org>, Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
 <20230718-feature-st7789v-v1-1-76d6ca9b31d8@wolfvision.net>
Organization: Linaro Developer Services
In-Reply-To: <20230718-feature-st7789v-v1-1-76d6ca9b31d8@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 17:12, Michael Riesch wrote:
> Determine the orientation of the display based on the device tree and
> propagate it.
> 
> While at it, fix the indentation in the struct drm_panel_funcs.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 28 +++++++++++++++++++++-----
>   1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index bbc4569cbcdc..6575f07d49e3 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -116,6 +116,7 @@ struct st7789v {
>   	struct spi_device *spi;
>   	struct gpio_desc *reset;
>   	struct regulator *power;
> +	enum drm_panel_orientation orientation;
>   };
>   
>   enum st7789v_prefix {
> @@ -170,6 +171,7 @@ static const struct drm_display_mode default_mode = {
>   static int st7789v_get_modes(struct drm_panel *panel,
>   			     struct drm_connector *connector)
>   {
> +	struct st7789v *ctx = panel_to_st7789v(panel);
>   	struct drm_display_mode *mode;
>   
>   	mode = drm_mode_duplicate(connector->dev, &default_mode);
> @@ -188,9 +190,22 @@ static int st7789v_get_modes(struct drm_panel *panel,
>   	connector->display_info.width_mm = 61;
>   	connector->display_info.height_mm = 103;
>   
> +	/*
> +	 * TODO: Remove once all drm drivers call
> +	 * drm_connector_set_orientation_from_panel()
> +	 */
> +	drm_connector_set_panel_orientation(connector, ctx->orientation);
> +
>   	return 1;
>   }
>   
> +static enum drm_panel_orientation st7789v_get_orientation(struct drm_panel *p)
> +{
> +	struct st7789v *ctx = panel_to_st7789v(p);
> +
> +	return ctx->orientation;
> +}
> +
>   static int st7789v_prepare(struct drm_panel *panel)
>   {
>   	struct st7789v *ctx = panel_to_st7789v(panel);
> @@ -346,11 +361,12 @@ static int st7789v_unprepare(struct drm_panel *panel)
>   }
>   
>   static const struct drm_panel_funcs st7789v_drm_funcs = {
> -	.disable	= st7789v_disable,
> -	.enable		= st7789v_enable,
> -	.get_modes	= st7789v_get_modes,
> -	.prepare	= st7789v_prepare,
> -	.unprepare	= st7789v_unprepare,
> +	.disable = st7789v_disable,
> +	.enable	= st7789v_enable,
> +	.get_modes = st7789v_get_modes,
> +	.get_orientation = st7789v_get_orientation,
> +	.prepare = st7789v_prepare,
> +	.unprepare = st7789v_unprepare,

Changing the indentation of the whole block is a spurious change,
either change it in a separate patch or use the current indentation style...

>   };
>   
>   static int st7789v_probe(struct spi_device *spi)
> @@ -382,6 +398,8 @@ static int st7789v_probe(struct spi_device *spi)
>   	if (ret)
>   		return ret;
>   
> +	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
> +
>   	drm_panel_add(&ctx->panel);
>   
>   	return 0;
> 

With this changed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

