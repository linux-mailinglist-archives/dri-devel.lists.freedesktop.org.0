Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D167666E13
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456DE10E8B4;
	Thu, 12 Jan 2023 09:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6A810E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:27:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id az7so17445641wrb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QSEIhlWHvAZaW6UKLsgzkNyGZuKx+U0pt2A72T4kA0U=;
 b=Afz0Kqjc5bY8KuKWMkSI9opBOiopFMcls0+32vim85vpVHHTLweyrp/qRPadFTQWZW
 JpcgKbds88VyEQ+LDEGCT2KiNbfSteQj80WQvmVistaRE7XaiLtPtvmWAKNz245x4JLo
 X0qUiNlMc6bFkowFojklC4+y1+2QupLYXierO4yTq4hA2v0KVFRhGWqlXD4/p75I6gd3
 GK0IQcO205Ea3sT+xAWE0xuqCeje2vogRQ0GcC5pMI1CBkEdckxbXoV73KhwJavuqgfN
 4oo+b3V6mpsjdVExhoFAhfQZTFqrzRGIxvBK+Cr3UkV2i/XkVGxqehGShKV3eoim1qAA
 Iysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QSEIhlWHvAZaW6UKLsgzkNyGZuKx+U0pt2A72T4kA0U=;
 b=fUOwTPFM+LvWCXOnCFXAiR9UyLkjTqGxxo2vLHCeiX4UVOAEGcVVtv8fiFCmbR9g5u
 I/DFlFcUXqP9+IRmhft52iUUKQvkvdsid1oIZFLbHwp7RQBk6Dq8abTkVBQppxGgwwmk
 bkLcymP8atX0wCR1xzTAZ4IUptwICxJdsbjVMzs/VM7nbZV7D3fDRuf4Z+A72Ln1tGKH
 DhMWYd5dCeOvKSjSlf/2LqUx1D1fubhjOkHW6ZeSuFw25VMsZkAv74dKARxl6DcGzhYj
 ZZWj0EJ9QPS9xnc8EYn7sPWVkAqdQJ6pEK9AAWDLwE9/m9/sPeUjIKB7/JM0tjThnOyY
 BuZw==
X-Gm-Message-State: AFqh2krJ40Yt6fZXKdNmaG0Ntzeir8ZmiLj2GO9CP7WHfkZvJ5U7WPFL
 Nozh0ppVO1i2zG39ShtEOaF4zQ==
X-Google-Smtp-Source: AMrXdXuNRsIItkqMfwS//Sj29c/EC9qU8GAYdV+ryEweIF8taUsEbKBh+wtFM3S10VRLabmbl1dO3Q==
X-Received: by 2002:a05:6000:80b:b0:29a:c631:e3ff with SMTP id
 bt11-20020a056000080b00b0029ac631e3ffmr25588539wrb.53.1673515626801; 
 Thu, 12 Jan 2023 01:27:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm15852287wrt.16.2023.01.12.01.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:27:06 -0800 (PST)
Message-ID: <2e3a1a03-f1b6-e3d2-8565-04cf8c9136c4@linaro.org>
Date: Thu, 12 Jan 2023 10:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 04/13] drm/bridge: lt9611: fix programming of video
 modes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
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
> Program the upper part of the hfront_porch into the proper register.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index deb503ca956a..f377052a45a4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
>   
>   	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
>   
> -	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
> +	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
> +						((hfront_porch / 256) << 4));
>   	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
