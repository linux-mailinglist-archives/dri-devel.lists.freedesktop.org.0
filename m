Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4DE167BB4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3BC6F413;
	Fri, 21 Feb 2020 11:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C8B6EE1E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 17:53:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6AF3F45C6;
 Thu, 20 Feb 2020 12:53:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/ilAHo2sD8DPbarnR+eiZM1rIcY
 n1q22Nc/a+Tg05HI=; b=f1hD521jZfmjXhb2Ix5sj5gSKqUVPAXbw6V3y9kE6to
 Cll7dmh1ytx1gz0v7/WzNRkO017HHxEVzRsEfZYA36oZWZ9toV3BM/IW2c5nah9B
 1WCwYv2NVPAqppW5jUf3IAiX61sG0O4PTWthwM/vEsZAy6FT4JCUb9y/x+tVaLaG
 m44s7f5lD10J/Jpw0zSIiaypESbdgai2wam5PUGGo67kBVdY7Vcdvp2i0opakcCe
 FIKrdBRtMs6kBBm/ZOlOUZefss7+jVUzBrGzpDzbWHAK30uudPdUeh1PD+qYfS2S
 tlIpYlLjfroJrQcomnBnmLa83nQ4+tu09px9McT3BQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/ilAHo
 2sD8DPbarnR+eiZM1rIcYn1q22Nc/a+Tg05HI=; b=AgvqZ90LDH3mg6xf3AmP0+
 8lLwrAeegt4SKMn8A9U5nzO399hyVW11EKkH1o0+cMXq1hWPHEQ16kW/VNFhWFOZ
 wYwfEDJnszpJDMOfr09xeV4PKlpQ2z0X1jsfMG4aohU/gV5ORABH9wiMnoPX4ZiM
 lDgJ9zZdXmv/wIPHDOMwkurMPHQmtfU7TvzemD/65KJs+7ZtRXGp+UkjbnxzwQg2
 EFWkjx53S5gNm+pgmSnYRhFO2TAMGAPW3QBwJV6/+HUWm4FBBcA2/A+q6egp0Y+r
 y8XzF1e8cyQshaRYFQmgayC16/yG33jLyGj/SJH9+NVkiLlMUXOqoVDr33ePFdiw
 ==
X-ME-Sender: <xms:hcdOXrHALdbQKHZDF-p5-V8U6h6NgOsgZV7Wlr5no_8FOvCfK5aSlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hcdOXsmtwDvPaLgeLEHxx2j4cLwJjScGaARsUg-I99Jqz_bs0ve5fw>
 <xmx:hcdOXguIyRKNu6lVir6e10c7mhQS-VgW-Alp2MxTtX_o-8p7Eg6heg>
 <xmx:hcdOXoPfWFzbyApop1EhhdLZpJ6CPfeQ3lfOKDQzHO90pEWhXT9g1Q>
 <xmx:h8dOXkkOITkjN6nbD5jPx4U_IsLY2jD4xnSKGOWk05WsgkQcD2MHMw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 90EBE3280059;
 Thu, 20 Feb 2020 12:53:09 -0500 (EST)
Date: Thu, 20 Feb 2020 18:53:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200220175307.qool442lm7qjqb5h@gilmour.lan>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
 <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
 <20200214154953.GJ4831@pendragon.ideasonboard.com>
 <20200217174253.mj53us4bb7h2lyca@gilmour.lan>
 <20200217181006.GE4830@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200217181006.GE4830@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Content-Type: multipart/mixed; boundary="===============0337083002=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0337083002==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o5bnojo4ldqgcpzr"
Content-Disposition: inline


--o5bnojo4ldqgcpzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 08:10:06PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>
> On Mon, Feb 17, 2020 at 06:42:53PM +0100, Maxime Ripard wrote:
> > On Fri, Feb 14, 2020 at 05:49:53PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 14, 2020 at 04:44:05PM +0100, Maxime Ripard wrote:
> > > > On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> > > > > On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> > > > > > SoCs that have multiple TCONs can use the two set of pins on the first TCON
> > > > > > to drive a dual-link display. Add a property to enable the dual link.
> > > > > >
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > ---
> > > > > >  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > > > index 86ad617d2327..aa6dd8409dbc 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > > > @@ -105,6 +105,13 @@ properties:
> > > > > >          - const: edp
> > > > > >          - const: lvds
> > > > > >
> > > > > > +  allwinner,lvds-dual-link:
> > > > > > +    type: boolean
> > > > > > +    description: |
> > > > > > +      On a SoC with two TCON with LVDS support, the first TCON can
> > > > > > +      operate over both pins sets to output in a dual-link setup. This
> > > > > > +      will be triggered by setting this property.
> > > > >
> > > > > Could you maybe provide an example of how this property is supposed to
> > > > > be used ? I'm especially wondering what ports are used in that case and
> > > > > how they're connected.
> > > >
> > > > It's pretty trivial to support, it's only a property to set on the
> > > > encoder node itself.
> > > >
> > > > I'm not really sure what you meant by your question with the ports
> > > > though :/
> > >
> > > I assume that, in the single-link case, you have two TCON instances that
> > > operate independently, each of them with one port that models an LVDS
> > > connection to a panel.
> >
> > Indeed,
> >
> > > In the dual-link mode, how does that look like ? Does the TCON
> > > instance that operate in dual-link mode have two ports in DT ? There
> > > are two physical ports, so I think it makes sense to always have two
> > > ports in DT. That's what we're doing for the LVDS encoders on R-Car
> > > Gen3, in order to specify in DT which LVDS input of the dual-link
> > > panel is connected to which LVDS output of the SoC. That allows
> > > configuring the LVDS encoder to send the even and odd pixels on the
> > > right port.
> >
> > As far as I can tell, you can't control that in our TCON. It just on
> > more lanes, that's it. Also, we currently have multiple ports, to map
> > another feature of the TCON, which is that it can drive directly a
> > panel, or will send its output to the HDMI / TV encoders. Adding
> > another port in that will break the current binding we have.
>
> This will create one issue though, in that the dual-link sinks are
> supposed to have two input ports, in order to expose the odd and even
> pixels ordering. If you have a single ouput port in your TCON, how will
> you interface with such sinks ?

I guess we could create multiple endpoints in the same port? That's
not going to be trivial either though given the current binding we
have :/

Maxime

--o5bnojo4ldqgcpzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7HgwAKCRDj7w1vZxhR
xcM8AQCpa6c0h8xK/CcS02Pjk8iW05AziHyjvBQHFtCVXRiR8gD+JzClYTbONPVl
oCYyx0aKehSbr6qn6kDEgIeDEfuHoQ0=
=TIhH
-----END PGP SIGNATURE-----

--o5bnojo4ldqgcpzr--

--===============0337083002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0337083002==--
