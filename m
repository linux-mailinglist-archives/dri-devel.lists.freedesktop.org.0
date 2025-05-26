Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC102AC3EB1
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5DB10E334;
	Mon, 26 May 2025 11:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pJFjuVaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8358110E312
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 11:40:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8D664A0B2;
 Mon, 26 May 2025 11:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B43C4CEE7;
 Mon, 26 May 2025 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748259636;
 bh=vxSgngWl9gnGhX0npvsrxprdc7Jvm72yP3K4LAXX6sw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pJFjuVaPkGBt60tLL+zgwQmE/O7P1zecHrkQKYgONibcvm//hoxIXnh5aCo4gspO5
 DyCyp3dIapegeVOtkOtWZKxNZMFILe6SLWviTuaVJqlG5ceWihKdfkHjSGzL/xPy6H
 b2CRmk3aRVbXPXLS8V5q2GesiRQyUf3R3pKcLFSLsIR6BCqax9Y9e2hoj8eJwkcpPE
 IMQYu0vKQMPHa+pDXXV0OntReiHwGYB1ycqzal0bGJKKvfWRKeweiETgtQpwroaQnv
 uXiK+uSpj99r5uhsPRRLPpCpHq+20p126ZlQ4pQ6ag862m2VvO/lQ7lBad4jhwcoCe
 O5XnwKt5JmKnw==
Date: Mon, 26 May 2025 13:40:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
Message-ID: <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ngc7e6uwxftxta6k"
Content-Disposition: inline
In-Reply-To: <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
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


--ngc7e6uwxftxta6k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
MIME-Version: 1.0

On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
> Hi Laurent,
> Thanks for your comment.
>=20
> On 26/05/25 12:49, Laurent Pinchart wrote:
> > On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
> > > Hi Maxime,
> > > Thanks for your comment.
> > >=20
> > > On 26/05/25 11:26, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
> > > > > After adv7511_mode_set() was merged into .atomic_enable(), only t=
he
> > > > > native resolution is working when using modetest.
> > > > >=20
> > > > > This is caused by incorrect timings: adv7511_mode_set() must not =
be
> > > > > merged into .atomic_enable().
> > > > >=20
> > > > > Move adv7511_mode_set() back to the .mode_set() callback in
> > > > > drm_bridge_funcs to restore correct behavior.
> > > > >=20
> > > > > Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI con=
nector helpers")
> > > > > Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > >=20
> > > > Explaining why, both in the commit log and the comments, would be n=
ice.
> > > > Because I can't think of any good reason it just can't work for that
> > > > bridge.
> > >=20
> > > Sorry, let me clarify and share with you some details:
> > >=20
> > > adv7511_mode_set:
> > >    - Is setting up timings registers for the DSI2HDMI bridge in our c=
ase
> > >      we are using ADV7535 bridge.
> > >=20
> > > rzg2l_mipi_dsi_atomic_enable:
> > >    - Is setting up the vclock for the DSI ip
> > >=20
> > > Testing new/old implementation a bit we found the following:
> > >=20
> > > root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25=
@XR24
> > > setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> > > [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) =3D 56
> > > [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> > >=20
> > > root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25=
@XR24
> > > setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
> > > [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
> > > [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) =3D 56
> > >=20
> > > Same result but different timing (in function call perspective):
> > >=20
> > >    - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_ena=
ble()
> > >    - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enab=
le()
> >=20
> > What is "old" and "new" here ? Is it before and after Dmitry's patch, or
> > before and after yours ? Please be precise when describing problems.
>=20
> Sorry, you are completely right:
>=20
>  - old --> before Dmitry's patch
>  - new --> after Dmitry's patch
>=20
> >=20
> > > What do you think? Thanks in advance.
> >=20
> > You're only explaining above what the "old" and "new" behaviours are,
> > and claiming one of them is causing an issue, but you're not explaining
> > *why* it causes an issue. That's what your commit message is expected to
> > detail.
> >=20
>=20
> Thanks for the clarification! :)
> I will send v2 explaining better this.

In particular, if the driver needs to have mode_set called before
atomic_enable, you should say why moving the call to mode_set earlier in
the function wouldn't work.

Maxime

--ngc7e6uwxftxta6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDRTMQAKCRAnX84Zoj2+
du9CAX9Y9WPS9gncvYUIPLhN9tq3b1Zv/Z3RpZV4XCCngEkhpuxOKSgdRqRoH86a
mcKeKxgBgPeOj5NgqoIeNCoviXkYOJvEhc6eG4jQRqSI5yowBNxXxTy9vgvnjTdi
RiMl/4VOlQ==
=/a6n
-----END PGP SIGNATURE-----

--ngc7e6uwxftxta6k--
