Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396EE78CB14
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D8310E46B;
	Tue, 29 Aug 2023 17:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AD310E46B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:22:11 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso479616766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693329730; x=1693934530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2tJx1LZA2LjgFtn73CfwP5M/IqTnK+MwGx8w31m75yU=;
 b=zhdT4+gqpd6hXl/1AYIMtl2I0Wi+ntmhHwcmBTqkgBdvdiVKuV+a+dl3qf6MAC89Yg
 xtFKR6zdCcg3/y9R9kN0QMBc3eeiglNerx8lEfteQJMddk3E6iZif5l2T9B4XvKrE4ma
 hYV1xLa2w3qc7BFGJIpITAtU+wKnbA5fhNkJSaRIR9+2o36urU0mHIIeYsJkxt6huU8v
 SdEYknF7yo13DKV/C0MCR/50DtwnBGfyf/pCh5qAp0176tnlclQF4fBPE5h/SKyKzi4q
 alj0NninrfISvuwp2iM8QhKKKSXceytX0YvYXWTOUbyrmlluV8qB43btBUzRiXMPYAFy
 NyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329730; x=1693934530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2tJx1LZA2LjgFtn73CfwP5M/IqTnK+MwGx8w31m75yU=;
 b=GsAETbfzAa0gwVs6IL0f9e2stUxfy3WAlMqaFsP8tm8dF7i4IuI2ZXhjpETA4znzdc
 zCYuMQUnqIwvCVjE4N1kyGADjJIGGF/i5kXBjluxNEtsRY+Smf3JZR9Ze53g4IDlC2ZB
 3g4e1J/R19JshaP05KjP58ep2+fciCwcX7I/qbKgvUS218S/D4bcVMtc3lay3o8Ex/AW
 4t42vbLh8uWCgcim2Hhc9H/VN4u6NFzc2r17jJxRFhJ9CnMPSsINUxfJ6N1YdKWEYXW1
 Rl/YmjSrSs1jN/+YjwtyVsHY10M4iLw827OtD4+kvF4L5gSLA7tlamJlNLE4IwMv99nu
 sgag==
X-Gm-Message-State: AOJu0YysUDE2cQoPfg/PqlZyKfw5SmzyO1nl/DdBNdJYkudFZzMTYuqw
 yjdQwmC7jJPSmkGTfOXJLrTTjQ==
X-Google-Smtp-Source: AGHT+IEkfyuO10UaoAlJW/IYUjOxaNUiUgX99OtB+CD8vi2Z/YeQChXUrbKkNwIR57XqpbHKCgrV0w==
X-Received: by 2002:a17:906:51d6:b0:9a1:d087:e0bf with SMTP id
 v22-20020a17090651d600b009a1d087e0bfmr15768869ejk.43.1693329730572; 
 Tue, 29 Aug 2023 10:22:10 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a17090606d800b0099364d9f0e2sm6189666ejb.98.2023.08.29.10.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:22:10 -0700 (PDT)
Message-ID: <92b8261b-420e-d96a-ba77-9abe7d53b427@linaro.org>
Date: Tue, 29 Aug 2023 19:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 04/31] dt-bindings: arm: rockchip: Add Geniatech XPI-3128
Content-Language: en-US
To: Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-5-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-5-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 19:16, Alex Bee wrote:
> Add Geniatech XPI-3128, a RK3128 based single board computer.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

