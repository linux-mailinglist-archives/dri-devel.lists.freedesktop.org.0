Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B26160CF8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420E6E8C9;
	Mon, 17 Feb 2020 08:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21826E3DA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 15:44:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 40E905CD1;
 Fri, 14 Feb 2020 10:44:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 10:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=n5v7Ksf5fN+HGYZQY4Cr6/EpGn+
 eFDk1rQovPH6zOQU=; b=k+dQmLVjp1h/yH4XaeEmVKsC8XumRaOXMNNVI1cAaOI
 uVDVHEwtAtIDB4hEB2Popc9ifkFA4dteIs/9nbd2RMvo40dmSBxaFJzbS+oa2gvW
 7UiMSSe3GRgN91WEOuZ6Xz9JOuPKjWENc3xQhOTaGEIlG/JKPEEvce0/PSa9Eg9P
 O4uPJ7DbxXrCAyoMzCNYRZO8sxDihm+p5fR5SjPWlLvhicYiCuTjqMxjBxNJBOeN
 viet7Cgi18ytKXsrZpVm+6cl79xYBiZ57o/axsPEEOTmJs+RWgOzXir+7xOV9XL0
 scedVSGvykOerXakEMOaA3/iYkZ+vGvH/XMiIQOwTJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n5v7Ks
 f5fN+HGYZQY4Cr6/EpGn+eFDk1rQovPH6zOQU=; b=rIA7N4TgCEXQwu43DKUW2L
 W4++wGCiAERQclPw/7jCi/4LxxIpBDbsWUhz2Bf8azP+AUkSt+9Y3xQrHditj2pQ
 uAJrx0xSRzp+moxYhgCPi8D5/kJkviLEKLScvhUZrcOZ8zad3RruSLo+pyGynmkH
 u1ZfpsDKfPiBPiUaZXP4e9TvxR5yqgXJ9Md4+LyRp06TP/5nd/l9IAkhw52WJEyw
 2Z56cPbIW+XbzKpfH3Sqe3ukv8ojpGkZEgiF9oWYLOrs6rdAPPPV1LdD6Aeu/Cr/
 PAOS9R1KQPhuUa614o9nCmt6ln5+zBK2QcmBLuh2pEV9kxoPyZB2mOSb1a54KT1Q
 ==
X-ME-Sender: <xms:R8BGXrT0Z-LrkYPf54YX95PM3kh0W0mk0CCcITPa8_Hvzi8QGsl8PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:R8BGXvvKwDo-3MEP4nIBCAsXoc1LBpljPg3kX3YUlAGQpXApwUL41g>
 <xmx:R8BGXkNWpig5YSHaEkc9zD-IcbYVcAO5yuZtUUlZ-m-b46PgjX2C8Q>
 <xmx:R8BGXijZhTpEesb32RwtqSX5HFkfNgzcVCAKoNw5nw-6SvAFI5TOVA>
 <xmx:ScBGXphAPunMvxwS9HvlUFBGO3sk2OaMZiwuMs5fA-XN0hEjfpHlVw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20A1530606E9;
 Fri, 14 Feb 2020 10:44:07 -0500 (EST)
Date: Fri, 14 Feb 2020 16:44:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200214131025.GI4831@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Content-Type: multipart/mixed; boundary="===============1441934860=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1441934860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ocew46sopze2pn2e"
Content-Disposition: inline


--ocew46sopze2pn2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>
> Thank you for the patch.
>
> On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> > SoCs that have multiple TCONs can use the two set of pins on the first TCON
> > to drive a dual-link display. Add a property to enable the dual link.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > index 86ad617d2327..aa6dd8409dbc 100644
> > --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > @@ -105,6 +105,13 @@ properties:
> >          - const: edp
> >          - const: lvds
> >
> > +  allwinner,lvds-dual-link:
> > +    type: boolean
> > +    description: |
> > +      On a SoC with two TCON with LVDS support, the first TCON can
> > +      operate over both pins sets to output in a dual-link setup. This
> > +      will be triggered by setting this property.
>
> Could you maybe provide an example of how this property is supposed to
> be used ? I'm especially wondering what ports are used in that case and
> how they're connected.

It's pretty trivial to support, it's only a property to set on the
encoder node itself.

I'm not really sure what you meant by your question with the ports
though :/

Maxime

--ocew46sopze2pn2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkbARQAKCRDj7w1vZxhR
xWgZAQCoX6IPh3nfofCSZf7uxIEwmYH/acb4D64t70G8fNoW4AEA0scufZoOcED6
nd6GkciRxgxAXhF3LhkXYBnzHA7tnQY=
=1YtU
-----END PGP SIGNATURE-----

--ocew46sopze2pn2e--

--===============1441934860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1441934860==--
