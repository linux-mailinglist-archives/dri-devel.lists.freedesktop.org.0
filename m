Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA876AEE2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1110E37F;
	Tue,  1 Aug 2023 09:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A54410E37E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:42:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so44238245e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 02:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690882966; x=1691487766;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=spF4IU+DOCl88bX1rso/uViMAiAyL5X5n+sxPi2GuFg=;
 b=TkX9otIECX+hw5hx1UB7tmWPS4t5tB805GlBzJfIqyJ/LIU22c+5ATQtjStUO5jZf1
 J30TLHhMn0K18ttRbJd/MhiaQSnKKiv3eYHv4eJqDhUTa6yGA5t5PCrW6ElchexL1BZO
 8IRkZJhclDYTeA+9aJ1aC09xnAuRAbC3aREIUEUoSipnjZRwX5oFKH2uNr3pfrKhRvtj
 BclQ7Ia1O4uB2AR/rgqn1H7pJCCBW8BDTE27CmKsu99qza5c+Arxt3MAyBSu7H8Rgu0P
 8oC5RlhpQzk0RiOiKlKw2iZrltoCgoEQ3Py6W1aaCkhexq4y2DljX3bXEcvso0G+/0tA
 7t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882966; x=1691487766;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spF4IU+DOCl88bX1rso/uViMAiAyL5X5n+sxPi2GuFg=;
 b=Ulgog6UBAsMqhYJnxPxjwpneb0Pwb+D8SA1b1csO9bCFxqg08igtETXyWR81OOG6q9
 XKNFc+e4OeYT16FPjRqNs75ygF/QCLYZv7rIghOHonT939SHO3FtuGAajer8qgwnou3I
 /jPvU+sXuiZsCMdOheyXJH0Xun9A3Wkvd7/8ZWlFLDg5AxBPI3u44KaNuMmWjo0BTx87
 jaFooSWBEKWWY4TvbXe6V7Jpbee+Hq2U2k/n1JQ2FVQFnYbW/qXJ3m17zoYfqduo+Tij
 w9AjIVliTtox06gvChNYVJvAs46DGY5RkXr2EQzxyo1HVhcHM3eSfiynb71CkuqiG6ZT
 fqVA==
X-Gm-Message-State: ABy/qLbgRhFTg1Cp/9qOGeZFa1HENYKY9K/PKfv+6AtHDtfJ6ZGxfe+r
 XtNvGac6qh1Mt8VzphoSVaskrw==
X-Google-Smtp-Source: APBJJlGnV/bR40erYnmyMF31OZCXGjDstUGU65XA0rEf6F8ew0/xJcZhNxfe8e789SbPjqVfzSdibg==
X-Received: by 2002:a05:600c:4792:b0:3fe:21f1:aba8 with SMTP id
 k18-20020a05600c479200b003fe21f1aba8mr1916010wmo.12.1690882965908; 
 Tue, 01 Aug 2023 02:42:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c234300b003fc16ee2864sm13713955wmq.48.2023.08.01.02.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 02:42:45 -0700 (PDT)
Message-ID: <8753afee-e160-8252-9ab2-4b1dad82d432@linaro.org>
Date: Tue, 1 Aug 2023 11:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/9] drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane
 byte clock cycles for HSA and HBP
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-7-victor.liu@nxp.com>
Organization: Linaro Developer Services
In-Reply-To: <20230717061831.1826878-7-victor.liu@nxp.com>
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
> According to Synopsys support channel, each region of HSA, HBP and HFP must
> have minimum number of 10 bytes where constant 4 bytes are for HSS or HSE
> and 6 bytes are for blanking packet(header + CRC).  Hence, the below table
> comes in.
> 
> +------------+----------+-------+
> | data lanes | min lbcc | bytes |
> +------------+----------+-------+
> |     1      |    10    |  1*10 |
> +------------+----------+-------+
> |     2      |    5     |  2*5  |
> +------------+----------+-------+
> |     3      |    4     |  3*4  |
> +------------+----------+-------+
> |     4      |    3     |  4*3  |
> +------------+----------+-------+
> 
> Implement the minimum lbcc numbers to make sure that the values programmed
> into DSI_VID_HSA_TIME and DSI_VID_HBP_TIME registers meet the minimum
> number requirement.  For DSI_VID_HLINE_TIME register, it seems that the
> value programmed should be based on mode->htotal as-is, instead of sum up
> HSA, HBP, HFP and HDISPLAY.
> 
> This helps the case where Raydium RM67191 DSI panel is connected, since
> it's video timing for hsync length is only 2 pixels and without this patch
> the programmed value for DSI_VID_HSA_TIME is only 2 with 4 data lanes.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 332388fd86da..536306ccea5a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -757,12 +757,19 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
>   	dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
>   }
>   
> +static const u32 minimum_lbccs[] = {10, 5, 4, 3};
> +
> +static inline u32 dw_mipi_dsi_get_minimum_lbcc(struct dw_mipi_dsi *dsi)
> +{
> +	return minimum_lbccs[dsi->lanes - 1];
> +}
> +
>   /* Get lane byte clock cycles. */
>   static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
>   					   const struct drm_display_mode *mode,
>   					   u32 hcomponent)
>   {
> -	u32 frac, lbcc;
> +	u32 frac, lbcc, minimum_lbcc;
>   	int bpp;
>   
>   	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> @@ -778,6 +785,11 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
>   	if (frac)
>   		lbcc++;
>   
> +	minimum_lbcc = dw_mipi_dsi_get_minimum_lbcc(dsi);
> +
> +	if (lbcc < minimum_lbcc)
> +		lbcc = minimum_lbcc;
> +
>   	return lbcc;
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
