Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A266598D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 11:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAB310E702;
	Wed, 11 Jan 2023 10:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0C810E704
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:57:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso12327474wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 02:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Nm8zSj0cM7vkF3pSzOoRgtxFjQPdHN6cbu+7x4hQDUM=;
 b=eNGVRLZ01B4ABrifgiFF7mgG47/4Ks6Omg0psCB0OnWISe009ekganx/iOfCLyO42G
 axw7b6ikbZlWjRfS8Qc+TdSFx6q366wedfX0pcztIeuIQn3zQbsyikuCwHELTtEGjW5y
 EDjnfLwWhQFHggziga9GVGjJvJYCqD70tyH9Qqfr2g1vybW2rnt0nYh0bn/ulDur4OwP
 55F7G3O6ti1qr68+iKGmDJp6eE/coEMmdUep2tNuUUkjSYslNdWl9fuhdrqvCHvajnbD
 m8RabR/kYso6/+ozJ1XsR02dEt/3wcK+i3j5EwwsKlcyZzM7VS7srg15Ive8gaLBUjU+
 QbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nm8zSj0cM7vkF3pSzOoRgtxFjQPdHN6cbu+7x4hQDUM=;
 b=R63aTSoV100aOXHytyF/xpXseo4U7ViBiAobLqEaVR1S6Ng7eesl6I9qjiGRzDHlbA
 0SaOaECEf+jtVxalZxgGCD9faNmLP4CCXUYmaWwT9tqHYenlnzanOBv4W71BuK4dgSlY
 69juA+NpDBDk4Y5igS32Hhb0vWC5LdbnlWfwlN/CnJT2ZG1O3YrkeIKptby1JEg3R3lt
 J8b3rrWyvncFhDk+246YRSLEUon8UVTpMoxujZ6yeDatUAAHIzBQYYBZjbFb+GXUYPL8
 qZl3Iv16Q6/necuqiJ5lsADqWOW4DnBKAeQtmVs0oUKxPvStUaRia5UWma26oHb8dbLa
 g0wg==
X-Gm-Message-State: AFqh2krSX26rqbJdZ1nQrIrZ8PNSfJUVt/WYBWR+cWiIOqzAbl7cQ4kD
 KCmy7hwzy3kh3SHkMM4Zmq8l7Q==
X-Google-Smtp-Source: AMrXdXtrqaSescef7K2+N6eVb3fqrxgSrMp4RWRtILLx091xMF//xYBCIHT+Ddl46jtMnCov3vLToQ==
X-Received: by 2002:a05:600c:a13:b0:3d0:2485:c046 with SMTP id
 z19-20020a05600c0a1300b003d02485c046mr51308170wmp.27.1673434618908; 
 Wed, 11 Jan 2023 02:56:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5?
 ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm26003311wmb.42.2023.01.11.02.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:56:58 -0800 (PST)
Message-ID: <62b2d803-38fc-c608-e3c8-86f93e9d8580@linaro.org>
Date: Wed, 11 Jan 2023 11:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/13] drm/bridge: lt9611: simplify video timings
 programming
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-11-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-11-dmitry.baryshkov@linaro.org>
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
> Inline calculated values to simplify the calculation in
> lt9611_mipi_video_setup().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 7f9be74acf0d..1396ab081f61 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -155,12 +155,12 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
>   	hactive = mode->hdisplay;
>   	hsync_len = mode->hsync_end - mode->hsync_start;
>   	hfront_porch = mode->hsync_start - mode->hdisplay;
> -	hsync_porch = hsync_len + mode->htotal - mode->hsync_end;
> +	hsync_porch = mode->htotal - mode->hsync_start;
>   
>   	vactive = mode->vdisplay;
>   	vsync_len = mode->vsync_end - mode->vsync_start;
>   	vfront_porch = mode->vsync_start - mode->vdisplay;
> -	vsync_porch = vsync_len + mode->vtotal - mode->vsync_end;
> +	vsync_porch = mode->vtotal - mode->vsync_start;
>   
>   	regmap_write(lt9611->regmap, 0x830d, (u8)(v_total / 256));
>   	regmap_write(lt9611->regmap, 0x830e, (u8)(v_total % 256));


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
