Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1A78CB30
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694410E471;
	Tue, 29 Aug 2023 17:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0E910E11B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:25:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so101330a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693329926; x=1693934726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AOsSOchRRigf+GMT70wdUDRGXijaBiL95u8f9cme2Mo=;
 b=mTYU82vIaKmuEfxrSHnyl+NHYrUZbiC2ZjuM70pZ/+LiiRVNNPDMlDwhVldU7k5mT4
 J31+Q2Ekm+j7NrrTxsRJIhPC1mm4RwRWFI70mcrOoerM7+/2q8u3XFzkqdiCkVkq+gOq
 qn2Wr9mhmD4ycbxdWui2wPwT/z04CpihXDDBHTpZMTFBy8Q1aNQRTgdDNxPi4vQTnbme
 iUSPSJgCkFZ5JujRzG6lDpHnuZf2bqiQlZbxaQBV7mkXXunX3JFYMYRHCXcKZGjjKDTx
 GmabgTW3GAf1BnjwH3o2nUYYziogxkYl4jodjxkFhJlMrnvI2JgCYIfY2SLZhoNb9+Rg
 RsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329926; x=1693934726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AOsSOchRRigf+GMT70wdUDRGXijaBiL95u8f9cme2Mo=;
 b=g0qlfvW5zfd+lkV8fSkbJWdu3NsZ0+rrJKVZFwfcLrXXS5PayntUjQDMvcIheKmBFm
 +FAaubISRBonOT/82VWpVeeUd55aYYasgzTK/KT0xwaWfUTAu1nytJG5PmBd5V/AkLql
 FRV77f2c+MDsNoaRiKCAY/YQXY2KckLcL/KRkuW+DBgetBdhx/uyEDrIG6f2eWx+8ZLw
 ua7QBhnhwaF512WkQtBonZ7Uc0+tC8EgCXZ2vgn+LhGuTLsoXBwVBOVwVXYHC7NBhQAi
 Y0IWHW4qsu8BH8daPFGdB8ipehWC1803bf9oxc7Sy1yoJC6VjR3B3Px+VleVqKzuKzx4
 kwFA==
X-Gm-Message-State: AOJu0YxLlsFLdibQTL9f6hCBhu1Gy/Rega8czNyxO2ZlL8FZYV1HUz/L
 yjcV60YSYQ6jTuoA3M8T8IH3KQ==
X-Google-Smtp-Source: AGHT+IF3yG8pM/1QQYR3cM78PgXLt47SF3cJUeeTGTYGaG5gDIhDp0rbhT11KNATVil2Mt43nb0AVg==
X-Received: by 2002:a17:907:6d0d:b0:9a5:7b9a:f32f with SMTP id
 sa13-20020a1709076d0d00b009a57b9af32fmr3582562ejc.1.1693329926489; 
 Tue, 29 Aug 2023 10:25:26 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a17090606d100b0098669cc16b2sm6103226ejb.83.2023.08.29.10.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:25:26 -0700 (PDT)
Message-ID: <771e116c-7e0d-d238-d35a-c5e9a44ce571@linaro.org>
Date: Tue, 29 Aug 2023 19:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 16/31] ARM: dts: rockchip: Add SRAM node for RK312x
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
 <20230829171647.187787-17-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-17-knaerzche@gmail.com>
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
> RK312x SoCs have 8KB of SRAM.
> Add the respective device tree node for it.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---

This really does not depend on your MFD, GPU nor ASoC changes. Keep
independent work for different subsystems separate.

Best regards,
Krzysztof

