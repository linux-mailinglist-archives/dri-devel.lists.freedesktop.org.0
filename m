Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D91666E22
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0349A10E8B2;
	Thu, 12 Jan 2023 09:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FAF10E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:28:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so395218wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bE4oQCcZATgYswFNXjiN1PSYvEeSqVFFTUEgVcCHRqY=;
 b=WLFz0SjPniOmuuhOSq+y9zKQAgHClwh20BdVYXd2Umlja+eunpiFmc7s4kRtI42i+d
 zsnRwdmemcr0uWpc5ln/7xC4tvfHa9q8taCiKhXFHVGwldR/cvFgYqkpQC+ApK+xYW5X
 E9k27xRHWDgSmWUl32GFnSYvceHlHhBpZNR6o7Rd8Q65PgYJuwfFeK3RMUnm7AmrgE8B
 v3HPtaqezo5VwCsQXK//0JgmLTlKD4monuuDMLiDIbOesJcEXoITlXHhRdKVOokTROSp
 nP8o+IqDYx+qgbRkN4BXC1sP2+v7bkxfUFDUnCBicq8WafK5E9RrOulGiHlW60hvuUoj
 WSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bE4oQCcZATgYswFNXjiN1PSYvEeSqVFFTUEgVcCHRqY=;
 b=nVUTln6X6jsieyL34cQQmDWOiqOFGvl1lT3QSiSYIRvCQqf2i6RNjZyHJSMxOYEpk8
 li29bUFHFNNMa1ySMISS+qVV/4VLBJqRHBb4QNFMlk724WiInFXGJG/uUPdAicZN/IHt
 Vfj7UKblujdZO1DmlEkD1YWZo6Ss5xaQB6wyqT8XXWxgiNTgX7egjAsl3hvq7ivoYJga
 B0qyq4VXoICXG1Bt+Y3bZuhlnth5b+hzuF3WEicUDhBmvLTXGoFIM5nNljcGjv7vDdrT
 YUh1TDPlm6F5yFjZEKGdWzPvXJyY/kdzVzQ63YpCr19D11/Q7tW9VsG5kyuUAzLcxKMq
 5RuA==
X-Gm-Message-State: AFqh2koMdZg1VTI0wBTTHOunFhzmABdUD4DsYEDsrQOAE/8Z1K9alEnB
 24/LFiBthymOAch/u9un+qQr3A==
X-Google-Smtp-Source: AMrXdXuPWI+yg3atLG0k05sqkYIWUkReEqRYzDSBlD2E+8z9mFSN57rM5bbZX3yhPmwmm9H3tSGnDg==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id
 be12-20020a05600c1e8c00b003d62952679bmr54348403wmb.34.1673515683704; 
 Thu, 12 Jan 2023 01:28:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm28585178wmq.33.2023.01.12.01.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:28:03 -0800 (PST)
Message-ID: <1fc55e78-d5a2-c16d-0178-2195fe09d8ae@linaro.org>
Date: Thu, 12 Jan 2023 10:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 05/13] drm/bridge: lt9611: fix clock calculation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-6-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-6-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/01/2023 17:56, Dmitry Baryshkov wrote:
> Instead of having several fixed values for the pcr register, calculate
> it before programming. This allows the bridge to support most of the
> display modes.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 32 +++++++++++--------------
>   1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index f377052a45a4..e2799a0df8f8 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -192,8 +192,9 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
>   	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
>   }
>   
> -static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> +static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int postdiv)
>   {
> +	unsigned int pcr_m = mode->clock * 5 * postdiv / 27000;
>   	const struct reg_sequence reg_cfg[] = {
>   		{ 0x830b, 0x01 },
>   		{ 0x830c, 0x10 },
> @@ -236,24 +237,14 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   	else
>   		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
>   
> -	switch (mode->hdisplay) {
> -	case 640:
> -		regmap_write(lt9611->regmap, 0x8326, 0x14);
> -		break;
> -	case 1920:
> -		regmap_write(lt9611->regmap, 0x8326, 0x37);
> -		break;
> -	case 3840:
> -		regmap_write(lt9611->regmap, 0x8326, 0x37);
> -		break;
> -	}
> +	regmap_write(lt9611->regmap, 0x8326, pcr_m);
>   
>   	/* pcr rst */
>   	regmap_write(lt9611->regmap, 0x8011, 0x5a);
>   	regmap_write(lt9611->regmap, 0x8011, 0xfa);
>   }
>   
> -static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> +static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int *postdiv)
>   {
>   	unsigned int pclk = mode->clock;
>   	const struct reg_sequence reg_cfg[] = {
> @@ -271,12 +262,16 @@ static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode
>   
>   	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
>   
> -	if (pclk > 150000)
> +	if (pclk > 150000) {
>   		regmap_write(lt9611->regmap, 0x812d, 0x88);
> -	else if (pclk > 70000)
> +		*postdiv = 1;
> +	} else if (pclk > 70000) {
>   		regmap_write(lt9611->regmap, 0x812d, 0x99);
> -	else
> +		*postdiv = 2;
> +	} else {
>   		regmap_write(lt9611->regmap, 0x812d, 0xaa);
> +		*postdiv = 4;
> +	}
>   
>   	/*
>   	 * first divide pclk by 2 first
> @@ -895,14 +890,15 @@ static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   	struct hdmi_avi_infoframe avi_frame;
> +	unsigned int postdiv;
>   	int ret;
>   
>   	lt9611_bridge_pre_enable(bridge);
>   
>   	lt9611_mipi_input_digital(lt9611, mode);
> -	lt9611_pll_setup(lt9611, mode);
> +	lt9611_pll_setup(lt9611, mode, &postdiv);
>   	lt9611_mipi_video_setup(lt9611, mode);
> -	lt9611_pcr_setup(lt9611, mode);
> +	lt9611_pcr_setup(lt9611, mode, postdiv);
>   
>   	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
>   						       &lt9611->connector,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
