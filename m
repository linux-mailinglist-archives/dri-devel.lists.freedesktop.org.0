Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C67CCD565
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3970510EA88;
	Thu, 18 Dec 2025 19:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A2F10EA88
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:08:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vWJMh-0008WQ-7c; Thu, 18 Dec 2025 20:08:43 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vWJMf-006Kvz-12;
 Thu, 18 Dec 2025 20:08:41 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vWJMf-00Ee3k-0T;
 Thu, 18 Dec 2025 20:08:41 +0100
Date: Thu, 18 Dec 2025 20:08:41 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20251218190841.pmn3kwghq6lxsfl4@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215175436.wwlgzxionq55zu27@pengutronix.de>
 <3210190.mvXUDI8C0e@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3210190.mvXUDI8C0e@steina-w>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Alexander,

On 25-12-16, Alexander Stein wrote:
> Hi,
> 
> Am Montag, 15. Dezember 2025, 18:54:36 CET schrieb Marco Felsch:
> > Hi Liu,
> > 
> > sorry I didn't fully answer you please see below.
> > 
> > On 25-12-08, Liu Ying wrote:
> > > Hi Marco,
> > > 
> > > On 12/02/2025, Marco Felsch wrote:
> > > > From: Liu Ying <victor.liu@nxp.com>
> > > > 
> > > > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > > > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > > > field. Document the Parallel Display Format Configuration(PDFC) subnode
> > > > and add the subnode to example.
> > > > 
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > > > [m.felsch@pengutronix.de: add bus-width]
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
> > > >  1 file changed, 92 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > > > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> > > > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > > > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > > > @@ -26,6 +26,12 @@ properties:
> > > >    reg:
> > > >      maxItems: 1
> > 
> > ...
> > 
> > > > +            properties:
> > > > +              endpoint:
> > > > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > +                unevaluatedProperties: false
> > > > +
> > > > +                properties:
> > > > +                  bus-width:
> > > 
> > > In v1-v5, I thought the output bus format can be determined by the sink
> > > device(a panel or a bridge) hence properties like bus-width were not needed.
> > > But, if this property is really needed, then reference video-interfaces.yaml
> > > since bus-width is documented there.  Should we reference bus-type defined
> > > in video-interfaces.yaml too?
> > 
> > You're right, the bus-width should be determined by the connected panel.
> > But there are cases where a 24-bit panel is connected but only the lower
> > 18-bits are muxed. I added the bus-width property to handle this case.
> > In the end most users don't have to specify this since the correct
> > bus-width is coming from the panel bus-fmt.
> > 
> > > > +                    enum: [ 16, 18, 24 ]
> > > 
> > > The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP supports
> > > below formats.  It seems that the enum here may tell RGB888, RGB666 and RGB565.
> > > How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> > > 
> > > 000b RGB888 -> RGB888
> > > 001b RGB888 -> RGB666
> > > 010b RGB565 -> RGB565
> > > 011b RGB555 -> RGB555
> > > 100b YUV -> YCbCr 24 bits
> > > 101b YUV -> YUV444
> > 
> > This enum is about the physical bus width. RGB565 == 16-bit, YUV ==
> > 24-bit.
> > 
> > That said, I don't think that you need to specify the bus-fmt since this
> > is coming from the panel. As said above, my itension with the bus-width
> > property is to provide integrators (dts-writers) a possibility to limit
> > the physical available bus width.
> 
> Mh, isn't [1] exactly about this? Not sure about the outcome at that time.

Thanks for the pointer, I wasn't aware of this discussion. I skimmed
through the dt-bindings thread and I agree with Rob and Maxime.

We do have the bus-width endpoint property already. This property is
alredy used by media and drm bridge drivers. Why not making use of for
this simple bridge driver too?

Furthermore I doubt, that a simple drm-bridge MEDIA_BUS_FMT_* convert
driver solves all the problem in a generic way for all platforms, all
connectors, all routing options.

If the i.MX93 NXP-EVKs in [1] would have connected the upper LCD_DAT*
pads instead of the lower ones, there would be no conversion needed by
the PDFC bridge driver, albeit the physical bus is cut to 18-bit width
due to the RPi ext. header limit, which is expanded to 24-bit again later on
via the Adafruit board panel FPC connector.

In such scenario the output width of the PDFC has to be 24-bit else
you would lose not only the two LSBs but also the two MSBs for each
channel. I tried to visualize what I meant for the blue channel:

                 24-bit PDFC bridge
		 ------------------
        +----+----+----+----+----+----+----+----+
 LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
        +----+----+----+----+----+----+----+----+
          |    |    |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
 PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
        +----+----+----+----+----+----+----+----+
                    |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
        +----+----+----+----+----+----+----+----+
                    |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
 ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
 HDR    +----+----+----+----+----+----+----+----+
                    |    |    |    |    |    |
                    |    |    |    |    |    |
                    |    |    |    |    |    |
          +-----------------------------+    |
          |    +-----------------------------+
          |    |    |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
 Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
 FPC    +----+----+----+----+----+----+----+----+

                 18-bit PDFC bridge
		 ------------------
        +----+----+----+----+----+----+----+----+
 LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
        +----+----+----+----+----+----+----+----+
          |    |    |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
 PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
        +----+----+----+----+----+----+----+----+
                    |    |    |    |    |    |
          +---------+    |    |    |    |    |
          |    +---------+    |    |    |    |
          |    |    +---------+    |    |    |
          |    |    |    +---------+    |    |
          |    |    |    |    +---------+    |
          |    |    |    |    |    +---------+
          |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
        +----+----+----+----+----+----+----+----+
                    |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
 ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
 HDR    +----+----+----+----+----+----+----+----+
                    |    |    |    |    |    |
                    |    |    |    |    |    |
                    |    |    |    |    |    |
          +-----------------------------+    |
          |    +-----------------------------+
          |    |    |    |    |    |    |    |
        +----+----+----+----+----+----+----+----+
 Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
 FPC    +----+----+----+----+----+----+----+----+


The mapping can get quite difficult for a single SoC already, just by
using a slighlty different HW routing (the upper D[ata] pads).

Therefore I would keep it simple and device/ip specific (in this case
PDFC specific) by making use of the bus-width. Specifying the bus-width
property could be also wrong albeit it's the case physically, as you can
see in my above example.

Therefore the bus-width property must have a good description.

Regards,
  Marco

> Best regards,
> Alexander
> 
> [1] https://lore.kernel.org/all/20250304101530.969920-1-victor.liu@nxp.com/
> 
> > [snip]
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/



-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
