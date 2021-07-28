Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BCB3D8F36
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7829C6EA7A;
	Wed, 28 Jul 2021 13:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8136EA7A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:35:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id E402D580B89;
 Wed, 28 Jul 2021 09:35:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 28 Jul 2021 09:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=W9clNQN5uDyZQ55X1bMgue4S4/1
 Xdcf9dM8OuoUM0nQ=; b=nB0VmPq3DYC+cySpIdUPJsH/LS0+P9/Ph4Qr9ivb3oo
 0zVHUt4KVitO0OodusrEUMZnwud1drOFrIElZ7Px/+wDVxE6A0086KoMvHsTDVIP
 7+bDpLy5lfxYEc4sKXKTfVCYClfFx699kCyp6Hw8HlZm3GWFmqLg/HM3pur8BsEk
 8R4+CrD1mgHIbw+QMh1xS/Gt5W1rTHXh9OWkG9xUDHcE6fJUVsC4d0gn1ihE3OZH
 e+osiSQktMuxzAk5f09bT5ZOsXRAxaphKm1TXWcbQIT+iK/CbnLW/HoM8LJaGD4V
 as93NE7bCG2Gqr4YiOKpn1JgjJZ5bwgBxcyCmB6iWyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W9clNQ
 N5uDyZQ55X1bMgue4S4/1Xdcf9dM8OuoUM0nQ=; b=I8prGpLHw3q/FnMBCfD3q6
 NomVyf5sOp5A4DcamVRqiez2I72DGurZs1raDUX2OOD0R/bgtPTo9UKzYx1U9P4y
 MsUPHuYdJcEq0CAS+ENDBSQXUcEHlHYOOavCM73sut1EY1KHv/L3ni9YnyUZGmRD
 4tMBKFt5PJYZFbdf1Inyeb3Vwi3Saph1Od75LWfydbhdddvRPB2jz2xC+R3qbApd
 gsL7/nT1Gq4t/L3Kre0+Ce0ubEavtX56QLQhkvyL3ro0frTWtcbLBABmxP9DjTD4
 mKmnRv5c1ds5hSO1KUxVRgiMO2BsPEfB2/qTHriJMSlxMWr1G6Scmjvl6lbTtFtg
 ==
X-ME-Sender: <xms:Jl0BYf15qDgUJxQ6u0y77XZVp_5Y7SjVnU_AohjiltDYnY64bC4OKw>
 <xme:Jl0BYeFah6ANbkWNh73HxMxv5y3ttK_YprjhdXPQzRykoq3OWtvc-CfngBnA-JId4
 XJwulIEKtDlLN4-lRk>
X-ME-Received: <xmr:Jl0BYf4vFNKZh1L13LMPRBbY52JK8DIjYhwwTe5X8pnbGjhT-ENHCOmpdKe4M1HLjOFxYv_KM8qpDurUITa4sxQfZsaCOBHPyPw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jl0BYU0PwlxcTCEVQwftjnBW9cfv7bH4TjU_Z-8RR-OXDmvrNfBDHg>
 <xmx:Jl0BYSF2n_UWE0OWXxw2rU6XJ9W0rY-4NNZcpjwsh-r3j933x2ocXw>
 <xmx:Jl0BYV-OWd7lmDxnejALBvdV-2An-XQUMYjILmxvj3wMXRNzhif6Zw>
 <xmx:KF0BYeHXLam8_9ve3UtCZjFXjnHcvf36sonGIzH90C-hXh0wrBc1aw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:35:33 -0400 (EDT)
Date: Wed, 28 Jul 2021 15:35:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Message-ID: <20210728133531.yzamhx5fhrofxwee@gilmour>
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-5-maxime@cerno.tech>
 <CAMty3ZD5rpYHtW-Rs4i=XvBmiVEaeWNu1j=QE3mFJTjSPJTpxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="utqwuarjxeuflrvb"
Content-Disposition: inline
In-Reply-To: <CAMty3ZD5rpYHtW-Rs4i=XvBmiVEaeWNu1j=QE3mFJTjSPJTpxQ@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--utqwuarjxeuflrvb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jagan,

On Tue, Jul 27, 2021 at 03:12:09PM +0530, Jagan Teki wrote:
> On Tue, Jul 20, 2021 at 7:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Interactions between bridges, panels, MIPI-DSI host and the component
> > framework are not trivial and can lead to probing issues when
> > implementing a display driver. Let's document the various cases we need
> > too consider, and the solution to support all the cases.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  Documentation/gpu/drm-kms-helpers.rst |  6 +++
> >  drivers/gpu/drm/drm_bridge.c          | 60 +++++++++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/=
drm-kms-helpers.rst
> > index 10f8df7aecc0..ec2f65b31930 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -157,6 +157,12 @@ Display Driver Integration
> >  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> >     :doc: display driver integration
> >
> > +Special Care with MIPI-DSI bridges
> > +----------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> > +   :doc: special care dsi
> > +
> >  Bridge Operations
> >  -----------------
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index c9a950bfdfe5..81f8dac12367 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -95,6 +95,66 @@
> >   * documentation of bridge operations for more details).
> >   */
> >
> > +/**
> > + * DOC: special care dsi
> > + *
> > + * The interaction between the bridges and other frameworks involved in
> > + * the probing of the display driver and the bridge driver can be
> > + * challenging. Indeed, there's multiple cases that needs to be
> > + * considered:
> > + *
> > + * - The display driver doesn't use the component framework and isn't a
> > + *   MIPI-DSI host. In this case, the bridge driver will probe at some
> > + *   point and the display driver should try to probe again by returni=
ng
> > + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> > + *
> > + * - The display driver doesn't use the component framework, but is a
> > + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> > + *   controlled. In this case, the bridge device is a child of the
> > + *   display device and when it will probe it's assured that the displ=
ay
> > + *   device (and MIPI-DSI host) is present. The display driver will be
> > + *   assured that the bridge driver is connected between the
> > + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operation=
s.
> > + *   Therefore, it must run mipi_dsi_host_register() in its probe
> > + *   function, and then run drm_bridge_attach() in its
> > + *   &mipi_dsi_host_ops.attach hook.
> > + *
> > + * - The display driver uses the component framework and is a MIPI-DSI
> > + *   host. The bridge device uses the MIPI-DCS commands to be
> > + *   controlled. This is the same situation than above, and can run
> > + *   mipi_dsi_host_register() in either its probe or bind hooks.
> > + *
> > + * - The display driver uses the component framework and is a MIPI-DSI
> > + *   host. The bridge device uses a separate bus (such as I2C) to be
> > + *   controlled. In this case, there's no correlation between the probe
> > + *   of the bridge and display drivers, so care must be taken to avoid
> > + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> > + *   other to probe.
> > + *
> > + * The ideal pattern to cover the last item (and all the others in the
> > + * display driver case) is to split the operations like this:
> > + *
> > + * - In the display driver must run mipi_dsi_host_register() and
> > + *   component_add in its probe hook. It will make sure that the
> > + *   MIPI-DSI host sticks around, and that the driver's bind can be
> > + *   called.
> > + *
> > + * - In its probe hook, the bridge driver must not try to find its
> > + *   MIPI-DSI host or register as a MIPI-DSI device. As far as the
> > + *   framework is concerned, it must only call drm_bridge_add().
> > + *
> > + * - In its bind hook, the display driver must try to find the bridge
> > + *   and return -EPROBE_DEFER if it doesn't find it. If it's there, it
> > + *   must call drm_bridge_attach(). The MIPI-DSI host is now functiona=
l.
>=20
> There is an another problem occur for this scenario in the case of kms
> hotplug driver, sun6i_mipi_dsi.c. When host attach wait till drm
> device pointer found and drm device pointer would found only when bind
> done, and bind would complete only when &drm_bridge_funcs.attach hooks
> are complete. But, If DSI driver is fully bridge driven then this
> attach in bind will trigger panel_bridge hook attach and at this point
> we cannot get panel_bridge at all which indeed second attach would
> would failed.
>=20
> This is one of the reason I'm trying to use drm_bridge_attach host
> attach itself instead of component bind, not yet succeeded.

I'm not really sure what you mean, but if you mention the code we have
in the DSI driver to make sure we can probe without our panel, then it's
not something that we really can support. Bridges cannot be hotplugged
in DRM and having some inconsistencies between drivers (since none of
them behave the same way there) and between what's plugged on the other
side of the DSI bus feels weird.

Maxime

--utqwuarjxeuflrvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYQFdIwAKCRDj7w1vZxhR
xXboAQDPd3516XTZxLz6b/R54mWo7oRQoZNppedrau7xd1FxAAD/WG/gX9F5lHP5
3F16+6CsvvDV4X2i2GlzFEuQaaRImQM=
=xE4I
-----END PGP SIGNATURE-----

--utqwuarjxeuflrvb--
