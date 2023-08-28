Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799878A694
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 09:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22B10E220;
	Mon, 28 Aug 2023 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497D310E220
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 07:35:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-50078e52537so4337977e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693208156; x=1693812956;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eRTjBz5a1miZs620PEWZRZmRnm0NusnqoGT+kLK4VVI=;
 b=AYr8yzj1EOyJK8hTqZ/13mPJG4DrHwfVwz0+4CvV21B3QQ/QSSqmMsSffjpVjQaRAt
 WZkE+eIywzIP6xn0Szkx4vcgJ4d/0+rc+Ei4GfWKSv2vzEN4lHrwGQ3JeF/3/pJ6DsTD
 B7FuNr0d4S2hYD33S/LJg98IywCE/ib/i7ndlAzHa6MdDzb/1ogoFesHsElix5I+yG11
 adhUQrb6kRieWJpvTxk5+EZSmDfhi4+joyTxZBGihrF/OMiBJVQnPGSAiu2cBnrgGfqW
 v2f02fo+by5oTn19ZALLQgpkjYgP7FBGFJMjEiymmgY8WElDunQfdYPS6KP9KiVtdQPX
 ruIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693208156; x=1693812956;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eRTjBz5a1miZs620PEWZRZmRnm0NusnqoGT+kLK4VVI=;
 b=YB8nYOukMHp+uRYo68Y1oQAIWfWsj3tOdHeQrwkpVosZDL3+AV71kTjbJ2VjoZqW3z
 PG4o6Rf16tVaOfuzOIbgwkKjHRp8Nh+M1LK4tPep/9TibBkmpgiswZpk9hSofjptirvu
 ij1scn0qesR6D/P+XDP0y0fDbSm2L/eOZ9fHyQR+Tz6R/tjdVKuavwlsUKK6Wc3wB2/a
 1BIjWkek+/gwsZJEwdDAios7rlXPKSYsLVzXHegpqY31YOAcgnhx2cENPGgeIoSFCxiZ
 esEkwBxACysQ/38zvkTxL+TkUzcZqTVQ7QhGiY1sFk9twMQ2yLWYsAVGFF3MKTOOaR/o
 Xk3Q==
X-Gm-Message-State: AOJu0YxFosIFmMnSGCz/Y+6VY4HSB3Ss3VwO7jlPX5YZjijKy1UWU/5/
 +IVs4D0LFnvewFq/Ghox/SE=
X-Google-Smtp-Source: AGHT+IHO3iYBm5dANyXxPfjOx0TjNzhBOFIbFHca+lLBW8UtKMgzgkjn6NFjooiNfNMpd8z37YYFTQ==
X-Received: by 2002:a19:7b06:0:b0:4f8:4245:ed57 with SMTP id
 w6-20020a197b06000000b004f84245ed57mr14782327lfc.35.1693208156010; 
 Mon, 28 Aug 2023 00:35:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q5-20020a19a405000000b00500a6304b7esm1435081lfc.37.2023.08.28.00.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 00:35:55 -0700 (PDT)
Date: Mon, 28 Aug 2023 10:35:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Message-ID: <20230828103546.31f834d9@eldfell>
In-Reply-To: <20230825140434.182664-1-jfalempe@redhat.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0j6=IO2Gn1fEICbuKp8EUyi";
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
Cc: tzimmermann@suse.de, javierm@redhat.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/0j6=IO2Gn1fEICbuKp8EUyi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Aug 2023 16:04:18 +0200
Jocelyn Falempe <jfalempe@redhat.com> wrote:

> After discussions on IRC, the consensus is that the DRM drivers should
> avoid software color conversion, and only advertise the formats supported
> by hardware.
> Update the doc accordingly so that the rule and exceptions are clear for
> everyone.
>=20
> Acked-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..d05642033202 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -140,6 +140,30 @@
>   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there hav=
e been
>   *     various bugs in this area with inconsistencies between the capabi=
lity
>   *     flag and per-plane properties.
> + *
> + *     All drivers should support XRGB8888, even if the hardware cannot =
support
> + *     it. This has become the de-facto standard and a lot of user-space=
 assume
> + *     it will be present. If XRGB8888 is not natively supported, then it
> + *     shouldn't be the default for preferred depth or fbdev emulation.
> + *
> + *     DRM drivers should not do software color conversion, and
> + *     only advertise the formats they support in hardware. This is for
> + *     performance reason, and to avoid multiple conversions in userspac=
e and
> + *     kernel space. KMS page flips are generally expected to be very ch=
eap
> + *     operations.
> + *
> + *     But there are two exceptions only for dumb buffers:
> + *     * To support XRGB8888 if it's not supported by the hardware.
> + *     * Any driver is free to modify its internal representation of the=
 format,
> + *       as long as it doesn't alter the visible content in any way, and=
 doesn't
> + *       modify the user-provided buffer. An example would be to drop the
> + *       padding component from a format to save some memory bandwidth.
> + *     On most hardware, VRAM read access are slow, so when doing the so=
ftware
> + *     conversion, the dumb buffer should be allocated in system RAM in =
order to
> + *     have decent performance.
> + *     Extra care should be taken when doing software conversion with
> + *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed explanations =
here:
> + *     https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@eldfell/
>   */

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/0j6=IO2Gn1fEICbuKp8EUyi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTsTlIACgkQI1/ltBGq
qqcfvA/8DB3BAva32CnO1tfTBIY+wpuh9FjGuF0k0SISPq6FZf+bwnGqjEicNPo7
Rz9w8FDA1PBCECjtBx5neQCukssZh/HPs7gvPNT7p5J2sJBch1b4XL1HoeJ5fzsu
Yv61epW7ohPyVNeKFqtAwSYl+dRZgqXzbsAn3qqiUknQ9tyHveBGY1yEl9bn/kDP
KE98vmceLDm5iIbpkKvCONRQgHQ9bCLXNdVz6VQ/qMOuFTaVWB7x/1HyFqrf6wnI
UmCVUKM6QqSqhHMEh03fx/orutyGJh1aGOuc5YIN5/+kJ/CSIg9pxYL06MfMesYV
/ShxkDSHswOLBsIKakMZaNbYsXkXIuS+PMucbnJyiw7E/Ek9maAuSMJFrZUkR/XP
mgzMqFLrfu7esq0qsi85ZO9E6pgxztrIpHjTJIPv32GSgHkaU+WHkODvL+fNoEnm
WlRC66jneX3FUwyV0I6qIAWvhNb34z7LEV9bptOutY/djHN9LQOkGekFWoRTzpAn
3QxT1z3tsDiyJa2f82OeeDSdPcCGWdPb8n3IiP41Yo4p8JmePbAZBwHJRbIKzSlH
ys3cPtG/BROR5A+jtpyO/fhj2bqTY3o+GjUC5CXuuy9RUDjDKXN+Op9bvfpAQ7wp
UxG0FMhSGRNeceM1dHOBzM9ExZEBT5sHitKiZT7hnGmN0JXxRd8=
=V6De
-----END PGP SIGNATURE-----

--Sig_/0j6=IO2Gn1fEICbuKp8EUyi--
