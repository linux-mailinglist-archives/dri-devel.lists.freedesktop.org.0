Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9FE3D4217
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 23:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F3888735;
	Fri, 23 Jul 2021 21:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BC76FC44
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 21:18:38 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id y4so2835991ilp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 14:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CKG+SIFOLcCaYKwd2tEvLAZD7WaQ/IHSvWAesLjHfew=;
 b=sh1tLKhuhItEdPpnnCsvHOLPzRL91/FuwAYMIRbUnnpn9mPw/2tc2OwvSh9Qq9LvAp
 jrko7s5u+zEF8UmhTQSTvLBBpE6rdNvHFwc/p4cW4/4tdS59rKByBQc4/GyxiuOEMwu4
 BPFvlr0OPmDTE0ptnoQPbAgrAVe4lsxIQtQy2Td8u5X2+WGhp+RYtvHzbNA8rH2SatMo
 y5qkfN73xhKdViUwq725/PyA3HMycN7REqR/ubWd2xueqRfAD5JOwjO4xLg1d8oUGoxj
 vgAybKJ1IzJUtgnqAdeXQ4ZmeBLwqpeQmz/Rz2xgZnvWWoExzqD9rsndSXCDEAycoMuM
 m7vw==
X-Gm-Message-State: AOAM531gxoyHeCKlcvONV6JtIcxkoiUl+t9Bfck6b+xI5fLSKU7DXmNH
 tvui3vJX5fBoQkrpTJDelw==
X-Google-Smtp-Source: ABdhPJyOIbF9rq5B3bw9Tx2y/wvm92OqGc0Be5P5cyYWmK3oh5EqS+J3TTa94Os0/ICItRZB++DE4A==
X-Received: by 2002:a05:6e02:190d:: with SMTP id
 w13mr4883804ilu.53.1627075117897; 
 Fri, 23 Jul 2021 14:18:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l11sm19496837ios.8.2021.07.23.14.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 14:18:37 -0700 (PDT)
Received: (nullmailer pid 2602448 invoked by uid 1000);
 Fri, 23 Jul 2021 21:18:32 -0000
Date: Fri, 23 Jul 2021 15:18:32 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
Message-ID: <20210723211832.GA2602340@robh.at.kernel.org>
References: <20210720172025.363238-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720172025.363238-1-robh@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-rtc@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Mark Brown <broonie@kernel.org>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Jul 2021 11:20:25 -0600, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
> 
> Enabling qca,ar71xx causes a warning, so let's fix the node names:
> 
> Documentation/devicetree/bindings/net/qca,ar71xx.example.dt.yaml: phy@3: '#phy-cells' is a required property
>         From schema: schemas/phy/phy-provider.yaml
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Robert Marko <robert.marko@sartura.hr>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
> Cc: "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: ChiYuan Huang <cy_huang@richtek.com>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Dilip Kota <eswara.kota@linux.intel.com>
> Cc: Karol Gugala <kgugala@antmicro.com>
> Cc: Mateusz Holenko <mholenko@antmicro.com>
> Cc: Olivier Moysan <olivier.moysan@st.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |  2 --
>  .../display/panel/boe,tv101wum-nl6.yaml       |  1 -
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    |  2 --
>  .../bindings/media/renesas,drif.yaml          |  1 -
>  .../bindings/net/intel,dwmac-plat.yaml        |  2 --
>  .../bindings/net/intel,ixp4xx-ethernet.yaml   |  2 --
>  .../bindings/net/nfc/samsung,s3fwrn5.yaml     |  3 ---
>  .../devicetree/bindings/net/qca,ar71xx.yaml   | 25 ++++---------------
>  .../regulator/richtek,rt6245-regulator.yaml   |  1 -
>  .../regulator/vqmmc-ipq4019-regulator.yaml    |  1 -
>  .../reset/hisilicon,hi3660-reset.yaml         |  1 -
>  .../bindings/reset/intel,rcu-gw.yaml          |  1 -
>  .../bindings/rtc/microcrystal,rv3032.yaml     |  1 -
>  .../soc/litex/litex,soc-controller.yaml       |  1 -
>  .../bindings/sound/st,stm32-sai.yaml          |  2 --
>  .../bindings/sound/ti,j721e-cpb-audio.yaml    |  2 --
>  .../sound/ti,j721e-cpb-ivi-audio.yaml         |  2 --
>  17 files changed, 5 insertions(+), 45 deletions(-)
> 

Applied, thanks!
