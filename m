Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7606B38E9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE5C10E986;
	Fri, 10 Mar 2023 08:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADFE10E984
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:38:28 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id k10so17296741edk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437507;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t4tm25fNnIaWemUx2VahelluE6ctKtlhrepqAnkCCss=;
 b=nmxtg+WHsmkV971tCViPa6+CimQStML5lIgnFi5wEyq3kb6St6+KLSZ/wsAY0gRoeC
 dgr9I2aXQx/Xna6OWEu0t99p0Xi9yA88yqa9G08FetK/cx5sWLyAA8orpezlPTMBPjE/
 qQiF6fj2hRGEkC7mvsU8frgcv3ND1XCksO+7nqpcZ/KHmutRWnoT1u8NndkTcUnZ3xPU
 hhIrSbS+5ftmrK5B7BJNrMIUH8lyrJOzJSOZQrPq9qLp1EDEEQQkhd5myR4hUUcbsyeI
 dwXElMqmT83g6OAj6Y6KXvo3DgXaXRoW7KG7kJjjZggAKANTLBKot24E1Hc4jGinAOas
 +NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437507;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t4tm25fNnIaWemUx2VahelluE6ctKtlhrepqAnkCCss=;
 b=JKvf4mm/+xy/1yWOnI0GyKM1jNgRJ0Yr/tdeXz03rxdimAdAa5Hq/J6+5KDMAgu1U3
 qmsvseaVHI9n2X3Adsb6ILzy8uY0mSh4iHiU9Jn06SbYk5cIVySEll4YCTMMx23KkCz1
 f/1CqN3UNbgPCpd0xfEzwIRZYgjwNBKoqsmvpW6ArCCGsM7uHpVACQn2Revc+u9esOdL
 qQbqUMLkez4kHabU1RVuH6A9NOT4cH9EPCAVJeG0iOLn+vBUyjQInVRV2nKEQGWfvWh8
 dT+wnuw62+IVYQ5LELs42J4Dew2TfOCGPRWvMmF3JpKtZtaq1fCVrPM+qKJlYjOZbBAb
 G8QQ==
X-Gm-Message-State: AO0yUKWOU9/eAkvPDhbQui0nTKgEuKqmtRXhXBeItKqDfPLemNTRdZEU
 NxC7fTZ9l1pYqXXPBux7RDv2Bg==
X-Google-Smtp-Source: AK7set/ljQXMn96k9aYajnipD3ShYXrnZo/eORj2bw7NOnFHEK9rIgYt7AS2Vqef+Ys9xbd2oOv3vA==
X-Received: by 2002:a17:906:fe07:b0:879:ab3:93d1 with SMTP id
 wy7-20020a170906fe0700b008790ab393d1mr35150385ejb.4.1678437507151; 
 Fri, 10 Mar 2023 00:38:27 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 dt22-20020a170906b79600b008d47cd2edfbsm682617ejb.60.2023.03.10.00.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:38:26 -0800 (PST)
Message-ID: <72543074-02e9-23f3-7963-62e23eae1e1a@linaro.org>
Date: Fri, 10 Mar 2023 09:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/21] dt-bindings: display: mediatek: ovl: add binding
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
 <20230220-display-v1-9-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-9-45cbc68e188b@baylibre.com>
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
> Display Overlay for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8192 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

