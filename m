Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA0CCDB8C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 22:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F292810E86C;
	Thu, 18 Dec 2025 21:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE7A10E86C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 21:41:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vWLk8-0004dr-Cf; Thu, 18 Dec 2025 22:41:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vWLk6-006Lsm-1S;
 Thu, 18 Dec 2025 22:41:02 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vWLk6-00EfK3-0v;
 Thu, 18 Dec 2025 22:41:02 +0100
Date: Thu, 18 Dec 2025 22:41:02 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, krzk+dt@kernel.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20251218214102.zfv35d2fryz333gl@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
 <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
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

On 25-12-18, Krzysztof Kozlowski wrote:
> On 15/12/2025 17:17, Marco Felsch wrote:
> > Hi Liu,
> > 
> > On 25-12-08, Liu Ying wrote:
> >> Hi Marco,
> >>
> >> On 12/02/2025, Marco Felsch wrote:
> >>> From: Liu Ying <victor.liu@nxp.com>
> >>>
> >>> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> >>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> >>> field. Document the Parallel Display Format Configuration(PDFC) subnode
> >>> and add the subnode to example.
> >>>
> >>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>> [m.felsch@pengutronix.de: port to v6.18-rc1]
> >>> [m.felsch@pengutronix.de: add bus-width]
> >>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> ---
> >>>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
> >>>  1 file changed, 92 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> >>> index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> >>> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> >>> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> >>> @@ -26,6 +26,12 @@ properties:
> >>>    reg:
> >>>      maxItems: 1
> >>>  
> >>> +  '#address-cells':
> >>> +    const: 1
> >>> +
> >>> +  '#size-cells':
> >>> +    const: 1
> >>> +
> >>>    '#power-domain-cells':
> >>>      const: 1
> >>>  
> >>> @@ -40,6 +46,60 @@ properties:
> >>>      minItems: 8
> >>>      maxItems: 10
> >>>  
> >>> +  bridge@60:
> >>
> >> The dependency patch series mentioned in cover letter has two links in it's
> >> cover letter.  Reading the patch sets pointed by the two links, we may find
> >> Krzysztof's comments - the child nodes of the blk-ctrl should be completely
> >> documented.
> > 
> > Thanks for pointing this out.
> > 
> > @Krzysztof
> > Requesting to add everything seems not feasible if everything added
> > should be tested too.
> > I don't see why everything should be added in one step, since the base
> > .dtsi isn't added in one step too.
> 
> Because otherwise we do not see entire picture and people post incorrect
> bindings, claiming they are complete picture, like messing nodes with
> addressing and nodes without. So sure, if you do not want to post
> complete picture, we cannot review that complete picture, therefore YOU
> MUST POST CORRECT CODE.

It's not that we don't want to post the complete code, it's rather that
we don't have the projects to cover the complete MEDIA_MIX blk-ctrl.
Albeit it's a very simple IP with just a few (25) registers, all of them
do have a complete different purpose:

- control the AXI QoS and IP Cache
- control the bus NIC settings
- control the camera parallel-input setup
- control the LVDS bridge (LDB) setup
- control the parallel-output (DPI) setup + the MIPI DSI input setup
- control the MIPI DSI PLL Setup

> I will not be taking excuses later "we did not know that such code is
> not allowed". You must know all rules.

I get your point and there are only two options IMHO:
 1st) Step-by-step
 2nd) Big-Bang

Step-by-step:
------------
+ Mainline support as fast as possible for each component
+/- Contributors must be trusted that everything is communicated openly
- Unforeseen issues which may require DT adaptions

Big-Bang
--------
+ Everything bindings + code can be checked by the maintainers
+/- Less trust required, since everything is added but still min. trust
    required
- Unforeseen issues which may require DT adaptions
- No mainline support at all or very late

I can only speak for myself, I don't want to hide anything from you or
other maintainers. But I can't guarantee that everything is 100% correct
and bug-free. I'm quite sure that no one can make such promises.
E.g. I didn't test the simultaneous DPI + DSI + LVDS output. It would be
part of this patchset, if I would have tested this.

Regards,
  Marco

> Best regards,
> Krzysztof
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
