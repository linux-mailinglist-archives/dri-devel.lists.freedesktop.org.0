Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4372A4D44C7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A06910EB80;
	Thu, 10 Mar 2022 10:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14C310EB80
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:35:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8275732013BE;
 Thu, 10 Mar 2022 05:35:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Mar 2022 05:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=rDzqDsocRwL5BYEyerOv5990DKcVOwRmP2SzWH
 8bhRs=; b=YVeuQ7psIj4U9nRt5xJ9ibjRTQ17+3RJDw6tfXlYrADs6pgUPToLsy
 QgrhDqXIXfDe+iwWC0X2GE8U59P++bMVfh+69B/jsI18KphzgHg8ysCETzlD7YGE
 9OXvg8Q4OUf1/liOgIuv4AdyxhXTwTekFIY9+uPGos1Vr0YttoR5NEPNqj/6JtRL
 CeOHwy/fb9g3qgen1Quk5ykkuPGb41kjOFQgv3tc1zmFSTo6/NLQphk5+Yxi1o+G
 qHjnBjYci7lg3o7cE3o2c3iJvYZw24xQbCAncMtXfACvFsYPqTIiRJXWsbCYLFEm
 Hb8OlhB8J5hUWDM6Yax4SRDdYsLtKw2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rDzqDsocRwL5BYEye
 rOv5990DKcVOwRmP2SzWH8bhRs=; b=Ykvupq4QmTi4unb5rlsyRkrdKtekCYOLQ
 OA8SDqbU+LHz266PjLV51qGLNE03++o0cZZS73dy8Ro/a8A6zMe2dXb1PlgdH34t
 3ZvjJtj793xrmHCY1vA9MWqT5q56fB3F1emQGgWcEvH6/pZHFKxL+q/XRomaqdPz
 ssaXNOV0MoB1a6ga3KdtLrD9stwYKYWMvUDq2f5/eQvwR1+UDd5fComx+2KnFVGW
 siTL2Hjg2U5Qvz9GZSa8GGPBlpEB78W1afwUnx8zFqmmx3OO2QUQunBn5uivRhRa
 4DW7VzqFOdZDDFnUA05twivhMONrdWDPPMjMO8cC7kf9ZJG9LvvHw==
X-ME-Sender: <xms:W9QpYitVsapWeUCNvxyoAraF5gj1zESvKZnnq_Ar7zOvvJWA_2rVYg>
 <xme:W9QpYncBoBXkL5Ckn1ELEialtY9YwZgrCCvPnSr8dAz_aSfPZffE2XkrcGcbesM-s
 tnImBSyT_T48IsQ7u4>
X-ME-Received: <xmr:W9QpYtzhhXkHd5PV9lFtGpNTAsIovUhBgx9fEq98rAnB-2XsEMkdtLjh186iE7FsQZ2PceUUOO6K-rHSiJxzof545_4-SOH29ULJ7IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:W9QpYtM-oEqYDhWkwBLIYBMoLYUVBHbWf9msASXBZ70YgrQ-QI_bTg>
 <xmx:W9QpYi8WdN9QDXojFiVlc9UvwhdHhvidmShHReiKZWVyq4_lbx4I4Q>
 <xmx:W9QpYlVIliZ3H6rifPZZtmIOSOmqGjt_95g5J5YJqKn507nQXyOCDQ>
 <xmx:XNQpYmT5IPbLvAfGfmN5m8asjM8Z-FJGK4cAFhcdknMFqpjtKj-otQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 05:35:07 -0500 (EST)
Date: Thu, 10 Mar 2022 11:35:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Adam Ford <aford173@gmail.com>
Subject: Re: DSI Bridge switching
Message-ID: <20220310103504.7bcvex7liwy3lsxu@houat>
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
 <CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=QpWj44KPw@mail.gmail.com>
 <CAMty3ZCnSZxMOMyd00z24a_dH0AmUE=5tEwARVB1vX2JMGkS3A@mail.gmail.com>
 <CAHCN7xLgKeRACM0kvC1kGBOd0KxNFYPSLesRvfgXRU5tV-gqFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3uh5ddq5fnjalejl"
Content-Disposition: inline
In-Reply-To: <CAHCN7xLgKeRACM0kvC1kGBOd0KxNFYPSLesRvfgXRU5tV-gqFQ@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3uh5ddq5fnjalejl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 06:45:10PM -0600, Adam Ford wrote:
> On Wed, Mar 9, 2022 at 1:11 PM Jagan Teki <jagan@amarulasolutions.com> wr=
ote:
> >
> >  or a Hi All,
> >
> > On Thu, Oct 14, 2021 at 6:45 PM Jagan Teki <jagan@amarulasolutions.com>=
 wrote:
> > >
> > > Hi Laurent,
> > >
> > > On Fri, Oct 8, 2021 at 7:07 PM Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > > > > Hi,
> > > > >
> > > > > Removed my invalid email (I will update files next week).
> > > > >
> > > > > On 08.10.2021 13:14, Jagan Teki wrote:
> > > > > > Hi,
> > > > > >
> > > > > > I think this seems to be a known use case for industrial these =
days with i.mx8m.
> > > > > >
> > > > > > The host DSI would configure with two bridges one for DSI to LV=
DS
> > > > > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technica=
lly we
> > > > > > can use only one bridge at a time as host DSI support single ou=
t port.
> > > > > > So we can have two separate device tree files for LVDS and HDMI=
 and
> > > > > > load them static.
> > > > > >
> > > > > > But, one of the use cases is to support both of them in single =
dts, and
> > > > > > - Turn On LVDS (default)
> > > > > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> > > > >
> > > > > Are you sure it will work from hardware PoV? Do you have some dem=
uxer?
> > > > > isolation of pins?
> > > >
> > > > It may be in the category of "you shouldn't do this, but it actually
> > > > works". I've seen the same being done with two CSI-2 camera sensors
> > > > connected to the same receiver, with one of them being held in rese=
t at
> > > > all times.
> > >
> > > Yes. Here the design has 2 MIPI D-PHY switches. Each switch take 2
> > > input data lanes and 1 clock lane from SoC and produces 4 data lanes
> > > and 2 clock lanes and from switch output 2 lanes and 1 clock are
> > > inputting to HDMI bridge and other 2 lanes and 1 clock is inputting to
> > > LVDS. So 1st pair of 1st switch and 1st pair of 2nd switch goes to
> > > HDMI and 2nd pair of 1st switch and 2nd pair of 2nd switch does to
> > > LVDS.
> > >
> > > However, routing of these lanes are controlled by SEL, OE GPIO pins.
> > > So at a time we can access only single bridge.
> > >
> > > >
> > > > > > The HDMI event can be detected via some HDMI-INT GPIO on-board =
design.
> > > > > >
> > > > > > The possible solution, I'm thinking of adding LVDS on port 1, H=
DMI on
> > > > > > port 2 in the DSI host node, and trying to attach the respective
> > > > > > bridge based on HDMI-INT like repeating the bridge attachment c=
ycle
> > > > > > based on the HDMI-INT.
> > > > >
> > > > > I think more appropriate would be to share the same port, but pro=
vide
> > > > > two endpoints inside this port - we have two hardware sharing the=
 same
> > > > > physical port.
> > > >
> > > > That sounds like the correct DT description to me.
> > > >
> > > > > > Can it be possible to do bridge attachment at runtime? somethin=
g like
> > > > > > a bridge hotplug event? or any other possible solutions?
> > > > > >
> > > > > > Any suggestions?
> > > > >
> > > > > Practically it is possible, see exynos_dsi + panels, or exynos_ds=
i +
> > > > > some toshiba bridge - panel and bridge are dynamically 'plugged' =
and
> > > > > 'unplugged' from exynos_drm, but they do not use bridge chain for=
 this
> > > > > and some other reasons. (un|re|)plugging should be performed of c=
ourse
> > > > > when pipeline is off (connector disconnected). I am not sure about
> > > > > bridges added to bridge chain - you need to inspect all opses to =
ensure
> > > > > it can be done safely.
> > > > >
> > > > > And the main issue: Daniel does not like it :)
> > > >
> > > > Neither do I :-) Could it be handled with two DRM connectors that a=
re
> > > > mutually exclusive ?
> > >
> > > How about adding lvds-connector, hdmi-connector on the pipeline and
> > > select them based on the switch SEL GPIO? does it make sense to do
> > > this implementation via display-connector.c
> >
> > I have somehow managed to make runtime switching possible between LVDS
> > and HDMI with the help of DRM bridges.
> >
> >                                                   | =3D> ADV7535    =3D>
> > HDMI-A Connector
> > DSI Host =3D> display-switch =3D> |
> >                                                   |=3D> SN65DSI83 =3D> =
Panel-Simple
> >
> > display-switch here is a bridge driver that can switch or attach the
> > downstream bridge flow based on HDMI HPD here. One potential problem
> > is that when we switch from LVDS to HDMI Out the HDMI Out is displayed
> > with the resolution that LVDS has and it is unable to display higher
> > HDMI resolutions even though it supports it. Does anyone aware of
> > changing the resolution at runtime, please let me know?
> >
> > Technically, the display-switch hardware does available in various forms
> > 1. MIPI Switch PI3WVR626
> > 2. Conventional Mux Switch
> > 3. Converter bridge DSI to LVDS/HDMI (from Lontium).
> >
> > Overall I believe this can be a potential possible feature and good to
> > support on Mainline as the hardware is intended to design for it.
> >
> > Any thoughts on this please let me know?
>=20
> I wonder if it would be possible to trigger a hot plug event similar
> to what is done when an HDMI cable is inserted/disconnected.
>=20
> If one switches, force a disconnect event, then triggle the connection
> event to force the video system to rescan/attach. I am not sure how to
> go about implementing such a thing, but that's my first thought

Nothing prevents the DRM Master to just ignore the hotplug event though :)
Kodi does that for example.

I think we could simply create two connectors, one for LVDS, one for
HDMI, with atomic_check making sure only one of them is enabled at the
same time?

The one thing that would make it difficult is that we're changing the
bridge list to a tree. For example, in such a case, what should
drm_bridge_get_next_bridge return? This will obviously depend on the
state, but it's used in context were we don't have a state (such as
drm_bridge_connector_init).

Maxime

--3uh5ddq5fnjalejl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYinUWAAKCRDj7w1vZxhR
xeYNAP9niUDigmkZ+AlAXWrWOHTKx7dJpcAWOqK3g6ils7t4PQEAhc8dRMZgnse/
JFrBDAKUVCQTmnBtf357tN9GD08gxA0=
=KhSL
-----END PGP SIGNATURE-----

--3uh5ddq5fnjalejl--
