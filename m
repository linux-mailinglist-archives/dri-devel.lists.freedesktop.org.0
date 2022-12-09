Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD044647F68
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 09:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E436510E4FA;
	Fri,  9 Dec 2022 08:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636910E4FA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 08:39:52 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 1so5956586lfz.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 00:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/O5h04PEE+ASwOC4yZVV1MN8tZ7/07CpqnbwV/QNyBc=;
 b=vayNdAAy9o5wMVJc65uANQqa9ES1RCQR1w0PAAiENZdEpf/du+Zx5xBbUAQ45ooH8J
 HUhC7y5au/1d1/Qqbwx2/af1FKsVft4S8op0mdjv4+IkXxDbYePTgY4z203RJiG0rvtH
 NazYoSmdxsMW6q9m+GaV7NcZX3mO0zAXvrcXV1Gtpx83CXmPvFVw0hh5bgY6UCE94TQ1
 FbOERFZpE0NRdEGYYwj6MjPBduhaWz9KVaevYGAg+6Cr7eOuuFRZ0YXBVaFrQLaZfRq/
 XG4KiGeYmWcDAelz1y6mLDEuv9kjWoYc8rSh1P1Ynh++tbDSGIBxup5dKjMzpauWJfSh
 r7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/O5h04PEE+ASwOC4yZVV1MN8tZ7/07CpqnbwV/QNyBc=;
 b=k5VEJ/on+vCKW++kQQs91DkCOqP139cPWyPmlQuVFRyihdt88yX4GYYzWyyKz6wmyD
 nt/7IZgczRj2RbH7Gjn6Fx6D7Zf+CNGmQ1CMIwiwrVGSCsve/GNWtD36fMcvwxwUVLph
 gLHNbcCpUn6KSytWKFh9v7EY92pS4hAx2GMgTtV7P6Q/GWQ4MIs9JTTIwH4oxu9ZH/tM
 uZ/wENzabS1MDezkX99ljc/S3NGa83GmlkNQIh9sXFX6xc8hzwCQyGNIfLgoyYQXFWk+
 1TDa66DChUMVXcaoQNVYg7AkH2V4Mmsa16/o4iA9DOgELMxzqcFo/1cL74raIk1y3gyC
 2F/Q==
X-Gm-Message-State: ANoB5pn09Zu31cC7eM9PStFWk2xcBTb1nDcFUvcwCR8HB7Cuj5b7y16m
 ysoYOedtS3UQmBBhATo0VQf6onE8UTo3+EUWRKc=
X-Google-Smtp-Source: AA0mqf5YLeUewxpyIwaAS1tTiG2Um6Z20fBicXYa41DQoajn1Cy5lhYmJtOYvHKsiFWZ3J8AeUaetA==
X-Received: by 2002:a05:6512:224e:b0:4a4:68b7:e74a with SMTP id
 i14-20020a056512224e00b004a468b7e74amr1753878lfu.52.1670575190758; 
 Fri, 09 Dec 2022 00:39:50 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j3-20020ac25503000000b004b5748fa3afsm167050lfk.107.2022.12.09.00.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:39:50 -0800 (PST)
Message-ID: <07fbe219-9034-65f6-963a-037de9bb6d79@linaro.org>
Date: Fri, 9 Dec 2022 09:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <20221209083339.3780776-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209083339.3780776-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 09:33, Alexander Stein wrote:
> It takes some time until the enable GPIO has settled when turning on.
> This delay is platform specific and may be caused by e.g. voltage
> shifts, capacitors etc.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 48a97bb3e2e0d..3f50d497cf8ac 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -32,6 +32,10 @@ properties:
>      maxItems: 1
>      description: GPIO specifier for bridge_en pin (active high).
>  
> +  ti,enable-delay-us:
> +    default: 10000
> +    description: Enable time delay for enable-gpios

Aren't you now mixing two separate delays? One for entire block on (I
would assume mostly fixed delay) and one depending on regulators
(regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
second delays in your power supply? If so, the first one might be fixed
and hard-coded in the driver?


Best regards,
Krzysztof

