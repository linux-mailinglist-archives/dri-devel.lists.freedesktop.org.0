Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FB51B049
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 23:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0085310EE4F;
	Wed,  4 May 2022 21:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0351510EE4D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 21:18:56 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-e656032735so2518894fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 14:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S5KOsETtEM/tlLh5aE4TllMhkuOxHv7tKaCHP6S4dRs=;
 b=V3L87jPC4oHRS3Ww3gXLwnAUu5UfbQ/xxVzXS2JokJhP5mO6jTku1xg2y/MkvMjYn5
 tQKSmAXZx4SLjCbDvWwhR0ZsBn1B4rU03Zqddc/keWrjasoMdytvEkLw/u7cuFG4XQ/i
 7BrXfcGJy4uvnjOPHbPNzkxkTEAEpXFHGVYeXvj2y406TLcnZg2Vv7CTngNIkJL9SVOn
 0NFZWlNOKrmvDHftgqwr7OlnCHDEUo5Clxw3sFeoBfGOSJ7rTyyETwtjzt9U9ewryM+A
 SJv/4j1PRIYAwfwzcu4yygg4ug4mx6KyyNIPHwUPx+ZaDCDYp2nG+H0wPoArJNXyw+4i
 dKAA==
X-Gm-Message-State: AOAM532p6DdUTaDDkbjBf0lxoIZOfVw++pOBkuxXSFoeRUDJU8BF/GMB
 uTxPw8Jh0QDVMC/FRfdzcA==
X-Google-Smtp-Source: ABdhPJx70C27VXLkiWuEEIrWSrTpQJyJY8Bcpnd3QFecXI5OFZqDfycowXXO+amY4bM1axvVUtwzWg==
X-Received: by 2002:a05:6870:7a8:b0:e5:d471:1e82 with SMTP id
 en40-20020a05687007a800b000e5d4711e82mr785288oab.138.1651699135188; 
 Wed, 04 May 2022 14:18:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m1-20020a056808024100b00325cda1ff88sm15372oie.7.2022.05.04.14.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:18:54 -0700 (PDT)
Received: (nullmailer pid 2242697 invoked by uid 1000);
 Wed, 04 May 2022 21:18:52 -0000
Date: Wed, 4 May 2022 16:18:52 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant 'maxItems/minItems' in
 if/then schemas
Message-ID: <YnLtvA9hWMSIfSP7@robh.at.kernel.org>
References: <20220503162738.3827041-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220503162738.3827041-1-robh@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
 Richard Weinberger <richard@nod.at>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-can@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Han Xu <han.xu@nxp.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dario Binacchi <dariobin@libero.it>, netdev@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 03 May 2022 11:27:38 -0500, Rob Herring wrote:
> Another round of removing redundant minItems/maxItems when 'items' list is
> specified. This time it is in if/then schemas as the meta-schema was
> failing to check this case.
> 
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
> 
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Anson Huang <Anson.Huang@nxp.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Han Xu <han.xu@nxp.com>
> Cc: Dario Binacchi <dariobin@libero.it>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/clock/imx8m-clock.yaml           |  4 ----
>  .../bindings/display/bridge/renesas,lvds.yaml |  4 ----
>  .../bindings/display/renesas,du.yaml          | 23 -------------------
>  .../bindings/iio/adc/st,stm32-adc.yaml        |  2 --
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |  7 +-----
>  .../devicetree/bindings/mtd/gpmi-nand.yaml    |  2 --
>  .../bindings/net/can/bosch,c_can.yaml         |  3 ---
>  .../bindings/phy/brcm,sata-phy.yaml           | 10 ++++----
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 10 --------
>  .../bindings/serial/samsung_uart.yaml         |  4 ----
>  .../sound/allwinner,sun4i-a10-i2s.yaml        |  1 -
>  .../bindings/sound/ti,j721e-cpb-audio.yaml    |  2 --
>  .../bindings/thermal/rcar-gen3-thermal.yaml   |  1 -
>  13 files changed, 5 insertions(+), 68 deletions(-)
> 

Applied, thanks!
