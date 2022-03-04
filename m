Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5CA4CD39D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA1D10F03A;
	Fri,  4 Mar 2022 11:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBA410F03E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 11:38:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8E87C3201464;
 Fri,  4 Mar 2022 06:38:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Mar 2022 06:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Zt6ger87IIwuVDB23LYuh2mdUpYNNHELXOhVsd
 LFqZY=; b=C30yfSmXKONLwS4u0UO0X3Rnokh9iDzAY4i/TctAM8F9kKN7/Vcpw/
 mtPipN18CjFiMb8aS6+/3AE5Qaq6LJMGi1TT2IqX6Vp3zJHM/OOZzShCWsqri/p/
 2g0tQzwrrB/ZWmxqY9MTESLUpkquNVsgnsDWh7fbXlWfqVeBqr7m/qU5sSxggPK+
 hD/H7xu+BkF6ndkE6VGivVkzn1v7wrcLuJ2ccY4Z7PCKvPw31T7mRv9YMGHu+TDi
 vP92qhX2Clig38X4rvqiJeeNfi1Vya7i1Yhm396ZbJI3ArDeilRjTlsVuETZiVeV
 sGA9TQ5ZWMyoMi6V95sSxhzkUu/Qz2Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Zt6ger87IIwuVDB23
 LYuh2mdUpYNNHELXOhVsdLFqZY=; b=hvIzAkcOXuKrWyXAoCPmQMhv/8Rr3gkZZ
 IPsjrL+67dIiFF8lr+SVaJeWZWkHaGVnr7KU7hGXzM+eB73VqqHiW22FWFTvDyS5
 siU05WyWfEmuzU3nXKmlA5wiaSh8OlsFk2mrq3cjCC1GiuFxkIrisK/JaO5vww7N
 pI6uJu7WoorzdgDIymjx2UCkp7lpX1BrZtNKc85uz8f1heDV9gO4MNyPBdtDm88E
 hwScPkyOsgadEm6q71vmnYhjguWkXGiqQSdosJcQ2jZszJHtzP+QTS8DQgnVU3qd
 fA2mZigmsQFI7Upe7J/Fz+/U0zzOpHkmi471WJz6GzJ3gIzcN0/Cg==
X-ME-Sender: <xms:L_ohYnfczwJJGKyuaa2SwkFYwjHvK6D9DJypv_n9gsjzrq5c_WIj-Q>
 <xme:L_ohYtPkPap5U02re85CpyRwJ3_2zBg8eT3owKP_yfpAucKjAdxKSMguv8Qa6JfpG
 TjBXxzkMIw7LZPi0pA>
X-ME-Received: <xmr:L_ohYghY1PuirrUsPpQNYAjAO5WBiinkwl234qv5lruQ7TNDX0cHshjsd0rlN57ivexwKEVsG33uSN4wjSO79la130RlxGD-L5sJ344>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L_ohYo8XxFwtUKRo-rb4wPZ5IUH4xOtS3PKK_OuZ-gFBugjmBKaL2g>
 <xmx:L_ohYjtGwKKZZT4eSd9thgCzaQp6bP5ZgF3Qxz_cFmeHD5vYIswiCQ>
 <xmx:L_ohYnGFQXTBEDINSVQcwX3AKENmTAl8wW5VLZA4Skhz3d9Of2RyNA>
 <xmx:MPohYpBS6bRSyr8PNepcfp1vGPE8IdCDtKECpXnELgKGn55Sv6ZeZw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 06:38:23 -0500 (EST)
Date: Fri, 4 Mar 2022 12:38:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4] drm: of: Lookup if child node has panel or bridge
Message-ID: <20220304113821.jfu6fxgehohlj5in@houat>
References: <20220202160414.16493-1-jagan@amarulasolutions.com>
 <YiEkaBO/lz05DkAD@aptenodytes>
 <20220304085445.avdrxlx5wnytriyk@houat>
 <YiHxU5GvnRuTeWqc@aptenodytes> <YiHyatlgpmkMY4/T@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tufvwv7zjv55obc5"
Content-Disposition: inline
In-Reply-To: <YiHyatlgpmkMY4/T@aptenodytes>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amarula@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tufvwv7zjv55obc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 12:05:14PM +0100, Paul Kocialkowski wrote:
> On Fri 04 Mar 22, 12:00, Paul Kocialkowski wrote:
> > Hi Maxime,
> >=20
> > On Fri 04 Mar 22, 09:54, Maxime Ripard wrote:
> > > Hi Paul,
> > >=20
> > > On Thu, Mar 03, 2022 at 09:26:30PM +0100, Paul Kocialkowski wrote:
> > > > On Wed 02 Feb 22, 21:34, Jagan Teki wrote:
> > > > > Devices can also be child nodes when we also control that device
> > > > > through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > > > >=20
> > > > > drm_of_find_panel_or_bridge can lookup panel or bridge for a given
> > > > > device has port and endpoint and it fails to lookup if the device
> > > > > has a child nodes.
> > > >=20
> > > > This patch breaks the logicvc drm driver that I'm currently develop=
ping.
> > > > The symptom is that drm_of_find_panel_or_bridge now always returns
> > > > -EPROBE_DEFER even after the panel has probed and is running well.
> > > > It seems that the function can no longer find the panel.
> > > >=20
> > > > I haven't figured out the details, but reverting your patch makes
> > > > it work again. I suspect other drivers might be affected as well, so
> > > > it would probably be a good idea to revert the patch until the root
> > > > cause is clearly understood and the patch can be adapted accordingl=
y.
> > > >=20
> > > > Here is what the device-tree looks like:
> > > >=20
> > > > / {
> > > > 	panel: panel-lvds {
> > > > 		compatible =3D "panel-lvds";
> > > >=20
> > > > 		[...]
> > > >=20
> > > > 		port {
> > > > 			#address-cells =3D <1>;
> > > > 			#size-cells =3D <0>;
> > > >=20
> > > > 			panel_input: endpoint@0 {
> > > > 				reg =3D <0>;
> > > > 				remote-endpoint =3D <&logicvc_output>;
> > > > 			};
> > > > 		};
> > > > 	};
> > > > };
> > > >=20
> > > > &amba {
> > > > 	logicvc: logicvc@43c00000 {
> > > > 		compatible =3D "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> > > > 		reg =3D <0x43c00000 0x6000>;
> > > >=20
> > > > 		#address-cells =3D <1>;
> > > > 		#size-cells =3D <1>;
> > > >=20
> > > > 		[...]
> > > >=20
> > > > 		logicvc_display: display-engine@0 {
> > > > 			compatible =3D "xylon,logicvc-4.01.a-display";
> > > >=20
> > > > 			[...]
> > >=20
> > > I think the issue lies in what you left out here: you have another no=
de
> > > aside from the port one, called layers. I *think* the issue is that t=
he
> > > code will now pick up the layers node, and try to use it as a panel,
> > > which will never probe.
> > >=20
> > > I've had a look at all the other bindings though, it seems like this
> > > driver is the only one that can be affected: the anx7625 seems to be =
the
> > > only other driver that has a child node that isn't either a port or a
> > > panel (aux-bus) but it doesn't use drm_of_find_panel_or_bridge either.
> >=20
> > Thanks a lot for looking into this so quickly!
> >=20
> > After some testing it clearly appears that you're right and the layers
> > node is the one conflicting with the patch. Removing it brings the
> > behavior back to normal. I'll try to dig-in a bit more to understand
> > why this is happening since it's really not obvious when just looking
> > at the patch.
>=20
> Ah wait I do understand it actually. The patch will take the *first* node
> that doesn't have ports/port in it and use that as remote instead of
> of_graph_get_remote_node.
>=20
> So maybe the fix would be to first look via of_graph_get_remote_node and
> if nothing is returned then it should try to use the first node as remote.
> tl;dr just inverting the order of the logic.
>=20
> Do you think that would work?

We can have multiple strategies here. The one you have in mind does work
indeed, but relying on the node order is still fairly fragile.

I think it would work fine then if:

  - We first lookup any endpoint, and see if we have a panel or bridge.
    If so, we return it.

  - Then, we look at any available child node, and see if we have a
    panel or bridge attached. If so, we return it.

  - we return -EPROBE_DEFER

That way, even if we have something like:

node {
     totally-not-a-panel {
     }

     panel {
     }
}

It would work fine, without relying on the node name (well, except for
port(s)?)

What do you think?
Maxime

--tufvwv7zjv55obc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYiH6LQAKCRDj7w1vZxhR
xc1+AP4qU25jNc62ilmS5KrlTO9CHSMa8X0tPT1IopsbUQxwoAEAjILcVK/sMCZM
s/FVfE6Ihlj+kAYc3gvtzLTlP5uVYww=
=zRqB
-----END PGP SIGNATURE-----

--tufvwv7zjv55obc5--
