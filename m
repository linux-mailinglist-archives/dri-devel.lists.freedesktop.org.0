Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50BC6A5F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEC510E4E5;
	Tue, 18 Nov 2025 15:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WwXFqbf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D90110E02C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:44:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA611434FF;
 Tue, 18 Nov 2025 15:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8B7C116D0;
 Tue, 18 Nov 2025 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763480651;
 bh=fPMobCdaL0FOBplLcMBrhnDqTORQkIgrmqJMrXuIO2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WwXFqbf3G8hm+/Hj8BtHUHFguYbM/9cxbGPe39D/4i2azDjf13+V5Z5EwBHqExQIk
 uCODL8v1HrEfc8QAD921ikF/MqxyBRTQ1w6XbK3ulD7WU0amFzvjpNJ+zW/G7muyJi
 9u24Kk6dyITjbgaIa/yX6t3GtLkaK4DWoeKvPW6jRj6JPqGw/GxEipSwo19k8Lh8uJ
 2p6lcuaTSs7ZrYgtu/5acJNbUvjhZiRwEImqQW15Xi1oselp+leq9BheD2qu6s5Ebh
 7yOEeMLN6pJLk2ffNwo/GBoO/oTem9ZP42HYgqPVw3uSk4Ryu9fWTgCbNO9MibgO1l
 WZ7TgO3lTnaww==
Date: Tue, 18 Nov 2025 16:44:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
Message-ID: <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="egvq5gtiq3uff7un"
Content-Disposition: inline
In-Reply-To: <20251118150128.GB23711@pendragon.ideasonboard.com>
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


--egvq5gtiq3uff7un
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> Hi Linus,
>=20
> Thank you for the patch.
>=20
> On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
> > This adds (yet another) variant of the
> > drm_atomic_helper_commit_tail_crtc_early_late() helper function
> > to deal with regressions caused by reordering the bridge
> > prepare/enablement sequence.
> >=20
> > commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> > "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> > caused a series of regressions in all panels that send
> > DSI commands in their .prepare() and .unprepare()
> > callbacks.
> >=20
> > As the CRTC is no longer online at bridge_pre_enable()
> > and gone at brige_post_disable() which maps to the panel
> > bridge .prepare()/.unprepare() callbacks, any CRTC that
> > enable/disable the DSI transmitter in it's enable/disable
> > callbacks will be unable to send any DSI commands in the
> > .prepare() and .unprepare() callbacks.
> >=20
> > However the MCDE driver definitely need the CRTC to be
> > enabled during .prepare()/.unprepare().
> >=20
> > This patch from Marek Vasut:
> > https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenes=
as%40mailbox.org/
> > solves part of the problem for drivers using custom
> > tail functions, since MCDE is using helpers only, we
> > add a new helper function that exploits the new
> > drm_atomic_helper_commit_modeset_enables_crtc_early()
> > and use that in MCDE.
> >=20
> > Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regressio=
n-v2-0-8d799e488cf9@linaro.org/
> > Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2=
Brenesas%40mailbox.org/
> > Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enab=
le and post-disable")
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 35 +++++++++++++++++++++++++++++=
++++++
> >  drivers/gpu/drm/mcde/mcde_drv.c     |  6 ++++--
> >  include/drm/drm_atomic_helper.h     |  1 +
> >  3 files changed, 40 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index eb47883be153..23fa27f21c4e 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -2005,6 +2005,41 @@ void drm_atomic_helper_commit_tail_rpm(struct dr=
m_atomic_state *state)
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
> > =20
> > +/**
> > + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update
>=20
> Based on the function name, it feels that the nem commit tail and
> modeset enable/disable helpers reached a point where we may want to
> reconsider the design instead of adding new functions with small
> differences in behaviour that will end up confusing driver developers.

Agreed, and I'd go even further than that: we don't want every odd order
in the core. And if some driver has to break the order we document in
some way it should be very obvious.

If you have a single user for all these new helpers variants, you
shouldn't be using the helpers at all. Go with a driver specific
implementation.

Maxime

--egvq5gtiq3uff7un
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRyUQgAKCRAnX84Zoj2+
dnY5AX9iZHY/r2tVzkrfThZnjfOczM7NRxE5jEcho5iiWb9htyjQkGm/EovpA9Su
VLbfXqgBgOZOpxB2C1cTz97QuQRbskUCkanBSs8nqjVeuq0QNyB9v7wb8vI4qkxP
Jw8dHysUfQ==
=2YbF
-----END PGP SIGNATURE-----

--egvq5gtiq3uff7un--
