Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B963F75B072
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1597610E5C7;
	Thu, 20 Jul 2023 13:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1638610E5C7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 13:52:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C984D4000D;
 Thu, 20 Jul 2023 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689861161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqgjGCqvaiSNlmDsRmBgwW6pMJtbiMAZmpY9wcvjHx8=;
 b=Q+VuocpWXVnPx1WTifgxymPhNNJ0KxzjDRTn/uTlgSnJQa8DltTxIsUVzHI+DJz8PUVpE8
 Hce1XkYFmfI4WQ7tmRnAblRvwb/ZgYMGFjxF/N0RNV7kGGlWBnulI3kB7Qfq43QzXsaZXI
 lScIHIIm0wrdphLQZoeU0ZJ0lmplkBs+/INiA8sQpsUDuK9QGQTLFMHO7zYZjbMDOa7E7m
 OsEcxMwax0gFuzTlzfoWHCsltwSEm44rvl3DWnf9Efb+t0LPhGVw0Su208bw0EYJ28cUTs
 z1zfaaX84kgrW5QOwHJ1FfoCYugcrbn7kvaZv+5nuxwZA4kCuzueYb3uaT4c3g==
Date: Thu, 20 Jul 2023 15:52:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Message-ID: <20230720155238.6fb8ac8c@booty>
In-Reply-To: <20230719190254.GA578754-robh@kernel.org>
References: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
 <20230719152147.355486-2-luca.ceresoli@bootlin.com>
 <20230719190254.GA578754-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob,

thanks for reviewing.

On Wed, 19 Jul 2023 13:02:54 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 19, 2023 at 05:21:46PM +0200, Luca Ceresoli wrote:
> > Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
> > connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
> > 480x800 panel based on it.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  .../display/panel/ilitek,ili9806e.yaml        | 69 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> > new file mode 100644
> > index 000000000000..42abc6923065
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ilitek ILI9806E display panels
> > +
> > +maintainers:
> > +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> > +
> > +description:
> > +  This binding is for display panels using an Ilitek ILI9806E controller in
> > +  SPI mode.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#  
> 
> A SPI device should reference spi-peripheral-props.yaml as well.
> 
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          # ShenZhen New Display Co 3.97" 480x800 RGB a-SI TFT LCD
> > +          - newdisplay,nds040480800-v3
> > +      - const: ilitek,ili9806e
> > +
> > +  reg: true  
> 
> maxItems: 1
> 
> > +  spi-max-frequency: true
> > +  reset-gpios: true
> > +  backlight: true
> > +  port: true  
> 
> Drop all these and ...
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - port
> > +
> > +additionalProperties: false  
> 
> ... use "unevaluatedProperties" instead.
> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    backlight: backlight {
> > +        compatible = "gpio-backlight";
> > +        gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
> > +    };  
> 
> The exact backlight is outside the scope of this binding and should be 
> dropped from the example.

As this comes from copy-pasting from the bindings yaml for another
panel, would it be useful if I send a patch to remove it?

Requested changes queued for v2.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
