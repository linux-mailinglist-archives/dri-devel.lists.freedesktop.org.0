Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3FC724F80
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD25910E3DB;
	Tue,  6 Jun 2023 22:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609D010E3DB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 22:22:50 +0000 (UTC)
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1q6f4U-0003CO-8M; Wed, 07 Jun 2023 00:22:34 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>, Keith Zhao <keith.zhao@starfivetech.com>, 
 Shengyu Qu <wiagn233@outlook.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Date: Wed, 07 Jun 2023 00:22:33 +0200
Message-ID: <1991848.PYKUYFuaPT@diego>
In-Reply-To: <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
 <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, wiagn233@outlook.com,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 6. Juni 2023, 20:41:17 CEST schrieb Shengyu Qu:
> Hi Conor,
> 
> > Hey Keith,
> >
> > On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
> >> Add bindings for JH7110 display subsystem which
> >> has a display controller verisilicon dc8200
> >> and an HDMI interface.
> >>
> >> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> >> ---
> >>   .../display/verisilicon/starfive-hdmi.yaml    |  93 +++++++++++++++
> >>   .../display/verisilicon/verisilicon-dc.yaml   | 110 ++++++++++++++++++
> >>   .../display/verisilicon/verisilicon-drm.yaml  |  42 +++++++
> >>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >>   MAINTAINERS                                   |   7 ++
> >>   5 files changed, 254 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/display/verisilicon/starfive-hdmi.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/display/verisilicon/verisilicon-dc.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/display/verisilicon/verisilicon-drm.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/verisilicon/starfive-hdmi.yaml b/Documentation/devicetree/bindings/display/verisilicon/starfive-hdmi.yaml
> >> new file mode 100644
> >> index 000000000000..c30b7954a355
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/verisilicon/starfive-hdmi.yaml
> >> @@ -0,0 +1,93 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/verisilicon/starfive-hdmi.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: StarFive HDMI transmiter
> >> +
> >> +description:
> >> +  The StarFive SoC uses the HDMI signal transmiter based on innosilicon IP
> > Is innosilicon the same thing as verisilicon? Also
> > s/transmiter/transmitter/, both here and in the title.
> 
> I think that is not the same, I remember Rockchip has used a HDMI 
> transmitter from
> 
> Innosilicon, and there is a existing driver for that in mainline.

Yep, I think Innosilicon is the company you turn to when you want to save
a bit of money ;-) . In the bigger SoCs Rockchip most of the time uses
Designware hdmi blocks and looking at the history only the rk3036 ever
used an Innosilicon block.

Looking at the history, 2016 really was a long time ago :-D.


> So Keith, if that's true, I think it is better to seperate the HDMI 
> stuff and reuse existing driver.

I'm not so sure about that - at least from a cursory glance :-) .

The registers do look slightly different and I don't know how much
the IP changed between the rk3036-version and the jh7110 version.

At the very least, I know my rk3036 board isn't booting right now, so
I can't really provide help for generalizing the rockchip-driver.


At the very least both the binding and driver could drop the "starfive-hdmi"
and actually use the Innosilicon in the naming somewhere, so that it's
clear for future developers :-)


Heiko


> >> +  to generate HDMI signal from its input and transmit the signal to the screen.
> >> +
> >> +maintainers:
> >> +  - Keith Zhao <keith.zhao@starfivetech.com>
> >> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: starfive,hdmi
> > Is this going to work on every SoC that StarFive has ever & will ever
> > make? Please use soc-based compatibles ;)
> >
> >> +
> >> +  reg:
> >> +    minItems: 1
> >> +
> >> +  interrupts:
> >> +    items:
> >> +      - description: The HDMI hot plug detection interrupt.
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: System clock of HDMI module.
> >> +      - description: Mclk clock of HDMI audio.
> >> +      - description: Bclk clock of HDMI audio.
> >> +      - description: Pixel clock generated by HDMI module.
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: sysclk
> >> +      - const: mclk
> >> +      - const: bclk
> >> +      - const: pclk
> >> +
> >> +  resets:
> >> +    items:
> >> +      - description: Reset for HDMI module.
> >> +
> >> +  reset-names:
> >> +    items:
> >> +      - const: hdmi_tx
> > You only have one item here, you don't need the "items: - const:",
> > "const:" alone will do.
> >
> >
> >> diff --git a/Documentation/devicetree/bindings/display/verisilicon/verisilicon-dc.yaml b/Documentation/devicetree/bindings/display/verisilicon/verisilicon-dc.yaml
> >> new file mode 100644
> >> index 000000000000..1322502c4cde
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/verisilicon/verisilicon-dc.yaml
> >> @@ -0,0 +1,110 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/verisilicon/verisilicon-dc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: StarFive display controller
> >> +
> >> +description:
> >> +  The StarFive SoC uses the display controller based on Verisilicon IP
> >> +  to transfer the image data from a video memory
> >> +  buffer to an external LCD interface.
> > Is it based on Verisilicon IP, or is it exactly that verisilicon IP? I
> > ask because...
> >
> >> +maintainers:
> >> +  - Keith Zhao <keith.zhao@starfivetech.com>
> >> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: verisilicon,dc8200
> > ...the compatible is the verisilicon IP. I would be a lot happier if
> > the compatibles were set yp for something like:
> > "starfive,jh7110-foo", "verisilicon,dc8200"
> >
> >> diff --git a/Documentation/devicetree/bindings/display/verisilicon/verisilicon-drm.yaml b/Documentation/devicetree/bindings/display/verisilicon/verisilicon-drm.yaml
> >> new file mode 100644
> >> index 000000000000..aed8d4af2c55
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/verisilicon/verisilicon-drm.yaml
> >> @@ -0,0 +1,42 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/verisilicon/verisilicon-drm.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Verisilicon DRM master device
> >> +
> >> +maintainers:
> >> +  - Keith Zhao <keith.zhao@starfivetech.com>
> >> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> >> +
> >> +description: |
> >> +  The Verisilicon DRM master device is a virtual device needed to list all
> >> +  display controller or other display interface nodes that comprise the
> >> +  graphics subsystem.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: verisilicon,display-subsystem
> > Same here.
> >
> >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> index 82d39ab0231b..52c04fd098be 100644
> >> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> @@ -1436,6 +1436,8 @@ patternProperties:
> >>       description: Variscite Ltd.
> >>     "^vdl,.*":
> >>       description: Van der Laan b.v.
> >> +  "^verisilicon,.*":
> >> +    description: Verisilicon Technologies, Inc.
> > This should be in it's own patch.
> >
> > Cheers,
> > Conor.
> >
> >>     "^vertexcom,.*":
> >>       description: Vertexcom Technologies, Inc.
> >>     "^via,.*":
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 2a0496448b7f..293aa13d484c 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -7049,6 +7049,13 @@ F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
> >>   F:	drivers/gpu/drm/vc4/
> >>   F:	include/uapi/drm/vc4_drm.h
> >>   
> >> +DRM DRIVERS FOR VERISILICON
> >> +M:	Keith Zhao <keith.zhao@starfivetech.com>
> >> +L:	dri-devel@lists.freedesktop.org
> >> +S:	Maintained
> >> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> >> +F:	Documentation/devicetree/bindings/display/verisilicon/
> >> +
> >>   DRM DRIVERS FOR VIVANTE GPU IP
> >>   M:	Lucas Stach <l.stach@pengutronix.de>
> >>   R:	Russell King <linux+etnaviv@armlinux.org.uk>
> >> -- 
> >> 2.34.1
> >>
> 




