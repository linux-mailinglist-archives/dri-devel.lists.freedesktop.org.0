Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAC6538CE2
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 10:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0CC10F7B7;
	Tue, 31 May 2022 08:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4494010F7EB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 08:29:20 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvxFY-0001zF-6i; Tue, 31 May 2022 10:29:12 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvxFV-0003F0-IZ; Tue, 31 May 2022 10:29:09 +0200
Date: Tue, 31 May 2022 10:29:09 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: (EXT) [PATCH 5/6] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 reset controller documentation
Message-ID: <20220531082909.hyr4zjalm3fu5ng6@pengutronix.de>
References: <20220530150548.1236307-1-m.felsch@pengutronix.de>
 <20220530150548.1236307-6-m.felsch@pengutronix.de>
 <5789362.MhkbZ0Pkbq@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5789362.MhkbZ0Pkbq@steina-w>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

On 22-05-31, Alexander Stein wrote:
> Hi Marco,
> 
> Am Montag, 30. Mai 2022, 17:05:48 CEST schrieb Marco Felsch:
> > The bridge device can now also be enabled/disabled by an external reset
> > controller. So the device now supports either enable/disable by simple
> > GPIO or by an Reset-Controller.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml    | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml index
> > 7306b9874dc3..eff8360c184e 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > @@ -35,6 +35,12 @@ properties:
> >    vcc-supply:
> >      description: A 1.8V power supply (see regulator/regulator.yaml).
> > 
> > +  resets:
> > +    maxItems: 1
> > +    description: |
> > +      Reset specifier for bridge_en pin. This is required only if the
> > brdige_en +      pin is connected to a reset controller.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> 
> Maybe it should be added here, that 'resets' is an alternative to 'enable-
> gpios' as both are essentially controlling the same pin from the bridge.

I mention the bridge_en pin two times :) But I could also add that this
is an alternative to the enable-gpios. Maybe it even more clear than.

Regards,
  Marco

> 
> Best regards
> Alexander
> 
> 
> 
