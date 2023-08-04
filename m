Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D221976FC1F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 10:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE3310E6B7;
	Fri,  4 Aug 2023 08:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1130488A3E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 08:40:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3178dd81ac4so1578948f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 01:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691138404; x=1691743204;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=wdx3f+50DISgPPdeHaF0Mb88wToJy9z92MXQTy2q84c=;
 b=hB9V8I0glM0cDRfG7+8UN4Ubaid2OSD46rTP9V16nGgVB4fsisVPZ7KCVDB/EZLW+V
 yKJ4rv++74jOrxUO0L7w3SYVbQ609CWQe28Dcut/Jv7yChXGuFlX7TQs+3hjeJQN69Xm
 D55fS1N4pa8iYPY0KZur9KoPD2yIdHlFrvvnegD1QiI+clS3aUcwLuO9wFsn5QNrbewp
 OxXUflTWArgs7DRGM8HYBUqY4xyBBkT+l5yH44jNChIY+CbuhFQX4j8iOiuI1xVh4kSY
 UrhJWBYK1KW277SOUKRcnJbk07f70ohDxoGQdkd8EOTpQbyCajLjZZTshgxEeZwZ5KKQ
 DkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691138404; x=1691743204;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdx3f+50DISgPPdeHaF0Mb88wToJy9z92MXQTy2q84c=;
 b=jX/8Q4JCEVu3RcWDvHkIjx2EH7HpXrEebDUcASXRUs48GktTKw1eaxvWNhZquO0uhC
 TGNw+YbFXE7c8z6CNCKCmNpvwG6y8WiMQm/nJodY7BlBGvaw+Jww/XI7mhhwStfZ/frA
 jfhCs/FqyfCrlVgSFqzzOsJeFpOUZDhyRArH8nuC+7j1IpyZcUdi8K+l7NBFv2x4S7OF
 6ZSgkIcwykMR8Y6kmAheIN0Gt+yTbM9SNapGJ8xI1OWguygg0Ha5Ok9rPtHIEOvWAqgM
 z3IzFx71CII9KIh7ccVro5nz2CaKf/0hPNvCVdYzSCMD2qL0eVT5ubBFTyOxYOqgdOiL
 BZig==
X-Gm-Message-State: AOJu0Yx757xj1O1U0yQnina9W09kchNcKxeuElHJEWRHtofdP5rx0owB
 5GjRNsPfeMdU+yOvgcEir2CXAA==
X-Google-Smtp-Source: AGHT+IHZJjfZzR14MYOvYq7wNubxQq7a16qY4NsGBsLLUeTuQhj3Q57WLx2xslUl8/d9+Zez0BZtPA==
X-Received: by 2002:adf:dfcf:0:b0:313:f429:f6e9 with SMTP id
 q15-20020adfdfcf000000b00313f429f6e9mr824781wrn.60.1691138404492; 
 Fri, 04 Aug 2023 01:40:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b526:9083:f5a6:4af1?
 ([2a01:e0a:982:cbb0:b526:9083:f5a6:4af1])
 by smtp.gmail.com with ESMTPSA id
 w17-20020adff9d1000000b00301a351a8d6sm1930082wrr.84.2023.08.04.01.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 01:40:04 -0700 (PDT)
Message-ID: <b2407b1d-23fb-3284-c4bb-b3a952d361dd@linaro.org>
Date: Fri, 4 Aug 2023 10:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] drm/panel: sitronix-st7789v: add panel orientation
 support
Content-Language: en-US
To: Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Reichel
 <sre@kernel.org>, Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
 <20230718-feature-st7789v-v2-2-207cb1baea0f@wolfvision.net>
Organization: Linaro Developer Services
In-Reply-To: <20230718-feature-st7789v-v2-2-207cb1baea0f@wolfvision.net>
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

Hi,

On 03/08/2023 22:13, Michael Riesch wrote:
> Determine the orientation of the display based on the device tree and
> propagate it.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index c7cbfe6ca82c..6575f07d49e3 100644
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
> @@ -349,6 +364,7 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
>   	.disable = st7789v_disable,
>   	.enable	= st7789v_enable,
>   	.get_modes = st7789v_get_modes,
> +	.get_orientation = st7789v_get_orientation,
>   	.prepare = st7789v_prepare,
>   	.unprepare = st7789v_unprepare,
>   };
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

This patch doesn't apply clean on drm-misc-next, could you rebase and resend ?

Thanks,
Neil
