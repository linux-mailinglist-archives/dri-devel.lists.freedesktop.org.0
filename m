Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5596B3890
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89EA10E977;
	Fri, 10 Mar 2023 08:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895F210E977
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:29:20 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ec29so17300348edb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678436959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uB0rK1kBMI+Nt2y6Mc9XPaDU5dUgUBOxars7E0HbbVA=;
 b=zgXBVXiVl7XoFo76/yrd+B+8ZajxnPqv4LRc4lpDiXq7OdZ7PU/xXWxE7HWrpyTF/4
 N1lpTiy7Rd19f/jIRZij0fBTMeCwHLg6Fy+27lUQEeTbJhj52jiCJptd62K8WbgTSuAA
 cy5EVQC1vzd2U40ptkBfNGpr1GDVSRVl5mMIX1O/utfr3GQxRecLGhuaPwZwCGHZ8h/o
 tjsyIFnNU6Pb+rB8y+kcbencLHR5P36ivelAWTgGr/IE8D4nIhiNx9kNOkleDoXi3Mzq
 IEnEkctP6UNzz2Xj0yGHZr+ypNEX+hydG89RjYsnqy2hhsYic3rCyHHqAKdJspIs3x7J
 Ro3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678436959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uB0rK1kBMI+Nt2y6Mc9XPaDU5dUgUBOxars7E0HbbVA=;
 b=IfDRBiTaT77FXaiRFLQTMnIkixo84tUL1+cI2b2VHlRLrzSUfdog+yeqVJA8hyytHM
 KxIt+QorIJtGAA/GV0dRZ9iKPVogUQT+APXiHGmrOSLhKD7KZTb9HHSu+aZncx1AOPIc
 RVgTkn68dsERLAYA83s853bbH+UXwZ8J2h1sqZEw8lEe5yX6l8YXXUyewxjZcWlUyjba
 jRA/EbGvvlgBtyS98KCa6T3tg9ZyIo4XJBr2pUBK+TU+kdq489V0Ugd3QV3ywVOH009J
 AZPVa0ehxI9BkIjq6XQ1m5HQFbfXJCnY/P3zsusZDVzrJ6ByIhdF9gymtHWfaj6qPdzm
 yUjw==
X-Gm-Message-State: AO0yUKWHw2D4qMA2cAPuS7d/wCANNIjL4qBe65OT+/5vKoZjqQ4+Tfe7
 KKE3GBnQ6sLHeaW8GwronRR7RQ==
X-Google-Smtp-Source: AK7set8UQKKMmAOVRYKQ/i/KExXg3AgioafyC3Q1XOnef/dHb+v6PnHiGYD4PqIZELC7xxX0L8tn1Q==
X-Received: by 2002:a17:906:246:b0:8b1:fc1a:7d21 with SMTP id
 6-20020a170906024600b008b1fc1a7d21mr30206548ejl.5.1678436959029; 
 Fri, 10 Mar 2023 00:29:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 br5-20020a170906d14500b008ddf3476c75sm673322ejb.92.2023.03.10.00.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:29:18 -0800 (PST)
Message-ID: <22325550-5b32-d55a-e647-3890be6b475a@linaro.org>
Date: Fri, 10 Mar 2023 09:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/21] dt-bindings: display: mediatek: ccorr: add binding
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
 <20230220-display-v1-2-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-2-45cbc68e188b@baylibre.com>
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
> Display Color Correction for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

