Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7574E841
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8888810E329;
	Tue, 11 Jul 2023 07:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4CC10E328;
 Tue, 11 Jul 2023 07:42:50 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69923a715so84077201fa.0; 
 Tue, 11 Jul 2023 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689061368; x=1691653368;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=w5ZFK5oeFqNh+L0vkvCc2zum90/7nADkltXF28ygQsA=;
 b=rEbK3d7EDRG8+8d0RgXWgipQ03napDtXis1XIPPtgpfxTrOYv9KJNHcUPEcMk96QA9
 5SqDPZosHCDAvwlcPbT+lM+bYyAPQ8lWnwtn2/dzweJNnAHaGMHbNiBo8sImfaS9U/tQ
 i8YV7s23qIqpEsXsrieCra9xTWon6Y8O3SMEyPUAxyRcUYvP+alwLBNNNPcz2JdhsI0w
 hNTsxD06Nbdsw3OQCA5p+kVQPXdmLTFmbBa+VPC3x12ETVGPxgVs/1gshk92wIS13P7k
 6GIDyMSQJd8ZJc98Dz+cvRSAD0UqI1N+gNsoQ6vRZL8DMQyF31uNESpiolMaD2tgkxdR
 SS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689061368; x=1691653368;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w5ZFK5oeFqNh+L0vkvCc2zum90/7nADkltXF28ygQsA=;
 b=UEI07Jf7I/OKi0P52jZOBi3Pa7qb2a9mP3q13PBUolRSDRl13aWpDzn0A1akdz4lNh
 cJv+ib2L/PzuYhPbPZj/0K+v4XmuVTeQMMveFQvJW4i7R+6S25Uz/QZighFYxaPRXE44
 uAxMRZLyWmRMdM8poZmUxEIVA6CAVUTL9ncsG+mVaU+m/oJrb5WXcGlnv7VW/THd+bKe
 Ptx2wyGNQlJriKAjr9MJM69j4qmNDQ2kHNB86akczap//kVE07Hx5CXfjVMt0e87qqX5
 tvwmPiUZcXD9fc8mdWFsXklpV8qnvB3+27ZzYOxLRph4nJBqJxTxkSpqrp/Za04UgUYy
 NGuA==
X-Gm-Message-State: ABy/qLZXJkz2qzhq+JF2vGihyAPfySUw1tKMtSQ0BQIG8vpXNXy5dzLv
 1qg/0BGvQOKxx1AkUtff524=
X-Google-Smtp-Source: APBJJlEy4XPNbYUsd7F5ncYZyvetbObpdZA5aTwWbCGxnohcpmPjygKWtww0+JFqbMYr7oYxZWGyoA==
X-Received: by 2002:a2e:9c14:0:b0:2b7:31c:8c44 with SMTP id
 s20-20020a2e9c14000000b002b7031c8c44mr12914608lji.7.1689061368029; 
 Tue, 11 Jul 2023 00:42:48 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 d9-20020a2e8909000000b002b6e3337fd5sm329482lji.7.2023.07.11.00.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 00:42:47 -0700 (PDT)
Date: Tue, 11 Jul 2023 10:42:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [Freedreno] [PATCH RFC v4 1/7] drm: Introduce solid fill DRM
 plane property
Message-ID: <20230711104245.2be648a9@eldfell>
In-Reply-To: <d29645bd-4f60-be6c-9f34-ef6ffc343f44@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
 <20230630112700.53d79343@eldfell>
 <d29645bd-4f60-be6c-9f34-ef6ffc343f44@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e_CUCxv=bWBos.vwc7bvlYF";
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
Cc: freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, Sean
 Paul <sean@poorly.run>, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/e_CUCxv=bWBos.vwc7bvlYF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Jul 2023 16:12:06 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 6/30/2023 1:27 AM, Pekka Paalanen wrote:
> > On Thu, 29 Jun 2023 17:25:00 -0700
> > Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >  =20
> >> Document and add support for solid_fill property to drm_plane. In
> >> addition, add support for setting and getting the values for solid_fil=
l.
> >>
> >> To enable solid fill planes, userspace must assign a property blob to
> >> the "solid_fill" plane property containing the following information:
> >>
> >> struct drm_solid_fill_info {
> >> 	u8 version;
> >> 	u32 r, g, b;
> >> };
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com> =20
> >=20
> > Hi Jessica,
> >=20
> > I've left some general UAPI related comments here.
> >  =20
> >> ---
> >>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> >>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++=
++++++++++
> >>   drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
> >>   include/drm/drm_blend.h                   |  1 +
> >>   include/drm/drm_plane.h                   | 43 +++++++++++++++++++++=
+++
> >>   5 files changed, 141 insertions(+)

...

> >> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> >> index 88bdfec3bd88..0338a860b9c8 100644
> >> --- a/include/drm/drm_blend.h
> >> +++ b/include/drm/drm_blend.h
> >> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
> >>   			      struct drm_atomic_state *state);
> >>   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
> >>   					 unsigned int supported_modes);
> >> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
> >>   #endif
> >> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> >> index 51291983ea44..f6ab313cb83e 100644
> >> --- a/include/drm/drm_plane.h
> >> +++ b/include/drm/drm_plane.h
> >> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
> >>   	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
> >>   };
> >>  =20
> >> +/**
> >> + * struct drm_solid_fill_info - User info for solid fill planes
> >> + */
> >> +struct drm_solid_fill_info {
> >> +	__u8 version;
> >> +	__u32 r, g, b;
> >> +}; =20
> >=20
> > Shouldn't UAPI structs be in UAPI headers? =20
>=20
> Acked, will move this to uapi/drm_mode.h
>=20
> >=20
> > Shouldn't UAPI structs use explicit padding to not leave any gaps when
> > it's unavoidable? And the kernel to check that the gaps are indeed
> > zeroed? =20
>=20
> I don't believe so... From my understanding, padding will be taken care=20
> of by the compiler by default. Looking at the drm_mode_modeinfo UAPI=20
> struct [1], it also doesn't seem to do explicit padding. And the=20
> corresponding set_property() code doesn't seem check the gaps either.
>=20
> That being said, it's possible that I'm missing something here, so=20
> please let me know if that's the case.
>=20
> [1]=20
> https://elixir.bootlin.com/linux/v6.5-rc1/source/include/uapi/drm/drm_mod=
e.h#L242

I suspect that drm_mode_modeinfo predates the lessons learnt about
"botching up ioctls" by many years:
https://www.kernel.org/doc/Documentation/ioctl/botching-up-ioctls.rst

drm_mode_modeinfo goes all the way back to

commit f453ba0460742ad027ae0c4c7d61e62817b3e7ef
Date:   Fri Nov 7 14:05:41 2008 -0800

    DRM: add mode setting support

and

commit e0c8463a8b00b467611607df0ff369d062528875
Date:   Fri Dec 19 14:50:50 2008 +1000

    drm: sanitise drm modesetting API + remove unused hotplug

and it got the proper types later in

commit 1d7f83d5ad6c30b385ba549c1c3a287cc872b7ae
Date:   Thu Feb 26 00:51:42 2009 +0100

    make drm headers use strict integer types


My personal feeling is that if you cannot avoid padding in a struct,
convert it into explicit fields anyway and require them to be zero.
That way if you ever need to extend or modify the struct, you already
have an "unused" field that old userspace guarantees to be zero, so you
can re-purpose it when it's not zero.

A struct for blob contents is maybe needing slightly less forward
planning than ioctl struct, because KMS properties are cheap compared
to ioctl numbers, I believe.

Maybe eliminating compiler induced padding in structs is not strictly
necessary, but it seems like a good idea to me, because compilers are
allowed to leave the padding bits undefined. If a struct was filled in
by the kernel and delivered to userspace, undefined padding could even
be a security leak, theoretically.

Anyway, don't take my word for it. Maybe kernel devs have a different
style.


Thanks,
pq

> >=20
> > It also needs more UAPI doc, like a link to the property doc that uses
> > this and an explanation of what the values mean. =20
>=20
> Acked.
>=20
> Thanks,
>=20
> Jessica Zhang
>=20
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >> +
> >> +/**
> >> + * struct solid_fill_property - RGB values for solid fill plane
> >> + *
> >> + * Note: This is the V1 for this feature
> >> + */
> >> +struct drm_solid_fill {
> >> +	uint32_t r;
> >> +	uint32_t g;
> >> +	uint32_t b;
> >> +};
> >> +
> >>   /**
> >>    * struct drm_plane_state - mutable plane state
> >>    *
> >> @@ -116,6 +135,23 @@ struct drm_plane_state {
> >>   	/** @src_h: height of visible portion of plane (in 16.16) */
> >>   	uint32_t src_h, src_w;
> >>  =20
> >> +	/**
> >> +	 * @solid_fill_blob:
> >> +	 *
> >> +	 * Blob containing relevant information for a solid fill plane
> >> +	 * including pixel format and data. See
> >> +	 * drm_plane_create_solid_fill_property() for more details.
> >> +	 */
> >> +	struct drm_property_blob *solid_fill_blob;
> >> +
> >> +	/**
> >> +	 * @solid_fill:
> >> +	 *
> >> +	 * Pixel data for solid fill planes. See
> >> +	 * drm_plane_create_solid_fill_property() for more details.
> >> +	 */
> >> +	struct drm_solid_fill solid_fill;
> >> +
> >>   	/**
> >>   	 * @alpha:
> >>   	 * Opacity of the plane with 0 as completely transparent and 0xffff=
 as
> >> @@ -699,6 +735,13 @@ struct drm_plane {
> >>   	 */
> >>   	struct drm_plane_state *state;
> >>  =20
> >> +	/*
> >> +	 * @solid_fill_property:
> >> +	 * Optional solid_fill property for this plane. See
> >> +	 * drm_plane_create_solid_fill_property().
> >> +	 */
> >> +	struct drm_property *solid_fill_property;
> >> +
> >>   	/**
> >>   	 * @alpha_property:
> >>   	 * Optional alpha property for this plane. See
> >> =20
> >  =20


--Sig_/e_CUCxv=bWBos.vwc7bvlYF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmStB/UACgkQI1/ltBGq
qqe5Tg//aAR4eIChxprQcu0US1hKvYvymbGgc1Z1Uy+ac217vV+414LBf5F3WLX8
ew6yQCRDpftqSeSiQ5amBB9ZhHG/kNvJ5iOko5corzDTBwOa3eJncxQQ9YOl67Dw
IJHKD/U7NHaBXwSi6cm5BzvJvGmQKEcyXIByd0bE7IhhSKUW/xrXrVtgcf3aWYy1
ekhbrat0nZbkR6oCUeqSG1t3O1orkSaQStOFXLrUjWGWVSgOYo3rpSxYuKJ0f805
/wZapM8/1D6ju0Mvi0TRkj/z5MAxYmz5a5NtTTxMnPvwUN9+W08PyeKMSaruROJ6
HM1qmDRflQF7nuuTbXEcskQ87s/T3Y0lyC8EIJMnxSBefIsEiNxw0tzA3Ni8vv6F
hmEMSfyBSYnbu63P0yWFfg7vfyvtPzi1PBPkJmbf6x6FBNx4mJeVKi/WZNTLgKE4
r2ZOVpwnYBeSpiClLYmJWqUSnzQGNMp4lYO0zfAqrO04vtw7Bzl/+pJ5jl0kC27P
j4Cpqfa1bSl1K1i6jc/q94B51sH12uJWEAk9yvIcUVcJWGk7n30X3rvpqxFOD82k
LyhJlk8CrbqxEz2Ahll8d2f7ZwZ0ugQzJBc0QSo0c0PZKa/pyGdKCuYIQLjXL1oA
mdP4mTNSRVzx4KHTwgrN+WgMWJav++47FYnlJIxlL04HKkyx6xk=
=aQiE
-----END PGP SIGNATURE-----

--Sig_/e_CUCxv=bWBos.vwc7bvlYF--
