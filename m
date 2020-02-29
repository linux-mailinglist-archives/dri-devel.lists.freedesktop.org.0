Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8AE174785
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 15:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CAC6E340;
	Sat, 29 Feb 2020 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983966E340
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 14:56:33 +0000 (UTC)
Received: from p508fcd9d.dip0.t-ipconnect.de ([80.143.205.157]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1j83XX-0003Bd-B4; Sat, 29 Feb 2020 15:56:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add binding document
 for Elida KD35T133
Date: Sat, 29 Feb 2020 15:56:26 +0100
Message-ID: <12676917.Ei69fZKULH@phil>
In-Reply-To: <20200229125052.GB5447@ravnborg.org>
References: <20200225093913.415844-1-heiko@sntech.de>
 <20200225093913.415844-2-heiko@sntech.de>
 <20200229125052.GB5447@ravnborg.org>
MIME-Version: 1.0
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, robin.murphy@arm.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Am Samstag, 29. Februar 2020, 13:50:52 CET schrieb Sam Ravnborg:
> Hi Heiko.
> 
> On Tue, Feb 25, 2020 at 10:39:12AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > 
> > The KD35T133 is a 3.5" 320x480 DSI display used in the RK3326-based
> > Odroid Go Advance handheld device.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> One small comment, but anyway:
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../display/panel/elida,kd35t133.yaml         | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> > new file mode 100644
> > index 000000000000..4bd74eaa61be
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/elida,kd35t133.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Elida KD35T133 3.5in 320x480 DSI panel
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: elida,kd35t133
> > +  reg: true
> > +  backlight: true
> > +  reset-gpios: true
> > +  iovcc-supply:
> > +     description: regulator that supplies the iovcc voltage
> > +  vdd-supply:
> > +     description: regulator that supplies the vdd voltage
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - backlight
> Is backlight really required? If it is tied to for example vcc then
> there is nothing to express in the DT.

Not sure I follow. On the Odroid Go Advance (device in question)
the backlight is provided by a (adjustable) pwm-backlight.

So of course for probability it is not required by at least to make the
display usable it is ;-)

Heiko

> 
> 	Sam
> 
> > +  - iovcc-supply
> > +  - vdd-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi@ff450000 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        panel@0 {
> > +            compatible = "elida,kd35t133";
> > +            reg = <0>;
> > +            backlight = <&backlight>;
> > +            iovcc-supply = <&vcc_1v8>;
> > +            vdd-supply = <&vcc3v3_lcd>;
> > +        };
> > +    };
> > +
> > +...
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
