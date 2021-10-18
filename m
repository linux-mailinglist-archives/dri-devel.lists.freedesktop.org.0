Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B171C4322A8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 17:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31D76E0AF;
	Mon, 18 Oct 2021 15:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A456E0AF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 15:20:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E47375810A6;
 Mon, 18 Oct 2021 11:20:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Oct 2021 11:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=EyaSCcSd+xkZIq0q3vy9VAx4Zhl
 OAxHSAzuNLYnTy54=; b=aGdjyzXdcMn1qq8ptCW43yyVEhpBdtfv95GDcJDnp0e
 k2yC2u0MYTYLlm4XfUHXqOZQq7vLjcJ0/K35Xb/LOxenym1duuIz50oJbKvbJUXO
 iqgxVI19XV5nfmU3v1Ozj595zVE91Tu/U0lCSdQZfer/6BHjehbI85AxwQ3vFUDt
 qgpQBGulvI6IamCrBozB6CRYwvsHrDlPAu12W7IPCIE3ea4I37bporDUsgTYIiKm
 B/+bLthWLppGYHx2EoEARl4OoqRH917khoham3fPOksXIrAbB0wfkyRCJ+i8kqsd
 nslAiZYcIi33BEwXyhmnGEmU8TNtJB5QNpvUI0zS8wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EyaSCc
 Sd+xkZIq0q3vy9VAx4ZhlOAxHSAzuNLYnTy54=; b=IFKjHm67pYLYLcCPyZ8/lC
 0YdqAADonjmO+vqV+2wu1j2rW7lrZWanN1cvLCvHmWNDov6M4Q6bt42Ige4XAjgW
 QEyEaOQU5ZQ1xKYO9Eag8v5C5SOyg3VhX+F39rIydoUArx2P013Nau8YuCdOiIxX
 ZEz1NzRe0pKV1inCPET2TtvHE1WczlmUfuAZZVbRVSHO12iSF6ydjdbBOSgM3XcR
 j58HVv0NAoamsLX8ImirpTGX7PEYHFKTWY8yFKn3Ab7glWdKAgl252iD5UtdvHJ8
 FYwCgdTia+lnCC+q3g+Ww2MJvhnORDH8Fq9slXZhvzKAwsl1m11YI38RzVw3d1FA
 ==
X-ME-Sender: <xms:r5BtYbd-R0yw152bhvFxz8zN215yvazpRTtolVXsgzQiyVJdXq7TXg>
 <xme:r5BtYRN684DwNJDrTbaFrMkWNSHZeXBELHGwKf6T5WJTnR31JsuusdQb7sjHdlB3S
 kTVotbJXmTlfVAa0aQ>
X-ME-Received: <xmr:r5BtYUhkPKJaTr7VdWJXxQuq0bfs3Kk8klw0_xp1Ut7Oq7cnxWxnApl_KkF4AD0rRkyEs8xAc0-S6qA24aFQ-DqXl7cwCShhCtMcmmaO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:r5BtYc_OEn2ieAj9600-Pf6YyCFZ13-yZscDZTOBX0PcRqUUS5XMJQ>
 <xmx:r5BtYXvM54vY8bCY04o_tAEEanG5_6NuS0TiGw4mcvPAJjp4svV3dw>
 <xmx:r5BtYbEus3_VFofZ_T1gOd7y-qwhQRTBxCfcpYojlaTmdDQD3kWc7w>
 <xmx:sJBtYbFPpplDYizxYBIk4oN3pv5QXLrv3V1En76ELbkBwC6KFh1c0g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 11:20:15 -0400 (EDT)
Date: Mon, 18 Oct 2021 17:20:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20211018152013.e3kmbm2lszb652gi@gilmour>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
 <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
 <20211013074722.7y7ug3eri4euknza@gilmour>
 <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
 <20211014074110.ym6mzugde2m5ak22@gilmour>
 <YWo6U1juhMsHnQYU@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bt6qxqknmq2wi7rm"
Content-Disposition: inline
In-Reply-To: <YWo6U1juhMsHnQYU@pendragon.ideasonboard.com>
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


--bt6qxqknmq2wi7rm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2021 at 05:34:59AM +0300, Laurent Pinchart wrote:
> On Thu, Oct 14, 2021 at 09:41:10AM +0200, Maxime Ripard wrote:
> > On Wed, Oct 13, 2021 at 12:37:47PM +0300, Laurent Pinchart wrote:
> > > On Wed, Oct 13, 2021 at 09:47:22AM +0200, Maxime Ripard wrote:
> > > > On Tue, Oct 12, 2021 at 08:48:42AM +0200, Alexander Stein wrote:
> > > > > Add a VCC regulator which needs to be enabled before the EN pin is
> > > > > released.
> > > > >=20
> > > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > ---
> > > > >  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5=
 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,=
sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65ds=
i83.yaml
> > > > > index a5779bf17849..49ace6f312d5 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi=
83.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi=
83.yaml
> > > > > @@ -32,6 +32,9 @@ properties:
> > > > >      maxItems: 1
> > > > >      description: GPIO specifier for bridge_en pin (active high).
> > > > > =20
> > > > > +  vcc-supply:
> > > > > +    description: A 1.8V power supply (see regulator/regulator.ya=
ml).
> > > > > +
> > > > >    ports:
> > > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > > > =20
> > > > > @@ -93,6 +96,7 @@ properties:
> > > > >  required:
> > > > >    - compatible
> > > > >    - reg
> > > > > +  - vcc-supply
> > > >=20
> > > > This isn't a backward-compatible change. All the previous users of =
that
> > > > binding will now require a vcc-supply property even though it was
> > > > working fine for them before.
> > > >=20
> > > > You handle that nicely in the code, but you can't make that new pro=
perty
> > > > required.
> > >=20
> > > We can't make it required in the driver, but can't we make it required
> > > in the bindings ? This indicates that all new DTs need to set the
> > > property. We also need to mass-patch the in-tree DTs to avoid validat=
ion
> > > failures, but apart from that, I don't see any issue.
> >=20
> > I guess we'd need to clarify what the schemas are here for.
> >=20
> > We've been using them for two things: define the bindings, and make
> > sure that the users of a binding actually follow it.
> >=20
> > The second part makes it very tempting to also cram "and make sure they
> > follow our best practices" in there. We never had the discussion about
> > whether that's ok or not, and I think the schemas syntax falls a bit
> > short there since I don't think we can make the difference between a
> > warning and an error that would make it work.
> >=20
> > However, if we're talking about the binding itself, then no, you can't
> > introduce a new property.
>=20
> I assume you mean "a new required property" here.
>=20
> > Since it was acceptable in the past, it still needs to be acceptable
> > going forward.
>=20
> I think that's a matter of definition. The way I see it (but I could be
> mistaken), we're essentially versioning DT bindings without actually
> saying so, with the latest version being the visible one, and drivers
> having to preserve backward compatibility with new versions. We could
> also see it in different ways of course.

I disagree. A binding is essentially a contract on how the OS is
supposed to interpret whatever comes from the DT. If we do what you
suggest, then we lose all documentation of older versions we still need
to support at the OS level. And relying on all developers to look
through the entire history to figure it out is a sure way to screw
things up :)

The use of deprecated indicates that we actually want to document the
old versions.

> What's important is in my opinion to make sure that new DTs will do
> the right thing, and if we don't make this property required, we can't
> check that. DT authors wouldn't know if the property is optional due
> to backward compatibility only but highly recommended, or really
> optional.

Add a comment saying that this should really be added, but we can't
because it was missing it was in the original binding?

Maxime

--bt6qxqknmq2wi7rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW2QrQAKCRDj7w1vZxhR
xc6DAQDyDpfvofZuF+nO9Zn7bkg9TdSoXtA6JgfUMPTQthtzmQD+NVIgOvQ0Z+s/
t39N7mUQdu/J8x2atBwq/fyAtGU5IwU=
=kSEg
-----END PGP SIGNATURE-----

--bt6qxqknmq2wi7rm--
