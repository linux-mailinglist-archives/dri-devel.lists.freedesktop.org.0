Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA706B38D9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8CA10E980;
	Fri, 10 Mar 2023 08:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C695910E980
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:35:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x3so17312073edb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mn1vLNX458kljHD+DHfjvMGt/le6hUqQgMBvdIhJEsY=;
 b=yRSFe7BvYv8hMAHXJ5/M6DA42nlT3ofi5LpTrmTGQbyGZXNYW/pN5FxD/7Ff+wkdOL
 uIUFfyL5W2t836jKHk11QHvarM59ZWADcKpc7Ektb8AMzpj9NlUf9Q9KRKsZbhey6l4m
 wwQgDjyXllRc+eA5ipo6kjojzkWoKilJIvdq5uU8erql+I4c6KI8O9b4UZ+g99ZYAZ0/
 URDnvz0c2J92xxkbheSnP3LIKX27MkRq8PjzN5tUMHTo5fpOdpVaMncSoYTfuyG0H/NL
 w0iKYcQWClqhTzPChCtCd9gL/HdanmcbfPdrFYSiXOMT3+po3Qff+FcTBnDFEA7tSSXS
 Dzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mn1vLNX458kljHD+DHfjvMGt/le6hUqQgMBvdIhJEsY=;
 b=wRrLNmPl9UITlVhYUwZ3Zw3kNdik282NBr1VxRG9F0+2DsX1HCdv924cPdtPV9sqD3
 tUc2+busGP1mz8G15K6x+qRx8oxUrc2o7r32GTw3bhOYiSeu+iE+lWAeeGWRPfMt/ikC
 mqD9TywUR0KM/EE+JcI+xLm1cRgy/yLINWWovPgl+wnv4P8hH8TOR59jugCfn33qGbSv
 yHJgKJq3a7UPFp30zxffVxmhaV05pH45UMy7gELIiOOqjxjhWo5cNyu9gywNEkcu4dUD
 V1kYhQMjEGlkGDQ3LgzdsngsBz26CFo9hFRFHBBrZD82KlWr0Bu8Vd5R0PPFuE26IcxU
 ISHg==
X-Gm-Message-State: AO0yUKX3uGhQ+t7lYickzmmK1twSex4w5ZUaU5rEpOe+UAbtb9jrUbxl
 g/nll9+GbRqLNfDNjbd8/z9MAA==
X-Google-Smtp-Source: AK7set+B8T3dy99CLujhhEDzNKkfET67hYpQvpYTs6C0Ur74VsFLFiujwxN190X58NvvhEJms9qBIA==
X-Received: by 2002:a17:906:dacd:b0:88d:ba89:1837 with SMTP id
 xi13-20020a170906dacd00b0088dba891837mr1006039ejb.8.1678437355374; 
 Fri, 10 Mar 2023 00:35:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a170906240e00b008b1779ba3c1sm667385eja.115.2023.03.10.00.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:35:54 -0800 (PST)
Message-ID: <eef712f9-43c6-d6ba-3ad7-3aff7542bf27@linaro.org>
Date: Fri, 10 Mar 2023 09:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/21] dt-bindings: display: mediatek: dsi: add binding
 for MT8365 SoC
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
 <20230220-display-v1-5-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-5-45cbc68e188b@baylibre.com>
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

On 09/03/2023 15:22, Alexandre Mergnat wrote:
> Display Serial Interface for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dsi.yaml       | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

