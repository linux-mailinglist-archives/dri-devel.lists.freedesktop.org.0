Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED1AD3DA1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 17:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219E910E056;
	Tue, 10 Jun 2025 15:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qpKPn/hX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774EC10E056
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:42:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 71B53629F9;
 Tue, 10 Jun 2025 15:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98718C4CEF0;
 Tue, 10 Jun 2025 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749570122;
 bh=OCX+PMXOnofivFIKf5B4TrKIDiVPaorIpAV/YEeu6NA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qpKPn/hXTpMKHurpAOYuvdyFWF2RKykP22wfL62XAqvyfVhTvhhhMjdqLh86MKBzM
 JtDc746E9N3lbyUvO5In6rn6/5TGFozVl7pVSYHRPsJwz43uiPjAF3JUndZjDUveFS
 z8hqpNCY9qB2XTPAjvralMFelri/ZJ8VgM/WYYhXSxmSPMUVYRetzMTsT7s74pcmYt
 Eq/3qMMYZCHJw6AZtA0XRU4yPu0mItmnCjO8oM4aAwKcRnOH2xitVfbWl+khIC03wH
 WQvj/oWSLTyBY3dOQmsnDZNAdVDUQAGcSSzjtWkOsAicYMlI82HyyDlE3nioLc068R
 W4Flwz4eYubFw==
Date: Tue, 10 Jun 2025 17:41:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
Message-ID: <20250610-wildcat-of-marvelous-modernism-e4ce27@houat>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
 <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
 <20250606-radical-rigorous-buzzard-ca09cd@houat>
 <CAN9Xe3Si6XwsGOesNKOx9M8PjBkMG2paWXV5gvAnujWih6sqtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zwi57rvdrnu4faa3"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3Si6XwsGOesNKOx9M8PjBkMG2paWXV5gvAnujWih6sqtA@mail.gmail.com>
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


--zwi57rvdrnu4faa3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 10:45:35AM -0500, Anusha Srivatsa wrote:
> On Fri, Jun 6, 2025 at 7:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>=20
> > On Wed, Jun 04, 2025 at 10:45:11PM -0500, Anusha Srivatsa wrote:
> > > Put the panel reference back when driver is no
> > > longer using it.
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > index
> > 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de65=
7af7fd14388
> > 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct
> > mipi_dsi_host *host,
> > >                       dsi->out_bridge =3D ERR_PTR(-EINVAL);
> > >       }
> > >
> > > +     drm_panel_put(panel);
> > >       of_node_put(remote);
> > >
> > >       if (IS_ERR(dsi->out_bridge)) {
> >
> > Explaining in your commit log why you think it's a good idea to put it
> > there would be really nice. In particular, it looks super odd to me that
> > you would put the panel reference in attach.
> >
> > Also, your patch doesn't work, and you have a reference inbalance. You
> > have one taken by the panel driver, put in remove. You have one in
> > drm_panel_add, put in drm_panel_remove. Which reference do you put here?
> >
> > This applies to your other patches too.
>
> Yes, I should get the ref in of_drm_find_panel() to put it here. With
> that said, all callers of of_drm_find_panel() should be converted
> instead of the small batch that this series addresses.

Then do the of_drm_find_panel() conversion before, because here you will
free up the structure despite some callers still having a reference on
it.

Maxime

--zwi57rvdrnu4faa3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEhSRwAKCRAnX84Zoj2+
dhb2AXd6k/XL3u9/OK5zj97VWmDQziONGHEsb3bDL6hJZj6l6EtMtZ9IDIPocg8T
0UuXCwGA01sHkSg3AqDJPDYt8mzstpL8wcd8zKh9oy1niBidaedsQ6I+2mKYzaTS
VdThoLbe
=nzew
-----END PGP SIGNATURE-----

--zwi57rvdrnu4faa3--
