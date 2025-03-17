Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA9A64A1A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 11:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6AB10E0EF;
	Mon, 17 Mar 2025 10:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QsDWmFcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445D110E0EF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:34:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2F33A489D2;
 Mon, 17 Mar 2025 10:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0ECC4CEEE;
 Mon, 17 Mar 2025 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742207693;
 bh=OOWMoUFQ23UHSwIZ8BvygHyrXX9kthpv+6WpnSx7ZNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QsDWmFcuxcsgFxG+2Q5SuxHmU93c+w9J/18L5YmxK5aviJm9Z4CUyWBrYiSnWqV2e
 C7GP8NTC6GV+/vET79P68p6yY4ndZ77nM5Qidg/EocBZRxEpLykxoK52Qq3XaAkOy8
 KTPXVZOgV5u7aBCFQwCMzMYJxlcldpTrsKgAJlR/4Ny0tx9C890MZIKAAdjizTMV9L
 VrzNMUMRwumMFNEbDQb1XVLR029YxilgVYa3urlPcqLBoCkLCcynRiwEcK+k2UfCEX
 T3oAWZCtEW8lZXjXHG9Md0KYqU91/xx4AAldISNUrDm8p8IZVEkSfRfduUQb3z1dPp
 B3NA64lusvwwA==
Date: Mon, 17 Mar 2025 11:34:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
Message-ID: <20250317-massive-calm-bat-43ff61@krzk-bin>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
 <20250314210652.GA2300828-robh@kernel.org>
 <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PA4PR04MB7630094413C8E1F3D715EE23C5DD2@PA4PR04MB7630.eurprd04.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 15, 2025 at 07:32:28AM +0000, Maud Spierings | GOcontroll wrote:
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reset-gpios
> >> +  - interrupts
> >> +  - sync-gpios
> >> +  - i2c-bus
> >> +  - slot-number
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    spi {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +
> >> +        connector@0 {
> >
> >I find this being a SPI device a bit strange. Is there a defined SPI
> >device that every slot is going to have? Or the connector has SPI
> >interface and *anything* could be attached on it?
> 
> So a module slot is like a pcie slot, it can be occupied or not, and when

But which buses...

Best regards,
Krzysztof

