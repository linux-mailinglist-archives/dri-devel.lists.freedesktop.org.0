Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB878BFF3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D5310E0C9;
	Tue, 29 Aug 2023 08:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E8210E0B8;
 Tue, 29 Aug 2023 08:11:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so60040271fa.3; 
 Tue, 29 Aug 2023 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693296695; x=1693901495;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QcuYJIkWkqttiEFUgjzpw9+w8oYYeUVuwo8y1FUeWpw=;
 b=J1PcgSd1BqMxBQvun64Fuuvhhr8YTHvbh6//P+i/Dh1RJ+9poUFPkzr4fCh2qWw3xR
 G1NBq0BZTz/VqftdPEviBeUxtnWLYjoPvwO6EGnRHn9y8MWqyUF+Ogb0k/1gz4NLKqqT
 WJMkv+qjPWwlm7estlENv5YXeFr4M2880+tMJmdUTme/djNa47wBAZzOzQ1bgdlZxyrJ
 ojOvMOkIZmi2LNiBEI8XK7bvqAp42WGICvKdADNRj03AAnxOdCSZ/FDhgy+P2ZWyAfDy
 kZT6XX+mGkKfY0iFVN2Zsnh1Y4JBalnbqtpplwDk1BatXz9V1WGPC0oouc+55Y5WjJ+U
 0Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693296695; x=1693901495;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QcuYJIkWkqttiEFUgjzpw9+w8oYYeUVuwo8y1FUeWpw=;
 b=BT+L3XQYCqB8+niYSbWsgiI2Tjt2DeGSZhP51rVgI9lic0IsZgRJoFwwbOAqWmu9VD
 GplDUE0Mk5RO1KeWBOj/eX4KLjc+KR5n6Sz79rR0JYAaTqygwlusx+JszFDUbZNAmOuy
 9S0l9NrECkSeqjU0OuX7WTkOlBeJ0767brfx+irrk+6ln1WOrT8gwQj+o7SVXJ5iOqCJ
 1BJYcCmmLRHpOV36J4BjNdOMNHYPq3FzhUWxX4tVUbPYJMBNNg614gTsfCp4THOINp17
 N7XExvhlslnsVS+mRAjEsCYSKLFZeVwsMIqZTZTWxQxpFyjR0QYk9ZgoU8WCXwHY2w0o
 CF6g==
X-Gm-Message-State: AOJu0YwDUgbf+xkKq0XJoRLgFGFOWrTh+D/kHlmJbqjjMFTknjbjzNP4
 iBsQo1MgXyI1u3clbu2465Q=
X-Google-Smtp-Source: AGHT+IFMlAx6sqTJuzUZsB/QddKc9/jYUouieId2yrQNkMF4IjefFx/1fYXL6lteGDwOKzAf8OGf2w==
X-Received: by 2002:a2e:7e0d:0:b0:2bc:d33f:3e8f with SMTP id
 z13-20020a2e7e0d000000b002bcd33f3e8fmr15271739ljc.53.1693296694747; 
 Tue, 29 Aug 2023 01:11:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v6-20020a2e9246000000b002bce3123639sm2054014ljg.98.2023.08.29.01.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 01:11:34 -0700 (PDT)
Date: Tue, 29 Aug 2023 11:11:33 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v6 03/10] drm: Add solid fill pixel source
Message-ID: <20230829111133.201afd11@eldfell>
In-Reply-To: <20230828-solid-fill-v6-3-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-3-a820efcce852@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9XiJ10hPEUcELqgCY+fqAZj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9XiJ10hPEUcELqgCY+fqAZj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Aug 2023 17:05:09 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Add "SOLID_FILL" as a valid pixel source. If the pixel_source property is
> set to "SOLID_FILL", it will display data from the drm_plane "solid_fill"
> blob property.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 10 +++++++++-
>  include/drm/drm_plane.h     |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 273021cc21c8..1016a206ca0c 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -200,6 +200,9 @@
>   *	"FB":
>   *		Framebuffer source set by the "FB_ID" property.
>   *
> + *	"SOLID_FILL":
> + *		Solid fill color source set by the "solid_fill" property.
> + *
>   * solid_fill:
>   *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
>   *	contains pixel data that drivers can use to fill a plane.
> @@ -638,6 +641,7 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
>  static const struct drm_prop_enum_list drm_pixel_source_enum_list[] =3D {
>  	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
>  	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> +	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
>  };
> =20
>  /**
> @@ -662,6 +666,9 @@ static const struct drm_prop_enum_list drm_pixel_sour=
ce_enum_list[] =3D {
>   * "FB":
>   *	Framebuffer pixel source
>   *
> + * "SOLID_FILL":
> + * 	Solid fill color pixel source
> + *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> @@ -671,7 +678,8 @@ int drm_plane_create_pixel_source_property(struct drm=
_plane *plane,
>  	struct drm_device *dev =3D plane->dev;
>  	struct drm_property *prop;
>  	static const unsigned int valid_source_mask =3D BIT(DRM_PLANE_PIXEL_SOU=
RCE_FB) |
> -						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
> +						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE) |
> +						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
>  	int i;
> =20
>  	/* FB is supported by default */
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index a38e18bfb43e..49995c4be2ab 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -43,6 +43,7 @@ enum drm_scaling_filter {
>  enum drm_plane_pixel_source {
>  	DRM_PLANE_PIXEL_SOURCE_NONE,
>  	DRM_PLANE_PIXEL_SOURCE_FB,
> +	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
>  	DRM_PLANE_PIXEL_SOURCE_MAX
>  };
> =20
>=20

This UAPI:
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/9XiJ10hPEUcELqgCY+fqAZj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTtqDUACgkQI1/ltBGq
qqf4phAAhXuiIR8fQ4IXOlA0nxQVJB549LK2+4jwQZ0RDRwRf5OQ4O4pUAf5LnRL
V/4MhUHMHen2fzkvIVhKxT0VX+gc+3LrUama/GNUuKJz13as7zWuHrug9AgItlah
r0I1kEiG+mzI3N3LNebBIv5LJxBcdSsj0HbLIqBvoCmUFw3JNbSDUu+SWVJwNMUo
SUN4LRUhaTrltQPjXfsIKHwDhpfjogng14AQC+XpzUAXq5mK5Fd62K8bVtFsIFkS
z9Y3O8mtvhFCAad+f3tPXIsixt+/+V9jJkb/cDQFN+jWklSy3zjZsLPYrwwHzCBA
xiC3kbhssRIsQwifJN3MJQaYIA1aw/3n5nbL3ysmcgE7LZGl9jAnukmag4SJvgX1
02H/FOfqiXLiG24M4OOG3ll9rV8XDHBnug6JMquZvTh2JuNBYl90qce7o4M9RaLg
6u92Azu4VFU81eLMm/FGA+1a3lBRTyZJmVzVwW8IerEfVQHECpAsNHAp32zMZqiW
hSxAdAVRRA1SyaPi64Fp1C4bKruCZIboG0sg0zbkhCaFahCADmy2AoM4m7OOS/Y+
a6WQ5E94IIA64dviEqzKidVNk4clOxU3K9zu2NM0mLjPoqoNa8GAFJ6oOiY4g1WT
fzEyIiL6MVly7HTVZSqE67aBsBFKHe2CZmfI/lVLYaCoL17MUKc=
=GyQP
-----END PGP SIGNATURE-----

--Sig_/9XiJ10hPEUcELqgCY+fqAZj--
