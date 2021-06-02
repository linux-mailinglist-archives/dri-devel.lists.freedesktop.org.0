Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0B3984D7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B3F6EC01;
	Wed,  2 Jun 2021 09:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6F96EC00;
 Wed,  2 Jun 2021 09:03:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j10so2192988lfb.12;
 Wed, 02 Jun 2021 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=PZ04IKgINdjuS/RIIl9cv7ohmscLQb+7So1jaLlkEe4=;
 b=s93UveRRfEUttHPB2R2aMhmrZz0Ywz1eH1d6vcQ4MmGmpgqfxwXr04PCC010wLZll2
 9SkdCjMKsH5LdcnV8RNykzNUWrE1Z5Lurv5ikr3woIkJkJcYFrbE9SKQNoBr6dA+IA1L
 t1W4rD/wAboOWgTEM/zcZrb+tNvNM9pb9PCm9ShenFibTFgIXtN+HJGp/Qc1eKmABQhZ
 jeOxMxAtPatCaJncKucXaYc7gbXvjpkEHSq4nPcBR5rljKQug6gpNTW5mTvNIF1ZtMSh
 b8EiZSuxSEuSeT4/q3Ag6qjcjNTdNzmAIpuoUlM+hdSRQRZXsQKTHgGVgAheSKjverYT
 40UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PZ04IKgINdjuS/RIIl9cv7ohmscLQb+7So1jaLlkEe4=;
 b=bmOAZ1ubeuSs6EWLSmWM8Co663JAudxVmJ6ZsNa+nZf0Arg2pZa7azebvv1yo04dI/
 HjbVqFXBWNVqnYKxcLipiQJ7GxJB4mgncoVPUouVIY5UZvpZw2JQsOH1xg6v3T6VdN+5
 gAhcw+htgsbGRiPJ+lnvC75PR/hNIQr5Qv3VUc1OvHUxksrebWkhtjkt9VC3Rg61MwqT
 Qs8o54lE77Yq3N2GHJwCL+OQnsUIvLrCcQQkpnCplbnPOyashIilGCk2n25AlO9izU2/
 61RTVP9g98p9UaLKa9HGIrLm+KmZPfZTsXFUnj6nKhRzHmV00VnTWyEZiAA8RGScPEjs
 9CHg==
X-Gm-Message-State: AOAM533Lx+LwYNeozliOD4MRtarQjCtRtSh+CqVoEnoruFc4UvT/cH4+
 yJq25EbCotEKZaamWq78lt4=
X-Google-Smtp-Source: ABdhPJxQFcvAMYxA2jxqNYLeAuXyB91b4OYAFukOiu5Qj+QvLBJr0S0UmQrrrxOF3ZwQF3t4d33JFA==
X-Received: by 2002:a05:6512:3684:: with SMTP id
 d4mr21608812lfs.90.1622624629512; 
 Wed, 02 Jun 2021 02:03:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s8sm2278937ljg.89.2021.06.02.02.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:03:49 -0700 (PDT)
Date: Wed, 2 Jun 2021 12:03:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 5/9] drm: Add Client Cap for advance gamma mode
Message-ID: <20210602120328.6ad60a2e@eldfell>
In-Reply-To: <20210601104135.29020-6-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <20210601104135.29020-6-uma.shankar@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ETnLTaDB4IUQhdxeuQ0WIwW"; protocol="application/pgp-signature"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ETnLTaDB4IUQhdxeuQ0WIwW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  1 Jun 2021 16:11:31 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> Introduced a client cap for advance cap mode capability. Userspace

Typo: "cap mode" should be "gamma mode"?

> should set this to get to be able to use the new gamma_mode property.
>=20
> If this is not set, driver will work in legacy mode.
>=20
> Note: This is suggested by Ville and based on his idea, the new
> gamma mode handling is designed.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
>  drivers/gpu/drm/drm_ioctl.c       | 5 +++++
>  include/drm/drm_atomic.h          | 1 +
>  include/drm/drm_crtc.h            | 8 ++++++++
>  include/drm/drm_file.h            | 8 ++++++++
>  include/uapi/drm/drm.h            | 8 ++++++++
>  6 files changed, 33 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index a5470a0ebbe6..7ee35bc14455 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1036,6 +1036,8 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>  			break;
>  		}
> =20
> +		crtc_state->advance_gamma_mode_active =3D
> +					state->advance_gamma_mode_active;
>  		ret =3D drm_atomic_crtc_set_property(crtc,
>  				crtc_state, prop, prop_value);
>  		break;
> @@ -1372,6 +1374,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
>  	state->acquire_ctx =3D &ctx;
>  	state->allow_modeset =3D !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
> +	state->advance_gamma_mode_active =3D file_priv->advance_gamma_mode_acti=
ve;
> =20
>  retry:
>  	copied_objs =3D 0;
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 53d314103a37..d51f72213882 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -361,6 +361,11 @@ drm_setclientcap(struct drm_device *dev, void *data,=
 struct drm_file *file_priv)
>  			return -EINVAL;
>  		file_priv->writeback_connectors =3D req->value;
>  		break;
> +	case DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES:
> +		if (req->value > 1)
> +			return -EINVAL;
> +		file_priv->advance_gamma_mode_active =3D req->value;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index ac5a28eff2c8..5a398a249c80 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -379,6 +379,7 @@ struct drm_atomic_state {
>  	 * states.
>  	 */
>  	bool duplicated : 1;
> +	bool advance_gamma_mode_active : 1;

"advance" is a verb. Did you mean "advanced"?


>  	struct __drm_planes_state *planes;
>  	struct __drm_crtcs_state *crtcs;
>  	int num_connector;
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 5a594f134a81..f4339fbad086 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -170,6 +170,11 @@ struct drm_crtc_state {
>  	 */
>  	bool color_mgmt_changed : 1;
> =20
> +	/**
> +	 * This is to indicate advance gamma mode support
> +	 */
> +	bool advance_gamma_mode_active : 1;

Same here.

> +
>  	/**
>  	 * @no_vblank:
>  	 *
> @@ -1036,6 +1041,9 @@ struct drm_crtc {
>  	 */
>  	bool enabled;
> =20
> +	/** To handle advance gamma mode support */
> +	bool advance_gamma_mode_active : 1;

Same here.

> +
>  	/**
>  	 * @mode:
>  	 *
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index b81b3bfb08c8..4af3e1a2a158 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -201,6 +201,14 @@ struct drm_file {
>  	 */
>  	bool writeback_connectors;
> =20
> +	/**
> +	 * This is to enable advance gamma modes using
> +	 * gamma_mode property
> +	 *
> +	 * True if client understands advance gamma
> +	 */
> +	bool advance_gamma_mode_active : 1;

Same here.

> +
>  	/**
>  	 * @was_master:
>  	 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 67b94bc3c885..661efdf0c969 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -816,6 +816,14 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
> =20
> +/**
> + * Add support for advance gamma mode UAPI
> + * If set to 1, DRM will enable advance gamma mode
> + * UAPI to process the gamma mode based on extended
> + * range and segments.
> + */
> +#define DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES     6

Same here.

> +
>  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>  struct drm_set_client_cap {
>  	__u64 capability;


Thanks,
pq

--Sig_/ETnLTaDB4IUQhdxeuQ0WIwW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC3SWMACgkQI1/ltBGq
qqewWA/+L6RTaJItj5fJc8KpwYA3FYH/z2PjpvydIpL5S8wRX8RJzhOe8IZHTuoq
eZO7QN7pyKNW6D2mqMHKZqnsjsfRWYzhZfLnBXC/lrai7aXfZSFr8xFqKlzO8isj
drs0pA/neyraoLM0VBueRM+ewP4wTSH6HhCNoGRgmTEyntL6/fPizSPBXad1gVoN
E6ZqgZotBBHwS8vW9HCe4P58fQ+rRg5ynbpcU1imAoTJQqlpYXnesIjngKZW+1kT
mkxs707TOafnJurHA6z3foWswnQTVN/RH2R82+dICUgMwx7JrQdPGDfpQLIGmNYw
uIKQP9LMifpRbMAYDiZ1H5G4ox3tLd757vby3+63MzT/orQYrGu3J7eNCvpfgND6
wcgufRa+1MCNMx3Ci4aUxj1tfy/qb89qmZAhLd45NlaJZjT29YTDE/Y++jVoMCxc
5D31WtPwynKCMAfVJCg1LMGatHPBLbvZRKeDI6s2bdtOn8Dn3Ss9x7jShq6UVqqN
7immasozDSkf13oTBvMP+O86L46k7zaCfBn7w9y9GdwDvLtWKy7MRg2vOKgw/2Pw
45d0VORQjIzWye2zWtwIB6E7k/NubLcZSwZko9SfCYgUyZMXV9ruk9iK7gizPS5z
R9U6uICiwTMZVnAtWS1zzd1saV71qcHaM+fZ320AzV5cw8M9CnQ=
=m87N
-----END PGP SIGNATURE-----

--Sig_/ETnLTaDB4IUQhdxeuQ0WIwW--
