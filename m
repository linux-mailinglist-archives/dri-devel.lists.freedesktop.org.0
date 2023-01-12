Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2893D666DFD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E8310E8B3;
	Thu, 12 Jan 2023 09:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90BD10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:24:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bn26so17465691wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8y93oKqpxvzE8rWdKpZl4lXsP+t5rguSGLhBVaBJc0g=;
 b=WThEKA9gNJkYP7HmfQRADIQADz/supXgAp8M0Ch0b6QgcTSLJkoTNqCmwTRX5X0SFi
 kWLSC9p7vL1U7COb9FN0upXxHQvW1YaHNZG0Rm/3K39kC1FmfT++a58cAQvSdEXcOz3l
 byKBbuHvDH/zGgVyrfqHwjMAtcMbF8MIWinhnfGRb2gx20+ScqjVIky1aQL1mQvrHKfk
 dFNmAr/uC27SuThkEmoqIE7eIvkZn1E8UBGpko8Y80IroOFuTCCC87rbaRDFOT/BvHoa
 0rZIGLbPgWEAI6r3Uj7Y/KSbN5KKovXNJeU+KSlU6IYGe6Se5dvi9Il2t9xC8MMw+al1
 SFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8y93oKqpxvzE8rWdKpZl4lXsP+t5rguSGLhBVaBJc0g=;
 b=pZLQ+CY5OYFtIzQUL5wgi22znAsoZdUVApn/B/5sIwtrl8mdKrFyuzm6KvASjE7PE0
 uJnHQRS/5wHo6MIYYSyfiNZ3/Gf0zjbzu9dGD/zqIlZvQL80nQDvz3zrdqJDbHbLwxma
 nyhU3OTomaZnu+T6mciDf0DWlQX39oZ/g8UxCahtQWvnyJOfc6MOeZZYuxV0e+5Sx5Vx
 r7SgOQR29bM5XttfPDD4icquzFiHSLXm7dnHdVDMtoihCUvXv7KNbrdnKnzFut2BDUr5
 WtjmWREc34J1awfUedcYUk6irJu3VnW2jCp/8r2Xfk8I9I6X6iAZ0zt1JVux95KkfehD
 dEFw==
X-Gm-Message-State: AFqh2kozTD/hUk46gT30gm0D8W5/YqeDJECmCW8TRElPhJidyFsJpW52
 Ekmlm24kyXzKRyRkx+n6UqKonW+jhWLQ3bIT
X-Google-Smtp-Source: AMrXdXuXd7dZBWw2m7FDxQZJt+AcbAClVVx1WZ3nCqqtcl5YstgfIvERZe4/zGu+w87qgXyMfElBYw==
X-Received: by 2002:a05:6000:54a:b0:2bd:6490:8c5f with SMTP id
 b10-20020a056000054a00b002bd64908c5fmr6062877wrf.23.1673515471297; 
 Thu, 12 Jan 2023 01:24:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adff642000000b002a01e64f7a1sm16255730wrp.88.2023.01.12.01.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:24:30 -0800 (PST)
Message-ID: <ed9eb076-7a81-8892-a509-9105cbc3c128@linaro.org>
Date: Thu, 12 Jan 2023 10:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 02/13] drm/bridge: lt9611: fix HPD reenablement
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
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
> The driver will reset the bridge in the atomic_pre_enable(). However
> this will also drop the HPD interrupt state. Instead of resetting the
> bridge, properly wake it up. This fixes the HPD interrupt delivery after
> the disable/enable cycle.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 2714184cc53f..58f39b279217 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>   static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	static const struct reg_sequence reg_cfg[] = {
> +		{ 0x8102, 0x12 },
> +		{ 0x8123, 0x40 },
> +		{ 0x8130, 0xea },
> +		{ 0x8011, 0xfa },
> +	};
>   
>   	if (!lt9611->sleep)
>   		return;
>   
> -	lt9611_reset(lt9611);
> -	regmap_write(lt9611->regmap, 0x80ee, 0x01);
> +	regmap_multi_reg_write(lt9611->regmap,
> +			       reg_cfg, ARRAY_SIZE(reg_cfg));
>   
>   	lt9611->sleep = false;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
