Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D997353151E
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 18:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F1310E6FA;
	Mon, 23 May 2022 16:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AB010E6FA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:56:13 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-e5e433d66dso19200160fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FfAOhZNasQcy6TRDHmB8U+mc653MKDmGV3a61UnarkE=;
 b=PkmYbeYfR96hgnXLjgVHfSo6j0r6RJ2qmFpKMV0E3N2mHMOlDT3687yI2YB0SLApor
 gAw/ZEBeShyWAlq6tKMjFnEXnD7WgEQhXEgk95mzFqlpdP+PEupSa/eJ1wg0t88Qno55
 DnfuNc39FtqrtWkBTTTZBzODKD2IlPPviQcLS1MNftfI0u2568z46R6LIcV5CzJwaQnP
 pRMnY3JoeBJQe9tekBEHoGYafSKeF7TTuyXttfHivepSsDnU6XaErU2+W42HdeX8Ds9M
 8VLnUbQSX+W/AtI2AJUuIYAKZKQMeeBOHVj25lSJ0/2C+TxOUH/gPA6Of+xaRfZ4ATO9
 ro5w==
X-Gm-Message-State: AOAM531zJHSgW8eS5nxQ3vhE6HUacQnjVNvW0VqmTrUvpVtJW11lWy2r
 nxb6t9+puDonhFqj3h798Q==
X-Google-Smtp-Source: ABdhPJzG3ZFQrmj1v1yitS4jTC5DzQZmWnfRLp9MNvhBwUQ6yufF6JdEMRoPfxaQK0q/QMOIiKOBDg==
X-Received: by 2002:a05:6870:5823:b0:f2:2dfd:8df0 with SMTP id
 r35-20020a056870582300b000f22dfd8df0mr6004573oap.157.1653324972043; 
 Mon, 23 May 2022 09:56:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 eb38-20020a056870a8a600b000edf5a12baasm3976216oab.46.2022.05.23.09.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 09:56:11 -0700 (PDT)
Received: (nullmailer pid 1750116 invoked by uid 1000);
 Mon, 23 May 2022 16:56:09 -0000
Date: Mon, 23 May 2022 11:56:09 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
Message-ID: <20220523165609.GA1743214-robh@kernel.org>
References: <20220519211411.2200720-1-robh@kernel.org>
 <6ae55a29-0b29-f53c-c9bd-fae929f3caf7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ae55a29-0b29-f53c-c9bd-fae929f3caf7@linaro.org>
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, chrome-platform@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 21, 2022 at 05:03:41PM +0200, Krzysztof Kozlowski wrote:
> On 19/05/2022 23:14, Rob Herring wrote:
> > Now that the schema tools can extract type information for all
> > properties (in order to decode dtb files), finding properties missing
> > any type definition is fairly trivial though not yet automated.
> > 
> > Fix the various property schemas which are missing a type. Most of these
> > tend to be device specific properties which don't have a vendor prefix.
> > A vendor prefix is how we normally ensure a type is defined.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../arm/hisilicon/controller/hip04-bootwrapper.yaml       | 5 +++--
> >  .../bindings/display/bridge/toshiba,tc358768.yaml         | 1 +
> >  .../devicetree/bindings/display/panel/panel-timing.yaml   | 5 +++++
> >  .../bindings/display/panel/raydium,rm67191.yaml           | 1 +
> >  .../bindings/display/panel/samsung,s6e8aa0.yaml           | 1 +
> >  .../devicetree/bindings/gpio/fairchild,74hc595.yaml       | 1 +
> >  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 1 +
> >  .../devicetree/bindings/input/matrix-keymap.yaml          | 4 ++++
> >  Documentation/devicetree/bindings/media/i2c/adv7604.yaml  | 3 ++-
> >  Documentation/devicetree/bindings/mux/reg-mux.yaml        | 8 ++++++--
> >  Documentation/devicetree/bindings/net/cdns,macb.yaml      | 1 +
> >  Documentation/devicetree/bindings/net/ingenic,mac.yaml    | 1 +
> >  .../devicetree/bindings/net/ti,davinci-mdio.yaml          | 1 +
> >  .../devicetree/bindings/net/wireless/ti,wlcore.yaml       | 2 ++
> >  .../devicetree/bindings/pci/snps,dw-pcie-ep.yaml          | 6 ++++--
> >  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml   | 2 ++
> >  .../devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml    | 2 ++
> >  Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml | 1 +
> >  .../devicetree/bindings/power/supply/battery.yaml         | 7 ++++++-
> >  .../devicetree/bindings/power/supply/charger-manager.yaml | 1 +
> >  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml   | 1 +
> >  Documentation/devicetree/bindings/serial/8250.yaml        | 1 +
> >  .../devicetree/bindings/sound/audio-graph-card2.yaml      | 3 +++
> >  .../devicetree/bindings/sound/imx-audio-hdmi.yaml         | 3 +++
> >  Documentation/devicetree/bindings/usb/smsc,usb3503.yaml   | 1 +
> >  25 files changed, 55 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml b/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml
> > index 7378159e61df..483caf0ce25b 100644
> > --- a/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml
> > +++ b/Documentation/devicetree/bindings/arm/hisilicon/controller/hip04-bootwrapper.yaml
> > @@ -17,14 +17,15 @@ properties:
> >        - const: hisilicon,hip04-bootwrapper
> >  
> >    boot-method:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >      description: |
> >        Address and size of boot method.
> >        [0]: bootwrapper physical address
> >        [1]: bootwrapper size
> >        [2]: relocation physical address
> >        [3]: relocation size
> > -    minItems: 1
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 4
> >  
> >  required:
> >    - compatible
> > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > index 3bd670b8e5cd..0b6f5bef120f 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > @@ -58,6 +58,7 @@ properties:
> >  
> >              properties:
> >                data-lines:
> > +                $ref: /schemas/types.yaml#/definitions/uint32
> >                  enum: [ 16, 18, 24 ]
> >  
> >        port@1:
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> > index 7749de95ee40..229e3b36ee29 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> > @@ -146,6 +146,7 @@ properties:
> >        Horizontal sync pulse.
> >        0 selects active low, 1 selects active high.
> >        If omitted then it is not used by the hardware
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [0, 1]
> >  
> >    vsync-active:
> > @@ -153,6 +154,7 @@ properties:
> >        Vertical sync pulse.
> >        0 selects active low, 1 selects active high.
> >        If omitted then it is not used by the hardware
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [0, 1]
> >  
> >    de-active:
> > @@ -160,6 +162,7 @@ properties:
> >        Data enable.
> >        0 selects active low, 1 selects active high.
> >        If omitted then it is not used by the hardware
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [0, 1]
> >  
> >    pixelclk-active:
> > @@ -169,6 +172,7 @@ properties:
> >        sample data on rising edge.
> >        Use 1 to drive pixel data on rising edge and
> >        sample data on falling edge
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [0, 1]
> >  
> >    syncclk-active:
> > @@ -179,6 +183,7 @@ properties:
> >        sample sync on rising edge of pixel clock.
> >        Use 1 to drive sync on rising edge and
> >        sample sync on falling edge of pixel clock
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [0, 1]
> >  
> >    interlaced:
> > diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> > index 745dd247c409..617aa8c8c03a 100644
> > --- a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> > @@ -24,6 +24,7 @@ properties:
> >  
> >    dsi-lanes:
> >      description: Number of DSI lanes to be used must be <3> or <4>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [3, 4]
> >  
> >    v3p3-supply:
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> > index ca959451557e..1cdc91b3439f 100644
> > --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> > @@ -36,6 +36,7 @@ properties:
> >  
> >    init-delay:
> >      description: delay after initialization sequence [ms]
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >  
> >    panel-width-mm:
> >      description: physical panel width [mm]
> > diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> > index 5fe19fa5f67c..a99e7842ca17 100644
> > --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> > @@ -26,6 +26,7 @@ properties:
> >      const: 2
> >  
> >    registers-number:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      description: Number of daisy-chained shift registers
> >  
> >    enable-gpios:
> > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > index e8f137abb03c..aa61fe64be63 100644
> > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > @@ -31,6 +31,7 @@ properties:
> >      type: boolean
> >  
> >    function-row-physmap:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >      minItems: 1
> >      maxItems: 15
> >      description: |
> > diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.yaml b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> > index 6699d5e32dca..9f703bb51e12 100644
> > --- a/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> > +++ b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> > @@ -27,6 +27,10 @@ properties:
> >        column and linux key-code. The 32-bit big endian cell is packed as:
> >            row << 24 | column << 16 | key-code
> >  
> > +  linux,no-autorepeat:
> > +    type: boolean
> > +    description: Disable keyrepeat
> 
> This should be rather a separate patch - it's documenting a missing
> property, not only a type.

Yes, I've dropped this hunk while applying.

Rob
