Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB075887B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A26510E06C;
	Tue, 18 Jul 2023 22:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BE710E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:32:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D649B61295;
 Tue, 18 Jul 2023 22:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF9EC433C8;
 Tue, 18 Jul 2023 22:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689719531;
 bh=O6WDxFarxzHsWtcIh7tAFZFJohqmPwl+2uLrWAbTkBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uZ9IhU2P1QscJgFfyrWZ2Pemc/kHO9AbjmtoTqkwYlnB/Hck6dQJ3jxnLJVb38mRl
 E8Ori/IBM/qzm9WmyQHqgdReymv7APVImm7ChCane99DXjje1nJhSrYKHFbv4Lyxco
 VwCgfG6f0saZnuK+lMAW8KTvPdtCQfLEbEGL0nNhC/K/qKqV7zkmiAMyG6dUoJMx3s
 Ywjml24/MfulgTeMbg8eVighkKRzYJF7XA1GTH7jau1uLAwJqmp+EYhm570SLbOkDT
 38QEGVgLyKCCDi32Fl4Jpdhy1lnBxbwVJusytJv/6jEK2Y83GczKAgMumcQvt7aUj0
 3JYU2D01TtNug==
Received: (nullmailer pid 2130228 invoked by uid 1000);
 Tue, 18 Jul 2023 22:32:08 -0000
Date: Tue, 18 Jul 2023 16:32:08 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <sandor.yu@nxp.com>
Subject: Re: [EXT] Re: [PATCH v7 3/7] dt-bindings: display: bridge: Add
 Cadence MHDP850
Message-ID: <20230718223208.GA2112396-robh@kernel.org>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
 <3646ea4d279838c78e00af1d746e3de34351b083.1689580812.git.Sandor.yu@nxp.com>
 <5693162.DvuYhMxLoT@steina-w>
 <PAXPR04MB94483425E2BC17597B7E555AF438A@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB94483425E2BC17597B7E555AF438A@PAXPR04MB9448.eurprd04.prod.outlook.com>
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ker
 nel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 01:58:09AM +0000, Sandor Yu wrote:
> Hi Alexander,
> 
> Thanks for your comments,
> 
> >
> > Am Montag, 17. Juli 2023, 10:03:49 CEST schrieb Sandor Yu:
> > > ********************
> > > Achtung externe E-Mail: Öffnen Sie Anhänge und Links nur, wenn Sie
> > > wissen, dass diese aus einer sicheren Quelle stammen und sicher sind.
> > > Leiten Sie die E-Mail im Zweifelsfall zur Prüfung an den IT-Helpdesk weiter.
> > > Attention external email: Open attachments and links only if you know
> > > that they are from a secure source and are safe. In doubt forward the
> > > email to the IT-Helpdesk to check it. ********************
> > >
> > > Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge..
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > ---
> > >  .../display/bridge/cdns,mhdp8501.yaml         | 105
> > ++++++++++++++++++
> > >  1 file changed, 105 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > > new file mode 100644 index 000000000000..b983ee765f54
> > > --- /dev/null
> > > +++
> > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.y
> > > +++ aml
> > > @@ -0,0 +1,105 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devi/
> > >
> > +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fcdns%2Cmhdp8501.yaml%
> > 23&dat
> > >
> > +a=05%7C01%7CSandor.yu%40nxp.com%7C603a90f3f3c34d32a1e708db86a
> > 8f868%7C
> > >
> > +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63825183250590544
> > 2%7CUnkno
> > >
> > +wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1
> > haWwi
> > >
> > +LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=JnbufeZplo%2B6JGW4HaK
> > %2BLyC0MESK
> > > +GsV%2FtjfeXCXqK4U%3D&reserved=0
> > > +$schema:
> > > +http://devi/
> > >
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=05%7C01%7CSandor.
> > yu%40n
> > >
> > +xp.com%7C603a90f3f3c34d32a1e708db86a8f868%7C686ea1d3bc2b4c6fa9
> > 2cd99c5
> > >
> > +c301635%7C0%7C0%7C638251832505905442%7CUnknown%7CTWFpbGZs
> > b3d8eyJWIjoi
> > >
> > +MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> > 000%7C%
> > >
> > +7C%7C&sdata=rdOyjVz4gGnToVC40Rcfp%2Fk925yC%2F6xNwGbBAnOtcDQ
> > %3D&reserv
> > > +ed=0
> > > +
> > > +title: Cadence MHDP8501 DP/HDMI bridge
> > > +
> > > +maintainers:
> > > +  - Sandor Yu <Sandor.yu@nxp.com>
> > > +
> > > +description:
> > > +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - cdns,mhdp8501
> > > +      - fsl,imx8mq-mhdp8501
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +    description: MHDP8501 DP/HDMI APB clock.
> > > +
> > > +  phys:
> > > +    maxItems: 1
> > > +    description:
> > > +      phandle to the DisplayPort or HDMI PHY
> > > +
> > > +  interrupts:
> > > +    items:
> > > +      - description: Hotplug cable plugin.
> > > +      - description: Hotplug cable plugout.
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: plug_in
> > > +      - const: plug_out
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          Input port from display controller output.
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          Output port to DisplayPort or HDMI connector.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - interrupts
> > > +  - interrupt-names
> > > +  - phys
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/imx8mq-clock.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    mhdp_dp: dp-bridge@32c00000 {
> >
> > I'm not sure, but I would name this node just 'bridge', because it can be either
> > DP or HDMI depending on the connector. But DT folks will know better than
> > me.
> This name should update too after DP and HDMI driver combined.

Has nothing to do with a driver.

> I will change to "mhdp: mhdp-bridge@32c00000" in the next version.

What is 'mhdp'? Doesn't sound generic. Use just 'bridge' or 
'display-bridge'. We don't have a standard name defined in the DT spec 
(there's 'hdmi', but nothing that's protocol independent).

Rob
