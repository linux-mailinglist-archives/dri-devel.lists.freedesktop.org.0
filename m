Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AD6B38EA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F9710E984;
	Fri, 10 Mar 2023 08:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8EC10E985
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:38:33 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id ay14so17307018edb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5jX9C5jsC1gif4BoDiLkwtHT3RghH5PN+LBKh8t0wrg=;
 b=H4fQ7akqxIUQoaNTb9Z4JkcxVGx/bU51xZWjMh9utqF6N1ScpXGX/Y7B4b2C4y3B8b
 1uJPBbYC2c2YUS2GiJLOioYm6G6CPJI1ITJLrSU9I29w+1L/GUpNh2SRzhsj7NG+uFRk
 GvuIo/nk+w2M+2qg8loXiWlOUIiWhi6B4fv2uzaDSSj1XlmSeQCg6QVszBPLWvlvwvjr
 P+N+MDsGYbMW4r0//DEhFvj48XikhdRigGPvnBjVnpglazhH8bmz2GSr5ZS6B36iN+6e
 wfxBsQWkUG1D2ttnZe5O5xtk89yHTtINLvAp5MbYt46wDZhcYuZvd8L88YFLjcKkiKJi
 gUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jX9C5jsC1gif4BoDiLkwtHT3RghH5PN+LBKh8t0wrg=;
 b=7PhAE2jqTRbShaqy+27rzgk01UWJdKC0awbcSQ4H8MnyjSm1Gte3qDyTdCunuMl7xO
 mxXoEfYzfaZ1jkdtSmKZow3r9Jjm+KwDsk8i3GF0iEBmQSzOpmrQy2hafLnPPdcnB3Hx
 nzWZPW7T4E4n6wAnalMWqjxt4BilnClpctpF9HoCFRfLipKAU9I3pOp8ea/lmSHWF5W7
 N4YYM4ch0swYxt68iduKFvaUuOqr79BpgmchBLIh0Bi+m7R7nOFJw9p3KWEO/lcLx2Pv
 oZHga6Qnps9wJqSv7T4AqKbIgwZ/VTYnXA6gWGbDf1Ge4TKX1+mMivK9QuMEUX+H/+AT
 Km6Q==
X-Gm-Message-State: AO0yUKXYFBKs8HPyovr44SbHOFe+7EzPTJrbaPxT7Zm2bRMqsy0LN4w+
 mTCPbqmT3vbIF3TLLhPNw+dl9A==
X-Google-Smtp-Source: AK7set+gioboWv9qQuHDDci4UGzpTiLbVncpzdW857S5/NDplZRpEN/ZSe4nXeBw8pldZ2o3ycauOQ==
X-Received: by 2002:a17:907:5ce:b0:8ae:6b88:e52d with SMTP id
 wg14-20020a17090705ce00b008ae6b88e52dmr904091ejb.7.1678437512905; 
 Fri, 10 Mar 2023 00:38:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a170906b31200b00914001c91fcsm673989ejz.86.2023.03.10.00.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:38:32 -0800 (PST)
Message-ID: <7b8d8c5d-493c-0785-832d-954af502fced@linaro.org>
Date: Fri, 10 Mar 2023 09:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/21] dt-bindings: display: mediatek: rdma: add binding
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
 <20230220-display-v1-10-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-10-45cbc68e188b@baylibre.com>
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
> Display Data Path Read DMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

