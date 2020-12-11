Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185352D7698
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E4F6EDE7;
	Fri, 11 Dec 2020 13:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01B36EDE7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:31:44 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f11so10920633ljn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 05:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=75vn0eEtsRQLfZLivxJBJ6LpgeNXYhiuxNikraSdeHw=;
 b=s0SgDrz+uPLfe+TD7vLQ/WEkNjt5UJ9KJML+nCvUa5ZXSRNZ7QFxUAdMrn3yavyGbS
 0jtsKHPhdfDfmV977ISxaICL6LEpFIHSgqiaJ3au0w1jMsqiwIaxHufZYgmRTDjvkTeW
 aouhbiyaaQSjk0fk5ihFlJwQg7xnNnXikfGd8UCVi6BBCB80BYV46OT/JLeiuEW2UQD7
 GQLz54I3sYoFkOn6qPK3u+KEg4PlYke0VmkJP9xxDdZEzCUBtAyswo+SJNro2Ek4RbQK
 2x4iqOZHRcyaVx5K33N0138c1LQOsRSUQIXp6g2gLVH6f/sDy/gcZRzuDSyOlAN3skHg
 QTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=75vn0eEtsRQLfZLivxJBJ6LpgeNXYhiuxNikraSdeHw=;
 b=BQdnDEVjSN2f/i3AmSK71aho2+3KKPm7oEOrD8vpUmb2Hz1G6ZbcH35mFsNKzF1LoH
 +zkhM8qKzhchzEW7zjmx6+kKv7LewuRVuOTWvOWnPyZRw/1j6ms8xJpgMSAAgpCenr0Y
 4pj3nv+VPt1EMu3VfP3Uji0q+XT9FqA4XYDd6SgvxYDX1O/ordDBLyEoTK95FvsxdL5Q
 k4FGkVSvOlzZJWne6aVQEWkBg4sqsplUqP5+QXuFDEpcYqrIRGJ7G0O0t+4zQYEfMf7o
 4FpgiBylqR+YPf8dmdi8uKVLBQQ/mo3L2jkkTkpjEvgYJ5g949Cgv+kdT+qFcrD6jj8u
 yIfg==
X-Gm-Message-State: AOAM5328uVCNNxCNnPv8Nh0oIlxevGlbbEgF1IBXWWTxek2UALpXArhc
 97G/MwJzmRjAz9VlFqAOOHg=
X-Google-Smtp-Source: ABdhPJwPJ3adqqX5SuJ4+DfOIFV70/1pJaAgU1HeLQoWmjgSd6jMKqaK70jyqt5U2EuM5Y/X58OzlQ==
X-Received: by 2002:a05:651c:10e:: with SMTP id
 a14mr5228979ljb.128.1607693503034; 
 Fri, 11 Dec 2020 05:31:43 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b29sm888538lfc.12.2020.12.11.05.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 05:31:42 -0800 (PST)
Date: Fri, 11 Dec 2020 15:31:39 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 1/4] drm: rework description of primary and cursor
 planes
Message-ID: <20201211153139.5376f450@eldfell>
In-Reply-To: <UhmKVQqbhh0wI7qwEAFiRxDcZqKRrmcoBTBF6rg@cp7-web-043.plabs.ch>
References: <UhmKVQqbhh0wI7qwEAFiRxDcZqKRrmcoBTBF6rg@cp7-web-043.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0866149012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0866149012==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IsG3FqkVcuNbiM=hLnzM.Qh"; protocol="application/pgp-signature"

--Sig_/IsG3FqkVcuNbiM=hLnzM.Qh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 13:06:10 +0000
Simon Ser <contact@emersion.fr> wrote:

> The previous wording could be understood by user-space evelopers as "a
> primary/cursor plane is only compatible with a single CRTC" [1].
>=20
> Reword the planes description to make it clear the DRM-internal
> drm_crtc.primary and drm_crtc.cursor planes are for legacy uAPI.
>=20
> [1]: https://github.com/swaywm/wlroots/pull/2333#discussion_r456788057
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


> ---
>  drivers/gpu/drm/drm_crtc.c  |  3 +++
>  drivers/gpu/drm/drm_plane.c | 16 +++++++++-------
>  2 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 8d19d258547f..a6336c7154d6 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -256,6 +256,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_cr=
tc *crtc)
>   * planes). For really simple hardware which has only 1 plane look at
>   * drm_simple_display_pipe_init() instead.
>   *
> + * The @primary and @cursor planes are only relevant for legacy uAPI, see
> + * &drm_crtc.primary and &drm_crtc.cursor.
> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 385801dd21f9..5d33ca9f0032 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -49,14 +49,16 @@
>   * &struct drm_plane (possibly as part of a larger structure) and regist=
ers it
>   * with a call to drm_universal_plane_init().
>   *
> - * Cursor and overlay planes are optional. All drivers should provide one
> - * primary plane per CRTC to avoid surprising userspace too much. See en=
um
> - * drm_plane_type for a more in-depth discussion of these special uapi-r=
elevant
> - * plane types. Special planes are associated with their CRTC by calling
> - * drm_crtc_init_with_planes().
> - *
>   * The type of a plane is exposed in the immutable "type" enumeration pr=
operty,
> - * which has one of the following values: "Overlay", "Primary", "Cursor".
> + * which has one of the following values: "Overlay", "Primary", "Cursor"=
 (see
> + * enum drm_plane_type). A plane can be compatible with multiple CRTCs, =
see
> + * &drm_plane.possible_crtcs.
> + *
> + * Legacy uAPI doesn't expose the primary and cursor planes directly. DR=
M core
> + * relies on the driver to set the primary and optionally the cursor pla=
ne used
> + * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(=
). All
> + * drivers should provide one primary plane per CRTC to avoid surprising=
 legacy
> + * userspace too much.
>   */
> =20
>  static unsigned int drm_num_planes(struct drm_device *dev)


--Sig_/IsG3FqkVcuNbiM=hLnzM.Qh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/TdLsACgkQI1/ltBGq
qqfWaRAAoX27Cp4r2rMUQfjEK/V1YV2H4U53xlkOmDXhkDSvxniECoZ7gTT9PDdw
e7xWakUF6MCRXgQ4E2uQufhFWtb4iLs/dnXhESp1pC8jM0Yy8nOqXTBe3MvZ+n2k
R52xdPY9z1M7DFDmj7NOQws6nEcchmjrSWCDgpYI+K2Wx0cEQGxx/+YeHlpYqxke
ReT6l4ZXYCAMDtshqRYKMbLCMY+Zr3xKNlfDJpp8qIgpVmwcEClKcPhsh7TJwzqU
P/5cIqCCqkDe0+w0SsKLWZXu1CrS92mFnj/SVOSed/Ycjdxckt9PpyOLAchlOo1c
4l5oFPwnv6Sk/2VgNPO+2+UjP8QNdoEKH4h4zlBA+3EOHycI1ObzgR/OzGoGUbyq
xzmn5GleNl9SkvXuPCFP1VQBNlNzrTYtzTq0XL7cO71I1SV4XHvezQpTz+X4blPr
PlU65eZJ+f9d5vLQvXJzZAcvYqEJgzx0wgQv+2xbkIwCX7Jiu8vTsc0791C67KKa
YnNOalkEEyl2N2FFNRCPSNP4l0lcRKQHsITSMUi3y5sx/en1H2XyU3OPgSlSgt0h
L4OOTd6eDpUngiXocQwUNw+UHEoqcUGhESxnK8obNJ3B3TYAIwsgpNV4hHcaXSKs
M0D2ithoh6qQZZOFGaZBboawnmb78E8LSJ60yZ+04ut6ocKFWjA=
=vAeb
-----END PGP SIGNATURE-----

--Sig_/IsG3FqkVcuNbiM=hLnzM.Qh--

--===============0866149012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0866149012==--
