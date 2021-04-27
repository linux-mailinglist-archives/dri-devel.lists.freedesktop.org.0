Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15E36C7A4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 16:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669F96E223;
	Tue, 27 Apr 2021 14:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FACC6E223
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 14:18:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d11so1805200wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z65TRtvxCHj7BauNi/chiq/yTCGlMnhafcBJVuv+uvc=;
 b=1JgQ6T8J5+DCIbKLYSb8X8pE6seOMZEzq7vwu9CDfatcw03IrdCxdpz2PUJFQHyVMA
 7aa//0VYhnb7ywY9TAUA+tm8ifFNcmCFp/xSU+VYV+m+OCZAsICOwiq9S23qeZOBzXZS
 zk1PU0t1LILKQNoMB//PlHqoB1GjsJU9D9spUoidCKxRtxFFwK5yRpKF2laM58dsJzSj
 Z8c+7LZ/GPKg3b4yJUgwsGQUmBxjr50KIX4ulSksWOt5Y7j3W8DZFdrxgi3JNNtqEAsa
 8BBv/93KQFvm5JJO+hJzzzVCFpxh/VA45XuuLlKz1Zo/Mz2t90zXt2p7mQUJIejikdsF
 LbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z65TRtvxCHj7BauNi/chiq/yTCGlMnhafcBJVuv+uvc=;
 b=sKEPsFEYBxWVjW/dk2APenHr64fiYJqA2lYwMlZz3ulQxzzMBXO+SejgqanbklbNzZ
 DuBKYlVA5lsSvL7HGx9wZENRZdHebqPsSailtWr1zOmb2VeTpU3QZrdSHygdPDRoWmK5
 40ti5jhrtH2EKk1IIOa5xOur1UPh9VXqstv67O+BWCnYs7rRb0FyIeggO7UvvhTSMgnj
 fAdpx4m8+oPVk2aqHFPQVuO1jStPLxLYJPwgZ38lLdNzaU6G3WrpDm9e3iVr8SczTr9u
 CQmUKXNG2NZzhG3L8W24nygGL08LYVWu8FQpGAvJdnydOEdaMMwwImj0HHX37geX3V4C
 ZrsQ==
X-Gm-Message-State: AOAM5316+muu5b6yN4rtmBu4n0xAXyAN8aV2EEPCGxy/5XLOa/uLAhu7
 sJIOLS3rLCDT+TWz8s/YICm//g==
X-Google-Smtp-Source: ABdhPJxW+s/+TqK1U8f2ctaKezCda71MRK+oQxfwwiUVSdcChPpFQBSja3Rf9omQgoYxR0v9W0FerQ==
X-Received: by 2002:adf:f701:: with SMTP id r1mr16679257wrp.67.1619533116962; 
 Tue, 27 Apr 2021 07:18:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2338:91ec:bf8:872b?
 ([2a01:e0a:90c:e290:2338:91ec:bf8:872b])
 by smtp.gmail.com with ESMTPSA id b14sm4365490wrf.75.2021.04.27.07.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 07:18:36 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: anx7625: Fix power on delay
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>
References: <20210427055320.32404-1-hsinyi@chromium.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c1472ba7-f416-f1aa-38d3-f2a4e7694903@baylibre.com>
Date: Tue, 27 Apr 2021 16:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427055320.32404-1-hsinyi@chromium.org>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2021 07:53, Hsin-Yi Wang wrote:
> From anx7625 spec, the delay between powering on power supplies and gpio
> should be larger than 10ms.
> 
> Fixes: 6c744983004e ("drm/bridge: anx7625: disable regulators when power off")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 23283ba0c4f9..0a8db745cfd5 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -893,7 +893,7 @@ static void anx7625_power_on(struct anx7625_data *ctx)
>  		usleep_range(2000, 2100);
>  	}
>  
> -	usleep_range(4000, 4100);
> +	usleep_range(10000, 11000);
>  
>  	/* Power on pin enable */
>  	gpiod_set_value(ctx->pdata.gpio_p_on, 1);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
