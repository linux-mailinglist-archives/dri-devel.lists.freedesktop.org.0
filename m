Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7E39D65C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8A988A56;
	Mon,  7 Jun 2021 07:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC3388A56;
 Mon,  7 Jun 2021 07:52:39 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z22so4953805ljh.8;
 Mon, 07 Jun 2021 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=VnwLRNd5kR0LUPEcbUD7x6J+EfFd1ZumEapw+492kUI=;
 b=M6YHQmqDQrHfqJsSaBCfrOSFeYuAx/4Wuvxqxfz55b1SM2edz/SvDqQXdLIzSnXa//
 Pmy+lXBSk4AVN0Ua2/qwhB/5yWuvGtiQdGZnG1ZrTghgDXGH8W/pC6UPS+ZnP5yu4ocG
 ZLj3bhWthn4w9J7LzPEyEuqZzaVSXUb9NrSsVMcW7s4i++gu2GoyImrsXh/lJFkNj+k8
 lvLBTozTgdtSUrDcQQ+xF7yxIBLY4noTaY5vHWPsjSuOfDo2UIvVYpJEhUILYE5YpNzC
 aCwzGGPoRoyyWSFmzpxalQLHJAFZLr/mag5V6p8Sn90DdYx6D24J3AWODazxugWCsemb
 e4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=VnwLRNd5kR0LUPEcbUD7x6J+EfFd1ZumEapw+492kUI=;
 b=slXaj4uzP0KKqwyGZ0an3+fWoYPjOw5RgxxDHJ/IgToIXWRR8aJ6fTAB/xdqOIwYkl
 OUt2UwHDa87RS+p0OlEC3Dr9MR+iSxbIfobmhbF9dXvtNekdvaSNhoGrVlvaLqFR+L/8
 l0bVs05LMD2jGwQFQXCuEY852s3qvR99EXNnUrbheYIoORlWfBWTWtUuiaofrYrsiglH
 X2vaC3gp6BBvMENv3/J3RJ37BLgio+vGhjPw7ekF8GtEH4lca1DBHz8cBOl+POuNo4kX
 CRiAhhsw1H2MRT6YSJ664xZY09jhnlj2GfHfB9gvMSSK3GsuaRTOpVLh0xnjtlxS5/qU
 /lqg==
X-Gm-Message-State: AOAM5326O9usy2D7lxU56nYxQq7RPVmYf2tz5sFpEwfLn+IuZQT9xEMB
 wB/hQU5cFjObAPm4RGJXnAM=
X-Google-Smtp-Source: ABdhPJz+lZIAtnEawBFkr/CaeDTWVqXJP2b4seJMifEs5d4X8i1rjyEr38elPNLJqEl0HLg7HjyMPQ==
X-Received: by 2002:a05:651c:1138:: with SMTP id
 e24mr13811331ljo.403.1623052357820; 
 Mon, 07 Jun 2021 00:52:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e9sm896925lfc.144.2021.06.07.00.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 00:52:37 -0700 (PDT)
Date: Mon, 7 Jun 2021 10:52:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH 2/4] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
Message-ID: <20210607105234.4bb8aae6@eldfell>
In-Reply-To: <20210604171723.10276-3-wse@tuxedocomputers.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-3-wse@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Pr+2/0V=PQE=VGC=tSRkY=f"; protocol="application/pgp-signature"
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
Cc: amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 intel-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, rodrigo.vivi@intel.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Pr+2/0V=PQE=VGC=tSRkY=f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  4 Jun 2021 19:17:21 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Add a new general drm property "active bpc" which can be used by graphic =
drivers
> to report the applied bit depth per pixel back to userspace.
>=20
> While "max bpc" can be used to change the color depth, there was no way t=
o check
> which one actually got used. While in theory the driver chooses the best/=
highest
> color depth within the max bpc setting a user might not be fully aware wh=
at his
> hardware is or isn't capable off. This is meant as a quick way to double =
check
> the setup.
>=20
> In the future, automatic color calibration for screens might also depend =
on this
> information available.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
>  drivers/gpu/drm/drm_connector.c   | 40 +++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h       | 15 ++++++++++++
>  3 files changed, 57 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 268bb69c2e2f..7ae4e40936b5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D 0;
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		*val =3D state->max_requested_bpc;
> +	} else if (property =3D=3D connector->active_bpc_property) {
> +		*val =3D state->active_bpc;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 7631f76e7f34..5f42a5be5822 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1195,6 +1195,13 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * active bpc:
> + *	This read-only range property is used by userspace check the bit depth
> + *	actually applied by the GPU driver after evaluation all hardware
> + *	capabilities and max bpc. Drivers to use the function
> + *	drm_connector_attach_active_bpc_property() to create and attach the
> + *	property to the connector during initialization.
> + *

Hi Werner,

the idea looks good to me, but the above doc could be a little more
fluent. May I suggest something like:

	This read-only range property tells userspace the pixel color
	bit depth actually used by the hardware display engine on "the
	cable" on a connector. The chosen value depends on hardware
	capabilities, both display engine and connected monitor, and
	the "max bpc" property. Drivers shall use
	drm_connector_attach_active_bpc_property() to install this
	property.

There should also be something said about dithering done by the display
engine (not monitor), but I'm not sure how that should be worded. It
may also depend on if and how userspace can know about dithering. So if
a dithering related property is added later, maybe add a note here too
in that patch.


Thanks,
pq


>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2150,6 +2157,39 @@ int drm_connector_attach_max_bpc_property(struct d=
rm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> =20
> +/**
> + * drm_connector_attach_active_bpc_property - attach "active bpc" proper=
ty
> + * @connector: connector to attach active bpc property on.
> + * @min: The minimum bit depth supported by the connector.
> + * @max: The maximum bit depth supported by the connector.
> + *
> + * This is used to check the applied bit depth on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor,
> +					  int min, int max)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D connector->active_bpc_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_range(dev, 0, "active bpc", min, max);
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_bpc_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +	connector->state->active_bpc =3D 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
> +
>  /**
>   * drm_connector_set_vrr_capable_property - sets the variable refresh ra=
te
>   * capable property for a connector
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1922b278ffad..c58cba2b6afe 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -781,6 +781,13 @@ struct drm_connector_state {
>  	 */
>  	u8 max_bpc;
> =20
> +	/**
> +	 * @active_bpc: Read only property set by the GPU driver to the actually
> +	 * applied bit depth of the pixels after evaluating all hardware
> +	 * limitations.
> +	 */
> +	u8 active_bpc;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1380,6 +1387,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
> =20
> +	/**
> +	 * @active_bpc_property: Default connector property for the active bpc
> +	 * to be driven out of the connector.
> +	 */
> +	struct drm_property *active_bpc_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -1698,6 +1711,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>  	int width, int height);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connecto=
r,
>  					  int min, int max);
> +int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor,
> +					  int min, int max);
> =20
>  /**
>   * struct drm_tile_group - Tile group metadata


--Sig_/Pr+2/0V=PQE=VGC=tSRkY=f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC90EIACgkQI1/ltBGq
qqdGCQ//cRerWSb24BlhxlzYGB8NQvHZrLXOSiGRs2viHwBP913JnXJGRViEDx5x
clhIXqdHwsmh+ezmYxHhAgi6lrgNhCr+9MBkLqhX5YbHmXdwSzQBWezRibzXjbYW
KeTvPx0z8Nvh3ViRHcb/dd4LcXflp7Ii9ksSW2avNktSJR7EZu6o+krZxTuOgKmx
nOWXVqxEwTcLDxp/ubDbEEOTvaaYyQVpGa3wSuyOVuW4ea4i/cm9Ax+N2f0/aHCH
Bj0F9S2qYNgGTDpGSm3myipPx2Lqd/teEqiEXH+Gxr6+vI8V+cfZz/xjoe0Ko84b
2BEuD3t22bDLSlC6C214virxbxV7R5fWRD72XfyDmDJrILVBWV2b2ftG9pKbS4GE
hJSbYs8eRS44o7RplbFYrJMVRf7DK3k/l8H9kpasLG36GxRMvaVtSCgrZLUBnCEb
gMKcqvf824YjA7FWFEAASHr0lDbroSxGuzxU8Ts2wYLyuK6PCvXv9TDwc3tcMB94
zhB3rToba+3Rmw+/lSLwp85EyHvtRTV/OrJMAZASLRVJs/mMsYCWupW1783Ueh4L
tvRnZ/MBz48DoZpYo3bOLySG4Nb7jhGgjmYI6I9huWXHUuBcknGf4oFn7cwPXFR2
3IOghkwAL3prSMIz80cfPeLBg7ahq2zA6C8KGj1xLU8IOST/knU=
=6CeT
-----END PGP SIGNATURE-----

--Sig_/Pr+2/0V=PQE=VGC=tSRkY=f--
