Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45B6BB46C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 14:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73DD10E184;
	Wed, 15 Mar 2023 13:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7218110E184
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 13:22:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x13so28129146edd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678886534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3/cG1woHh53iE47t9IaTZRCKGzkSSa7msGm/VhK5acs=;
 b=Pow9GvwqHtlC0BOvs0ezBbgaYHV1fPye+3TLKkG54DJjkKbhnZ0jvlBHw2AU7b8xk+
 xlyLpnuvF6TO4/Xlw3hjx/D9jn9U7lh1TOA1VhYXCwT/ENqpDfkaXE7uTOM0lEPv8BY0
 X9hSLHtDIH1hLGjLbyDwUMNaL6t86ek10Oh2x2ou4ZAG31I9uaPyQUD82MQdcHZb5nrQ
 y0pe/Wjfscfxi1+n0D8qW/ARD3wKOPhonm6yf60hUOlHOAQR8EE1RtDTN9czBoMNJDoy
 uwl9HTafH1IbiWmNx7Eh9Xl9w4Ko+C6+AiB1IvBGOriWO7bHbDy7EVEpCj+Fz6GIQYA3
 2LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678886534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3/cG1woHh53iE47t9IaTZRCKGzkSSa7msGm/VhK5acs=;
 b=PP0UfvfxIh5F9KII7NMjes/cTO9asFX/vALYnPt94uJGqXQv3AShxIFGo/MehaRqEa
 FhlPXGh0jQlGwBWweL8Vs35ZNlm5ET9ebTA1HkCfl4WqaEz/aIeQ6zaesm8EfDQCGNfU
 vDU0MciEQhUGelABj8J777Kn8dXKECgatQhA7l5Fx5ZYMIz/A+p78TX8h4u8Kp9Pgl+O
 20xTM2IP8UdtzA3jPWIlTONKT9H9Om4MTQBd2xP43Y6jDBttrPLevAGuboX7XYm+JNRk
 Kh6gImr/qhDmGOzoXecA6bBuUQI6H7Q3QE2semYILfAG3Tdi/8uCgPsPVTR0qIufj7Lv
 Upuw==
X-Gm-Message-State: AO0yUKWs3YORn4P/T5lleq69uOmgzHSGiPywXnRnwOSjp/yjQy1cavNV
 wlP9w//Kk5Akn68n5h+sCScExQ==
X-Google-Smtp-Source: AK7set9OR91fwXBsgIoFh/ZQ0DkKpqVOc2a+qrrIMeS4gnjZr0ycWRM6ou2nEein8GfBPtd1Otjl3w==
X-Received: by 2002:a17:906:4ecc:b0:91f:9cab:3edc with SMTP id
 i12-20020a1709064ecc00b0091f9cab3edcmr5490125ejv.51.1678886533882; 
 Wed, 15 Mar 2023 06:22:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170906858a00b008d173604d72sm2534521ejx.174.2023.03.15.06.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 06:22:13 -0700 (PDT)
Message-ID: <d356f2b4-354a-d4de-6e7a-6392d1943cdc@linaro.org>
Date: Wed, 15 Mar 2023 14:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Add compatible for the MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

