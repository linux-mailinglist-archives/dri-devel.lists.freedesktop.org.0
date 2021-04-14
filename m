Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96435F341
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 14:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004106E2B4;
	Wed, 14 Apr 2021 12:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E388B6E2B4;
 Wed, 14 Apr 2021 12:14:31 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u20so22993642lja.13;
 Wed, 14 Apr 2021 05:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=HAj7oPYY6ZVDD1rHO88cM3eLSuHN4CVgSyI+sBH8YOw=;
 b=PqwGThBvkn/6xivzo1zHwiXwvxa9kNPu84xcdFA+ryFs4h785yo+SrHheLvitKrcwy
 p7OPlDC08Fx3Ca+PpcelvT4hxebj0gs8Ye61b7sq1imA3ro+O+eQg47VO8v6XxCDRUx/
 UHnTHDQfdoVfa0WLpYDYopgfN0kpDSUdesrmPcFryEpvg2Pr6eR6P4cbDFJa0OiBpMri
 w9c4KCb2O6zzRZCzBiU8fPjMooJ4IIRiOiG9dRc5CFqDvYU297AG1oX6iYshW5SNIkxs
 COXXCW5WvGdFwcBj/FjucwOw0fKgpVkWIL+YCSxQ1JzwCQ5iZcUf9x6+8V95uOms8MD3
 5beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HAj7oPYY6ZVDD1rHO88cM3eLSuHN4CVgSyI+sBH8YOw=;
 b=VsYTx61Uq3dLkbSbOsSnOgBG+rjRm5lCUetz9/T/Y9gc4uQQjCfuRIyD7zVsbAZBVa
 srXAjWfsA27XEFqpxvuciC9kZvwTXSRNLpqD4sNvohx4Z7JVVL/OWfYN/yMIugLeXCFv
 9nNIVlcgRPkwIKHec+lrIIqPNB3e+X0I+kAOpHGSOASqSnZ8tsXfF0V8Thoc67b+Ftd+
 rYPkpaG8+NWA9vmdRmOc3v50dzS6oZr+of+QzBXUtb5YiitzBZytRyDOsvjFPMJjiaeX
 PweuA5ZNorkC5KHeJb3o2Vl0xOb7gqVT3mx1zYxk2SkRRsxbbTwFdQlcYYV7TTt3tOyQ
 w9FQ==
X-Gm-Message-State: AOAM531GQ4sb5o9PhJKlrxo3Br4Ik8oWUqpfmU351tiv4od/KUzPlYQj
 upzUs5PKV0AWxCqid6PXewM=
X-Google-Smtp-Source: ABdhPJy4I2LqXMJcqI4lwSUARCC8BIwjvX6oPKwA0ZOBAKIbVfCCR/k+pejLKvUMzUB1iM3Iw6V8bA==
X-Received: by 2002:a05:651c:1198:: with SMTP id
 w24mr13630978ljo.29.1618402470336; 
 Wed, 14 Apr 2021 05:14:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n25sm103258lfi.234.2021.04.14.05.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 05:14:29 -0700 (PDT)
Date: Wed, 14 Apr 2021 15:14:18 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/modifiers: Enforce consistency between the cap an
 IN_FORMATS
Message-ID: <20210414151418.47031ce1@eldfell>
In-Reply-To: <20210414090815.453744-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
 <20210414090815.453744-1-daniel.vetter@ffwll.ch>
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
Content-Type: multipart/mixed; boundary="===============0505346762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0505346762==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HV0N1M8ikEtSC8hB+jqRRsS"; protocol="application/pgp-signature"

--Sig_/HV0N1M8ikEtSC8hB+jqRRsS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Apr 2021 11:08:15 +0200
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

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/HV0N1M8ikEtSC8hB+jqRRsS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmB23JoACgkQI1/ltBGq
qqclJg//dj0eoX3qj0VkTjM3GwqFlYyUZc4OoztvYUsFVT5zjmjeaA39NUtGJnny
cGgCIi6vbWa0ZedQgcZA2Vii7CwHC66EsNscWqW1NSnwQ1cJvkWkkEy1pDrYuO9E
Jm9wcrRuXvIOrtbn+Ov6UzxFRx5HMT2ew5MHQYlkz5Jl8XGe2WCThypqIluzI2rv
XuMovCfeaC1/boBjwpYcRIrdeU7V/CvJFwI2zadekXFc8Nb4ZoaSWmysGts1/w33
8vbDJ2IK+6BaHY85OTmzYVWVz/AHrjBOCQN2fmd9RmAWOOTxEkwf1Tx0AfsiPMvU
me7fNsjosIKihmTE0p8EnBOJIwfm9k/fRrdbEMW3qfpSMlkghPidWyolfmGxW94A
2eyEU3r5TgVsVeH0mC9GE6h9F2umVzW9ga2EZsrl3g9nmezSZxPhxxtaOhWXL87g
G0NzktNvj1BBkHCA7cKyvtg5aSt0nY/Ho101z+MG7tougtjIOXulwbTe/3jVBCEZ
GvilEKU2GHA58P4jazE7S5hOWbBaGmDx2+hOxtUY5B28e0IzyscjGAql+xE+gQS+
2SJ+ocwwe1SRiXwTzyVozkojRT2l7O5O1wqapYC0JKvDzUPlntoO2M1x26it/+jJ
0IQ/eiSQ4tG5S0xiUloCCWqSadnNtr1OerRGse3JMqNP09aLvEg=
=1Ebx
-----END PGP SIGNATURE-----

--Sig_/HV0N1M8ikEtSC8hB+jqRRsS--

--===============0505346762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0505346762==--
