Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BE13F8402
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 10:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464896E566;
	Thu, 26 Aug 2021 08:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812986E566
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 08:56:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 65270580E35;
 Thu, 26 Aug 2021 04:56:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 26 Aug 2021 04:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=8ZqZMRxHYnjQ2uzAJrMkPBHkNou
 kBe6k9p1sniS1y0c=; b=Jn3pmql5i/BUkYPxISEaqVtJnFkGhpi/u/AjE+0hTLa
 v/JDM65cX/QTuMOGONVv2i2QuN+klkRGa3X7cknQzDeSvSv/yLg/fC4mcLqj8j6H
 ad6D6qOGpFkj19ZlIcQp86PMmi4BNli4hJnfb1EYMZU2cVBFu+gH2MTS8aSjtkfJ
 vLbaVHBUEqtWzmlTnvOWhA5YNIWAh3rjbNhddxE2kMeZoWsDRW7Ollt7b2kiGLY5
 +bwmp3t8n5RhEnoTYsK/VWTic+KvGZwnSGI6RJg83kfK6o8ISDyqK7j466FsaTGT
 Cp7NZLNx6obB04R2UfKgnT6+Ix2rBzQ/iMoVHOPCrzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8ZqZMR
 xHYnjQ2uzAJrMkPBHkNoukBe6k9p1sniS1y0c=; b=XGBJoyHhR3DWmlyc9RZDOx
 AfgoSfwijcJiiWIMds8+VM32IOf3AjPVCBwhpYeq8atXg/adGDVfcPlQVJ3YxP99
 0+qHbeEoFxPLwsgROM6A86TVUbGdAqX3UIDSLlAPNP4NKVcc8ekCJvrBRUlMWskB
 0l+wMHdzAT1qgdJsbOsp55LCkPhhkcF8xqD1XDDZp5i6nDUCx2YljrHUN7N9CySP
 Cl3iRXQsCuUN/KBpSWL1i1UW/NuBj3xBdlv3g0OahPBGEuvgu7Z5zBqDLlXVY2jL
 26KNA20MpMLqaAstUrvvD3ua3xtayUYJ8ctu0zT0UI9hFM3vdZ6YwS2zt5oogvxw
 ==
X-ME-Sender: <xms:UFcnYdgJteDE000dBm6ZWsJILsLkL2Stk6RewL0jEZDV2-IK8FWGdA>
 <xme:UFcnYSBdA_8BLcqnD7LUlKea5bJofE8NaW1flcZhKTXTCOh-n93nZOH3fdvFSZr7P
 llMFRRgKqDWpxxLIRw>
X-ME-Received: <xmr:UFcnYdG--SqUiJfMZ6CFNoNnHbkvgpL8Q-8BIFTC65qrtW3tO9WZfOOPhjGk4yXla5lUELhxZOiAVI_XcPCGawWOix225dZvmehX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduuddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UFcnYSRxVRmQ_BO8DffA2O9zOrhZc7tfabpRM9SgTeVH_SpY6fVh2g>
 <xmx:UFcnYaxIe07tQdDMMdlvPzUNIHwIMc5lX28SBIIwklK7IulH-SPhhg>
 <xmx:UFcnYY4VP9UOWdyGiJWW3HabMKKK2VR1VRTMJEmFeZLBqK0CMPUi0Q>
 <xmx:U1cnYVoKFt63Ne47mTAydzjn01gNIlF0gTkir8hQHwx3TYaUvyRFIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Aug 2021 04:56:48 -0400 (EDT)
Date: Thu, 26 Aug 2021 10:56:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/8] drm/bridge: Document the probe issue with
 MIPI-DSI bridges
Message-ID: <20210826085646.3mj53any74jwnjmi@gilmour>
References: <20210823084723.1493908-1-maxime@cerno.tech>
 <CGME20210823084750eucas1p24cd5dd54a967f63fda4184773b98c135@eucas1p2.samsung.com>
 <20210823084723.1493908-3-maxime@cerno.tech>
 <792b1a4b-7a82-e633-0266-787205ae279a@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dfbzll24nb43ccgk"
Content-Disposition: inline
In-Reply-To: <792b1a4b-7a82-e633-0266-787205ae279a@samsung.com>
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


--dfbzll24nb43ccgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrzej,

On Mon, Aug 23, 2021 at 06:32:11PM +0200, Andrzej Hajda wrote:
> Hi Maxime,
>=20
> On 23.08.2021 10:47, Maxime Ripard wrote:
>=20
> > Interactions between bridges, panels, MIPI-DSI host and the component
> > framework are not trivial and can lead to probing issues when
> > implementing a display driver. Let's document the various cases we need
> > too consider, and the solution to support all the cases.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   Documentation/gpu/drm-kms-helpers.rst |  6 +++
> >   drivers/gpu/drm/drm_bridge.c          | 58 +++++++++++++++++++++++++++
> >   2 files changed, 64 insertions(+)
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
> > index baff74ea4a33..794654233cf5 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -96,6 +96,64 @@
> >    * documentation of bridge operations for more details).
> >    */
> >  =20
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
>=20
> I guess component_add is leftover from previous iteration (as you wrote=
=20
> few lines below) component_add should be called from dsi host attach=20
> callback.

Indeed, I'll remove it

> > + *
> > + * - In its probe hook, the bridge driver must try to find its MIPI-DSI
> > + *   host, register as a MIPI-DSI device and attach the MIPI-DSI device
> > + *   to its host. The bridge driver is now functional.
> > + *
> > + * - In its &struct mipi_dsi_host_ops.attach hook, the display driver
> > + *   can now add its component. Its bind hook will now be called and
> > + *   since the bridge driver is attached and registered, we can now lo=
ok
> > + *   for and attach it.
> > + *
> > + * At this point, we're now certain that both the display driver and t=
he
> > + * bridge driver are functional and we can't have a deadlock-like
> > + * situation when probing.
> > + */
> > +
>=20
> Beside small mistake the whole patch looks OK for me. Maybe it would be=
=20
> worth to mention what is the real cause of this "special DSI case" -=20
> there is mutual dependency between two following entities in display chai=
n:
>=20
> 1. display driver - it provides DSI bus, and requires drm_bridge or=20
> drm_panel provided by child device.
>=20
> 2. bridge or panel with DSI transport - it requires DSI bus provided by=
=20
> display driver, and provides drm_bridge or drm_panel interface required=
=20
> by display driver.

I was trying to explain it in the first part of this patch. Is there
anything misleading there?

> I guess similar issues can appear with other data/control bus-es,=20
> apparently DSI case is the most common.

The issue only presents itself when it's using a separate control bus
actually. If it's controlled through DCS, the panel / bridge will be a
children node of the DSI host and will only be probed when the host is
registered, so we don't have this issue.

> And one more thing - you use "display driver" term but this is also case=
=20
> of any bridge providing DSI bus - there are already 3 such bridges in=20
> kernel - cdns, nwl, synopsys, tc358768, maybe "DSI host" would be better=
=20
> term.

Good point, I'll change it.

> And another thing - downstream device can be bridge or *panel*, it would=
=20
> be good to mention that panels also should follow this pattern.

We're pretty much forced to do this with panels though. They don't have
an attach hook unlike bridges so we don't have much other options than
putting it in probe.

> Btw this is another place where word bridge can be 1:1 replaced by word=
=20
> panel - it clearly suggest that DRM subsystem waits for brave men who=20
> proposes patches unifying them, we would save lot of words, and lines of=
=20
> code if we could use drm_sink instead of "if (sink is bridge) do sth=20
> else do sth-similar-but-with-drm_panel-interface".

I agree. In the previous iteration I had this patch that was a step in
this direction:
https://lore.kernel.org/dri-devel/20210728133229.2247965-3-maxime@cerno.tec=
h/

Even though it's not relevant to this series anymore, I still plan on
submitting it and converting as many users as possible (if my coccinelle
skills allows me to at least).

Maxime

--dfbzll24nb43ccgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYSdXTgAKCRDj7w1vZxhR
xQTyAQDeyoP4blj3lnV14h3xpZT0ygLGV8h27f6dZz75hm4RngEA+IWYrkjnTVLs
6ZSNtxNkmhNsKxWPxqM9FBIMfzghzQU=
=5p/2
-----END PGP SIGNATURE-----

--dfbzll24nb43ccgk--
