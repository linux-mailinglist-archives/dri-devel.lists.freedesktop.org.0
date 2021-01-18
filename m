Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3955C2F9B6D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53D16E11F;
	Mon, 18 Jan 2021 08:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50626E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 08:41:04 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a12so22893650lfl.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 00:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1xY0Iq3PQYL5JM3lRVlU6WCeI25xwGKcbfe7iPLGMIk=;
 b=MIXM//5jYFlXWxvvQYt1h8kGrSF1Av6wzaxFtgksfTOIunjxOS+yh1m5QfzA+XH2L1
 SAy5r/3tMbY2A351szSN25b3hilOMxTsUuVIJdGTClRPETZ+Ao6seUR2F1yyz32oBvnT
 SfIVxkbnzPaHIKKY50KBjm8/jE2z6SG+mvIlyC3artgox4wUqES0LIP+d8p8efjWYOaP
 /OfffCYFcHy6wftwPpueh+iN3VnaAnCVhvjibI7KFrzj8kl8oSSkbV2vTeFwO5M2ukNN
 02zTTxIKtMFmosHH08dHra7MY6KTfVEdj5fnREnWBOkXVRDTcwSXiNEijYbZ25zH/wA+
 CVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1xY0Iq3PQYL5JM3lRVlU6WCeI25xwGKcbfe7iPLGMIk=;
 b=sWKiw3o6hF+JkbshpJw/+4tou6GAluHzch3piuqF1gPqOa6DfzcxBL3+IGQylz2EJb
 aR/LLYLnicbNN/0YUP3BzVdioihmwTR+LJlVwQHqkurm1/d9mJ7JgHkofIA2l9hCCic1
 MxZS/5HVHyu3PY5uPTZJrtlufzdjYQUoPPzEjVC8wQBl2oSBUvtzlFN0LW7OdG1zxUrb
 t8dK4WBYiPG3t8t7bGbvjH4Gx2tr9pF2lBqXyR1T0JmtYe0b/Mh+6oYLz67qzFYRF1vC
 mCsl1sVJA7duZoqVccDKa8Ekt2jNRU0ySXPTLWKUcwqwhuYaNaxJM61OCryUIq7GsRqq
 IZeA==
X-Gm-Message-State: AOAM5327fdsheQuOLMEu1IbrlgtqusGWWtWmebWliRWTIfGtVQgnSOct
 O6mad9Nc6scs5gV9Obnu1YQ=
X-Google-Smtp-Source: ABdhPJyqRolMpWxEIiuieEi5PiitxuIp0yMTr8hKblbN+n0CjlVqBR0DMlYkZlpweYkHcCS6DBwVxg==
X-Received: by 2002:a05:6512:39c9:: with SMTP id
 k9mr8327002lfu.432.1610959263271; 
 Mon, 18 Jan 2021 00:41:03 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l24sm1563133ljg.65.2021.01.18.00.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 00:41:02 -0800 (PST)
Date: Mon, 18 Jan 2021 10:40:52 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 1/2] drm/doc: fix drm_plane_type docs
Message-ID: <20210118104052.092b0d85@eldfell>
In-Reply-To: <20210115110626.12233-1-contact@emersion.fr>
References: <20210115110626.12233-1-contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0314932309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0314932309==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AuWFwjE+475BmBxWNfi.CUx"; protocol="application/pgp-signature"

--Sig_/AuWFwjE+475BmBxWNfi.CUx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Jan 2021 12:06:25 +0100
Simon Ser <contact@emersion.fr> wrote:

> The docs for enum drm_plane_type mention legacy IOCTLs, however the
> plane type is not tied to legacy IOCTLs, the drm_cursor.primary and
> cursor fields are. Add a small paragraph to reference these.
>=20
> Instead, document expectations for primary and cursor planes for
> non-legacy userspace. Note that these docs are for driver developers,
> not userspace developers, so internal kernel APIs are mentionned.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/drm/drm_plane.h | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 8ef06ee1c8eb..95ab14a4336a 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -538,10 +538,14 @@ struct drm_plane_funcs {
>   *
>   * For compatibility with legacy userspace, only overlay planes are made
>   * available to userspace by default. Userspace clients may set the
> - * DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate tha=
t they
> + * &DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate th=
at they
>   * wish to receive a universal plane list containing all plane types. Se=
e also
>   * drm_for_each_legacy_plane().
>   *
> + * In addition to setting each plane's type, drivers need to setup the
> + * &drm_crtc.primary and optionally &drm_crtc.cursor pointers for legacy
> + * IOCTLs. See drm_crtc_init_with_planes().
> + *
>   * WARNING: The values of this enum is UABI since they're exposed in the=
 "type"
>   * property.
>   */
> @@ -557,19 +561,20 @@ enum drm_plane_type {
>  	/**
>  	 * @DRM_PLANE_TYPE_PRIMARY:
>  	 *
> -	 * Primary planes represent a "main" plane for a CRTC.  Primary planes
> -	 * are the planes operated upon by CRTC modesetting and flipping
> -	 * operations described in the &drm_crtc_funcs.page_flip and
> -	 * &drm_crtc_funcs.set_config hooks.
> +	 * A primary plane attached to a CRTC is the most likely to be able to
> +	 * light up the CRTC when no scaling/cropping is used and the plane
> +	 * covers the whole CRTC.
>  	 */
>  	DRM_PLANE_TYPE_PRIMARY,
> =20
>  	/**
>  	 * @DRM_PLANE_TYPE_CURSOR:
>  	 *
> -	 * Cursor planes represent a "cursor" plane for a CRTC.  Cursor planes
> -	 * are the planes operated upon by the DRM_IOCTL_MODE_CURSOR and
> -	 * DRM_IOCTL_MODE_CURSOR2 IOCTLs.
> +	 * A cursor plane attached to a CRTC is more likely to be able to be
> +	 * enabled when no scaling/cropping is used and the framebuffer has the
> +	 * size indicated by &drm_mode_config.cursor_width and
> +	 * &drm_mode_config.cursor_height. Additionally, if the driver doesn't
> +	 * support modifiers, the framebuffer should have a linear layout.

Hi,

is there anything to be said about positioning a cursor plane partially
off-screen?

>  	 */
>  	DRM_PLANE_TYPE_CURSOR,
>  };

Anyway,
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/AuWFwjE+475BmBxWNfi.CUx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmAFSZQACgkQI1/ltBGq
qqc7BA//fZcsAG4MOXx2f1OmIL9qsKdXxUdSxWM3M+COCVmHZOzvrMH4IqA/CJHh
Noq+RZEi0ff7z07QkwZThlEKqlaGlPq6SdOkMo0/BIWUVYRG1xBnjL9Rcj84yiWF
KlmchJFTH3R5qCtsLaOkoUbTl5YMDJQl8yhPlCRZIghAHmx5Z1JxBXBbKkK5R54+
c+VTl4OmiHvszBgMv+wgpex9tQpeAYWghIFr3mJCDZEMTUzTZMXVKxfCoVxJ7164
7ohM7LWyw6Oq1V8VP+BUsad7O5PiElbkZZ5/UGwDPPUSPh7S+OqPx/mW+DdoVz6H
+rL9Qxm97CI5+o8QwJeJR8knUOJYJqf1NHqq7dWsaBtXWR5QjP6wvemt4sYklyhw
wzH8Y/7B6FxdomzPWGvd7oOWMWtVy5thMmDw08L4EeqyX2KrLwhgF0FcZ7UwLdnY
7aVSPD/ZfREgBVwZ/pBY0uXKjTR1Ty2HWfo9/4FDgAR3UlNeHKtFYhyvk/OUerur
nUkmH2mrKZ/7t54KDiInw9Ub0MY/9S82XdYfgeM9BkaKTODfgaFT0P46YcL4QjiV
6iJ0WbGYjZ3fpYEH0tSViuA+nxiI4UrA+LCOQN+Kk+nk3EPgMzaOcRqsQRZvrUbb
xOdt5KhFO8xKQmafpuE7NgkmtW1ScGsAnXw7VsvvNQCHNsuL0/U=
=tQvh
-----END PGP SIGNATURE-----

--Sig_/AuWFwjE+475BmBxWNfi.CUx--

--===============0314932309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0314932309==--
