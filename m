Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0778CB13
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A7910E44B;
	Tue, 29 Aug 2023 17:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C35A10E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:21:46 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso9626566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693329705; x=1693934505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ONMdNT0qe15nFMdXWcs/Q8c5HCoTBwiBJLGrnRV1nw0=;
 b=hFIUpQP3vr7BX/EEpnXL/NWmOHDl46fx6bKa4j8pqUBkTuvlHw6h9toIYNLg57Vebd
 YTN708R3rvfqzb9NgzkZWj2DOVccX7Pa7nLA+SRC/Wfu54ki3pYapQ8QWmrwigugJJ+j
 1cXGVekw640+TpxkpUgg+ZDODWxWWTH3rdv5g75GiMB4A0CTcC3EnfU5zZpce2WxGnEZ
 lGDDjmSKEQtaQ1ZjaL2Lp58CGjnga7sNDtV/JmgH7PG7q9c/+LgiWDY0OUmj57qGXbmy
 BSUHPWONNozJU3PT9vH0JwAwO5aw/aENYejDtTOCLHCwm6bBJvvVTU8JpfgeVzTPRVNw
 FsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329705; x=1693934505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ONMdNT0qe15nFMdXWcs/Q8c5HCoTBwiBJLGrnRV1nw0=;
 b=a6qAMznr7ESZcrSnr8/u/zxgvuLILqbhBQqjPFYbPA5h+FvErM9eASSvqkCH8c6v3B
 pP4Fgajq79Cvd/Ie5VUZkSUTtTQofv/5akNIhpMCxaEgxLvlw9f5BnB7+1vUPNkmPyq1
 8O6GfMgWQ/Px86wFPadPdsp+4K5NxUknhBXbd6v+o6M8D7qYvUZp7BVk58JhG101hE5N
 kGfosyDmHeu44RQxuNnMLRI1YlX49U4QjgdevHa8pVc1KHoYK0ZVo2gnbuD9z9zvv6mW
 5RlSZPbPiZ4SHNDPVXd5btCTqNfFCWk6Q1d4C/jSea33V6c5uD1StlflOcHD4o5Ug29J
 kewQ==
X-Gm-Message-State: AOJu0YySnmM5jY4lpDJt71M+HgIfd6SwXKoIRP1G9b4mTSfyx3HdeWgX
 iI+UAZc/l0+Dfd7pYsPeYp5Ukg==
X-Google-Smtp-Source: AGHT+IEC28zmPiIgJmKgcQJmlnUeRmPValFdXqSMVRYqh4YR7AT6QaS02hhHQPZGW4brxIj/NspEyA==
X-Received: by 2002:a17:907:1614:b0:9a5:c2c0:1d0f with SMTP id
 hb20-20020a170907161400b009a5c2c01d0fmr3407559ejc.12.1693329704763; 
 Tue, 29 Aug 2023 10:21:44 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a170906805200b0097073f1ed84sm6161481ejw.4.2023.08.29.10.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:21:44 -0700 (PDT)
Message-ID: <ea386a28-841d-0e76-cb1b-735b630001ba@linaro.org>
Date: Tue, 29 Aug 2023 19:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 03/31] dt-bindings: ASoC: rockchip: Add compatible for
 RK3128 spdif
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
 <20230829171647.187787-4-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-4-knaerzche@gmail.com>
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
> Add compatible for RK3128's S/PDIF.
> 

Subject: ASoC: dt-bindings: rockchip,spdif:

> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

