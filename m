Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E9738398
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5AB10E452;
	Wed, 21 Jun 2023 12:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC37110E452
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:21:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3113dabc549so4361913f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687350094; x=1689942094;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IiYHd+ez1eBUEBJjfoLrdHwsLSVwCQn16XtUaKUe2VI=;
 b=DhlKQ6dU+tlczMaohMlS+W0k73hDWJ8p5AAh3nHc1Awu9hOczZH5jPmD51Kv/zDiIx
 6XnE7NH++TrIlaI4WvNiUHB37AG5BfT+BNhc7MzUu/CsATwFnFWPPEY6L9PF4rNZy3If
 S1goMFGHntFVJIfj5bHm3ZBS3VxIBpsVqaoneriX1yfOtutIsaQupJNFE/D/Yf5Gx4cB
 CaRaoJqF9453UmrLfhcuLLWVyBSd/S65UdFIcFOT38Ug4IdasHNOvsm89FIyvQOZ70rn
 A4Fd8u1C/Nn5Jno6gRA2MFCYP2SgSdbIDvj1ADYHFmPecGy60wGA6JuR1UYwQyKI84FX
 JqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687350094; x=1689942094;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IiYHd+ez1eBUEBJjfoLrdHwsLSVwCQn16XtUaKUe2VI=;
 b=DrBVIIaLLocvjrff7D3FYRspeyrl+XSPiM4w4zweiwx83Isn9Q9sA3gFjHNoJ2z6Bu
 nzHHxoZFQxFI3BSoQ4PYTYGzaHSEt6y1sTA4LuR3ETfLiAWcXKHn3jNf4gSBwekQQhWW
 yMtcJ7D0AoSO2cHEmiJklZRj1fBKrHJCc0y1Zk1CVLALawbeKKPWaW7UqTU1nLmcBvP8
 e/NCq5kkH9xWGbhEo/JNo4Fdf9yWXdzX6bZo5CWdJNrti1V7xrcH0RcB0k4ZCb5cbzsU
 XOkw+MyrprKt6znI6kfWNYw3AHkjrOqGyaItuYf0wdbCyJ2IH4wza22aWb9D4JFnOsxK
 UrwA==
X-Gm-Message-State: AC+VfDyN9aZOqsPSaaNeucVyVnJp0SlOaxjr5LjzWkv39Gdfq103/0NY
 oy8YmdXHJnLEkS1RxmzllMxjOA==
X-Google-Smtp-Source: ACHHUZ7YdAD+SC9QActN7pDnaISAagYkfFkfMfIM4lfGQTS4szBq0gc+PMkNmbwHZvwhbsjLdpTVeg==
X-Received: by 2002:a05:6000:104f:b0:311:110d:5573 with SMTP id
 c15-20020a056000104f00b00311110d5573mr14519588wrx.64.1687350093788; 
 Wed, 21 Jun 2023 05:21:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056000114400b0030ae93bd196sm4370845wrx.21.2023.06.21.05.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 05:21:33 -0700 (PDT)
Message-ID: <69ef04db-f7a2-e5bd-1e6c-c922e2fa75e4@linaro.org>
Date: Wed, 21 Jun 2023 14:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: ili9881c: add compatible string for
 Elida hj080be31ia1
Content-Language: en-US
To: Dongjin Kim <tobetter@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
References: <20230621100244.1325638-1-tobetter@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230621100244.1325638-1-tobetter@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2023 12:02, Dongjin Kim wrote:
> Elida hj080be31ia1 is a 8" MIPI display panel. It utilizes an ILI9881C
> controller chip, so its compatible string should be added to
> ilitek,ili9881c file.
> 
> Add the compatible string for it.
> 
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

