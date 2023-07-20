Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F475B06F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB9710E5BE;
	Thu, 20 Jul 2023 13:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE0810E5BE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 13:52:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33664E0012;
 Thu, 20 Jul 2023 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689861146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQjwgP8NyAhjmDO+mDi8yi5oc9GjBls2NUUYZadye/k=;
 b=NOCwrt5yLMd025/qXCMrQZBKyitZGU/phqpgRJQmxaRbDcgwPdCM2gYvs5ya5Yc9vrgf8s
 d3lNaCv1ST9SGcmM1VJyDoemLKD4Xg3UoMTNwpHEuKcvH075SjTU9KVrNY8XcliymaB/LW
 vEcISNBI6flr0Q7dLuetw43OT0Q5Sgz4CxVTeTPQEgOtcazabOzO0EmQXZSYEfaLiYQvWT
 7Zio2o1k3vgkAoHZiY+vTmR63m/rEYrD0D+9eDwc8T1fPI3/ys3pNgXgcHllQziEBBnEa7
 x1Xxx9zjzy70d0aIDj73JEH5lGovbNdz03mluByJxeWF6bm+BFbbVEEAy8j1dw==
Date: Thu, 20 Jul 2023 15:52:23 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Message-ID: <20230720155223.7f4da41a@booty>
In-Reply-To: <20230719-sizing-ribbon-9e62a4afb5f6@spud>
References: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
 <20230719152147.355486-2-luca.ceresoli@bootlin.com>
 <20230719-sizing-ribbon-9e62a4afb5f6@spud>
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
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Conor,

thanks for reviewing.

On Wed, 19 Jul 2023 17:44:45 +0100
Conor Dooley <conor@kernel.org> wrote:

> Hey Luca,
> 
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
> 
> I figure you explicitly mention SPI mode here because it also supports
> D{P,S}I?

Exactly, DSI is supported as well by the chip.

> > +allOf:
> > +  - $ref: panel-common.yaml#
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
> > +  spi-max-frequency: true
> > +  reset-gpios: true
> > +  backlight: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    backlight: backlight {
> > +        compatible = "gpio-backlight";
> > +        gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
> > +    };
> > +    spi {  
> 
> Just a nit, a blank line between properties please. Clearly no
> respinning needed for that...

I agree. This comes from copy-paste from another bindings file so I'm
probably sending a separate series to fix it and avoid the same issue
in the future.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
