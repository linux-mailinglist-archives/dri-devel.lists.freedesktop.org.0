Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F44EBCF5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C04310F771;
	Wed, 30 Mar 2022 08:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B8810F771
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:50:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 384A23201D2F;
 Wed, 30 Mar 2022 04:50:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Mar 2022 04:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=iamojpI/1KoDjbkbGyoUE/yMcZCQT7FIidOnNN
 W7rfQ=; b=JR53EPtXdcjVD/rNuVbnCSJGK3Xm0FskW/WPh5EOh0LBUAPLVZkeJk
 CrJ8KQ6gIHJe/pLvaoneo1Sscsb75aB2/32JLI6JvbKn2oaj8TYbhj0v8/e3ZALe
 /9j3KWxANXzu0cUC8zw4jZciE9l/xhKzQ4JZd/lT3oR8GM7z0Ha+48chD0PZIU1Y
 0inpvUNhiM42xRhOH+yNhOAnqfE6dIjYgigalo8cwKdRk6m6Sv94PEsZhQrR1C1g
 f9iKRFvLuj3K8KsQ8hukr2Rvcphy0XtC/M5q/VIMcKRcGz0kxwNZMrogWxxSWi7w
 Uz2PsSMK+FN8d2+crvbKZhlYHKGzLnvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iamojpI/1KoDjbkbG
 yoUE/yMcZCQT7FIidOnNNW7rfQ=; b=HUdQ9j+QT9+OlfK3wNAt70ddOilwNcjKm
 AI3Wr3zSwagDlF2axwv2sJV8PJyS7+VP5f0kSd3ffA+6a6DlzggGsZSf+eEIiaJA
 kJhQgnDne2kkfr+ZZRpozScoVXykECKpGAUDeZtTjjgcxr6bbp36TJPnv640Ge6X
 njRrGJCNgjH65CoDoF/kVF4MdIWEmk8e1u6TTrPpIjKiy5RmkofBV6OPu7ham7/k
 KCFlOIj4dcXX/+N8Ha8XYKhi9HBt7KCY5JdfLZDgOOlodO3J4JrhacH11r/5flcO
 /DEDGAcv4/eo3yTPNrkqBHAYd+BMOvUDmFP7F5sgK2l5bVwioD+Tw==
X-ME-Sender: <xms:5xlEYt5PA1_c5sMcoBhlEAUPOqDvSIr9-JX5TlEDCcVIIlbdTE1qsQ>
 <xme:5xlEYq6RyNqN28Kg51h56YYia-APjgNjk5kYfANgBvCRe6SVD7myMoCuMUPlg-RWQ
 UKaq2t3sSQtKKxFmNw>
X-ME-Received: <xmr:5xlEYkezEIJgrq7eEC4R1UA0zZcRBvBhUhfwK5_cpXxYnwUGiVWK4qXueSnsB9hg8fiMeA8oSAUSeC_5bk_9W0l3nPuoKzOs3R7ICNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5xlEYmKLhX76Hj92EWg00ll7BKZsxXNNAe5ozHvSbJN_k7tKpMj38w>
 <xmx:5xlEYhIpspCLLBEzyN07YWPcGw5QIbRZUE72KCLuIfrCRlrRscXWBg>
 <xmx:5xlEYvxEQKamKal9IAViSSGF3rckoquTrItWE79t7w_rurGqJd5cDw>
 <xmx:5xlEYo_7fjsE7Bj0cZgkAscnsDYN7ZpE9b18dj0eTmQw_cW7AXuT7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 04:50:46 -0400 (EDT)
Date: Wed, 30 Mar 2022 10:50:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: DSI Bridge switching
Message-ID: <20220330085045.omtrq255gtwqeozd@houat>
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
 <CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=QpWj44KPw@mail.gmail.com>
 <CAMty3ZCnSZxMOMyd00z24a_dH0AmUE=5tEwARVB1vX2JMGkS3A@mail.gmail.com>
 <CAHCN7xLgKeRACM0kvC1kGBOd0KxNFYPSLesRvfgXRU5tV-gqFQ@mail.gmail.com>
 <20220310103504.7bcvex7liwy3lsxu@houat>
 <CAMty3ZBnu-23akY_nda_nKJfj8xN0F_Wch3fu5_cNDJ2Rc6_FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="epdep26z7arbm747"
Content-Disposition: inline
In-Reply-To: <CAMty3ZBnu-23akY_nda_nKJfj8xN0F_Wch3fu5_cNDJ2Rc6_FA@mail.gmail.com>
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
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--epdep26z7arbm747
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 07:39:21PM +0530, Jagan Teki wrote:
> On Thu, Mar 10, 2022 at 4:05 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Wed, Mar 09, 2022 at 06:45:10PM -0600, Adam Ford wrote:
> > > On Wed, Mar 9, 2022 at 1:11 PM Jagan Teki <jagan@amarulasolutions.com=
> wrote:
> > > >
> > > >  or a Hi All,
> > > >
> > > > On Thu, Oct 14, 2021 at 6:45 PM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
> > > > >
> > > > > Hi Laurent,
> > > > >
> > > > > On Fri, Oct 8, 2021 at 7:07 PM Laurent Pinchart
> > > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > Removed my invalid email (I will update files next week).
> > > > > > >
> > > > > > > On 08.10.2021 13:14, Jagan Teki wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > I think this seems to be a known use case for industrial th=
ese days with i.mx8m.
> > > > > > > >
> > > > > > > > The host DSI would configure with two bridges one for DSI t=
o LVDS
> > > > > > > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Tech=
nically we
> > > > > > > > can use only one bridge at a time as host DSI support singl=
e out port.
> > > > > > > > So we can have two separate device tree files for LVDS and =
HDMI and
> > > > > > > > load them static.
> > > > > > > >
> > > > > > > > But, one of the use cases is to support both of them in sin=
gle dts, and
> > > > > > > > - Turn On LVDS (default)
> > > > > > > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> > > > > > >
> > > > > > > Are you sure it will work from hardware PoV? Do you have some=
 demuxer?
> > > > > > > isolation of pins?
> > > > > >
> > > > > > It may be in the category of "you shouldn't do this, but it act=
ually
> > > > > > works". I've seen the same being done with two CSI-2 camera sen=
sors
> > > > > > connected to the same receiver, with one of them being held in =
reset at
> > > > > > all times.
> > > > >
> > > > > Yes. Here the design has 2 MIPI D-PHY switches. Each switch take 2
> > > > > input data lanes and 1 clock lane from SoC and produces 4 data la=
nes
> > > > > and 2 clock lanes and from switch output 2 lanes and 1 clock are
> > > > > inputting to HDMI bridge and other 2 lanes and 1 clock is inputti=
ng to
> > > > > LVDS. So 1st pair of 1st switch and 1st pair of 2nd switch goes to
> > > > > HDMI and 2nd pair of 1st switch and 2nd pair of 2nd switch does to
> > > > > LVDS.
> > > > >
> > > > > However, routing of these lanes are controlled by SEL, OE GPIO pi=
ns.
> > > > > So at a time we can access only single bridge.
> > > > >
> > > > > >
> > > > > > > > The HDMI event can be detected via some HDMI-INT GPIO on-bo=
ard design.
> > > > > > > >
> > > > > > > > The possible solution, I'm thinking of adding LVDS on port =
1, HDMI on
> > > > > > > > port 2 in the DSI host node, and trying to attach the respe=
ctive
> > > > > > > > bridge based on HDMI-INT like repeating the bridge attachme=
nt cycle
> > > > > > > > based on the HDMI-INT.
> > > > > > >
> > > > > > > I think more appropriate would be to share the same port, but=
 provide
> > > > > > > two endpoints inside this port - we have two hardware sharing=
 the same
> > > > > > > physical port.
> > > > > >
> > > > > > That sounds like the correct DT description to me.
> > > > > >
> > > > > > > > Can it be possible to do bridge attachment at runtime? some=
thing like
> > > > > > > > a bridge hotplug event? or any other possible solutions?
> > > > > > > >
> > > > > > > > Any suggestions?
> > > > > > >
> > > > > > > Practically it is possible, see exynos_dsi + panels, or exyno=
s_dsi +
> > > > > > > some toshiba bridge - panel and bridge are dynamically 'plugg=
ed' and
> > > > > > > 'unplugged' from exynos_drm, but they do not use bridge chain=
 for this
> > > > > > > and some other reasons. (un|re|)plugging should be performed =
of course
> > > > > > > when pipeline is off (connector disconnected). I am not sure =
about
> > > > > > > bridges added to bridge chain - you need to inspect all opses=
 to ensure
> > > > > > > it can be done safely.
> > > > > > >
> > > > > > > And the main issue: Daniel does not like it :)
> > > > > >
> > > > > > Neither do I :-) Could it be handled with two DRM connectors th=
at are
> > > > > > mutually exclusive ?
> > > > >
> > > > > How about adding lvds-connector, hdmi-connector on the pipeline a=
nd
> > > > > select them based on the switch SEL GPIO? does it make sense to do
> > > > > this implementation via display-connector.c
> > > >
> > > > I have somehow managed to make runtime switching possible between L=
VDS
> > > > and HDMI with the help of DRM bridges.
> > > >
> > > >                                                   | =3D> ADV7535   =
 =3D>
> > > > HDMI-A Connector
> > > > DSI Host =3D> display-switch =3D> |
> > > >                                                   |=3D> SN65DSI83 =
=3D> Panel-Simple
> > > >
> > > > display-switch here is a bridge driver that can switch or attach the
> > > > downstream bridge flow based on HDMI HPD here. One potential problem
> > > > is that when we switch from LVDS to HDMI Out the HDMI Out is displa=
yed
> > > > with the resolution that LVDS has and it is unable to display higher
> > > > HDMI resolutions even though it supports it. Does anyone aware of
> > > > changing the resolution at runtime, please let me know?
> > > >
> > > > Technically, the display-switch hardware does available in various =
forms
> > > > 1. MIPI Switch PI3WVR626
> > > > 2. Conventional Mux Switch
> > > > 3. Converter bridge DSI to LVDS/HDMI (from Lontium).
> > > >
> > > > Overall I believe this can be a potential possible feature and good=
 to
> > > > support on Mainline as the hardware is intended to design for it.
> > > >
> > > > Any thoughts on this please let me know?
> > >
> > > I wonder if it would be possible to trigger a hot plug event similar
> > > to what is done when an HDMI cable is inserted/disconnected.
> > >
> > > If one switches, force a disconnect event, then triggle the connection
> > > event to force the video system to rescan/attach. I am not sure how to
> > > go about implementing such a thing, but that's my first thought
> >
> > Nothing prevents the DRM Master to just ignore the hotplug event though=
 :)
> > Kodi does that for example.
>=20
> Does it mean the DRM master unlocks the kodi if we switch the display?

What do you mean by "the DRM master unlocks the Kodi"? Kodi is the DRM
master in that case.

> In my use-case QT is holding the DRM master so
> drm_master_internal_acquire returns 0 in drm_fb_helper_hotplug_event
> so it indeed not able to switch. But for non-qt and normal DRM console
> applications I can see drm_fb_helper_hotplug_event return properly in
> order to do the proper switching.

I don't see what QT has to do with it, but like I said, nothing requires
the DRM master to just ignore that hotplug event. So whatever you do,
you can't rely on the master reacting to the hotplug event.

> > I think we could simply create two connectors, one for LVDS, one for
> > HDMI, with atomic_check making sure only one of them is enabled at the
> > same time?
>=20
> How can we create two connectors at the same time? You mean try to
> attach LVDS and HDMI bridge one after another in display-switch
> attach. does it create two different bridge lists?

Not two lists, but the bridge list would become a tree yes

Maxime

--epdep26z7arbm747
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQZ5QAKCRDj7w1vZxhR
xVGbAP99WaNl178XgqHinj19kOzh9Xp7hpNZrLs698z7Ju3sDgD/X/Uc9fntT0XS
mQdmJkxhJ1wLdisN4elc1YJPl9iW8A4=
=resE
-----END PGP SIGNATURE-----

--epdep26z7arbm747--
