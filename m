Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE9666DFA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4F110E8AF;
	Thu, 12 Jan 2023 09:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E9510E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:24:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso3587529wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Inj/3PggdMPYPA24KawCfZfU7CmEHAqtZxRLX2hdoWI=;
 b=yi4dkWk/iAVpCRfAkllAvewefjlYU+JlQediFjEF8+Kw5VXjyYWDnDj1dri9dwjhXA
 DE69X1eoObMk+X9AHhKd6zRgCgupS4atLus+mQ1ADHQU4pESg9Aenzo1g39F8PBCTiH3
 yI/OBwTlIYyGsUj6GlXuZjjWE7+wJem/afFrYpKvhba840ylsbIwbKvG2n2MvIJTtq21
 qMlLYQRhXcKBcwTSpZDnljNwhrKs+FZBV5CqGVxn2qUGDnQkNU8VPLGGtmdAE6sX/4Ux
 hBplV2XMVaxikRg/SaoUKbWve+KccxPUgSo5vNegYtEHBW7y8q2l80RH0JUfJ9mU9/T9
 8BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Inj/3PggdMPYPA24KawCfZfU7CmEHAqtZxRLX2hdoWI=;
 b=20TYWKy4FW8mdnuE6TcrQCjRIQrZ4MpoyBK93ER90LqroS708YiVwZGqWmvFmBu5ZW
 XtSeXDFOxb62OAmzM5rqcBF71TPxCCZgb/kZGUsYhMdQNiqWARaIs+XJc1yPzAHNZ0Tl
 Lfg/wOpUIwXeYRD+MqKnlJvhKRWht9kTKQ+A30/T0oI0t4JP+wAQCihOLQAJZj5Am/dr
 Z4itYmUS+2Tsv3BnNkjC1XlklvnC3PorVqAA3EHZvfBP69zmo/NDdusXOEa6lFeZrUXe
 Cby7v2OzsNtxTy0OcFV8AowGbFov3wvjcXc9hmo7q1kHdDjeTWZDa61x7Z44If8lL3d4
 zuoQ==
X-Gm-Message-State: AFqh2krVDQn54pUXskUtjI8ARu+1F/J8rL7l6RhsVhFyiDBpweC8bdHh
 P/3NyXxpFM/GD+lMv5vNeUsjNA==
X-Google-Smtp-Source: AMrXdXu4Cn2SfMYp75y3XbTCBX5viFqdISRSjsdfTQoV36ZSgWzi0CXykjz590HbUZMKW0YVNEZAqQ==
X-Received: by 2002:a05:600c:4a9b:b0:3d1:dc6f:b1a4 with SMTP id
 b27-20020a05600c4a9b00b003d1dc6fb1a4mr65376450wmp.5.1673515447761; 
 Thu, 12 Jan 2023 01:24:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm22549818wmo.3.2023.01.12.01.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:24:07 -0800 (PST)
Message-ID: <5e58a091-525b-7678-a0e8-1a7ab39d0d18@linaro.org>
Date: Thu, 12 Jan 2023 10:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 01/13] drm/bridge: lt9611: fix sleep mode setup
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-2-dmitry.baryshkov@linaro.org>
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
> On atomic_post_disable the bridge goes to the low power state. However
> the code disables too much of the chip, so the HPD event is not being
> detected and delivered to the host. Reduce the power saving in order to
> get the HPD event.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 7c0a99173b39..2714184cc53f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -448,12 +448,11 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
>   		{ 0x8023, 0x01 },
>   		{ 0x8157, 0x03 }, /* set addr pin as output */
>   		{ 0x8149, 0x0b },
> -		{ 0x8151, 0x30 }, /* disable IRQ */
> +
>   		{ 0x8102, 0x48 }, /* MIPI Rx power down */
>   		{ 0x8123, 0x80 },
>   		{ 0x8130, 0x00 },
> -		{ 0x8100, 0x01 }, /* bandgap power down */
> -		{ 0x8101, 0x00 }, /* system clk power down */
> +		{ 0x8011, 0x0a },
>   	};
>   
>   	regmap_multi_reg_write(lt9611->regmap,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
