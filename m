Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4F42BBC8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 11:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BF089A16;
	Wed, 13 Oct 2021 09:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181AA89A16
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 09:38:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85ABF291;
 Wed, 13 Oct 2021 11:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634117881;
 bh=HD/eg9/BLQa2IhZm34NN/3Op2QH9skwkY5+JYv60cuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sr4wXtE9ZExL0sB6+JNnjr4BVGpKVY+yWegOX08vOqX9cEmFokKVM5VZRZzuMyjHY
 I8xeocDSwB3ItqzjDOlWfnrfcMfSUF0ZMaXzBX13aFlJ7RPA5t5LDLn80S9W766qoj
 +ogMzwXRG8Qm5HEBFkpX/I/gMNMjp2M55dtTDgQE=
Date: Wed, 13 Oct 2021 12:37:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
Message-ID: <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
 <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
 <20211013074722.7y7ug3eri4euknza@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211013074722.7y7ug3eri4euknza@gilmour>
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

Hi Maxime,

On Wed, Oct 13, 2021 at 09:47:22AM +0200, Maxime Ripard wrote:
> On Tue, Oct 12, 2021 at 08:48:42AM +0200, Alexander Stein wrote:
> > Add a VCC regulator which needs to be enabled before the EN pin is
> > released.
> > 
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > index a5779bf17849..49ace6f312d5 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > @@ -32,6 +32,9 @@ properties:
> >      maxItems: 1
> >      description: GPIO specifier for bridge_en pin (active high).
> >  
> > +  vcc-supply:
> > +    description: A 1.8V power supply (see regulator/regulator.yaml).
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >  
> > @@ -93,6 +96,7 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - vcc-supply
> 
> This isn't a backward-compatible change. All the previous users of that
> binding will now require a vcc-supply property even though it was
> working fine for them before.
> 
> You handle that nicely in the code, but you can't make that new property
> required.

We can't make it required in the driver, but can't we make it required
in the bindings ? This indicates that all new DTs need to set the
property. We also need to mass-patch the in-tree DTs to avoid validation
failures, but apart from that, I don't see any issue.

-- 
Regards,

Laurent Pinchart
