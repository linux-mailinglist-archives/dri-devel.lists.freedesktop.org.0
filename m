Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E918873D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9E76E1B8;
	Tue, 17 Mar 2020 14:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436B36E4D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 20:49:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6699B58089A;
 Mon, 16 Mar 2020 16:48:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 16 Mar 2020 16:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2tglQQZWc8w8BFYHHOuQ8FRIUWK
 jMyItVwVW13flha0=; b=LP1I9ll8CV/bx8h+KXkGxkFpvuXfPfTPSCZq1455SA6
 oW1thhFn4p2zGNFDMWx6loA246ZNaggiWkI2PMPcUKyYdptl0DIh8jL8C/kRJY44
 tARF8LnwNGRM6Gl3v8ramNfHvpTJ+SGRAoqEtU6BYb+izeX2sTJSlbbue1XNw9bp
 qvuyRXX1KXurx5LuxJLI+zEl9TmtS50a4RpvGn/qEP24jJm2sekECVQdrzxxFLnT
 iPCB/Y/Rh7IErGSNZmDvJDePWHTUK2OFFMx1HvdI9IDQmVnR8XSsMYVk81T8c96R
 Pqyb03DlVavmgxAqFnifFpV00TF6BQwDRw9cLPkCSow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2tglQQ
 ZWc8w8BFYHHOuQ8FRIUWKjMyItVwVW13flha0=; b=WAc3H/gWQdr3elcEYWxvbq
 wslSbdrMrxGnWftrdLz+1T+t/F//9bAbg65T7dsIxWHugJtMIliNktmFEjm1Bfp/
 za2nvaGjmUE+uPZJaDQyJRWAj8eX8x+nTeIB7EPm+tFyNab6f/t+Kkjic8UGX7VA
 CbjcelqmPy5gAjtyfJ1UbZp/g+ejTPdYvIhyrzIbvokKPdgos+7j9sgrq7Q/sVdB
 FJHAJ37alG/F7T/2W2Crv/aePS63mAe4fFN6nX4Uf+SFXbparBLXLO1Mms/CCeBO
 UGkWo8ZhsfGrSWc+B9iatHK2tuE+17Z1ueJx+J5tBLraJSNCmtBI41arNQVj5F6A
 ==
X-ME-Sender: <xms:NeZvXqEn8Yf3bXeXC3UMNn3qvRCzfhoScIVtjkKaAQU9CCJo01LcHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeffedgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NeZvXp2YuEvGoIbgs0Ic0o4EgHdl36nnXGba5HsJJcytNmTq_-qchA>
 <xmx:NeZvXq1-KzfBBuOObXdDCJjb3fRRRMLkjdk61uB3pTZ8jmVxQK0bhA>
 <xmx:NeZvXjNIBev9Y-1WVwT_s8ght3MAxgU8dnxvXiaVq14ne5oJBvP4FQ>
 <xmx:OeZvXuCXIHbp6weyKnjMyZRj7vq_Y4094xNFyiPTfefEWaio9uF2tQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D21533280060;
 Mon, 16 Mar 2020 16:48:52 -0400 (EDT)
Date: Mon, 16 Mar 2020 21:48:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/36] dt-bindings: spi: support non-spi bindings as
 SPI slaves
Message-ID: <20200316204850.gggeyjulgiy53i7x@gilmour.lan>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-3-sam@ravnborg.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Mar 15, 2020 at 02:43:42PM +0100, Sam Ravnborg wrote:
> Independent bindings can be SPI slaves which for example is
> the case for several panel bindings.
>
> Move SPI slave properties to spi-slave.yaml so the independent
> SPI slave bindings can include spi-slave.yaml rather than
> duplicating the properties.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-spi@vger.kernel.org
> ---
>  .../bindings/spi/spi-controller.yaml          | 63 +-------------
>  .../devicetree/bindings/spi/spi-slave.yaml    | 83 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 60 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-slave.yaml
>
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 1e0ca6ccf64b..99531c8d10dd 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -67,71 +67,14 @@ patternProperties:
>    "^.*@[0-9a-f]+$":
>      type: object
>
> +    allOf:
> +      - $ref: spi-slave.yaml#
> +
>      properties:
>        compatible:
>          description:
>            Compatible of the SPI device.
>
> -      reg:
> -        minimum: 0
> -        maximum: 256
> -        description:
> -          Chip select used by the device.
> -
> -      spi-3wire:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires 3-wire mode.
> -
> -      spi-cpha:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires shifted clock phase (CPHA) mode.
> -
> -      spi-cpol:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires inverse clock polarity (CPOL) mode.
> -
> -      spi-cs-high:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires the chip select active high.
> -
> -      spi-lsb-first:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires the LSB first mode.
> -
> -      spi-max-frequency:
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        description:
> -          Maximum SPI clocking speed of the device in Hz.
> -
> -      spi-rx-bus-width:
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - enum: [ 1, 2, 4, 8 ]
> -          - default: 1
> -        description:
> -          Bus width to the SPI bus used for MISO.
> -
> -      spi-rx-delay-us:
> -        description:
> -          Delay, in microseconds, after a read transfer.
> -
> -      spi-tx-bus-width:
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - enum: [ 1, 2, 4, 8 ]
> -          - default: 1
> -        description:
> -          Bus width to the SPI bus used for MOSI.
> -
> -      spi-tx-delay-us:
> -        description:
> -          Delay, in microseconds, after a write transfer.
> -

I can see what you're trying to do, but you don't really need to.

All the SPI devices will be declared under a spi controller node that
will validate its child nodes (and thus the devices) already.

Doing it this way would actually make all the checks happen twice,
once as part of the SPI controller, once as part of the SPI device
binding, without any good reason.

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
