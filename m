Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5EF57C9A7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 13:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73A78F062;
	Thu, 21 Jul 2022 11:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812E68F062
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 11:18:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z13so1745922wro.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JxKRkanKyIQSgAXyW/zxMciS5Z0aXs7nIaBgenQvy+U=;
 b=NjZTt7fuWailgk8RrUPjLNjEMZaNgwLfRSyxj4o22+JoTHZjR1Hcb7pJ5sjN/44Why
 lBJ5UfUfaqBKgWpw3P+9dUIhypJsRDzRPl4lVd6SRm7jE88EynFqojuu+1u+Ik2qwpBM
 C1UbppBqFJluz2rg3X2V7jPmqcqNR9pu5Sa2+19P5NSITvPmd3x9PxA1XxOIfbDtGwxf
 62nO0JMeU/itFR/RVjKT0jhOsAXzmEsxTkVnPf3thh5mqIbFYZzjUH8w0exnI3/aqcoT
 w7D27JI6kRRSv7+SwutR+o0YtwPtYvRI0QNjLtWb4qWZ2sUMMz3abFKLZIeuYl8/LW1E
 +zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JxKRkanKyIQSgAXyW/zxMciS5Z0aXs7nIaBgenQvy+U=;
 b=td4E2nVTXV/X9JhEk+yfJHJLCl+8s0OzgWjvjDsEd4FVuh6lHscZR1FXDTWxyui+Iw
 xses6fXpDnTuiKfzrBkElyCgOjyDATSl78rGaNzFrm9HZUngU0QQymaIiedP5zXQqltH
 M+2P1y9abOLX3KJRUBRxA4dMS4rMwHBpGPohzr61gKsNLYjaDfNm+mcBVvnV4vg+jZFV
 0OYhF0VBiNxQo5rJSqGn+9EXKntlp8MjSTjBGZFv5x/RV00e1xGLeqTwynTbbuPSmTYR
 BRe7Upd87ajk+cyPwxcsH6cnNEjS10NyxRgNJ/iNYm7e7OVm5yHAXCjw25dDei2fmVuK
 YUBw==
X-Gm-Message-State: AJIora/zZfSgiyAoy07eJmoqdwlfbQbjaDg3S1sJmrCqw4W5OXz6mH+N
 +zJIJs9WonXVzol9vY5TWwsfPQ==
X-Google-Smtp-Source: AGRyM1v7gzqu43KCclau0/KoOTMcjADXlkDHG6E3JaZAUvzBRPQO37ak9BPoPl6WjXiy3ozE7HvhCQ==
X-Received: by 2002:a5d:6c6f:0:b0:21d:cb1b:5776 with SMTP id
 r15-20020a5d6c6f000000b0021dcb1b5776mr26304365wrz.44.1658402303868; 
 Thu, 21 Jul 2022 04:18:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4c23:a5d2:f5f6:4cd7?
 ([2a01:e0a:982:cbb0:4c23:a5d2:f5f6:4cd7])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a05600c211800b003a2e655f2e6sm1532823wml.21.2022.07.21.04.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 04:18:22 -0700 (PDT)
Message-ID: <2b41ef82-1d9f-bead-fc6b-45da200b0838@baylibre.com>
Date: Thu, 21 Jul 2022 13:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Fix regulator supply order
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220721092258.3397461-1-wenst@chromium.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220721092258.3397461-1-wenst@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/07/2022 11:22, Chen-Yu Tsai wrote:
> The datasheet says that VDD12 must be enabled and at full voltage before
> VDD33 is enabled.
> 
> Reorder the bulk regulator supply names so that VDD12 is enabled before
> VDD33. Any enable ramp delays should be handled by setting proper
> constraints on the regulators.
> 
> Fixes: bc1aee7fc8f0 ("drm/bridge: Add I2C based driver for ps8640 bridge")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 31e88cb39f8a..49107a6cdac1 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -631,8 +631,8 @@ static int ps8640_probe(struct i2c_client *client)
>   	if (!ps_bridge)
>   		return -ENOMEM;
>   
> -	ps_bridge->supplies[0].supply = "vdd33";
> -	ps_bridge->supplies[1].supply = "vdd12";
> +	ps_bridge->supplies[0].supply = "vdd12";
> +	ps_bridge->supplies[1].supply = "vdd33";
>   	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
>   				      ps_bridge->supplies);
>   	if (ret)

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
