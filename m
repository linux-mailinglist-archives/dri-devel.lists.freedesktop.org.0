Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514D678CB0D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B110E0B9;
	Tue, 29 Aug 2023 17:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC5F10E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:21:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-500bb392ab7so3541701e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693329659; x=1693934459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QBKkSL9t38kSqeftJsbciCM+HglFHnwrbKgwPhleq2o=;
 b=WOyiTVlnOOUo6lKsyRU0FN0t4Y0sbAF7/1a9l8mU5zGheftOc2fA41+7bCjl3jMHaC
 SdSdMV2DBKjRnw1tr2HnWisrSnTXsku10i1pwBDD62x096r2AUaZ8gEGrGo3NCJbxgJz
 zv1axfA/ZNKEESvUiu0gC/krrVKl/kGAJfwbyFwsYFIzEIzVkf/feQ3TBotYPHegFQ8y
 Fdle+Z4wZCcxfK+3JbdGH9LGAWOKMXY6nXXMQkDr7d51pdunU2ilmTA/HRTXh2s9cmnZ
 9hm29kl6z4GKDxqVPxPFJ30PJphupOPXQbS5T6+pHdzKUPeEn90N1xu6MxDgkYvi1l12
 U90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329659; x=1693934459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QBKkSL9t38kSqeftJsbciCM+HglFHnwrbKgwPhleq2o=;
 b=CFNvQVUo+T2LVXlZTGyr0NtgMTrvrextQDo2KZi88cvf4wvdajbVKkOgqrK0rY9tN5
 xh32o/wlzVIdtaZ8+ZV8+2LZmn4VUOlQUjSspcuA/5qcfAXb0MSo0S3ljkrvlA8HToAF
 X4VcvHpVKyOu/ACq/pUsW+ks9lvyjKLdPFDQKpWHLKESy4wuqfkcnjAE3ugtTI8x9wXd
 MkCSRFDs0lGy80g94SZIW9963Yd89dSjRa2kI0s/1nQQ9e+welNRIqR+7BseWx3Xmb+O
 H43KOdPDjFFKjI1Nq+Rzj+37fkgwJfZkgsOX4XurYM4NxIHbjKQcalek0vVQjhy4YsVs
 P51w==
X-Gm-Message-State: AOJu0YzxMQ9fi2ENfY4bXYJ1Gj7ylx8UuVZr75Y/fgQO5NiGq2NHlj5k
 VuFJG0rRdUjRS9JzSdsoTBTqfA==
X-Google-Smtp-Source: AGHT+IG/q2ZZ6mJ8wgVf7UkQm2wC4U2oV3GvzNYN1v09DUHmgy8f2+SWpj1f+hhyVjmrfvs8FPGv0Q==
X-Received: by 2002:ac2:4bd3:0:b0:500:ac3:dd77 with SMTP id
 o19-20020ac24bd3000000b005000ac3dd77mr9085492lfq.10.1693329658953; 
 Tue, 29 Aug 2023 10:20:58 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 l15-20020aa7d94f000000b0052568bf9411sm5797806eds.68.2023.08.29.10.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:20:58 -0700 (PDT)
Message-ID: <d3fa22f6-22e4-3d15-70d1-d64b2c125ad7@linaro.org>
Date: Tue, 29 Aug 2023 19:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 02/31] dt-bindings: gpu: mali-utgard: Add Rockchip RK3128
 compatible
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
 <20230829171647.187787-3-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-3-knaerzche@gmail.com>
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
> Rockchip RK312x SoC family has a Mali400 MP2.
> Add a compatible for it.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

