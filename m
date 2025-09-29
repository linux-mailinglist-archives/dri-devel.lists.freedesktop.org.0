Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B72BA8691
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 10:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAED310E3BD;
	Mon, 29 Sep 2025 08:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YgQXE/8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0827E10E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 08:37:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DC5F662339;
 Mon, 29 Sep 2025 08:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA6BC4CEF4;
 Mon, 29 Sep 2025 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759135068;
 bh=8X3bC5ZmFeK58UgyyT40VVtc7YpFDCj89sUYr6xGYpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YgQXE/8lYz8HxcUWf/DvTXB3frvyCZbZYDYzLVlalKtpaeaJMX38S42Sk8GWgcLPl
 85Vemu2ljr7XuxypYb+JnuTc/o44e39r91uhZg6xIi3iEOkPvVC64pHAqNM6d22+CR
 sOPFn6QPTQ4nhvnTCOIU5iOLaSdrLTmlfpfwdHtjdLyIqwTx3W3kREXUmZl2wgZAFi
 TcKM/uAx3gvfIBYrw+uSqXi6cA4WEDuqiae8blfSIBZHZAVkrRvWAC4qChgaRS3kCo
 zRP0pOz1X2HltWHo45ARFOND2FSy3sL4cvYFhh5TSxgLdE54GFg+izWz5g07TUYPsZ
 uKItdcofgaIYg==
Date: Mon, 29 Sep 2025 10:37:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: bridge_connector: get/put the stored
 bridges
Message-ID: <20250929-cheerful-beagle-of-health-e40d38@houat>
References: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="y6znywc5jj6sunh2"
Content-Disposition: inline
In-Reply-To: <20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com>
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


--y6znywc5jj6sunh2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/display: bridge_connector: get/put the stored
 bridges
MIME-Version: 1.0

On Fri, Sep 26, 2025 at 04:59:40PM +0200, Luca Ceresoli wrote:
> drm_bridge_connector_init() takes eight pointers to various bridges, some
> of which can be identical, and stores them in pointers inside struct
> drm_bridge_connector. Get a reference to each of the taken bridges and put
> it on cleanup.
>=20
> This is tricky because the pointers are currently stored directly in the
> drm_bridge_connector in the loop, but there is no nice and clean way to p=
ut
> those pointers on error return paths. To overcome this, store all pointers
> in temporary local variables with a cleanup action, and only on success
> copy them into struct drm_bridge_connector (getting another ref while
> copying).
>=20
> Additionally four of these pointers (edid, hpd, detect and modes) can be
> written in multiple loop iterations, in order to eventually store the last
> matching bridge. However, when one of those pointers is overwritten, we
> need to put the reference that we got during the previous assignment. Add=
 a
> drm_bridge_put() before writing them to handle this.
>=20
> Finally, there is also a function-local panel_bridge pointer taken inside
> the loop and used after the loop. Use a cleanup action as well to ensure =
it
> is put on return.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> This series ensures the bridge-connector gets a reference to bridges when
> storing a pointer to them, and releases them afterwards.
>=20
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (=E2=9E=9C marks the current series):
>=20
>  1. =E2=9E=9C add refcounting to DRM bridges (struct drm_bridge)
>     (based on devm_drm_bridge_alloc() [0])
>     A. =E2=9C=94 add new alloc API and refcounting (v6.16)
>     B. =E2=9C=94 convert all bridge drivers to new API (v6.17)
>     C. =E2=9C=94 kunit tests (v6.17)
>     D. =E2=9C=94 add get/put to drm_bridge_add/remove() + attach/detach()
>          and warn on old allocation pattern (v6.17)
>     E. =E2=80=A6 add get/put on drm_bridge accessors
>        1. =E2=9C=94 drm_bridge_chain_get_first_bridge() + add a cleanup a=
ction
>             (drm-misc-next)
>        2. =E2=9C=94 drm_bridge_get_prev_bridge() (drm-misc-next)
>        3. =E2=9C=94 drm_bridge_get_next_bridge() (drm-misc-next)
>        4. =E2=9C=94 drm_for_each_bridge_in_chain() (drm-misc-next)
>        5. =E2=9E=9C drm_bridge_connector_init
>        6. protect encoder bridge chain with a mutex
>        7. of_drm_find_bridge
>        8. drm_of_find_panel_or_bridge, *_of_get_bridge
>     F. =E2=9E=9C debugfs improvements
>        1. =E2=9C=94 add top-level 'bridges' file (v6.16)
>        2. =E2=9C=94 show refcount and list removed bridges (drm-misc-next)
>  2. =E2=80=A6 handle gracefully atomic updates during bridge removal
>  3. =E2=80=A6 DSI host-device driver interaction
>  4. removing the need for the "always-disconnected" connector
>  5. finish the hotplug bridge work, moving code to the core and potential=
ly
>     removing the hotplug-bridge itself (this needs to be clarified as
>     points 1-3 are developed)
>=20
> This was tricky both because there is no central place in
> drm_bridge_connector.c to put the references on disposal (handled by patch
> 1) and because of the complex code flow of drm_bridge_connector_init()
> (handled by patch 2).
> ---
> Changes in v2:
> - Use drmm_add_action() instead of hacking the .destroy connector func
> - Removed patch 1 (where the hacking the .destroy connector func was)
> - Link to v1: https://lore.kernel.org/r/20250925-drm-bridge-alloc-getput-=
bridge-connector-v1-0-f0736e1c73ee@bootlin.com
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 114 +++++++++++++++++--=
------
>  1 file changed, 78 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index a5bdd6c1064399ece6b19560f145b877c9e0680e..7b18be3ff9a32b36246835183=
5bdab43c3f524f1 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -618,6 +618,20 @@ static const struct drm_connector_hdmi_cec_funcs drm=
_bridge_connector_hdmi_cec_f
>   * Bridge Connector Initialisation
>   */
> =20
> +static void drm_bridge_connector_put_bridges(struct drm_device *dev, voi=
d *data)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D (struct drm_bridge_co=
nnector *)data;
> +
> +	drm_bridge_put(bridge_connector->bridge_edid);
> +	drm_bridge_put(bridge_connector->bridge_hpd);
> +	drm_bridge_put(bridge_connector->bridge_detect);
> +	drm_bridge_put(bridge_connector->bridge_modes);
> +	drm_bridge_put(bridge_connector->bridge_hdmi);
> +	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
> +	drm_bridge_put(bridge_connector->bridge_dp_audio);
> +	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
> +}
> +

I'd rather have a drmm_bridge_get helper that register the action
itself, but that can be fixed later on.

Maxime

--y6znywc5jj6sunh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNpFVQAKCRAnX84Zoj2+
doXTAX9meJVNQ4dFu1UPbSaawaQf/e2082k1Xb0ZvZxVJb/jZAEp1G8zt7Uz2uK1
hLrWZ8sBfikzR76GKLnK1HRQ0ZG9GdohBppblHmZG7SGA0j0XRD7iySNPt4dhlbc
6zXhQbq9lQ==
=cdBZ
-----END PGP SIGNATURE-----

--y6znywc5jj6sunh2--
