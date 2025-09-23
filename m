Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD56B954E1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21FF10E0F2;
	Tue, 23 Sep 2025 09:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e7N6PqgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E0C10E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:45:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B1FA360203;
 Tue, 23 Sep 2025 09:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD32DC4CEF5;
 Tue, 23 Sep 2025 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758620752;
 bh=F9M0nCaoB2hujHNonYH+GW8C0tt9Z9Zca54kRKpXrWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e7N6PqgJ3KBALgJSFJS+mCAMfLaNchEROf9hbPnxw6FYIMLRrJgOOsdJ1EUL6Tsg7
 eHQJ6iTT3SPl2qjfZgFIPwXhYUQo1/0hN+vtEmpEV55S66+srMm+/h5KrLg7hE3Qhv
 jpHMV4M7ApZBLaxcRROkrJkycInr4RMAChbIp/Y6u0S+3gJDBx6vdsla3jevMeEeg0
 OMgVfmOBjWXOMXUiTuI5CwLg5taRwPLoRwoSWB+u3adF0ZQHgsuTAbM4mVSEiwjiIO
 EV9up7cem0OcEKpYPYw57Kcd1+KNme2Cy11WDjA7Vhxtw05WC520PXbUXlg4gHacK3
 h10dlycTlVSmw==
Date: Tue, 23 Sep 2025 11:45:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <20250923-rigorous-tamarin-of-cookies-2f1a25@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pzzstkbdyxc2j6ic"
Content-Disposition: inline
In-Reply-To: <zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x>
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


--pzzstkbdyxc2j6ic
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 09:40:57PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 10:32:38AM +0200, Maxime Ripard wrote:
> > In order to enable drivers to fill their initial state from the hardware
> > state, we need to provide an alternative atomic_reset helper.
> >=20
> > This helper relies on each state having its own atomic_state_readout()
> > hooks. Each component will thus be able to fill the initial state based
> > on what they can figure out from the hardware.
> >=20
> > It also allocates a dummy drm_atomic_state to glue the whole thing
> > together so atomic_state_readout implementations can still figure out
> > the state of other related entities.
> >=20
> > Link: https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5R=
a8CxPvJ=3D9BwmvfU-O0gg@mail.gmail.com/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 382 ++++++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/drm_mode_config.c   |   1 +
> >  include/drm/drm_atomic_helper.h     |   1 +
> >  include/drm/drm_bridge.h            |  21 ++
> >  include/drm/drm_connector.h         |  26 +++
> >  include/drm/drm_crtc.h              |  19 ++
> >  include/drm/drm_plane.h             |  27 +++
> >  7 files changed, 477 insertions(+)
> >=20
> > +	drm_for_each_encoder(encoder, dev) {
> > +		struct drm_connector_state *enc_conn_state;
> > +		struct drm_crtc_state *enc_crtc_state;
> > +		struct drm_bridge *bridge;
> > +
> > +		/*
> > +		 * It works a bit differently for bridges. Because they are
> > +		 * using a drm_private_state, and because
> > +		 * drm_atomic_private_obj_init() asks for its initial state when
> > +		 * initializing, instead of doing it later on through a reset
> > +		 * call like the other entities, we can't have reset xor
> > +		 * readout.
>=20
> Would it make sense to unify the way the bridges / priv_obj handle the
> state with the rest of the object types?

I would be all for it, but I think this is pretty much the same
conversation we had in my recent bridge improvement series. Aren't
bridges not assumed to have atomic support and thus we can't really do
something better here?

Or should we move all bridges to be atomic?

Maxime

--pzzstkbdyxc2j6ic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNJsTAAKCRAnX84Zoj2+
dpKWAYCEcJRa7+2tDeUz0y2h/VWhc6ILKt/pSvSoEUwyz3VdpHRGDOfCRVxIEUFE
EAEymiwBfR0dymG4bar7yy2532TPLF/3iQXZX5VD0gMrUGQ5CngXPYacZGW2NXHD
/NfI2CcdZw==
=5AuG
-----END PGP SIGNATURE-----

--pzzstkbdyxc2j6ic--
