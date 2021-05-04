Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0882372B31
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680C86EB09;
	Tue,  4 May 2021 13:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365C6EADB;
 Tue,  4 May 2021 13:39:08 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id w15so9821103ljo.10;
 Tue, 04 May 2021 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=2yIbFjPkWuW8wS+b8UtMbXrEWc3cRq2xFdr5elk3jX8=;
 b=iHfYoLq+Io7uFMNuM9P+1dkunVofFhYXMUtIPkMKGw0+ZtVWOE3Ct8udXker/DZPRK
 +YQWH5zoWE6NISsQgECRi2Xq87GlKCiH3dAeaPnAK4hn2EBCPed6uprM6hmpu0/F/bOO
 90QKSFq5g5P/30T4b9UXq0uSudolVrZUayjBvS0ye9VnsOis35661B1+y4U5qzF6OKFU
 5t/bTuM1jSCmZ8GjgL18kXGiHCRphX1C7B/8IikyoWeFTsAFQUaLB5QvR2VoMofRnWFn
 BYGEg5wh1lcvisOt9pL5kQu0jOtQwz27VM8eOAK68r0Mms9W3yF0mVgarzH9Y+yIIh0i
 vorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2yIbFjPkWuW8wS+b8UtMbXrEWc3cRq2xFdr5elk3jX8=;
 b=YcnhIGZs3DxmoSKEPx8YXXMYag7e/MeZRhT1LwWIsN2is0UdsVNt9JON79XlCy0O5a
 9ACCgF/F8l2Mn590xEuHgtIfEDw0UlxSfA4ZSobKIT7W+gM1IdXvHVumHEgrilsqg89+
 o4UylBDTuSUGut4UVXKVeljNuJo7qujSKPMQxwCxKdg/c41p+7qczalK/spOXf83kd6w
 k7uo06z9Q0Iz7f3o7Axle9TC7r8mDrC99jw7V0S1V6r7sYz3J1ZABJdqPMaL6+LbIV61
 01MFgy5xbNmne52X510MphBEJtgm6DNp3IZUUExJ2nyimXQPgRa+qfJru77c2+jz1fwO
 vUgw==
X-Gm-Message-State: AOAM533pi0sQemr76bLeEn7e1B5o6yLSsPnVY3RBo/cVwkU7mawiCc8K
 +J2iibkc9eoLg+SGR35Ww3o=
X-Google-Smtp-Source: ABdhPJxCOIYneeM1bAB28sEljHivDQz4oRh5DKW6HC8/klr1Lsp6r7x3wKVA5M8v1f7Qp/msK/2YdQ==
X-Received: by 2002:a05:651c:319:: with SMTP id
 a25mr16794930ljp.69.1620135547102; 
 Tue, 04 May 2021 06:39:07 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d25sm269200lfs.235.2021.05.04.06.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:39:06 -0700 (PDT)
Date: Tue, 4 May 2021 16:38:54 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 8/8] drm/modifiers: Enforce consistency between the cap
 an IN_FORMATS
Message-ID: <20210504163854.5b7b853c@eldfell>
In-Reply-To: <20210427092018.832258-8-daniel.vetter@ffwll.ch>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
 <20210427092018.832258-8-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0809146388=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0809146388==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e2f=K/.ysQBY/duKREquXSE"; protocol="application/pgp-signature"

--Sig_/e2f=K/.ysQBY/duKREquXSE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Apr 2021 11:20:18 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> It's very confusing for userspace to have to deal with inconsistencies
> here, and some drivers screwed this up a bit. Most just ommitted the
> format list when they meant to say that only linear modifier is
> allowed, but some also meant that only implied modifiers are
> acceptable (because actually none of the planes registered supported
> modifiers).
>=20
> Now that this is all done consistently across all drivers, document
> the rules and enforce it in the drm core.
>=20
> v2:
> - Make the capability a link (Simon)
> - Note that all is lost before 5.1.
>=20
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Cc: Simon Ser <contact@emersion.fr>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_plane.c   | 18 +++++++++++++++++-
>  include/drm/drm_mode_config.h |  2 ++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 0dd43882fe7c..20c7a1665414 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -128,6 +128,13 @@
>   *     pairs supported by this plane. The blob is a struct
>   *     drm_format_modifier_blob. Without this property the plane doesn't
>   *     support buffers with modifiers. Userspace cannot change this prop=
erty.
> + *
> + *     Note that userspace can check the &DRM_CAP_ADDFB2_MODIFIERS driver
> + *     capability for general modifier support. If this flag is set then=
 every
> + *     plane will have the IN_FORMATS property, even when it only suppor=
ts
> + *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there hav=
e been
> + *     various bugs in this area with inconsistencies between the capabi=
lity
> + *     flag and per-plane properties.
>   */
> =20
>  static unsigned int drm_num_planes(struct drm_device *dev)
> @@ -277,8 +284,14 @@ static int __drm_universal_plane_init(struct drm_dev=
ice *dev,
>  			format_modifier_count++;
>  	}
> =20
> -	if (format_modifier_count)
> +	/* autoset the cap and check for consistency across all planes */
> +	if (format_modifier_count) {
> +		WARN_ON(!config->allow_fb_modifiers &&
> +			!list_empty(&config->plane_list));
>  		config->allow_fb_modifiers =3D true;
> +	} else {
> +		WARN_ON(config->allow_fb_modifiers);
> +	}
> =20
>  	plane->modifier_count =3D format_modifier_count;
>  	plane->modifiers =3D kmalloc_array(format_modifier_count,
> @@ -360,6 +373,9 @@ static int __drm_universal_plane_init(struct drm_devi=
ce *dev,
>   * drm_universal_plane_init() to let the DRM managed resource infrastruc=
ture
>   * take care of cleanup and deallocation.
>   *
> + * Drivers supporting modifiers must set @format_modifiers on all their =
planes,
> + * even those that only support DRM_FORMAT_MOD_LINEAR.
> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index ab424ddd7665..1ddf7783fdf7 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -909,6 +909,8 @@ struct drm_mode_config {
>  	 * @allow_fb_modifiers:
>  	 *
>  	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
> +	 * Note that drivers should not set this directly, it is automatically
> +	 * set in drm_universal_plane_init().
>  	 *
>  	 * IMPORTANT:
>  	 *

I can only say about the doc parts, but:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

For patches 2 and 5 too, on the grounds that the idea is good.


Thanks,
pq

--Sig_/e2f=K/.ysQBY/duKREquXSE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCRTm4ACgkQI1/ltBGq
qqemqw//RXpj1TMJzJQBmA3p/jR23ByhoqEcQTI1RnYX2kEA0jFB3oYQ5cbjByUw
JmnsInKOhFFvK8bhkUz9EJKGF0UgYTw9ujc9NEpW9YU50tW240HbJM5rDoovQt4Q
xvd64UJ4kE5sXJOwWrhfJsJCmcmMi+nYGC3I7MN886XlyeQzKzfWazqysdaPfa96
xf9pi0qa/ZUuBcJeBF3qDeIJVzyTmxWRafnzVqw7J4cHRunF6uFQurT91MAcTeab
IOyPAcMVE5WnQFDo38rtkUoKjFkXDNmo/KOLga1yzicg+56N6SIbmogHyDOAbYjs
gikDSKCOBT86zJa6uwHKcV+Ngfsw/j196eErK4Zxj6ffvqLTWhQ5oAV1Af1HApYb
mokbmhpdImZJtYCnRIxCgjGGkxRPP3syScGQSHI+pQgOuJiQIDzmju6jFis0mkPU
zo4GV98zu17qEM/IyfPu2WkDhZP6mBvWbyHLe1cpMfRqHgqnQ3MrAPXLNSdRxihV
c8jIrSMg7aPU+jUOd3RzAjihsZqgpiYJKdfiRs4mjAmDUhO6ZMlpTLWMLk4kQApa
Xpe9Xtgsq7NuX6UEX0O5Yyo0Ma2TocSaunzdkGiVhRR9pb7Eolpl7uv6X6c8mUmZ
JsjPWaBXYKHzFjVSngaZWp8shE8mV8AytgttqIQPImQuGB3G5FY=
=xQSr
-----END PGP SIGNATURE-----

--Sig_/e2f=K/.ysQBY/duKREquXSE--

--===============0809146388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0809146388==--
