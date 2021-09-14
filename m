Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869A40B0FE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 16:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34E46E4BB;
	Tue, 14 Sep 2021 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712496E4B5;
 Tue, 14 Sep 2021 14:35:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 540172B01324;
 Tue, 14 Sep 2021 10:35:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 14 Sep 2021 10:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=gzQp1QWFJ1terVGLXG3LkelZHX1
 PY0zeCf7c+zfmKMQ=; b=qwrojLetWm8vSiNaOYOzvA/4bx5c9Ldp0mN1akY5Tic
 XOFC+LZ3NHVFZI0Q4j2gV0uL7YEnEhe21l1M5TJFRig2DKZ4Un6hDXjgQOii1Y82
 5WyO4KZZoNqJ7oKdX2MwmOfMWRot1Q9AgXdATsPsVVG1riN9nlnyyYDqXn3YFXN+
 9s2V28gn97sb698EtmBEz1ccHFSZHOl3o33DXtlw99spoJ9ov5lx4oe2vyal1Z25
 oC6aWg/N2xi93fEny5sIuxmWO0VPSLBWD1xzy12AF01w9pCYn7bWBQxuyyMCpvaM
 y39vOL7n4ExOP5RKVrgIgcSbtNTWg/52A2XQpR9ZJ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gzQp1Q
 WFJ1terVGLXG3LkelZHX1PY0zeCf7c+zfmKMQ=; b=c/mMgHLb69f6Km6Eo4UNJk
 iqu9ZZm7TixCWDggjEknfbBqsJ52MzYz/I4E70KNWN/WqGb3DQztg8k8Yrg3GJWH
 j2J6KLBaFTzsJxJV91N4IKyxV0/a6O4XJ3IvpCkAC8pP6I0sr3cNzGcMlPlA8env
 X2ImR9ouayJUHXEp/1vY0qlG+uEifOqaQSSqfF8UuJkExlp3xMnD0e7qfgfD0Sg1
 OE5DWmY8f3GCZHWtF+3JmCP1ZfpRdijxPE1U4kDXV43gPOKkuJp+IpDKyKvq8XYx
 80xU/GYYirii0rkNFO/4xy2V+mCPAhIrhQzaztYQ68dD9DiEY6KnX9Q9zY8okcEw
 ==
X-ME-Sender: <xms:QLNAYRRIFa4rSrl28gZuhzlFsybDsgQ7nkmeZl5zpLuNJOQCstlOig>
 <xme:QLNAYazEN1B0GtYZNDVvBnlB_inGyLt5gYMTwFR3Val9eFw9-oUu_QjcxdFVSsaHx
 H8s-ha7EhGz4epG-b8>
X-ME-Received: <xmr:QLNAYW2dYbBrD_FTXbHB145EFkvIvpd4rn-cFX4ZyFRbm2b4ZWNyTLHLaYZHybdI9mP_f4AgYSHO9N5K59xExzFWHeqMJ_FLvMwB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QLNAYZBhX7gMyjqQnd3byuW810fgxZwSXvXY1EKAd67AkaRHHH7Evw>
 <xmx:QLNAYaiuRz9tXXyco0VVshdpldJ7Wd0Gkg2gWwox-6NPEz6x1FD2-g>
 <xmx:QLNAYdrpNozFNjj3x9MkmlrhwAaq7s2DlUm_F_ZyK07OOwtm1JX4kg>
 <xmx:Q7NAYV2Gu08tOsNR8-vbHEH_8RwSgikcxSllFFc66JW-Hpv9TPo8yYDvtyI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 10:35:44 -0400 (EDT)
Date: Tue, 14 Sep 2021 16:35:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,	Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,	linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v4 02/24] drm/bridge: Document the probe issue with
 MIPI-DSI bridges
Message-ID: <20210914143541.433ucx2kvz36tw42@gilmour>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CGME20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60@eucas1p1.samsung.com>
 <20210910101218.1632297-3-maxime@cerno.tech>
 <7ad18d53-3ad6-a614-a8e1-cce6505f90a8@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6br4ofwy642o3hq4"
Content-Disposition: inline
In-Reply-To: <7ad18d53-3ad6-a614-a8e1-cce6505f90a8@samsung.com>
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


--6br4ofwy642o3hq4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 13, 2021 at 08:29:37AM +0200, Andrzej Hajda wrote:
>=20
> W dniu 10.09.2021 o=A012:11, Maxime Ripard pisze:
> > Interactions between bridges, panels, MIPI-DSI host and the component
> > framework are not trivial and can lead to probing issues when
> > implementing a display driver. Let's document the various cases we need
> > too consider, and the solution to support all the cases.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   Documentation/gpu/drm-kms-helpers.rst |  6 +++
> >   drivers/gpu/drm/drm_bridge.c          | 57 +++++++++++++++++++++++++++
> >   2 files changed, 63 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/=
drm-kms-helpers.rst
> > index 10f8df7aecc0..ec2f65b31930 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -157,6 +157,12 @@ Display Driver Integration
> >   .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> >      :doc: display driver integration
> >  =20
> > +Special Care with MIPI-DSI bridges
> > +----------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> > +   :doc: special care dsi
> > +
> >   Bridge Operations
> >   -----------------
> >  =20
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index baff74ea4a33..7cc2d2f94ae3 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -96,6 +96,63 @@
> >    * documentation of bridge operations for more details).
> >    */
> >  =20
> > +/**
> > + * DOC: special care dsi
> > + *
> > + * The interaction between the bridges and other frameworks involved in
> > + * the probing of the upstream driver and the bridge driver can be
> > + * challenging. Indeed, there's multiple cases that needs to be
> > + * considered:
> > + *
> > + * - The upstream driver doesn't use the component framework and isn't=
 a
> > + *   MIPI-DSI host. In this case, the bridge driver will probe at some
> > + *   point and the upstream driver should try to probe again by return=
ing
> > + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> > + *
> > + * - The upstream driver doesn't use the component framework, but is a
> > + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> > + *   controlled. In this case, the bridge device is a child of the
> > + *   display device and when it will probe it's assured that the displ=
ay
> > + *   device (and MIPI-DSI host) is present. The upstream driver will be
> > + *   assured that the bridge driver is connected between the
> > + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operation=
s.
> > + *   Therefore, it must run mipi_dsi_host_register() in its probe
> > + *   function, and then run drm_bridge_attach() in its
> > + *   &mipi_dsi_host_ops.attach hook.
> > + *
> > + * - The upstream driver uses the component framework and is a MIPI-DSI
> > + *   host. The bridge device uses the MIPI-DCS commands to be
> > + *   controlled. This is the same situation than above, and can run
> > + *   mipi_dsi_host_register() in either its probe or bind hooks.
> > + *
> > + * - The upstream driver uses the component framework and is a MIPI-DSI
> > + *   host. The bridge device uses a separate bus (such as I2C) to be
> > + *   controlled. In this case, there's no correlation between the probe
> > + *   of the bridge and upstream drivers, so care must be taken to avoid
> > + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> > + *   other to probe.
> > + *
> > + * The ideal pattern to cover the last item (and all the others in the
> > + * MIPI-DSI host driver case) is to split the operations like this:
> > + *
> > + * - The MIPI-DSI host driver must run mipi_dsi_host_register() in its
> > + *   probe hook. It will make sure that the MIPI-DSI host sticks aroun=
d,
> > + *   and that the driver's bind can be called.
> > + *
> > + * - In its probe hook, the bridge driver must try to find its MIPI-DSI
> > + *   host, register as a MIPI-DSI device and attach the MIPI-DSI device
> > + *   to its host. The bridge driver is now functional.
> > + *
> > + * - In its &struct mipi_dsi_host_ops.attach hook, the MIPI-DSI host c=
an
> > + *   now add its component. Its bind hook will now be called and since
> > + *   the bridge driver is attached and registered, we can now look for
> > + *   and attach it.
> > + *
> > + * At this point, we're now certain that both the upstream driver and
> > + * the bridge driver are functional and we can't have a deadlock-like
> > + * situation when probing.
> > + */
> > +
> >   static DEFINE_MUTEX(bridge_lock);
> >   static LIST_HEAD(bridge_list);
>=20
>=20
> Nice work with documenting this initialization dance. It clearly shows=20
> that bridge API lacks better mechanism - usage of mipi dsi callbacks to=
=20
> get notifications about bridge appearance is ugly.

Yeah, there's so many moving parts it's definitely not great.

> It remains me my resource tracking patches which I have posted long
> time ago [1] - they would solve the issue in much more elegant way,
> described here [2]. Apparently I was not stubborn enough in promoting
> this solution.

Wow, that sounds like a massive change indeed :/

> Anyway:
>=20
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

I assume you'll want me to hold off that patch before someone reviews
the rest?

Thanks!
Maxime

--6br4ofwy642o3hq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUCzPQAKCRDj7w1vZxhR
xZX4AQCpuzsltUoIAMTseQh0blWKIJdfpCQSgO0Tdf29VLbP8gEAx8aZkhD8UtLs
gYRcFQgX4NWKsoez7eyiExM4WOxRygQ=
=zKFO
-----END PGP SIGNATURE-----

--6br4ofwy642o3hq4--
