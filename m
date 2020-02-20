Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5151666EE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 20:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8E6E227;
	Thu, 20 Feb 2020 19:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185286EDDD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 19:14:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB488563;
 Thu, 20 Feb 2020 20:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582226039;
 bh=gZwjMsgBdJ7cjOIuVKbX6JBxZRJ2zvDLN5OL1pMq0pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=czF5MdgufJzCiszRL1sU1Ozt2MmetdJqtVdmjRVXR0QP+c3m3hi1POi7GG0BlvFEA
 9JtwgcdNWL69VLGeJ0/evIOOnR7Ia8YaYQed97bbT5WrnBJct73C/UF3tRj4Kr03js
 xNn2/BXtmr5Moc6jHPkuH/iaz62vo9Xjt5FvoKqU=
Date: Thu, 20 Feb 2020 21:13:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200220191339.GJ4998@pendragon.ideasonboard.com>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
 <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
 <20200214154953.GJ4831@pendragon.ideasonboard.com>
 <20200217174253.mj53us4bb7h2lyca@gilmour.lan>
 <20200217181006.GE4830@pendragon.ideasonboard.com>
 <20200220175307.qool442lm7qjqb5h@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220175307.qool442lm7qjqb5h@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Thu, Feb 20, 2020 at 06:53:07PM +0100, Maxime Ripard wrote:
> On Mon, Feb 17, 2020 at 08:10:06PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 17, 2020 at 06:42:53PM +0100, Maxime Ripard wrote:
> >> On Fri, Feb 14, 2020 at 05:49:53PM +0200, Laurent Pinchart wrote:
> >>> On Fri, Feb 14, 2020 at 04:44:05PM +0100, Maxime Ripard wrote:
> >>>> On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> >>>>> On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> >>>>>> SoCs that have multiple TCONs can use the two set of pins on the first TCON
> >>>>>> to drive a dual-link display. Add a property to enable the dual link.
> >>>>>>
> >>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>> ---
> >>>>>>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> >>>>>>  1 file changed, 7 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> >>>>>> index 86ad617d2327..aa6dd8409dbc 100644
> >>>>>> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> >>>>>> @@ -105,6 +105,13 @@ properties:
> >>>>>>          - const: edp
> >>>>>>          - const: lvds
> >>>>>>
> >>>>>> +  allwinner,lvds-dual-link:
> >>>>>> +    type: boolean
> >>>>>> +    description: |
> >>>>>> +      On a SoC with two TCON with LVDS support, the first TCON can
> >>>>>> +      operate over both pins sets to output in a dual-link setup. This
> >>>>>> +      will be triggered by setting this property.
> >>>>>
> >>>>> Could you maybe provide an example of how this property is supposed to
> >>>>> be used ? I'm especially wondering what ports are used in that case and
> >>>>> how they're connected.
> >>>>
> >>>> It's pretty trivial to support, it's only a property to set on the
> >>>> encoder node itself.
> >>>>
> >>>> I'm not really sure what you meant by your question with the ports
> >>>> though :/
> >>>
> >>> I assume that, in the single-link case, you have two TCON instances that
> >>> operate independently, each of them with one port that models an LVDS
> >>> connection to a panel.
> >>
> >> Indeed,
> >>
> >>> In the dual-link mode, how does that look like ? Does the TCON
> >>> instance that operate in dual-link mode have two ports in DT ? There
> >>> are two physical ports, so I think it makes sense to always have two
> >>> ports in DT. That's what we're doing for the LVDS encoders on R-Car
> >>> Gen3, in order to specify in DT which LVDS input of the dual-link
> >>> panel is connected to which LVDS output of the SoC. That allows
> >>> configuring the LVDS encoder to send the even and odd pixels on the
> >>> right port.
> >>
> >> As far as I can tell, you can't control that in our TCON. It just on
> >> more lanes, that's it. Also, we currently have multiple ports, to map
> >> another feature of the TCON, which is that it can drive directly a
> >> panel, or will send its output to the HDMI / TV encoders. Adding
> >> another port in that will break the current binding we have.
> >
> > This will create one issue though, in that the dual-link sinks are
> > supposed to have two input ports, in order to expose the odd and even
> > pixels ordering. If you have a single ouput port in your TCON, how will
> > you interface with such sinks ?
> 
> I guess we could create multiple endpoints in the same port? That's
> not going to be trivial either though given the current binding we
> have :/

That's however not really how endpoints are supposed to be used.

Let's try to find a solution. Could you show me a DT example that
explains why having two ports would create backward-compatibility issues
?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
