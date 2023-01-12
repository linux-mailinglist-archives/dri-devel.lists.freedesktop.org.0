Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBEF666E0B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F5B10E5B9;
	Thu, 12 Jan 2023 09:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E3610E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:26:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso9609335wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eBlIHS2Zl7GF2Q8lPs3zV1BAKl5mMtukn1yC7tdNIEc=;
 b=oUin74EeEXy8maX+Y0SSB5hRgeW9wABT/oT86EoGEqxLuXKob3zkdJnkBRDgsakDN8
 pAtVG4W/XOu6zU9rGwtauco8o0J5rUdINLwjm7Xvsv0vuzd6ucYvCgtLjSyeTBb9gUmR
 X2eQfgrVtiV8njVXZnZa5D11qKwKHy+gBOSyGCLDqj7j+07fJkwl3LfnCTME+qALPJBi
 X3Q605jZmzextwUHvWn6coy29oyWYBl7jyRnRgzqIzAq/7O5ZDbMrGcrA0FcElSKNTUQ
 yeshcHJCpJaJkATWBKP4jftAb+Uk3BhoACqb6wDVQkF/4/QZoxrh5d4rCgdDTfSsjhPU
 zXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eBlIHS2Zl7GF2Q8lPs3zV1BAKl5mMtukn1yC7tdNIEc=;
 b=sq8cnAjPs7sQB8980/H/kP3tmAh5bpWxuNIGuyY4EW0MpPDvO6VqCyfCJDFdEuMRQ0
 IH3zxYALCh0+P92WtedA0H2vbiTKrepae5Oa9olNz88I/AkT3pqVcCsONygdozkI+upg
 0o4bBDDm1T8MMqmFc2kvDIKB0of/UchR18JG2UVl376cVOmYtF1pqITQqNrlWHvLxkjG
 gyANg0Fkx5HomA3B9CZ4biYcYk8hbG/q8kyB0Q7lMBqmM/Yxh4UyQt5ea2bScTKQnlkc
 +9mw3SGV6SNdUgP7Smt7v/rNORVL1kCDmTryP3IUT/+lyLBXvnxcmSFFNg1LEzCK3v8u
 GHTg==
X-Gm-Message-State: AFqh2kp2oNgVfl/UhueLWClhBZZPi3aTcMT1eHoaM43vCNkf+c07cnGx
 +aMiKatzL35Yx1EM2IlK1CpNNQ==
X-Google-Smtp-Source: AMrXdXsV188Hle3fFVDUTr1Xo5oOGGtcvKq1uElQqAZitxGc5tTAwYA0K4zGmbjBegQEkYdXvYLNpA==
X-Received: by 2002:a05:600c:1c81:b0:3d1:e907:17cb with SMTP id
 k1-20020a05600c1c8100b003d1e90717cbmr55291627wms.1.1673515610497; 
 Thu, 12 Jan 2023 01:26:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b003d98f92692fsm23349739wmq.17.2023.01.12.01.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:26:50 -0800 (PST)
Message-ID: <84f4f4ef-569c-c292-0b52-f15cd94a6853@linaro.org>
Date: Thu, 12 Jan 2023 10:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 03/13] drm/bridge: lt9611: fix polarity programming
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-4-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-4-dmitry.baryshkov@linaro.org>
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
> Fix programming of hsync and vsync polarities
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 58f39b279217..deb503ca956a 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -207,7 +207,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   
>   		/* stage 2 */
>   		{ 0x834a, 0x40 },
> -		{ 0x831d, 0x10 },
>   
>   		/* MK limit */
>   		{ 0x832d, 0x38 },
> @@ -222,11 +221,19 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   		{ 0x8325, 0x00 },
>   		{ 0x832a, 0x01 },
>   		{ 0x834a, 0x10 },
> -		{ 0x831d, 0x10 },
> -		{ 0x8326, 0x37 },
>   	};
> +	u8 pol = 0x10;
>   
> -	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		pol |= 0x2;
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		pol |= 0x1;
> +	regmap_write(lt9611->regmap, 0x831d, pol);
> +
> +	if (mode->hdisplay == 3840)
> +		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
> +	else
> +		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
>   
>   	switch (mode->hdisplay) {
>   	case 640:
> @@ -236,7 +243,7 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   		regmap_write(lt9611->regmap, 0x8326, 0x37);
>   		break;
>   	case 3840:
> -		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
> +		regmap_write(lt9611->regmap, 0x8326, 0x37);
>   		break;
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
