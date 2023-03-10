Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA40C6B38D0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE96F10E982;
	Fri, 10 Mar 2023 08:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F9D10E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:35:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j11so17394158edq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SFsIUvQhnh2wbwHqMLG7mN4Mz01L3GW7UAQC2+jEkIo=;
 b=fYVytIbt0kRF0tnnLPcwQ7EF7XcCYv8OYZL5/yoNCRnv8tAcHblkanGpQ6JgV540qy
 WTNSxJfv8NIfoWNrswkv8xcwveQt7yMHOP1s+ei/Y1ocjefH37NAuC5JvViV8j8v3B7P
 pXbFsWMp8NFOeQOSBznsU208r6uF2UP2EyGv1Z6H8YCU17FOy5ja6t9TtuvLGnEaO5gq
 i/HzF9WKrQhg5ZcXC7dSpeJZrkSZfKGhQq5V/OL8HE7CqamcOR1WNRHUV7JnpeX+2p11
 vUNpFu4PHTU2z7DD5E13TkmCLb/1JM1gzQ4mY/VDbPwTxjfg5y/MkZl9Ce2W8iC0Ii2P
 ReOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFsIUvQhnh2wbwHqMLG7mN4Mz01L3GW7UAQC2+jEkIo=;
 b=mh+NfDfeZbqg9Ykw7hYnznK2lgMeZYYDWL5SlexXDWtaMnv4BfcU7TTpuecWNRGWEa
 TFDbp79JuToSErbwtQ4o7+Y3h27mJJoKYSSMKDQUcTmMdVtySNkLJwnWMBbKyNnULyfr
 LRic4ptz+TJWSVxhTvfHuaMhYC1LVSmqoXL1j4sCjQPI6jquJkrjRszcX2zP42qmTFVw
 jEDqIz+YTlAZltGvCyO6u4DxVK11v3YYYjTwHoU8g5WIRtFErUV5tQmS0YBU/9ASmimA
 CfJyEZf4Rc/VohLwgocX2zHB6/pYpEy117RtOiBbRuXfIWTsZrPgAxfEVDzWmyfbNngX
 ++Qg==
X-Gm-Message-State: AO0yUKWJRjzGYuwF1VP/i/q9tGj6S3SfsSKr42S/0pt5cnne4urQLdlp
 /NCEj1xXZ8PCFiMZYublJYP2Fw==
X-Google-Smtp-Source: AK7set9I5xoClWzOboxhwkIqcXcQKYAuUC4Krc6brpIBR2aX71Y2At8rBXzZdBkd+8bMsc88kMSK1g==
X-Received: by 2002:aa7:c153:0:b0:4ac:b614:dcfc with SMTP id
 r19-20020aa7c153000000b004acb614dcfcmr24012037edp.9.1678437317709; 
 Fri, 10 Mar 2023 00:35:17 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 y94-20020a50bb67000000b004d47ce55e57sm541331ede.10.2023.03.10.00.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:35:17 -0800 (PST)
Message-ID: <81466b52-826f-b4ab-5a1d-d4d49381d7f7@linaro.org>
Date: Fri, 10 Mar 2023 09:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/21] dt-bindings: display: mediatek: color: add binding
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
 <20230220-display-v1-3-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-3-45cbc68e188b@baylibre.com>
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
> Display Color for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

