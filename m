Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559127825D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF506EC4E;
	Fri, 25 Sep 2020 08:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476056EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 08:14:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b12so1808175lfp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=bDllcyiSqhQXI1IZoFS1d9S0Z5j8kQBsPwOF+Baje8Q=;
 b=IfOVUaoG568RQbf51JeNswcgFGVQ1jyui5w7mvSP3mMt4h0sN4L9Y6r0sfUgzqC8AV
 SXgY+KEtFrdC+wyK+nR2indrX7DwJWvu9cOa0cKMWfv8BFkMeFBXPPe1sqMoai53Ibt5
 w1D1H7v42b+JeQKOLPkYdWwj3wizHQ+DTKDBpxPHiLJvXDLTxdRhQcvuVyWyKwuo9oE/
 CIvNBoDlLeHij2N5plTGmd8N2akctyue6IL2OksAampldL+ePgBotnLRbUZ2ahDEnhKS
 bYG6hbWWPAgiA430Orcglw2bTQKXXgNKfCJyaldNJPBkRFs8/VcrwkrGI+VHogzHIJcX
 Wv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=bDllcyiSqhQXI1IZoFS1d9S0Z5j8kQBsPwOF+Baje8Q=;
 b=b1GyNOT3SosVR7u8zI6+J/91FalBio+folxZQehwsatYbpV2NngDQM/sjFAxJKpGCr
 nPB6WDemTWNcii//M7fHChNN4eQjVWEW3RCIuReBo3nKouAsNoVfMQFrUnzAj1VAX8Xz
 K2/VQJymoBmfn+MCk/xtHdE3ijjm9CPGi1f1B2rS8GwQ6C+f+RLzkWqJrbh8mDAlBfKL
 tMoAH0s6pjdkotyQL9C5WXbOrE4O6keKAltjcNSUUuyucMbjfNXVaVy/RbxM0Cxyz76v
 Klbs95DIcRRxMC4x7dCQj7XljcS8H7XbiWy0rwLPYfYrG6XbBACzUyhzRI5PnLDP9gBO
 xIqA==
X-Gm-Message-State: AOAM53059F9YtYtEMztdYKM8TbPVscTsXK0aDMbuxggCzLeeV7ppxng1
 OWBLDrNKnpneMFwOfjFdgyE=
X-Google-Smtp-Source: ABdhPJyL0AzUNmC02jLlNoXs7ZZGS9bXvwncsswO6bNrzf0tbChKELfgDNnNyC0W/YTQ5snmREHG5g==
X-Received: by 2002:a19:7fc8:: with SMTP id a191mr898706lfd.591.1601021656648; 
 Fri, 25 Sep 2020 01:14:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v10sm1755230lji.128.2020.09.25.01.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:14:16 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:14:12 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/5] drm/omap: use degamma property for gamma table
Message-ID: <20200925111412.0982cb76@eldfell>
In-Reply-To: <20200923115727.248705-3-tomi.valkeinen@ti.com>
References: <20200923115727.248705-1-tomi.valkeinen@ti.com>
 <20200923115727.248705-3-tomi.valkeinen@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0881764366=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0881764366==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mewE.XEeQBAtUFg.21j4._a"; protocol="application/pgp-signature"

--Sig_/mewE.XEeQBAtUFg.21j4._a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2020 14:57:24 +0300
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> omapdrm supports gamma via GAMMA_LUT property. However, the HW we have
> is:
>=20
> gamma -> ctm -> out
>=20
> instead of what the model DRM framework uses:
>=20
> ctm -> gamma -> out
>=20
> As the following patches add CTM support for omapdrm, lets first fix the
> gamma.
>=20
> This patch changes the property from GAMMA_LUT to DEGAMMA_LUT, and uses
> drm_atomic_helper_legacy_degamma_set for gamma_set helper. Thus we will
> have:
>=20
> degamma -> ctm -> out
>=20
> and the legacy ioctl will continue working as before.
>=20

Makes sense to me:

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> ---
>  drivers/gpu/drm/omapdrm/omap_crtc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdr=
m/omap_crtc.c
> index 328a4a74f534..6116af920660 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -573,8 +573,8 @@ static int omap_crtc_atomic_check(struct drm_crtc *cr=
tc,
>  {
>  	struct drm_plane_state *pri_state;
> =20
> -	if (state->color_mgmt_changed && state->gamma_lut) {
> -		unsigned int length =3D state->gamma_lut->length /
> +	if (state->color_mgmt_changed && state->degamma_lut) {
> +		unsigned int length =3D state->degamma_lut->length /
>  			sizeof(struct drm_color_lut);
> =20
>  		if (length < 2)
> @@ -614,10 +614,10 @@ static void omap_crtc_atomic_flush(struct drm_crtc =
*crtc,
>  		struct drm_color_lut *lut =3D NULL;
>  		unsigned int length =3D 0;
> =20
> -		if (crtc->state->gamma_lut) {
> +		if (crtc->state->degamma_lut) {
>  			lut =3D (struct drm_color_lut *)
> -				crtc->state->gamma_lut->data;
> -			length =3D crtc->state->gamma_lut->length /
> +				crtc->state->degamma_lut->data;
> +			length =3D crtc->state->degamma_lut->length /
>  				sizeof(*lut);
>  		}
>  		priv->dispc_ops->mgr_set_gamma(priv->dispc, omap_crtc->channel,
> @@ -738,7 +738,7 @@ static const struct drm_crtc_funcs omap_crtc_funcs =
=3D {
>  	.set_config =3D drm_atomic_helper_set_config,
>  	.destroy =3D omap_crtc_destroy,
>  	.page_flip =3D drm_atomic_helper_page_flip,
> -	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
> +	.gamma_set =3D drm_atomic_helper_legacy_degamma_set,
>  	.atomic_duplicate_state =3D omap_crtc_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
>  	.atomic_set_property =3D omap_crtc_atomic_set_property,
> @@ -839,7 +839,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *de=
v,
>  	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
>  		unsigned int gamma_lut_size =3D 256;
> =20
> -		drm_crtc_enable_color_mgmt(crtc, 0, false, gamma_lut_size);
> +		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, false, 0);
>  		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
>  	}
> =20


--Sig_/mewE.XEeQBAtUFg.21j4._a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9tptQACgkQI1/ltBGq
qqdMYQ//SVaHwVc51QSH1nfA8jZs01gNusyOqa8WRucMyeFCTUi4OYItL1vPHJ1z
r9XXkH3YauJwTIiAI8KIRUqhSl8IutMZ5DIZ4dHXisgwuOffUycy5fxGSli6c4tZ
i3VhYo5rEEZxSv3s0NJbOdO36dKVUGPQWIv0Vvxb7Ey99BWdpIfQw5BOBMDiUmIo
F8yNutxck1+gHkQTHh3Noh+injCPYcZ0AtXjaktM2ONZV92MXZwVOs3Itnsxk1RH
GKhNxULrKVyUSsb+F51q3hkzR0H7pBWcD3zPSvkgk1cPjbJyqtxfR0PT6C45dYVS
ksq0AhQpjeRmsG2vqxywDO5Vo/3R9hQ7A7j6rp/I9OF59kkNvkTFM5VZ3Gmr3Ijt
U5WWvoZIX2adoc0T8mB54QfBiT0cm64KXTMWrUEsL9k9CFFVJNc+hcip+bprNhrg
jCoQHUaviWYS2/mbuGzSZ0iE9QaIma76UylBcEgj0qQfb5dpEdNDO/ZPsDixoL12
qAe7Sv7iBMoykRhgYXsgOqanRoVwUd0HQ6g4DwHknJymOhBhDTp1vfHt+KJjZKTD
7O/lBfnt2MAaYTHdMqXzb9RcgrlocA7pWYcKLqW/Lz8oIyfMLMWIRcDpO9WEI5Md
Ws3DvPCl/Sj/9dyQUEfry/ORo+gztyNdgxE4zLjPbLjuUcJFAtg=
=7Q1A
-----END PGP SIGNATURE-----

--Sig_/mewE.XEeQBAtUFg.21j4._a--

--===============0881764366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0881764366==--
