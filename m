Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB71635A51
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CD510E1FB;
	Wed, 23 Nov 2022 10:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF3010E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:40:41 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f13so6029299lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2pM9FxyqpBfqOkWHZznQlsEGwgwUinMmoNOgEnKgLr4=;
 b=Ow0xVzWPkFoncMiJC03Spf4BHgUncJGI6fQ7W+eTFjCoE4X66chE8lsyYCE0hXnJx7
 ON+KOvz2pDbpILTd4dvyuUMLuxlKmRXlYf9Es+7+klAP3l/xiit/GIAUzTktA9aJvDZD
 3mS++ghxdsqW75p8bIsNImoQdk9YcbHpMvUlXo/UR+OEYN40/PtII+ME7+7e6TuQj5jI
 Ta+2In+MS0zfCDz1VP1h98e6BQYUGV+GWJUexUARWyB92ANYo35/OCJsZNLYMS/mzoQ2
 xJqC8DCG3gvepFdk2lxVPDUZGuHXwci5biqppPoX3RVOpbeW/n7bWRsSrR8lIdWnN+0W
 Yacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2pM9FxyqpBfqOkWHZznQlsEGwgwUinMmoNOgEnKgLr4=;
 b=fJr+F4hpZSjNs6Le9DCFbbqeJgz8uhHTwXFlRBQJ0Rff6PUb20YOhZ6dP1cA9yYIVx
 pRlTgeUVsI2pD95+iBJA7EZlqBIts6q5SOBle2KZqnimvkufHn9OHRmL4RZHDrPpD7Pb
 Amskdl/9YSPerWxGHzxEj0U1uRCC5EcANYWAgCIwFWGJQ/IIPv7vKHxLI4U9QouDyGiY
 1dNQsiOOn9LPvEq8Vlf1XV+QX/mlk0E2N81STrGY27sNq2Ma/bjbTrCiyehrh/LhQBCk
 x11rAywqLesTZrZhl1502zQLixw3Geagx6I2JEh2nFMy0b1UzAgNUz269/epoHjzkXpY
 OE5w==
X-Gm-Message-State: ANoB5plKPdnoBUBN0bO7rKCro+8gDmabUPwEBEyfuR7g/04bKIXX3Kvm
 /yuYOCxLMxdqnUNlF/jA7HY4jgkxcn2QY6y0
X-Google-Smtp-Source: AA0mqf65UK1CaHGngQBgykBf32ZTP2POeVhbADAETUeoSjm5v+P3xFmEI/+7eSZUzMMygcDjB106IA==
X-Received: by 2002:a05:6512:3b23:b0:4b3:abaf:b7c1 with SMTP id
 f35-20020a0565123b2300b004b3abafb7c1mr3193346lfv.39.1669200039533; 
 Wed, 23 Nov 2022 02:40:39 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a056512118700b004b4cbc942a3sm1653992lfr.127.2022.11.23.02.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:40:39 -0800 (PST)
Message-ID: <ef1eec15-4875-9ba7-1152-97a9b81330d3@linaro.org>
Date: Wed, 23 Nov 2022 11:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/11/2022 20:54, Biju Das wrote:
> Document RZ/V2L DSI bindings. RZ/V2L MIPI DSI is identical to one found on
> the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-mipi-dsi" will be used as a fallback.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

