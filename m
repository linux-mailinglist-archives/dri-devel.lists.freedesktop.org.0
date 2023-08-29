Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC3978C010
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC0910E0FD;
	Tue, 29 Aug 2023 08:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8F110E0FD;
 Tue, 29 Aug 2023 08:14:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-500a8b2b73eso5940477e87.0; 
 Tue, 29 Aug 2023 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693296867; x=1693901667;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WpCt/3rI6BwltGm6OrrHxjmtGTGMQx5mSNvkMRK1Jws=;
 b=YRQlOcCRcFxAqYZAwQxhMqpBs0MSqAHQdVO4iPz2daPciNJKDVkPuS62HK15kZCZ+h
 ytMMNW0a+CGr2GIUFWW3KWVXWhdo5dHe99iVnoohjqTGHKnJcUTn/QE80iKX0CDAw00X
 aZGT0zVpbxgzRSArWz0MHWpTFXBiu4e74gsoVkgXcn9BVh4q38RrmBXvUH/BtkTcgtYw
 dqOm3iwtmjjVnj2UASckxpKxkneNrxH4mpIvfeM2/gtLPH8rkGkYTELxsRyk+Ta9VmNd
 SfZ4ag4yv0vpEIKvV53/rCKge6WCsXfEbXLPHb15pgv9QPDb/3+yrV7HpEmofNcFyboH
 EMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693296867; x=1693901667;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WpCt/3rI6BwltGm6OrrHxjmtGTGMQx5mSNvkMRK1Jws=;
 b=LExa7n2QbSNFqwzR8izdr6lGg4RJbqonhWh+1+zj9DCGI92d+zbUzeRBY6p0H33T9L
 5PJOLJSrnBBHfGLKov06V0+1hO3vcpXyNG3K1Su/oTJCSulJjmtE4hQokDauvn2I0NM9
 rMnVcjKhAfDleA651HVVnlJ1Eicwd+3de6sGhvh8i7d52mN71bhppVbkvpYHVLRQAmft
 yHL58f42rSbrmgKRGSIjqh7mng67uMT6zBc9SWgUimGT/UTtVnMQdGwofirobQ6bow3/
 f9teWH61moWAytLO8Wjj6kgMwMC4OPhMSfo+SE4RDpSH2Vi5JaQ2AAGmjrdyEIB2P207
 cJCA==
X-Gm-Message-State: AOJu0Yz7RVEPNYudN2y2TjiVXrKPJ2kOoxST/hXh60RCDgvFAPlGLV1Z
 SGFW2yx78Vlo7p3GTQ8dzns=
X-Google-Smtp-Source: AGHT+IF6eneRxFLz00elzVlsaViyXlp9Lf/PuaIKg7elUxgACLx6idoz53N5/PfqryD/gK9F++hr7w==
X-Received: by 2002:a05:6512:1594:b0:500:9b26:9760 with SMTP id
 bp20-20020a056512159400b005009b269760mr13354264lfb.13.1693296866888; 
 Tue, 29 Aug 2023 01:14:26 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q17-20020ac25151000000b004fcdf8b8ab4sm1878629lfd.23.2023.08.29.01.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 01:14:26 -0700 (PDT)
Date: Tue, 29 Aug 2023 11:14:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v6 05/10] drm/atomic: Add solid fill data to plane
 state dump
Message-ID: <20230829111424.3f187b88@eldfell>
In-Reply-To: <20230828-solid-fill-v6-5-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-5-a820efcce852@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p3ZFNBA7.FbYl_glCOK8o6h";
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

--Sig_/p3ZFNBA7.FbYl_glCOK8o6h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Aug 2023 17:05:11 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Add solid_fill property data to the atomic plane state dump.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 4 ++++
>  drivers/gpu/drm/drm_plane.c  | 8 ++++++++
>  include/drm/drm_plane.h      | 3 +++
>  3 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index bcecb64ccfad..3cb599b3304a 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -717,6 +717,10 @@ static void drm_atomic_plane_print_state(struct drm_=
printer *p,
>  	drm_printf(p, "\tfb=3D%u\n", state->fb ? state->fb->base.id : 0);
>  	if (state->fb)
>  		drm_framebuffer_print_info(p, 2, state->fb);
> +	drm_printf(p, "\tsolid_fill=3D%u\n",
> +			state->solid_fill_blob ? state->solid_fill_blob->base.id : 0);
> +	if (state->solid_fill_blob)
> +		drm_plane_solid_fill_print_info(p, 2, state);
>  	drm_printf(p, "\tcrtc-pos=3D" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
>  	drm_printf(p, "\tsrc-pos=3D" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src=
));
>  	drm_printf(p, "\trotation=3D%x\n", state->rotation);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 559d101162ba..6244b622a21a 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1495,6 +1495,14 @@ __drm_plane_get_damage_clips(const struct drm_plan=
e_state *state)
>  					state->fb_damage_clips->data : NULL);
>  }
> =20
> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int=
 indent,
> +				     const struct drm_plane_state *state)
> +{
> +	drm_printf_indent(p, indent, "r=3D0x%x\n", state->solid_fill.r);
> +	drm_printf_indent(p, indent, "g=3D0x%x\n", state->solid_fill.g);
> +	drm_printf_indent(p, indent, "b=3D0x%x\n", state->solid_fill.b);

I'd recommend %08x format, so that leading zeroes are explicit. That
makes it easier to see the difference between e.g. 0xffffffff and
0x0fffffff.


Thanks,
pq

> +}
> +
>  /**
>   * drm_plane_get_damage_clips - Returns damage clips.
>   * @state: Plane state.
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 49995c4be2ab..a58f84b6bd5e 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -1001,6 +1001,9 @@ drm_plane_get_damage_clips_count(const struct drm_p=
lane_state *state);
>  struct drm_mode_rect *
>  drm_plane_get_damage_clips(const struct drm_plane_state *state);
> =20
> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int=
 indent,
> +				     const struct drm_plane_state *state);
> +
>  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  					     unsigned int supported_filters);
> =20
>=20


--Sig_/p3ZFNBA7.FbYl_glCOK8o6h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTtqOAACgkQI1/ltBGq
qqfEIw//VTbz8t1OwEo0CcfNcMpnOHydv9qTAEla3tDyevZTdRJVT/sMDlyAoEJM
Xl8y+9mZOiIl2GNHr1eg+FIKyAC/dnjFHK7wVNb2Qg4iw2pKuwFhEmbPgSf+Oyo4
ira8tQYseDoXoAERgbDSTZ13a5QXFk0kplnWtzDILTrLRRu5n78gamzlQb2LWjij
FW8LcFzxH8SrRUKZHZuVq0FUBRMq7XQyANJepM4wQ1YlmbEvRJRZUFIN5l/lE4kU
Rja6otQUZg+zRrWVvOeAFxPp+nkdN9JxBf52SFz44taFrVu/FmWl1FzhnYCju7wj
ZdhiB3OnsuQ3LifJd1tJCG/AndoYnkQoz0jXBvGlmXDpLraoCboHs6/k/QPgiX6Q
XQ0rcunlTrdtyKDPGzOt41TEVyRxV1WHUZCCWIWmRcJI6WvCUL0r/lR09Y4WwhSU
0S1+hxc1wdJj4l/Ay8HzFAu159/EipGnOQe6OdsKeaEkOTc5s1XLhkDC3W4bMN6O
zVXSEAhzGCjEdQdg24yabhVXwqyNzqqWuxcrLAe2P0QbBTnzHLH/H7LIFgi6y9yY
rXenXRL18kxyYLmBw8Vrx1w5EZhp05/fE4OklK2czh3I0PK/A8nV4j7GzcgwlPeQ
MT6a2xZ1/m7vAWvBitN7D5pcw4D/i3hqLZscm8I+39lbahyIwIg=
=9B8a
-----END PGP SIGNATURE-----

--Sig_/p3ZFNBA7.FbYl_glCOK8o6h--
