Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA023C6B5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5E36E513;
	Wed,  5 Aug 2020 07:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103F6E4AD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596561528;
 bh=PfvJzRfka1xHALav28arWCZDate4GnXBbihee0+KhaM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EN+uw33PfyCYqZ6Jb2icnF5c3HrpWf8dPUDgmjQ0xQgkIywa91Ka/SNvT9ciqcDkj
 sXP7fkS7r7C+JQOj4bQNn0JWOFMVaKvx+Fs4Ua4EBBZjm9KXJ0REbmAn3XM9N7pS9l
 TjaLv4KQ59Xm0oALBjjqmhMF0BsvYxDVWLXGBKjo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 19:18:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-aa434d4a-b151-4595-93cc-a222bf12522d-1596561528040@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Aw: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
Date: Tue, 4 Aug 2020 19:18:48 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200804165555.75159-2-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-2-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:eCpOYYm91ycQQu1zE0e+aOPm1QDKgTJTaCDXAvupGT9O7b7zVueJh3Y7K+mn6AlKnxs2w
 fAJIySZyPMQMY1/Ca53+ViEmZwvy0/33JZgAdrdny3mU/HpI4uZ2AM2LMUMFh/TYQpEIHkUG6EI+
 aPetOKusURCqBbYXH4LzuQQl4BIO18tkt0UKlFiuhjkV5DemiPW9yT7mvCV1mpwdjz15r4ySI8bP
 Y0m/eB5qyaBQBLbgcjtt0k+PlxOvAFiyd2tOjl7se3+7q/fcAd8hLSq6+oqRGY4P5eWUlnO0Fm1I
 fs=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:flVI4GK44zY=:nmGK0L7OG07U+JF9NHf1aw
 yvBcL9s33de88JTiZqtyo6gQh5bxuIGOjNLBuEEIPW83AroQ0K4ewN3WxnLLGFwUV/GO9Jm9v
 tpEkvAiS5txolz33oit+3JUrAL951IuYY8LKXus67j788niebxyH75tw/LOPPznb4D33U67Zc
 YBZUhtUNm5GdHIDrJgTK0rCKvo/+AY8U3hKsaOSoFVIXbcxTEDaoiBvNJozPn3CgYJrO/Ga8b
 tgJGgxd2Ef+TPYav2JLQ9zSoHUgDVEyyPGFhioZwXPzJCdMzLlKP+eRyvm9LhVMfgBMVIF8UT
 xn+sfz/lrXDGnmzMnXNWVfqbRbTaZIq/v6HZ5qQSpuvmhgG/nfpQkYEodDtIkm4YWp7N6s2pw
 oIHnIj42ICssWVmEN7aAs70avl3MCycthwyCGkuupIM6+F21SGkIjXjRNlUNy1fJDWsd1O3J9
 MYVlhc12JVqi5g/H03G+TIlemx4/PSSvEwkjZPnKdqfE6qqOsJIxZgbdXeU5MAqlBuejIpUnL
 dsNpQD+jD+tlbuZqIebghGIH9AhJbGgtILadCFV7i6q1m5MIOcXPYPe+Oc8Gd6XPqsdbpf2sm
 1hPhyQO6k1b0FawcCHhLOVxWeRKcTSHfuZo6wo3HCTLLXAfU7yIXqHk71PNdEnF73K9gcJqxF
 akfUCTNBif0WSCCzBNydYyrNIWUl3+GCMqnN3pmPZQ0EyNKXgSj8Q592EHSlqf8wwgZQ=
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC Rob Herring and devicetree-list

> Gesendet: Dienstag, 04. August 2020 um 18:55 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>
> An: linux-mediatek@lists.infradead.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, "Matthias Brugger" <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
> Betreff: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> mt7623 uses mt2701/mt8173 for drm, but have own compatibles
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
>  .../devicetree/bindings/display/mediatek/mediatek,hdmi.txt    | 4 ++++
>  4 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709db7a4..121220745d46 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -43,7 +43,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" 		- display mutex
>  	"mediatek,<chip>-disp-od"    		- overdrive
> -  the supported chips are mt2701, mt2712 and mt8173.
> +  the supported chips are mt2701, mt7623, mt2712 and mt8173.
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index 77def4456706..dc1ebd13cc88 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -7,7 +7,7 @@ output bus.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-dpi"
> -  the supported chips are mt2701 , mt8173 and mt8183.
> +  the supported chips are mt2701, mt7623, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index 8e4729de8c85..f06f24d405a5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -7,7 +7,7 @@ channel output.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-dsi"
> -  the supported chips are mt2701, mt8173 and mt8183.
> +- the supported chips are mt2701, mt7623, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> @@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-mipi-tx"
> -  the supported chips are mt2701, mt8173 and mt8183.
> +- the supported chips are mt2701, 7623, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - clocks: PLL reference clock
>  - clock-output-names: name of the output clock line to the DSI encoder
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> index 7b124242b0c5..6b1c586403e4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> @@ -6,6 +6,7 @@ its parallel input.
>
>  Required properties:
>  - compatible: Should be "mediatek,<chip>-hdmi".
> +- the supported chips are mt2701, mt7623 and mt8173
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> @@ -32,6 +33,7 @@ The HDMI CEC controller handles hotplug detection and CEC communication.
>
>  Required properties:
>  - compatible: Should be "mediatek,<chip>-cec"
> +- the supported chips are mt7623 and mt8173
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clock
> @@ -44,6 +46,7 @@ The Mediatek's I2C controller is used to interface with I2C devices.
>
>  Required properties:
>  - compatible: Should be "mediatek,<chip>-hdmi-ddc"
> +- the supported chips are mt7623 and mt8173
>  - reg: Physical base address and length of the controller's registers
>  - clocks: device clock
>  - clock-names: Should be "ddc-i2c".
> @@ -56,6 +59,7 @@ output and drives the HDMI pads.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-hdmi-phy"
> +- the supported chips are mt2701, mt7623 and mt8173
>  - reg: Physical base address and length of the module's registers
>  - clocks: PLL reference clock
>  - clock-names: must contain "pll_ref"
> --
> 2.25.1
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
