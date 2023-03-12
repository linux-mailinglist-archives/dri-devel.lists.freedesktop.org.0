Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340446B62A1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 02:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1865210E02A;
	Sun, 12 Mar 2023 01:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0D10E02A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 01:10:13 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bp27so1115390lfb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 17:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678583412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QiwsY9OJEcjxZFm1rjoIDbhErPmPuAzTuewFchOar48=;
 b=syH/JXmWXHXbR7jpOmJoUM2Pr8/47bxsNI1/v2/nDYHf6cF6rnIpfjiA6verpTDREe
 GP7KxOSNgUpvuc36JYeVSkRZDj0/6oEB/oFlh3lxicLk8bXkmqAXTbGcdTvQkpaL2SZA
 YGjdlonKL7h4d0/5jSheAh1RmvUTqEU7tbTktQg1ndIII2TVaZCPNFagmMiHDsYTtu94
 uKDnnDMph/dL/1iksJRxZ1dFjUjzAGl7TtYm/1axeW6JlW2DcOpwJTE/s5VqLCCKKwkA
 wu+zEoTA/EK7Kj4HDdjQmzTOCcRKThDU1eCJu5JpvdJ6ZMm2wVFAlD5b7G3jn9FV1x7w
 J7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678583412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QiwsY9OJEcjxZFm1rjoIDbhErPmPuAzTuewFchOar48=;
 b=znewskrItErvKu+E7u1gvbUGh9XPr97SdN+aIBdPyMS9+eOoni6dI+X9jRZuuiN8Ux
 rA5U25AZKBoxO2h3xdp/q7Z1AIRwBVvuMX9kPhNBMIYeSCQKRvWJgT9+No/an8UCAU21
 hC51pJJ/EZqqSQIzt8DCVOYJhREp0sK1b9fLsMxIyqGX675olqD6AMRvUSGz6ooTPhoE
 GVFvoGLLZ1D6OS5ICpHEbE8WXTLbQu/juucpl8zeILFVB68+5rVnjsiPO4VxZQuglM4w
 Ag74zHlOEGSV4nRtmkryHxzJWWiYzT0pvVcMZBKC0hm/BVYk6gfZ2UsESHAYDo59Eq83
 IM9g==
X-Gm-Message-State: AO0yUKUlTkvAc3Uj30Qq16bLbF9nPUK5nfZtLr7ZPJtU65bsrurCOlWs
 3eM2c5t3qfYKsUo3HUjsVb5/7g==
X-Google-Smtp-Source: AK7set/klWxn5UxnMNH3MedgzFr8F3gXSvz8nvQja+oFF0eYvNFnnFkeVyP2h5Rm4xWD/cD6lQtkuA==
X-Received: by 2002:ac2:489a:0:b0:4dc:807b:9040 with SMTP id
 x26-20020ac2489a000000b004dc807b9040mr8723477lfc.5.1678583411712; 
 Sat, 11 Mar 2023 17:10:11 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a19a412000000b004b56bebdc4esm475185lfc.14.2023.03.11.17.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Mar 2023 17:10:11 -0800 (PST)
Message-ID: <6ae67215-28b6-04bf-b61d-1ba99ffdf6fb@linaro.org>
Date: Sun, 12 Mar 2023 03:10:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533
 and adv7535
Content-Language: en-GB
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230311231007.46174-1-aford173@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230311231007.46174-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 quic_abhinavk@quicinc.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/03/2023 01:10, Adam Ford wrote:
> When dynamically switching lanes was removed, the intent of the code
> was to check to make sure that higher speed items used 4 lanes, but
> it had the unintended consequence of removing the slower speeds for
> 4-lane users.
> 
> This attempts to remedy this by doing a check to see that the
> max frequency doesn't exceed the chip limit, and a second
> check to make sure that the max bit-rate doesn't exceed the
> number of lanes * max bit rate / lane.
> 
> Fixes: 9a0cdcd6649b ("drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridge")
> 

Please remove the empty line here. There should be no empty lines 
between the tags


> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index fdfeadcefe80..10a112d36945 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -103,13 +103,9 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
>   enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>   					const struct drm_display_mode *mode)
>   {
> -	int lanes;
> +	unsigned long max_lane_freq;
>   	struct mipi_dsi_device *dsi = adv->dsi;
> -
> -	if (mode->clock > 80000)
> -		lanes = 4;
> -	else
> -		lanes = 3;
> +	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>   
>   	/*
>   	 * TODO: add support for dynamic switching of lanes

Drop the comment please. It makes little sense with your new implementation.

> @@ -117,8 +113,16 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>   	 * out the modes which shall need different number of lanes
>   	 * than what was configured in the device tree.
>   	 */
> -	if (lanes != dsi->lanes)
> -		return MODE_BAD;
> +
> +	/* Check max clock for either 7533 or 7535 */
> +	if (mode->clock > (adv->type == ADV7533 ? 80000 : 148500))
> +		return MODE_CLOCK_HIGH;
> +
> +	/* Check max clock for each lane */
> +	max_lane_freq = (adv->type == ADV7533 ? 800000 : 891000);
> +
> +	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
> +		return MODE_CLOCK_HIGH;
>   
>   	return MODE_OK;
>   }

-- 
With best wishes
Dmitry

