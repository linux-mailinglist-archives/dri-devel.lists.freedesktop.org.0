Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F24173243
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3BF6EE19;
	Fri, 28 Feb 2020 07:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC476ECC0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 14:25:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 82F7477BB;
 Thu, 27 Feb 2020 09:25:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Feb 2020 09:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8k8ifdUwFDmcr1ArdIrV0k+L0po
 RQVFUQt0Z3XT5bwI=; b=QofFa8xonDt6zn0DF9+ivYYHTiwYYcNzFwfQv9IYx1H
 lQVTqGC6T9MYDQ5wgkVkBxpD+CfQESTGyKq+V8UjmweYx4jSXfEEpzLw+siiUijR
 GFRQpqTYRU+9m0qTFUMjZDhgKaFHGZxOcauggtDnu15HdauSPn+VPerHAuJsNX4o
 KfMykFLM2N+gBE2C6RvMPdLXQKPgqnSb/UHIWw+/S738HNMLlGCsjNTeV8CPk1KD
 cszgujYUd5+ZKA1ogTfhafm7b+IXsrYo/jEPOvr0tNlXMBiT4NnJ4x1NR8AnTNOh
 P9iUipa8bUgP9hKSBpO9MX0GVcXn9f2UKIQUJ+g2obA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8k8ifd
 UwFDmcr1ArdIrV0k+L0poRQVFUQt0Z3XT5bwI=; b=P77kFJG49ME2EtAi4y+kF/
 znLlZmgqZEwYmB2IMRBbSfIHUUdmqbyOvR/EbbLSXwBjDin9Rog+/X/Rt04qH4LV
 /VtU1ujfW40A10O7h9vF4/f55KRO3ZXVdZxwsHCrj3pzNpHk4xJXDI/Y52qw5fsp
 pwg/ACaFJuO4dc+GU0Skj2rMCzyi61mZvtkG/ttEkcyaBIIO/Zraz5XBDYzGX84+
 gmdF98c0g6MW4qJvZfj35HQ65Xy78qiFKLU5Sqxmg7w4O2wFdUPoQL0mo0ztE099
 Jszd9z4WO51ocbXwLw8Y4p2Z+OpgpR+OmK/SgLX2Iel7Itck+IzdRmdt5ysLlrdg
 ==
X-ME-Sender: <xms:U9FXXqc_jC4dXhKJjYPY0SwqkKXkwg4bFqI9w6OA63FuIsfkqJDcdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeigdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrieekrdejieenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrh
 hnohdrthgvtghh
X-ME-Proxy: <xmx:U9FXXocZAPRdGoI3AMrdQIC_SExy12PCYkDXuEvfgdE8OkX3U75uCQ>
 <xmx:U9FXXmgVGVeMNDJbNivPAomv_gMVHz70RTnLzv_VqngHyaJxHlnAmA>
 <xmx:U9FXXsSWyJkG--YI-yWI5SIBGxb0Lhb200UYZocpUsk0DnhJ5ci3_A>
 <xmx:VdFXXgO_BqyPBRPSX6zOnzDJR0pVYDwjNmKtOyHQsGZjZWT5NPMgkw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5CBCD3280066;
 Thu, 27 Feb 2020 09:25:23 -0500 (EST)
Date: Thu, 27 Feb 2020 15:25:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200227142521.vtmcwbwxjddphjf2@gilmour.lan>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
 <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
 <20200214154953.GJ4831@pendragon.ideasonboard.com>
 <20200217174253.mj53us4bb7h2lyca@gilmour.lan>
 <20200217181006.GE4830@pendragon.ideasonboard.com>
 <20200220175307.qool442lm7qjqb5h@gilmour.lan>
 <20200220191339.GJ4998@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200220191339.GJ4998@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Content-Type: multipart/mixed; boundary="===============2002504495=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2002504495==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubhaez32phxyobwo"
Content-Disposition: inline


--ubhaez32phxyobwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 09:13:39PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>
> On Thu, Feb 20, 2020 at 06:53:07PM +0100, Maxime Ripard wrote:
> > On Mon, Feb 17, 2020 at 08:10:06PM +0200, Laurent Pinchart wrote:
> > > On Mon, Feb 17, 2020 at 06:42:53PM +0100, Maxime Ripard wrote:
> > >> On Fri, Feb 14, 2020 at 05:49:53PM +0200, Laurent Pinchart wrote:
> > >>> On Fri, Feb 14, 2020 at 04:44:05PM +0100, Maxime Ripard wrote:
> > >>>> On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> > >>>>> On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> > >>>>>> SoCs that have multiple TCONs can use the two set of pins on the first TCON
> > >>>>>> to drive a dual-link display. Add a property to enable the dual link.
> > >>>>>>
> > >>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >>>>>> ---
> > >>>>>>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> > >>>>>>  1 file changed, 7 insertions(+)
> > >>>>>>
> > >>>>>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > >>>>>> index 86ad617d2327..aa6dd8409dbc 100644
> > >>>>>> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > >>>>>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > >>>>>> @@ -105,6 +105,13 @@ properties:
> > >>>>>>          - const: edp
> > >>>>>>          - const: lvds
> > >>>>>>
> > >>>>>> +  allwinner,lvds-dual-link:
> > >>>>>> +    type: boolean
> > >>>>>> +    description: |
> > >>>>>> +      On a SoC with two TCON with LVDS support, the first TCON can
> > >>>>>> +      operate over both pins sets to output in a dual-link setup. This
> > >>>>>> +      will be triggered by setting this property.
> > >>>>>
> > >>>>> Could you maybe provide an example of how this property is supposed to
> > >>>>> be used ? I'm especially wondering what ports are used in that case and
> > >>>>> how they're connected.
> > >>>>
> > >>>> It's pretty trivial to support, it's only a property to set on the
> > >>>> encoder node itself.
> > >>>>
> > >>>> I'm not really sure what you meant by your question with the ports
> > >>>> though :/
> > >>>
> > >>> I assume that, in the single-link case, you have two TCON instances that
> > >>> operate independently, each of them with one port that models an LVDS
> > >>> connection to a panel.
> > >>
> > >> Indeed,
> > >>
> > >>> In the dual-link mode, how does that look like ? Does the TCON
> > >>> instance that operate in dual-link mode have two ports in DT ? There
> > >>> are two physical ports, so I think it makes sense to always have two
> > >>> ports in DT. That's what we're doing for the LVDS encoders on R-Car
> > >>> Gen3, in order to specify in DT which LVDS input of the dual-link
> > >>> panel is connected to which LVDS output of the SoC. That allows
> > >>> configuring the LVDS encoder to send the even and odd pixels on the
> > >>> right port.
> > >>
> > >> As far as I can tell, you can't control that in our TCON. It just on
> > >> more lanes, that's it. Also, we currently have multiple ports, to map
> > >> another feature of the TCON, which is that it can drive directly a
> > >> panel, or will send its output to the HDMI / TV encoders. Adding
> > >> another port in that will break the current binding we have.
> > >
> > > This will create one issue though, in that the dual-link sinks are
> > > supposed to have two input ports, in order to expose the odd and even
> > > pixels ordering. If you have a single ouput port in your TCON, how will
> > > you interface with such sinks ?
> >
> > I guess we could create multiple endpoints in the same port? That's
> > not going to be trivial either though given the current binding we
> > have :/
>
> That's however not really how endpoints are supposed to be used.
>
> Let's try to find a solution. Could you show me a DT example that
> explains why having two ports would create backward-compatibility issues
> ?

Sure, here is what the DT looks like for the SoC this patch was
relevant for (but we have the issue on multiple SoCs, all sharing
pretty much the same binding as far as ports go):
https://elixir.bootlin.com/linux/v5.6-rc3/source/arch/arm/boot/dts/sun7i-a20.dtsi#L406

And here is the binding part:
https://elixir.bootlin.com/linux/v5.6-rc3/source/arch/arm/boot/dts/sun7i-a20.dtsi#L406

As you can see, in that binding, ports were used to differentiate
between output and input, each of the output being an endpoint (since
we can't have the TCON driving multiple output at once).

Adding multiple ports would kind of break that, and would break the
general idea behind that binding (and the rest of the display
pipeline).

Maxime

--ubhaez32phxyobwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXlfRUQAKCRDj7w1vZxhR
xc0PAP9zjDzXT9CNGe6TSoSpsnFcO7r6DJ3ynEyYRcoX7uy9zQD/ZURcSADOTd+8
9E6zrb7rrCuTN42+4NccjG1sXpHlego=
=Vvge
-----END PGP SIGNATURE-----

--ubhaez32phxyobwo--

--===============2002504495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2002504495==--
