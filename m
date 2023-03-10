Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4A6B38D3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A8510E97F;
	Fri, 10 Mar 2023 08:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48B710E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:35:28 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id cy23so17257671edb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437327;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pJcUaaupxC0Cesm+olJlrB4JiVcGZmcF1bEfkcOLpFI=;
 b=zztfA9qPNw1B7ChjfD6USbohMrg+ZdoZ+JjKrIEDhaJERv9YNUUUQA1X1MYjz51uKR
 31cOuv6NTiT5mbHRx4VVFO/fLvmc6dEtsHOvB/JhvBKy/W3SfiRXVIxspinsqMKpHk71
 Ohyk5en+I2XdyMp7RQzAftVAY53VhRcipdTO/jpldfsrK3XqBiBRPT3D81j5DfxhhroN
 +UZsxlgxInFQQOlcNXCPbfakmwzJgJz4/fLsWn6a6gJkwKQkwF4lvwNb/Q1wCAIYfSGr
 mVYdb5SQwYtmu37jDJrzCVexyecDa1PMdsaS/6WHX+wtWHTghlwfYJqQ8Iy71DilruNc
 jL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437327;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pJcUaaupxC0Cesm+olJlrB4JiVcGZmcF1bEfkcOLpFI=;
 b=31mHnbR7OWYIzq+Vbu0EKebnVx4VLSJkNX3fcCAX6Nug9QNMdlNYpOwXou7MD9J6wu
 aS6erF/mtxGtvHyubM1ijAyUV1CbhHhDfcfI0QgkIPfnsMQeZ4qyjZIxGQQkPQ+wm2RU
 FkFR+gFMhZdroGiyuvsdn9deh2pqSbZARaApATFTLBQIbxIeIBx0aWbkyRhNd57AjL+g
 fO8yeru6JePQcyKK1xDQSXF+pLhG0npJP0QFzt571sg+uFTEaa5fsr44d9r+gIDjAlBE
 kcFvcSUOH+PPM6j8+lZanFU+LG4Bq9PNQiOmtvKDb5Tqv80T0pBYUDKxI93Zy+7A7LkB
 IXXg==
X-Gm-Message-State: AO0yUKWAqYkQiS6f6U4p/kxThoAglYU1k0Lwwzj8s6OktB4H1EF4b3hS
 c3oyKXKv+927X5lvUXvcdkU+VA==
X-Google-Smtp-Source: AK7set+DBGNE0cU7kyarjTZodaPg1LsewOJQmmlUqoGRgEFs7ZUUw7tEf5XmIBJ8/sY4WBxI3pQ6dA==
X-Received: by 2002:a17:906:6dd3:b0:878:8249:bef6 with SMTP id
 j19-20020a1709066dd300b008788249bef6mr24440085ejt.59.1678437327185; 
 Fri, 10 Mar 2023 00:35:27 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 zg12-20020a170907248c00b008c76facbbf7sm679116ejb.171.2023.03.10.00.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:35:26 -0800 (PST)
Message-ID: <f76edb9c-a3e9-456d-30c8-bd1af074a0cc@linaro.org>
Date: Fri, 10 Mar 2023 09:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/21] dt-bindings: display: mediatek: dither: add binding
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
 <20230220-display-v1-4-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-4-45cbc68e188b@baylibre.com>
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
> Display Dither for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

