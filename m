Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03D58C463
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 09:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35F91F01;
	Mon,  8 Aug 2022 07:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1298291FC2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 07:43:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n185so4359063wmn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=H423BeLAypCbCKSxmHZM0X+T6gytpYF1rvFZiDskpVU=;
 b=mHhrQpWeXaeFNOE9biXzg8I5rVYNPNwvVXmJV6sdmAfbpvq6ZFGuXgN4ftIS/iNkpU
 /cLhTsyGuVr0wM2e/waI33FgzvqJuyaNqsJ1TJk0EPoy8ANHvjgKixwzedCUGlABT3Vp
 7aRMxTX9jz2QGpLKxnb3gla+1doKgmy58gRamGkfVzivQ+JhMzZfCfcLEBLtxMe0H2BX
 7V1djW8vB9LLKQWpkU9LxgtVVpruoC1TVNst/v6LytQ6n65LWYV6GK68qn1y/TqChl6m
 4xcBLyJP0ZCjxG1CX7E772t8P+RZv0Yt+0+1TYh2f+oHKQXg12dNGLjAXr5T6gNeSj15
 ksag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=H423BeLAypCbCKSxmHZM0X+T6gytpYF1rvFZiDskpVU=;
 b=VKjI4sirMfHFOjijZRlwgn34gVrhPaf4gU2LPvF5Gkw0A8zOIwAxF/TmXoyugZtLbk
 Av7BjVpP9IHBvm2Z+wavMfCto7HzRIY156JbiG43NOXABDL9AFTMKQ5AesEzLK8YW37x
 fLrJh7T3V6UmhzBaiNgpeSs8NCPkPeWV85ZAm5/zmUAmeiZKbQ4DenW3faRtDrl873si
 0krj7l9zboW/PQp7wcWIUjc8HIC8g5dK7JFI/ZQeB9K9mbwTogJC1ArZ5g1YZTSGvl1l
 ZnnkQL1BoZSTAOoEhaHwg/PP+LANOqk+Bg5t7oIZMS5mccYHcPwZaZJgFCiZM3x+wjCS
 HTGA==
X-Gm-Message-State: ACgBeo2oY0Q7bVLs/b3nyE5EdI//u9YnSqMYtSRoBTbSXEiW1H8mIIFK
 /aBtTZJrYLc7n/nOIwtAmpxJRA==
X-Google-Smtp-Source: AA6agR54HRv6Gzeefc3fvv7sxuxnu2DTZR/UUyqF4zfyLnu0iiHsgS467TzMfSXGDWYg5TGJ+BIQtg==
X-Received: by 2002:a05:600c:35d5:b0:3a3:2490:c984 with SMTP id
 r21-20020a05600c35d500b003a32490c984mr17216699wmq.162.1659944584427; 
 Mon, 08 Aug 2022 00:43:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b?
 ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b0021e491fd250sm10873022wrv.89.2022.08.08.00.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 00:43:03 -0700 (PDT)
Message-ID: <ba811c93-62ac-b8ad-8b06-d76dd7b5f33b@baylibre.com>
Date: Mon, 8 Aug 2022 09:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/meson: Fix refcount bugs in
 meson_vpu_has_available_connectors()
Content-Language: en-US
To: Liang He <windhl@126.com>, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
References: <20220726010722.1319416-1-windhl@126.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220726010722.1319416-1-windhl@126.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2022 03:07, Liang He wrote:
> In this function, there are two refcount leak bugs:
> (1) when breaking out of for_each_endpoint_of_node(), we need call
> the of_node_put() for the 'ep';
> (2) we should call of_node_put() for the reference returned by
> of_graph_get_remote_port() when it is not used anymore.
> 
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
> Signed-off-by: Liang He <windhl@126.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 1b70938cfd2c..bd4ca11d3ff5 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -115,8 +115,11 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
>   	for_each_endpoint_of_node(dev->of_node, ep) {
>   		/* If the endpoint node exists, consider it enabled */
>   		remote = of_graph_get_remote_port(ep);
> -		if (remote)
> +		if (remote) {
> +			of_node_put(remote);
> +			of_node_put(ep);
>   			return true;
> +		}
>   	}
>   
>   	return false;

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
