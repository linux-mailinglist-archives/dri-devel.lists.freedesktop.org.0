Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DFF494C26
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E29410E464;
	Thu, 20 Jan 2022 10:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387A810E437
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:51:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c66so11142819wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 02:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0mEqvDNu9Zk6sTqlde6UJTd4iKTAhS2ZsSWCjtjL8Js=;
 b=IbMaG71swN4sg6h7akifeOkgqmBmzGXKACVQZ7YeIkKLuvwtXX6p+6UctVNQY/APfF
 bQqm3tf1/cVG4tduVkPRsNK0yY6hBpMXqtmBMl+cteiTxRv6AEClmvr74ai7lRU76R27
 3U88OB7w/lEDblM5xJGdIi02EnnM6d2kY/MojR4TSfmNCbsVEUCVsO9fFo0hfM/B6Uvl
 eeJNrt99WTtMoPozJa45ASMZicDTzwsh8BZkL0q8+S6jBl7Lx9BUo04suJkGEb2gT9g1
 XVIDjgSG3Ad0UDwiLL+X6gg9rE3VO4BvA/h1Pgcp6OJRlgivxq/eMqUpWh7ANX6Vp4U5
 7yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0mEqvDNu9Zk6sTqlde6UJTd4iKTAhS2ZsSWCjtjL8Js=;
 b=SsbCLQK4XF2OB1p+G+rGvvkw7VWMqRjw0MiAaBcR7Ii+724QMf41YSyo1FjvzkDuBb
 v78i/wafxWBbdf2OdnDK8w3bKW/jRo0IjxsZheN8U6qmmkELSqQhVHamjI7cOBTNhBJ+
 CuNe24pEAE7qgH7oKX/SVbOMcbSGOoEvncZJZ/SOr2g0Dh/2nzZYIDGB88/FoEvinwL+
 2eUz/cNnL9+nXLitVxHxdhAc/MiuNPvhY17H3LE7wk60ee/YCERh4qo4y6qPD59F7m9c
 A1Q65LV37Y5STqlgTDrWixdPy6G01qP13++Eymg4Xf3P0vohGMlixWzepBY/KqUFt3Up
 wO5g==
X-Gm-Message-State: AOAM530B223jS/w9PbdRYHLyetxQnKHJKIPKkml/g4tg/hBGn+sJnoj4
 Z1xosmIUDZwhsD8KOgkw9unBzQ==
X-Google-Smtp-Source: ABdhPJxCmfCA/1jlhXZWdxR9sWvgeiXVFA3T8nw7/QKA41S71Chv5KYtJpjPG5UiXpySFQYrnJk1dQ==
X-Received: by 2002:a05:6000:1d84:: with SMTP id
 bk4mr31790024wrb.708.1642675914618; 
 Thu, 20 Jan 2022 02:51:54 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5?
 ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id b62sm1834642wmb.16.2022.01.20.02.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 02:51:53 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
 Serra from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Simon Glass <sjg@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a370a74a-2548-fc20-20b0-89e48645086f@baylibre.com>
Date: Thu, 20 Jan 2022 11:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 20/01/2022 11:40, Krzysztof Kozlowski wrote:
> Enric Balletbo i Serra emails bounce:
> 
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> 
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
> bridge maintainers to Analogix ANX7814.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7814.yaml  | 4 +++-
>  .../bindings/display/bridge/google,cros-ec-anx7688.yaml       | 1 -
>  Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 1 -
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> index 8e13f27b28ed..bce96b5b0db0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
>  
>  maintainers:
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +  - Andrzej Hajda <andrzej.hajda@intel.com>
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Robert Foss <robert.foss@linaro.org>
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> index 9f7cc6b757cb..a88a5d8c7ba5 100644
> --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> @@ -8,7 +8,6 @@ title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
>  
>  maintainers:
>    - Nicolas Boichat <drinkcat@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>  
>  description: |
>    ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> index cdaf7a7a8f88..186e17be51fb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> @@ -8,7 +8,6 @@ title: MIPI DSI to eDP Video Format Converter Device Tree Bindings
>  
>  maintainers:
>    - Nicolas Boichat <drinkcat@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>  
>  description: |
>    The PS8640 is a low power MIPI-to-eDP video format converter supporting
> 

Let's wait for Enric's response, but in any case (removal or new address):
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
