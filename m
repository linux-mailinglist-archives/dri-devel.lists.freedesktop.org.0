Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD756B3905
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEA110E97B;
	Fri, 10 Mar 2023 08:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0B910E97B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:41:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o12so17413403edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437713;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jY19RBdXGErSuK96SQ9CO/VfqzR61PSiwucTWNRVDbE=;
 b=ZdR6O1tBpHF+lilFpQQlvhYUaj1uscCMv151wALtJiKxx7nhMroGk7Zx2dHnMxKrHy
 UBAiF40+9XQLG7M5KcFaMhqxRjOdmpJvsgHFOXkNg+MgU8aGx8qWtNy9Qn3/8E4o4TF6
 mbeqrU7JwF0dVu2x6LVeN2wbGOkHfYwdvH2eS8RZwUyYbxkoTh0aziit6x9MCaerboWJ
 K5iMFTV4m96ZEdgcv/OagZ5f9ZKR9pUjcSiLywCJcIQthGgrnbxDQ2IwcUBv4D3qfNRx
 0iCsNZifm1/3Ej2552eb7fjQv/mbyIUpOsDK/UxUnoNQlJlEd30jLxn8KKAEiUCvCzCs
 5BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437713;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jY19RBdXGErSuK96SQ9CO/VfqzR61PSiwucTWNRVDbE=;
 b=5ntt7/HMga/XHRCj2aiwTbAMokmWaBN07xqN9s3yzBte3MhrtcQEDpJXdXAYa6upmF
 eVuLxpQ2W9869e7MZEPsyMDu6uWvE0j/pR7Qwo5ZCipqslvgAJBftFUVKtNW+FEopDnC
 yygQ9eUBesIA6aQvHbhmP7OvXgN3QoVyzG8flN8BEr8YcEwcj1kjp2EKwOzzP/vHP1cj
 W+ATYs8zED3rO/ft7SnnPe9a1s6qCKXPm5BN77slCA6SV3z7JX0S4bN63PcQWIckSmBe
 EA+q9aNbxuLnt/REObCXR9T/yusunL5n07z9L+Xuw0b6nN8ouhVT9h9I8QHWODoOIN/W
 SEFQ==
X-Gm-Message-State: AO0yUKW+AIo/kILTe0stp8I2V4haEzXvC5AaEx11Tm7Uf6kZS7sHPqQo
 JqASVMNFnFabTGUUsI4XoOaffw==
X-Google-Smtp-Source: AK7set/wf4w9jzDPoANKQB4e+0Ofo51LjennRsoVP/tsxVTpy93y5J3W+5W5VhClHpcVl0kpfmkn7A==
X-Received: by 2002:a17:906:9c8b:b0:8b1:76dd:f5ef with SMTP id
 fj11-20020a1709069c8b00b008b176ddf5efmr25974741ejc.5.1678437713153; 
 Fri, 10 Mar 2023 00:41:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a170906720900b008b133f9b33dsm665646ejk.169.2023.03.10.00.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:41:52 -0800 (PST)
Message-ID: <02174928-2071-512a-3cc6-d24bcc75cc32@linaro.org>
Date: Fri, 10 Mar 2023 09:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
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
 <20230220-display-v1-1-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-1-45cbc68e188b@baylibre.com>
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
> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

