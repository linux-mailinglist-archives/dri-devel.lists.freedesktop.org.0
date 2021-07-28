Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56833D8F05
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B362F6E969;
	Wed, 28 Jul 2021 13:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F49F6E953
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:27:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 96498580ACE;
 Wed, 28 Jul 2021 09:27:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Jul 2021 09:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=QNlSOB6XFbHWykgqVLPHDrgx3CK
 E3KWvg12VK5u4qnc=; b=i771LHsL2XgcoWhBfBpDwu2ryEp6KMGG1CxT3wT4dtO
 pKe5X8rx7UcI0l7zmUbwzHP6gR2bZgVOuF57usbKBjqfoV+S9yo+CT9be9bl0g4g
 GsuyunBj0G7Yl2k8/AYF/dSB1i5FBWksENAxc3jgVb5pdxLs3RZ/1vL61RI1+gGZ
 uscJ5LGxKpprZPUheIcvjVcBx5xUrb3auRLu/mk1bJn+2GCzGbJYeq60BRCp6t/d
 rvnlAhhryMW5nips5Ai+NlVKpIUVAZM64OVOipkf3tjwz5vVCU2PZnu8aw3C4dPE
 m4sNLwF9z2A3Gj3vV3jc2/91jEII6ydj9JfBDaCf3tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QNlSOB
 6XFbHWykgqVLPHDrgx3CKE3KWvg12VK5u4qnc=; b=gKitsHKTvAPvou8vzx5Vh+
 6lnGRVDkHp2bdI6Dqfhi1P6oCorIK9gXdBiUsccSU+5+elsVuDRIf3jpnjIAAot8
 nJt+4w3/q1JCyA5nJ7MAGtrS/T/PZNJqWOh7l2IzjbnBu6GyRrhOM+ijXuj4YIjv
 PA1/zEMa0k7QzI0fDkReqIJP8PhFXcyKe2lsVuJ/FXR70hOMBKRCPmKBO9wU41Jy
 PsqBVcAqP9jL3w2leWXJiJLvOsyU/OVSmrx8oRFqrLFZo7QPUm5OpV649gp8PbUU
 3PlGwFbVORndHaNtsu+rWaIiaUuwy4YsBYYL8u6RZOA7WkoFye5icgQtL6+At/Fg
 ==
X-ME-Sender: <xms:UVsBYUbNNfOvrBbTb3qlEoEzYdeNZRWyJl1SZcRZeOPXByvVyfCN-A>
 <xme:UVsBYfZm0xwUu4LnbfYXE6YRU95fxuxyqkkfyJmhSc2oliTZUCbXCB0_vUbbId-Fe
 poIBMEm2FV24bQ0IJg>
X-ME-Received: <xmr:UVsBYe8yrGo0xOHgN7I_40m2WGpdduX59hLdHVcAW09rQ3tR_ynNmc1CuTTuQY6KuOa4Y5ZiFyxRbE0Ax9OZx8JVGkbJ-NRMnD36>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UVsBYerVS5yakdCKH310Yv7s0QGoyUiYGSBCAht4-zwf1dJByK38mA>
 <xmx:UVsBYfoUdgqXxf_4XtXReN818MWMXnwq_dDvxpNx38Hoi4xI6Y3iUg>
 <xmx:UVsBYcQmfi5XbM89_V3bv5LLzIqTaneJx2V6ljbC9uBNgwAjQYt_RQ>
 <xmx:U1sBYdjdLFBmf1B8Rk8wOprh73Y-l3ABrA948i1j0K14CDbH3UEF_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:27:44 -0400 (EDT)
Date: Wed, 28 Jul 2021 15:27:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Message-ID: <20210728132741.dzqqohi34cm56q6j@gilmour>
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-5-maxime@cerno.tech>
 <YPgNbVoNnq3fTMN2@phenom.ffwll.local>
 <20210726151657.c46qmkdvqfhlg6ox@gilmour>
 <YP/P9rJrZyk6zjsT@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xeh2a4js4i5wzele"
Content-Disposition: inline
In-Reply-To: <YP/P9rJrZyk6zjsT@phenom.ffwll.local>
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


--xeh2a4js4i5wzele
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 27, 2021 at 11:20:54AM +0200, Daniel Vetter wrote:
> On Mon, Jul 26, 2021 at 05:16:57PM +0200, Maxime Ripard wrote:
> > Hi Daniel,
> >=20
> > On Wed, Jul 21, 2021 at 02:05:01PM +0200, Daniel Vetter wrote:
> > > On Tue, Jul 20, 2021 at 03:45:19PM +0200, Maxime Ripard wrote:
> > > > Interactions between bridges, panels, MIPI-DSI host and the compone=
nt
> > > > framework are not trivial and can lead to probing issues when
> > > > implementing a display driver. Let's document the various cases we =
need
> > > > too consider, and the solution to support all the cases.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > I still have this dream that eventually we resurrect a patch to add
> > > device_link to bridges/panels (ideally automatically), to help with s=
ome
> > > of the suspend/resume issues around here.
> > >=20
> > > Will this make things worse?
> > >=20
> > > I think it'd be really good to figure that out with some coding, sinc=
e if
> > > we have incompatible solution to handle probe issues vs suspend/resume
> > > issues, we're screwed.
> > >=20
> > > Atm the duct-tape is to carefully move things around between suspend =
and
> > > suspend_early hooks (and resume and resume_late) and hope it all work=
s ...
> >=20
> > My initial idea to fix this was indeed to use device links. I gave up
> > after a while since it doesn't look like there's a way to add a device
> > link before either the bridge or encoder probes.
> >=20
> > Indeed the OF-Graph representation is device-specific, so it can't be
> > generic, and if you need to probe to add that link, well, it's already
> > too late for the probe ordering :)
>=20
> But don't we still need the device_link for suspend/resume and module
> reload? All very annoying indeed anyway.

I guess we would still need it for proper suspend and resume ordering
(but I never really worked on that part, so I'm not sure), but it's a
bit orthogonal to the issue here since those can be added after probe

Maxime

--xeh2a4js4i5wzele
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYQFbTQAKCRDj7w1vZxhR
xSEmAPwOxQqXDdghNM0po6K1BOfqhKogINFRlAFlP5KeBW1/NAEA2aO57tmIfUAX
GMjL4BMs5AuKDiq2tZVSX3PJcror+wg=
=fRPC
-----END PGP SIGNATURE-----

--xeh2a4js4i5wzele--
