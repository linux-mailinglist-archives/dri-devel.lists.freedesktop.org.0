Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCB122FBD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 16:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F07A6EA2A;
	Tue, 17 Dec 2019 15:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A766EA2A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 15:08:53 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ihESw-0007uN-KC; Tue, 17 Dec 2019 16:08:50 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add binding document
 for Xinpeng XPP055C272
Date: Tue, 17 Dec 2019 16:08:49 +0100
Message-ID: <1823876.MjdJyG0ANN@diego>
In-Reply-To: <20191217142446.yexcmh5ox4336qmd@gilmour.lan>
References: <20191217140703.23867-1-heiko@sntech.de>
 <20191217140703.23867-2-heiko@sntech.de>
 <20191217142446.yexcmh5ox4336qmd@gilmour.lan>
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
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 17. Dezember 2019, 15:24:46 CET schrieb Maxime Ripard:
> Hi,
> 
> On Tue, Dec 17, 2019 at 03:07:02PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> >
> > The XPP055C272 is a 5.5" 720x1280 DSI display.
> >
> > changes in v2:
> > - add size info into binding title (Sam)
> > - add more required properties (Sam)
> >
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../display/panel/xinpeng,xpp055c272.yaml     | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> > new file mode 100644
> > index 000000000000..2d0fc97d735c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
> 
> The ID doesn't match the file name.
> 
> Did you run dt_bindings_check?

Thanks for that pointer ... I did run dtbs_check on the binding and was
sooo happy to not find any panel errors in the pages of other dt errors
but till now didn't realize that there's also a dtbinding_check.

Will keep that in mind for future bindings  - and of course fix things
in the next version.


> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Xinpeng XPP055C272 5.5in 720x1280 DSI panel
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: xinpeng,xpp055c272
> > +  reg: true
> > +  backlight: true
> > +  port: true
> 
> What is the port supposed to be doing?

Hooking the display up to the dsi controller. But you're right,
works without port as well with these single-dsi displays.

I just remember needing one for the Gru-Scarlet display that needed
to connect to two dsi controllers.

So I'll drop the port node here and from my board devicetree.

Thanks for the review
Heiko


> 
> > +  reset-gpios: true
> > +  iovcc-supply:
> > +     description: regulator that supplies the iovcc voltage
> > +  vci-supply:
> > +     description: regulator that supplies the vci voltage
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - backlight
> > +  - iovcc-supply
> > +  - vci-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi@ff450000 {
> > +        panel@0 {
> > +            compatible = "xinpeng,xpp055c272";
> > +            reg = <0>;
> > +            backlight = <&backlight>;
> > +            iovcc-supply = <&vcc_1v8>;
> > +            vci-supply = <&vcc3v3_lcd>;
> > +        };
> > +    };
> > +
> > +...
> 
> Thanks!
> Maxime
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
