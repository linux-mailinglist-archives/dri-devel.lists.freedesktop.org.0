Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2B4333AA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 12:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E466EB8C;
	Tue, 19 Oct 2021 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B455B6EB82
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 10:37:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75AD58AE;
 Tue, 19 Oct 2021 12:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634639875;
 bh=8JWvYP7ZXVX/kiNPwYH3OHqA/Dchd8D3VcR7gzCGxug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZdUhWVXrY7JUp50m8IW066ZGCBuCbfbCtZAnL4r6Q70Csc173wfQ5Qrg7Y/3YVVZG
 qT5r7Oz/u7TPihqG8iqnMSA2JAKe8DeJF+znP9xJv8vbX4l7EdxQmPrOptCGQjLMFh
 wO2G6XqZSuJFSgadNgihDBOYDudmBPZF08Kfs5+8=
Date: Tue, 19 Oct 2021 13:37:37 +0300
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
Message-ID: <YW6f8U2BC/6WQoVx@pendragon.ideasonboard.com>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
 <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
 <20211013074722.7y7ug3eri4euknza@gilmour>
 <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
 <20211014074110.ym6mzugde2m5ak22@gilmour>
 <YWo6U1juhMsHnQYU@pendragon.ideasonboard.com>
 <20211018152013.e3kmbm2lszb652gi@gilmour>
 <YW2zhFX9krzbHlpL@pendragon.ideasonboard.com>
 <20211019073728.7a3rmp3fz62rxh6w@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211019073728.7a3rmp3fz62rxh6w@gilmour>
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

On Tue, Oct 19, 2021 at 09:37:28AM +0200, Maxime Ripard wrote:
> On Mon, Oct 18, 2021 at 08:48:52PM +0300, Laurent Pinchart wrote:
> > On Mon, Oct 18, 2021 at 05:20:13PM +0200, Maxime Ripard wrote:
> > > On Sat, Oct 16, 2021 at 05:34:59AM +0300, Laurent Pinchart wrote:
> > > > On Thu, Oct 14, 2021 at 09:41:10AM +0200, Maxime Ripard wrote:
> > > > > On Wed, Oct 13, 2021 at 12:37:47PM +0300, Laurent Pinchart wrote:
> > > > > > On Wed, Oct 13, 2021 at 09:47:22AM +0200, Maxime Ripard wrote:
> > > > > > > On Tue, Oct 12, 2021 at 08:48:42AM +0200, Alexander Stein wrote:
> > > > > > > > Add a VCC regulator which needs to be enabled before the EN pin is
> > > > > > > > released.
> > > > > > > > 
> > > > > > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5 +++++
> > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > > > > index a5779bf17849..49ace6f312d5 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > > > > > > > @@ -32,6 +32,9 @@ properties:
> > > > > > > >      maxItems: 1
> > > > > > > >      description: GPIO specifier for bridge_en pin (active high).
> > > > > > > >  
> > > > > > > > +  vcc-supply:
> > > > > > > > +    description: A 1.8V power supply (see regulator/regulator.yaml).
> > > > > > > > +
> > > > > > > >    ports:
> > > > > > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > >  
> > > > > > > > @@ -93,6 +96,7 @@ properties:
> > > > > > > >  required:
> > > > > > > >    - compatible
> > > > > > > >    - reg
> > > > > > > > +  - vcc-supply
> > > > > > > 
> > > > > > > This isn't a backward-compatible change. All the previous users of that
> > > > > > > binding will now require a vcc-supply property even though it was
> > > > > > > working fine for them before.
> > > > > > > 
> > > > > > > You handle that nicely in the code, but you can't make that new property
> > > > > > > required.
> > > > > > 
> > > > > > We can't make it required in the driver, but can't we make it required
> > > > > > in the bindings ? This indicates that all new DTs need to set the
> > > > > > property. We also need to mass-patch the in-tree DTs to avoid validation
> > > > > > failures, but apart from that, I don't see any issue.
> > > > > 
> > > > > I guess we'd need to clarify what the schemas are here for.
> > > > > 
> > > > > We've been using them for two things: define the bindings, and make
> > > > > sure that the users of a binding actually follow it.
> > > > > 
> > > > > The second part makes it very tempting to also cram "and make sure they
> > > > > follow our best practices" in there. We never had the discussion about
> > > > > whether that's ok or not, and I think the schemas syntax falls a bit
> > > > > short there since I don't think we can make the difference between a
> > > > > warning and an error that would make it work.
> > > > > 
> > > > > However, if we're talking about the binding itself, then no, you can't
> > > > > introduce a new property.
> > > > 
> > > > I assume you mean "a new required property" here.
> > > > 
> > > > > Since it was acceptable in the past, it still needs to be acceptable
> > > > > going forward.
> > > > 
> > > > I think that's a matter of definition. The way I see it (but I could be
> > > > mistaken), we're essentially versioning DT bindings without actually
> > > > saying so, with the latest version being the visible one, and drivers
> > > > having to preserve backward compatibility with new versions. We could
> > > > also see it in different ways of course.
> > > 
> > > I disagree. A binding is essentially a contract on how the OS is
> > > supposed to interpret whatever comes from the DT. If we do what you
> > > suggest, then we lose all documentation of older versions we still need
> > > to support at the OS level. And relying on all developers to look
> > > through the entire history to figure it out is a sure way to screw
> > > things up :)
> > > 
> > > The use of deprecated indicates that we actually want to document the
> > > old versions.
> > > 
> > > > What's important is in my opinion to make sure that new DTs will do
> > > > the right thing, and if we don't make this property required, we can't
> > > > check that. DT authors wouldn't know if the property is optional due
> > > > to backward compatibility only but highly recommended, or really
> > > > optional.
> > > 
> > > Add a comment saying that this should really be added, but we can't
> > > because it was missing it was in the original binding?
> > 
> > That will not help validating that new DTs are compliant with the last
> > version of the bindings.
> > 
> > We have one tool, and two needs. The tool should be extended to cover
> > both, but today it can only support one. Which of these two is the most
> > important:
> > 
> > - Documentating old behaviour, to helper driver authors on other
> >   operating systems implement backward compatibility without having to
> >   look at the history ?
> > 
> > - Validating all new device trees to ensure they implement the latest
> >   recommended version of the bindings ?
> > 
> > I think the second one is much more frequent, and is also where most of
> > the issues will arise.
> 
> I understand the drive for the latter, but we shouldn't be dropping the
> former in the process, which has been what we've been doing for the last
> decade or so.

That point is debatable :-) I've repeatedly asked during review of DT
bindings for new properties to be made required, based on the above
rationale. This is the first time I see a push back.

I believe we need to address both of the above problems. In the very
short term, we have to pick which of the two we care about most, as we
can't have both yet. I have made my personal preference clear, but I'll
apply the official decision in further reviews. Maybe Rob could share
his point of view ?

-- 
Regards,

Laurent Pinchart
