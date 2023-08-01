Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BDA76AEE0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E93410E37D;
	Tue,  1 Aug 2023 09:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7747F10E37D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:42:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso50181515e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690882961; x=1691487761;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=B8htkPfQN7tDCTKzLvcKLdUtnIHD1CgSdgnE1gTJ9+A=;
 b=GOFohhf7EJlA6jrKUeTDGHDzyuW7gl2OJAwUqkqYQeM8p3uwkHQtamtSxytNvLo5ie
 3dtsNnrjYJpsfkpJJ3X1biDoOBEzJcRxLsCW3xw1089uR4gJrvQZe4T+JjzKKMMQtMJT
 c1h73M90WwJEXC/cA3GhxA3kyLlJUN38rJXBI/w+FzoZe65JH8TmyaxaHOfnQ0jUpfUJ
 IkMrcpxgXqGjFWzSJeGpYq2xNRJLIEK3UdOl2Wp6Wlr9O3KW+Y4m/hSPiBPdDt+0h2bV
 3TVSwqECd9JWHfOF8rJWy5jPGvCR3q8tLWBOB2P5MPPEau0rGh9eXch5VRRAKwpW8pHW
 TL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882961; x=1691487761;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8htkPfQN7tDCTKzLvcKLdUtnIHD1CgSdgnE1gTJ9+A=;
 b=H4Xn+U7RXiJ5GBuqCU//Kn+QToSsiqlya9Ycmt3pt1HLiYZ4+tXjTvLGWVxn9gYmUF
 t6W2l78UI3hd81/54nocwd00JOaCT8UUI8R5vXbkEGL/Pej0B8Mcw4i1NSBX7nFvKLGw
 tGB9g5Aj7ZSQm2iN/G7GGOB1jU69hksJf9BQox+HjPmHpdgTx51pmNxXvC3IbNPEH/wg
 KkF/W40nz0QV0Fx/DE6Xq6hLMvj+Bu0UwwoeY56fZ3r8a5fS5QH1mLfA0ognH7Yiy0Ch
 QhmNXdtrrC2yqRs0akuLKL21RekgAYAD/T4H4ZLUyDhGSBz7jRWsLWgFvCXYBON6Uv9u
 QnwQ==
X-Gm-Message-State: ABy/qLbDV2cRvAJ4Y2qg04T/hXdqvTtRH1QsySWSvv/2kuS+0/Xz1ZoF
 73O5dwXmPw+74yxy3qo/KSevdQ==
X-Google-Smtp-Source: APBJJlH8+vyOv7Y4rRY+pMDO1yXUEHYynaydqbSPnfpp1Dyw3Ic6Q3e5j6BfodNBBIcBgpdzjPUK5Q==
X-Received: by 2002:adf:f206:0:b0:313:e9f6:3378 with SMTP id
 p6-20020adff206000000b00313e9f63378mr1858599wro.4.1690882960821; 
 Tue, 01 Aug 2023 02:42:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b0031751d7d8a6sm15609359wrx.18.2023.08.01.02.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 02:42:40 -0700 (PDT)
Message-ID: <285db5bc-f901-e09f-7f86-6638d260c283@linaro.org>
Date: Tue, 1 Aug 2023 11:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
 rate to calculate lbcc
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-6-victor.liu@nxp.com>
Organization: Linaro Developer Services
In-Reply-To: <20230717061831.1826878-6-victor.liu@nxp.com>
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
Cc: conor+dt@kernel.org, rfoss@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/07/2023 08:18, Liu Ying wrote:
> To get better accuration, use pixel clock rate to calculate lbcc instead of
> lane_mbps since the pixel clock rate is in KHz while lane_mbps is in MHz.
> Without this, distorted image can be seen on a HDMI monitor connected with
> i.MX93 11x11 EVK through ADV7535 DSI to HDMI bridge in 1920x1080p@60 video
> mode.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index c754d55f71d1..332388fd86da 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -12,6 +12,7 @@
>   #include <linux/component.h>
>   #include <linux/debugfs.h>
>   #include <linux/iopoll.h>
> +#include <linux/math64.h>
>   #include <linux/media-bus-format.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> @@ -762,8 +763,15 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
>   					   u32 hcomponent)
>   {
>   	u32 frac, lbcc;
> +	int bpp;
>   
> -	lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
> +	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	if (bpp < 0) {
> +		dev_err(dsi->dev, "failed to get bpp\n");
> +		return 0;
> +	}
> +
> +	lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
>   
>   	frac = lbcc % mode->clock;
>   	lbcc = lbcc / mode->clock;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
