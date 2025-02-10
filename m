Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B9A2EC7F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 13:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A1710E506;
	Mon, 10 Feb 2025 12:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IM7scVdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D4E10E504
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 12:31:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A246FA412B9;
 Mon, 10 Feb 2025 12:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69938C4CED1;
 Mon, 10 Feb 2025 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739190692;
 bh=teK4ttYOMlWq8tq2UiLPoCPI2lhY9ZNw14S8VUBzkF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IM7scVdBK/YoxQXWdz4vMVPrjsEedMZzOkn3yM3sFHloHvp+F/Cfp4zn4FNyGAckh
 2zwIKnYXmnmDMI81dKsmTZp2OhNargnEkEQ1exTzXlHV1Tu+F5yg7087aQorHrlGdK
 +Gl8DJThc35ntFiR0F36SJZL7b6XAmOt5sttil4U0/iret59qdI5nkGtNWnYc76qZ1
 QWZKVdNTAr6T338TKMHkjFvbqevdRmft01XOttquqPBVps3du4Z7sy+jqXK0TIuY2w
 SpgL6/vkEUJXp3CmEw/VDH6YeTggXvlowVI++laevGKOATyD3nu+9ELbiLRC0l3cCf
 RSfIfhJJ/hR9g==
Date: Mon, 10 Feb 2025 13:31:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250210-bold-steel-collie-cecbad@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="h3r7ypzcsxjmsmg3"
Content-Disposition: inline
In-Reply-To: <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
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


--h3r7ypzcsxjmsmg3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > > DRM bridges are currently considered as a fixed element of a DRM card=
, and
> > > thus their lifetime is assumed to extend for as long as the card
> > > exists. New use cases, such as hot-pluggable hardware with video brid=
ges,
> > > require DRM bridges to be added and removed to a DRM card without tea=
ring
> > > the card down. This is possible for connectors already (used by DP MS=
T), so
> > > add this possibility to DRM bridges as well.
> > >=20
> > > Implementation is based on drm_connector_init() as far as it makes se=
nse,
> > > and differs when it doesn't. A difference is that bridges are not exp=
osed
> > > to userspace, hence struct drm_bridge does not embed a struct
> > > drm_mode_object which would provide the refcount. Instead we add to s=
truct
> > > drm_bridge a refcount field (we don't need other struct drm_mode_obje=
ct
> > > fields here) and instead of using the drm_mode_object_*() functions we
> > > reimplement from those functions the few lines that drm_bridge needs =
for
> > > refcounting.
> > >=20
> > > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcou=
nted
> > > bridge.
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >=20
> > So, a couple of general comments:
> >=20
> > - I've said it a couple of times already, but I really think you're
> >   making it harder than necessary for you here. This (and only this!)
> >   should be the very first series you should be pushing. The rest can
> >   only ever work if that work goes through, and it's already hard enough
> >   as it is. So, split that patch into a series of its own, get that
> >   merged, and then we will be able to deal with panels conversion and
> >   whatever. That's even more true with panels since there's ongoing work
> >   that will make it easier for you too. So the best thing here is
> >   probably to wait.
>=20
> Luca and I had a quick chat on this during FOSDEM. I really think that
> panel (part of the) series can go in first as it fixes a very well known
> bug _and_ allows a pretty good cleanup to a whole set of drivers.

I don't necessarily disagree on principle, but if you state that it can
get first, and fixes a known problem (which one?), then it should be a
separate, standalone, series.

Ever-expanding features are bad for both the reviewers and the
contributors, even more so when the discussion happens off-list.

> With all those panel / bridge wrappers gone we should be able to see a
> clearer picture of what individual drivers are doing. In other words,
> which memory and which code actually hosts and uses internal
> 'next_bridge' reference.
>=20
> > - This patch really needs to be split into several patches, something
> >   along the lines of:
> >=20
> >   + Creating devm_drm_bridge_alloc()
> >   + Adding refcounting
> >   + Taking the references in all the needed places
> >   + Converting a bunch of drivers
>=20
> The last two parts seem troublematic to me, but, I must admit, I didn't
> spend so much time reviewing all drm_bridge usage patterns.

Why? the third one is already done by that patch, the fourth can
relatively easily be done using coccinelle.

Maxime

--h3r7ypzcsxjmsmg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6nxmgAKCRAnX84Zoj2+
dgAAAYD1zo9jws+jFwyoujUMoXvo7uqOZL/9OK/s0i3cA8pEq+cLx/HKCQF3NN9l
sJ5kBOYBf2gBZ4AIQPwr2cf1FpfD0FsbxKZRGHTMQuNOS/9mZhrWytOQgkQ29ihv
bB/Hs5n12w==
=CoCR
-----END PGP SIGNATURE-----

--h3r7ypzcsxjmsmg3--
