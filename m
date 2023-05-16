Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B63A70467B
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C071010E315;
	Tue, 16 May 2023 07:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD1110E315
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:33:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f475366522so44378155e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684222414; x=1686814414;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=P1CBJQZk3nGmqnh1NX99wMR8/HbaWCbVhluByi1E/gg=;
 b=pMUTGbpAVkJpZjmzKAwmaGe0oxW+idx19mZBzGO8T7sASsXGOoszO7B9g24JwqctTg
 Q/C+mLYjgX3HmsYGFYXv66qaTGxhfovd9fZKGXUOPhO+IyF+waGh7wERbv8FSpqwaqJU
 WWjwvSn3twE+l36M2A4x1HzAlDIdjL0KN/y6tlO6t3bjFSz4Mg8fSQj9X4N9DvvmC2/7
 M4/qpi4jxvX6ZlqfoO4H4+vJMy6k/rFKxVi6ttQaUWU9wTrA9d274OuHjDoup0SaudzR
 hfJCJHNPZXqnhxDujYeFK6LY6JtevZ6s8jqmq6jJ9XHw3UbTFE1KU/movbkrq65O8Bpb
 5s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684222414; x=1686814414;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P1CBJQZk3nGmqnh1NX99wMR8/HbaWCbVhluByi1E/gg=;
 b=SispjG8Jqu1f1Uo7cI9w5W4MQJy2qVfTDWdxZ7pZsht9KGdSLsoJ/+nZXCuv+XW4vh
 UlwqFZDRCiONIgQrdDO0KPsMTTgyN1u3Ul15ybXtf4G3sgEyBQuFDxqfzRBEe9rrK3e6
 J3YxZOiEl7YLf7e0R1rB5l8NMh7YK1RsKn/6JmdJ/2pB7hQtILaa7nWMiQejr6LxLITn
 mVB57/moUvty0IiUHLMgtJe2MMNq8cXabCrHu97T3UgJtXe2CIYqcYNxB8lMvttfpKCT
 E0fFYIKZl3cLyXNlA2DaY2BlIxzPlFNptacuvWwO41YSyfvgNC6LLHbxebKdSzQYX2Ij
 qAgw==
X-Gm-Message-State: AC+VfDwV7FL9JqsblZ1Ss8PNSObstxRuQoiKtnimRlpy3CYbjShi0eVn
 nrdwR5LUDWOCdXXoMvVz+Wu7ug==
X-Google-Smtp-Source: ACHHUZ6GJ0ORKzdRChRfD5ma+PIzXWFlPMPfAWorlFKHdguQ2khCw+kSy3PYMaaIMfb1ppTLM1mlkg==
X-Received: by 2002:a1c:7703:0:b0:3f4:2c8f:d2d3 with SMTP id
 t3-20020a1c7703000000b003f42c8fd2d3mr15548980wmi.20.1684222414539; 
 Tue, 16 May 2023 00:33:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a7bc846000000b003f3157988f8sm1305903wml.26.2023.05.16.00.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:33:34 -0700 (PDT)
Message-ID: <e819f7c7-5023-ce9b-3787-1fb152745f0e@linaro.org>
Date: Tue, 16 May 2023 09:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi83: Fix enable/disable flow
 to meet spec
Content-Language: en-US
To: Frieder Schrempf <frieder@fris.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Foss <rfoss@kernel.org>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-3-frieder@fris.de>
Organization: Linaro Developer Services
In-Reply-To: <20230503163313.2640898-3-frieder@fris.de>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 18:33, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The datasheet describes the following initialization flow including
> minimum delay times between each step:
> 
> 1. DSI data lanes need to be in LP-11 and the clock lane in HS mode
> 2. toggle EN signal
> 3. initialize registers
> 4. enable PLL
> 5. soft reset
> 6. enable DSI stream
> 7. check error status register
> 
> To meet this requirement we need to make sure the host bridge's
> pre_enable() is called first by using the pre_enable_prev_first
> flag.
> 
> Furthermore we need to split enable() into pre_enable() which covers
> steps 2-5 from above and enable() which covers step 7 and is called
> after the host bridge's enable().
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes for v2:
> * Drop RFC
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 75286c9afbb9..a82f10b8109f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -321,8 +321,8 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
>   	return dsi_div - 1;
>   }
>   
> -static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> -				    struct drm_bridge_state *old_bridge_state)
> +static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>   {
>   	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>   	struct drm_atomic_state *state = old_bridge_state->base.state;
> @@ -484,11 +484,22 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>   	/* Trigger reset after CSR register update. */
>   	regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
>   
> +	/* Wait for 10ms after soft reset as specified in datasheet */
> +	usleep_range(10000, 12000);
> +}
> +
> +static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *old_bridge_state)
> +{
> +	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> +	unsigned int pval;
> +
>   	/* Clear all errors that got asserted during initialization. */
>   	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>   	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
>   
> -	usleep_range(10000, 12000);
> +	/* Wait for 1ms and check for errors in status register */
> +	usleep_range(1000, 1100);
>   	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>   	if (pval)
>   		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
> @@ -555,6 +566,7 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
>   	.attach			= sn65dsi83_attach,
>   	.detach			= sn65dsi83_detach,
>   	.atomic_enable		= sn65dsi83_atomic_enable,
> +	.atomic_pre_enable	= sn65dsi83_atomic_pre_enable,
>   	.atomic_disable		= sn65dsi83_atomic_disable,
>   	.mode_valid		= sn65dsi83_mode_valid,
>   
> @@ -697,6 +709,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
>   
>   	ctx->bridge.funcs = &sn65dsi83_funcs;
>   	ctx->bridge.of_node = dev->of_node;
> +	ctx->bridge.pre_enable_prev_first = true;
>   	drm_bridge_add(&ctx->bridge);
>   
>   	ret = sn65dsi83_host_attach(ctx);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
