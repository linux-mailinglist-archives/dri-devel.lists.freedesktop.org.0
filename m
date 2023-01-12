Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1AD66738B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9C410E8F0;
	Thu, 12 Jan 2023 13:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C41110E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 13:51:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11790026wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 05:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XfUbQ/ydCRRW+3mE1Orr5gwPDzcHINGiVYjYnLQJabM=;
 b=Nheg9M8T3r76JC0MyQyGTSuHDE/jZFJyg0jHOMls4lAc1wG28mV4rQdtQ08LaHhg0m
 mNKm6vItSKgNIvdKLIDbR+/cykBn0onE8cpKGk73XVuY4irZPeuki42YBvOo2sDpTbxf
 mRpDRxqshyHB2aU+ZJBpITlsaOuLhuI+wcQfJkH8d1h/utvof8xIjXk/9C0giqTqp82F
 PC9dRQ0KFFy8H+CjEavPv4kQes3Vp5YHEYqtDsK8NPRpqeKzOihdgoaIWyJbfZ/zdZF4
 zgfAaSYrOW0JphqxdiN01ZK1fhD7sD9YKPRcW8kHfy+WFMgWnnRA8FU4pheCF62fFHw0
 F1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XfUbQ/ydCRRW+3mE1Orr5gwPDzcHINGiVYjYnLQJabM=;
 b=uKm9j4R1jVGYVE/sDB4yJ7PoPtfHAdtXBj2cG0jpWr7FqEXYs7cP6/mur/vwSVLah+
 jutFPDCrJZNbTZy826CYTxx1aaSvyUnCJC6Wla/cC6RTdehJT2pZUZbZ3ueLGbcVVNBN
 7PjmbJY6OGgNNscl8jr2MLAcYD1hvscPdoBVEL1LJVYsNylNDnueTG4p1LksIzyl3pBi
 aYRRCkVQBbwY12/iyjUZ7pSaC9Ty3szLJebKe51EGQV6lAel0KqhJ76pQRVHIe+AqJnj
 QD58kJba4xsT4/gqT0oRR+r1aObMVawU10JqarboKoQyJX1ht3nVXsw6Pe3L7FOeAZOi
 0XVg==
X-Gm-Message-State: AFqh2kr0x2DAadQvX/ok39T0cfCtm1CZ+YBjB9enOb9oulEHufCvPB5J
 frltbgSQrf3VJgHA4qj8NP9EbA==
X-Google-Smtp-Source: AMrXdXvi5cu18zppjCtIm75u+gZcYTBzEXlUpuEp7dkaofSYD0wytooU0aAmOLOsMFAi0IEKaHnx4w==
X-Received: by 2002:a05:600c:4f94:b0:3d9:f85c:97ff with SMTP id
 n20-20020a05600c4f9400b003d9f85c97ffmr8009219wmq.16.1673531461622; 
 Thu, 12 Jan 2023 05:51:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm24902780wmq.42.2023.01.12.05.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 05:51:01 -0800 (PST)
Message-ID: <af4b1d38-be2e-bc07-c407-82201f9d8cad@linaro.org>
Date: Thu, 12 Jan 2023 14:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 13/13] drm/bridge: lt9611: properly program the dual
 host mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-14-dmitry.baryshkov@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-14-dmitry.baryshkov@linaro.org>
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
> If the bridge is connected using both DSI ports, the driver should use
> both of them all the time. Correct programming sequence to always use
> dual-port mode if both dsi0 and dsi1 are connected.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 28 ++++++++++++-------------
>   1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index df9f015aa3a0..561da6bd2698 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -118,7 +118,7 @@ static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
>   		{ 0x8306, 0x0a },
>   	};
>   
> -	if (mode->hdisplay == 3840)
> +	if (lt9611->dsi1_node)
>   		reg_cfg[1].def = 0x03;
>   
>   	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> @@ -191,16 +191,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   		{ 0x832d, 0x38 },
>   		{ 0x8331, 0x08 },
>   	};
> -	const struct reg_sequence reg_cfg2[] = {
> -		{ 0x830b, 0x03 },
> -		{ 0x830c, 0xd0 },
> -		{ 0x8348, 0x03 },
> -		{ 0x8349, 0xe0 },
> -		{ 0x8324, 0x72 },
> -		{ 0x8325, 0x00 },
> -		{ 0x832a, 0x01 },
> -		{ 0x834a, 0x10 },
> -	};
>   	u8 pol = 0x10;
>   
>   	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> @@ -209,10 +199,18 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
>   		pol |= 0x1;
>   	regmap_write(lt9611->regmap, 0x831d, pol);
>   
> -	if (mode->hdisplay == 3840)
> -		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
> -	else
> -		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +	if (lt9611->dsi1_node) {
> +		unsigned int hact = mode->hdisplay;
> +
> +		hact >>= 2;
> +		hact += 0x50;
> +		hact = min(hact, 0x3e0U);
> +		regmap_write(lt9611->regmap, 0x830b, hact / 256);
> +		regmap_write(lt9611->regmap, 0x830c, hact % 256);
> +		regmap_write(lt9611->regmap, 0x8348, hact / 256);
> +		regmap_write(lt9611->regmap, 0x8349, hact % 256);
> +	}
>   
>   	regmap_write(lt9611->regmap, 0x8326, pcr_m);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
