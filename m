Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46926B10B0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 19:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58A110E6DC;
	Wed,  8 Mar 2023 18:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C47B10E6D8;
 Wed,  8 Mar 2023 18:11:55 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 m25-20020a05683026d900b006941a2838caso9458942otu.7; 
 Wed, 08 Mar 2023 10:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678299114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SIxmU/QtppDrzLwRQM4/EQwwRkPiWGOq6+7u8fs1B9E=;
 b=vwCR+eKgpwiyaRqFvQkVcT1yKxUOPHLM2hrbJxvgioTQrX7jG/XYXvswu42zcr6Fa1
 JFMN+gLyyUTpEOonKm0BQaVtilGFq5yeHnSTdHF+aqodt9VhQHn7E2MsMg5kx7SwXnkA
 Xl5iK/G0uEenG2+fBPl0qqBvlq+yf+7nBWZu885DDC10btY3M10crt0awWACrknLDW6e
 yYkqjVLq60CATD81xi/p1SBrkunNOnsyNEuOB7yfGf3lYqhm5SP0cwCPacpjZn6Mp2Nv
 AyB2kWA9p6J72JK0oO/8yc44+jrH9GdjnllxEKhMuP8zmW0porGqyahnsh9PMxEO4LC/
 gZgg==
X-Gm-Message-State: AO0yUKV94FuObgEs/HNP//6H8EfHwZKs7z7ZB+9UA/G7UFnjJf7df9RS
 QhQpBvh4YJwT7GjK0c+BPg==
X-Google-Smtp-Source: AK7set9H8k0goZQjGPEgNkkixy3gs3vd/sHKzFTM0Gx4xSIKWRHwsc1ffnNsJ1R+prua9m2CbtMAgg==
X-Received: by 2002:a9d:7103:0:b0:690:d498:56d2 with SMTP id
 n3-20020a9d7103000000b00690d49856d2mr7763163otj.4.1678299114187; 
 Wed, 08 Mar 2023 10:11:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d1-20020a056830138100b0068bb73bd95esm6636451otq.58.2023.03.08.10.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 10:11:53 -0800 (PST)
Received: (nullmailer pid 3526245 invoked by uid 1000);
 Wed, 08 Mar 2023 18:11:52 -0000
Date: Wed, 8 Mar 2023 12:11:52 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment '#'
Message-ID: <167828471597.2730705.13533520056770041535.robh@kernel.org>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 03 Mar 2023 15:42:23 -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/.yamllint   |  2 +-
>  .../bindings/clock/qcom,a53pll.yaml           |  4 ++--
>  .../devicetree/bindings/crypto/ti,sa2ul.yaml  |  4 ++--
>  .../bindings/display/msm/qcom,mdp5.yaml       |  2 +-
>  .../interrupt-controller/arm,gic.yaml         |  4 ++--
>  .../loongson,pch-msi.yaml                     |  2 +-
>  .../bindings/media/renesas,vin.yaml           |  4 ++--
>  .../devicetree/bindings/media/ti,cal.yaml     |  4 ++--
>  .../bindings/net/brcm,bcmgenet.yaml           |  2 --
>  .../bindings/net/cortina,gemini-ethernet.yaml |  6 ++---
>  .../devicetree/bindings/net/mdio-gpio.yaml    |  4 ++--
>  .../phy/marvell,armada-cp110-utmi-phy.yaml    |  2 +-
>  .../bindings/phy/phy-stm32-usbphyc.yaml       |  2 +-
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |  2 +-
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      |  2 +-
>  .../regulator/nxp,pca9450-regulator.yaml      |  8 +++----
>  .../regulator/rohm,bd71828-regulator.yaml     | 20 ++++++++--------
>  .../regulator/rohm,bd71837-regulator.yaml     |  6 ++---
>  .../regulator/rohm,bd71847-regulator.yaml     |  6 ++---
>  .../bindings/soc/renesas/renesas.yaml         |  2 +-
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |  2 +-
>  .../bindings/sound/amlogic,axg-tdm-iface.yaml |  2 +-
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   |  4 ++--
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   |  4 ++--
>  .../bindings/sound/qcom,lpass-va-macro.yaml   |  4 ++--
>  .../sound/qcom,q6dsp-lpass-ports.yaml         |  2 +-
>  .../bindings/sound/simple-card.yaml           | 24 +++++++++----------
>  .../bindings/spi/microchip,mpfs-spi.yaml      |  2 +-
>  28 files changed, 65 insertions(+), 67 deletions(-)
> 

Applied, thanks!

