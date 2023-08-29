Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FD978C025
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063F410E15B;
	Tue, 29 Aug 2023 08:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500F710E15B;
 Tue, 29 Aug 2023 08:22:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bceca8a41aso60531101fa.0; 
 Tue, 29 Aug 2023 01:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693297353; x=1693902153;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TZx2hAPgb6zexMBqHQBnKFsfmBtJ6v3UCYZHdfm75zk=;
 b=isCI/UHL/rijnXWcbnjeYAi1Je/vch6QIf3TsTrdhDfl/DY/AMhdJfGZdaZGNzV/18
 6VTiqksGNNxik81zgiByQPsK4wR+psldPSPTqXoGlfovYXS2tlWvQI6qIlJ6akiOU4XR
 wbfnF7Swcp8+UEvbE8+T9eHPLPzy9cbqm2O9JCFCgBZykrD1eykl41nh6p4D7Mdq76bq
 aiAdb3F7PDnUI/JLnIilu+frb3j5A5tszuhfwU7j5qQJABVAYxdc2w/gQJg4zmuZABqn
 llX2roRrSPEkGdY3yvyRavjWZWgMCr3vVR+4V4QJk1UN9GJDgVfXzgsy3n3pO0zxl05P
 8OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693297353; x=1693902153;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZx2hAPgb6zexMBqHQBnKFsfmBtJ6v3UCYZHdfm75zk=;
 b=eBE+grsFkfyJXXYgDFVt7ZD4oP0jDw1/qoFQCebjCzccGko+FiFig5oPRtMUbnTZTX
 EL/FCpMN8E2H7fkzsbmFIWDBzWnoQQIGZPZVIEzgK26jT9BJLaQMETegmlPuYaYT53G6
 UatpgBwjwIWMFTM6HQjfBgynvwix68ECXs7bfYsMVoGtlXnAhPWNj4TohZoGnR8L5N+i
 W1G5svGUdgX6QOiR07wprbcHySOWBGb84kId8Qutco4qMhKLetzVO82sEZqLmuO+Wxtv
 rWJ3aW/ZNwyq2kEFXzY1l5QM4Urea6bwIYx0gPBYsQwLJiJkRs21hXh+IdNO+nWZdMi0
 6HdQ==
X-Gm-Message-State: AOJu0Yz351vocq4rU63UETo3EqPT/8seGULsXbCVUVX2vvfoRq6hyXwX
 Y3zhamWRuYMsSMoISinWU1M=
X-Google-Smtp-Source: AGHT+IFKGlUrcw3OW+R+3iPrHDJYsUPDRMtiFHIqcU66b25u63kZISd1JgPjox1EJwgWhYds1QzNDg==
X-Received: by 2002:a2e:a16b:0:b0:2bc:c490:10cf with SMTP id
 u11-20020a2ea16b000000b002bcc49010cfmr18584533ljl.18.1693297353192; 
 Tue, 29 Aug 2023 01:22:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 i4-20020a2e8084000000b002b6d68b520esm2022029ljg.65.2023.08.29.01.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 01:22:33 -0700 (PDT)
Date: Tue, 29 Aug 2023 11:22:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v6 07/10] drm/atomic: Loosen FB atomic checks
Message-ID: <20230829112230.7106a8bf@eldfell>
In-Reply-To: <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H5g8wKc5R4arUhKQdvg=lAj";
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

--Sig_/H5g8wKc5R4arUhKQdvg=lAj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Aug 2023 17:05:13 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source !=3D FB, the commit can still go through.
>=20
> This includes adding framebuffer NULL checks in other areas to account for
> FB being NULL when non-FB pixel sources are enabled.
>=20
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source =3D=3D FB.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
>  drivers/gpu/drm/drm_atomic_helper.c | 36 ++++++++++++++++++++-----------=
-----
>  include/drm/drm_atomic_helper.h     |  4 ++--
>  include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++++
>  4 files changed, 62 insertions(+), 27 deletions(-)

...

> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index a58f84b6bd5e..4c5b7bcdb25c 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -992,6 +992,35 @@ static inline struct drm_plane *drm_plane_find(struc=
t drm_device *dev,
>  #define drm_for_each_plane(plane, dev) \
>  	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
> =20
> +/**
> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
> + * @state: plane state
> + *
> + * Returns:
> + * Whether the plane has been assigned a solid_fill_blob
> + */
> +static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *=
state)
> +{
> +	if (!state)
> +		return false;
> +	return state->pixel_source =3D=3D DRM_PLANE_PIXEL_SOURCE_SOLID_FILL && =
state->solid_fill_blob;
> +}
> +
> +static inline bool drm_plane_has_visible_data(const struct drm_plane_sta=
te *state)
> +{
> +	switch (state->pixel_source) {
> +	case DRM_PLANE_PIXEL_SOURCE_NONE:
> +		return false;
> +	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
> +		return state->solid_fill_blob !=3D NULL;

This reminds me, new UAPI docs did not say what the requirements are for
choosing solid fill pixel source. Is the atomic commit rejected if
pixel source is solid fill, but solid_fill property has no blob?

This should be doc'd.


Thanks,
pq

> +	case DRM_PLANE_PIXEL_SOURCE_FB:
> +	default:
> +		WARN_ON(state->pixel_source !=3D DRM_PLANE_PIXEL_SOURCE_FB);
> +	}
> +
> +	return state->fb !=3D NULL;
> +}
> +
>  bool drm_any_plane_has_format(struct drm_device *dev,
>  			      u32 format, u64 modifier);
> =20
>=20


--Sig_/H5g8wKc5R4arUhKQdvg=lAj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTtqsYACgkQI1/ltBGq
qqeTog/8Dv877MsYgD2yMEFq4iy4cM+PK7kLDTvDtGCBUI7yDeFvqA46SuALLBp2
R0f6Lm3HkKZjCIcZ2LZZZSiESJCd9KFqoxyqj1dFYtdcUOO1iKISvzXeZJHGb7Qs
BtjsFYtOGPFE91O+xonH4/UqDHNfZeQ8tCmFMNK7Lw/iaqyCUE5RPQFvDjFOqMAy
t2BMaQntcKhr4KjIxWgS8n1isaPI/h4hNEzc/WS8rEwblubaamJr8UWQsvtV3sJd
wCbJHAhMsORQjE15xm6siGTp/x2q9HUjbuDUUvEa+lO9owpXrJPucGMAyhf4flwN
FOftM6kAYy7+Nu2RxYPzO086JsyGoUnxzIdrlBn5Qq/5a/RfdUosXJYYFPr7tWVC
CjEJBonNvLLK0QW/mnGs+yD8BoPKp6qI/CbCe1nQhrOWPKSakzpF2DfWmeOmd7bZ
Kn2xsqNTPZSn6ZE/8HDvtlUloktwJPKvyS1dBZ025YlIBi17exLVwBQREYTVZSS0
GS9J7h9blKD9I0H/c6vrQpf5wa93SVRka/52LBeNRU82ReaTQyRNH7QFpbIJqvdc
zXW5oFeQqdBFbZcxB8SGIyYYNLGbwn7/vKbntRcB7GCh/dQAsXIewODNVbGXCa9b
IgRToTt7i//LwFFH4Uw1+3zNqjuK7SinpSs7ni611esewEEySR8=
=NP0j
-----END PGP SIGNATURE-----

--Sig_/H5g8wKc5R4arUhKQdvg=lAj--
