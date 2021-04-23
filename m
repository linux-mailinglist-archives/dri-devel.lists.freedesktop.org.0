Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E43690E5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 13:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0C76EB6F;
	Fri, 23 Apr 2021 11:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495CC6EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 11:11:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a13so1447020ljp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=8N3Fk76f7NO9kZ18syaOyq7mqIGKxsXbzSbLSjSsexs=;
 b=AaLY5M4ELUsQeZ976dpBRbG8OjaNwGj5pNydomm2NdKa9VOrlEi7FsB+tnvGHjVfGI
 nrY0zXn4rWISfGGa88Z1IvY5wtZYJFYLMQxCHshbqEHp9yvapZcnCdOHJBSotNtTeS4x
 LcQtd37XN/quV4267W/FkzFYMFhyZUUVTSMnLsFkW0cVg8g4Wz3KyrGU/ABPX+uwsN/A
 RRqoK/EhEYJy9HdGxxPBRI8MRkWBa8FZ5WTollfK0gceUiomz3y+yGBsoQOiaKOqbHJJ
 hyyFeJnztXwGxjUjXMAw3QU2+bN4pCmMOCbzLsV2eOAx4PpUv/3uI6W78394j8dOgXbd
 axKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=8N3Fk76f7NO9kZ18syaOyq7mqIGKxsXbzSbLSjSsexs=;
 b=k4sNcTv8r9059n90WKXcOUA33j+q0+WhWLO75UmhDC8YHxzYF1vhzBLOCi6JKtHdyc
 r9YcKic5eK1mnO3hNjHAcqvyTe1Ngj0h4ezWPL6wrslxzdAPAXX2rex37+UHkYCetWHO
 dmqhHllPn4ouUUfVijHd6Lwrhk7KAbJj9nC8Azaz/oRHTk0A8W110aWfIOL4bJU9NYXC
 ZVuegCBUMhJUTaSsru3sY4tP/ZI0XgNPVF0YCh8qqV8gME4ot+5TMcQg90keUVkhknYB
 GtM25tLQz5RoNR6kXqPPO2/Tjt4DfCvIVeGVLNNn9/FbMUOvAzh1abxLWjmqZo3Uwuok
 UspA==
X-Gm-Message-State: AOAM532HDFlD0gPz1Y2AFFw2nTRrShAb3FcBsBX4p95qJiiG6N35vEks
 KF20YCR0SSlOloE4fdxB2h8=
X-Google-Smtp-Source: ABdhPJwwnu/hP4XBqNh1bVsfDj1z1PpYhjt7ZrYgSvHK9AkFbVDAwxticaHF9Uzh3iSKOxy6byJwSw==
X-Received: by 2002:a2e:9c06:: with SMTP id s6mr2366734lji.508.1619176297543; 
 Fri, 23 Apr 2021 04:11:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c16sm521182lfb.57.2021.04.23.04.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 04:11:37 -0700 (PDT)
Date: Fri, 23 Apr 2021 14:11:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <20210423141126.308d4145@eldfell>
In-Reply-To: <20210422181004.34247-2-leandro.ribeiro@collabora.com>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1641230768=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1641230768==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/c57Shm80ZDSo3rtf=sbzay3"; protocol="application/pgp-signature"

--Sig_/c57Shm80ZDSo3rtf=sbzay3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Apr 2021 15:10:04 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> Add a small description and document struct fields of
> drm_mode_get_plane.
>=20
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a5e76aa06ad5..3e85de928db9 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -312,16 +312,32 @@ struct drm_mode_set_plane {
>  	__u32 src_w;
>  };
>=20
> +/**
> + * struct drm_mode_get_plane - Get plane metadata.
> + *
> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
> + * plane.
> + */
>  struct drm_mode_get_plane {
> +	/** @plane_id: Object ID of the plane. */
>  	__u32 plane_id;
>=20
> +	/** @crtc_id: Object ID of the current CRTC. */
>  	__u32 crtc_id;
> +	/** @fb_id: Object ID of the current fb. */
>  	__u32 fb_id;
>=20
> +	/** @possible_crtcs: Bitmask of CRTC's compatible with the plane. */

This should probably explain what the bits in the mask correspond to.
As in, which CRTC does bit 0 refer to, and so on.

>  	__u32 possible_crtcs;
> +	/** @gamma_size: Size of the legacy gamma table. */

What are the units? Entries? Bytes?

>  	__u32 gamma_size;
>=20
> +	/** @count_format_types: Number of formats. */
>  	__u32 count_format_types;
> +	/**
> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> +	 * supported by the plane. These formats do not require modifiers.

I wonder if the "do not require modifiers" is again going too far in
making a difference between this list and IN_FORMATS?

> +	 */
>  	__u64 format_type_ptr;
>  };

Other than those, looks like a significant improvement to me.


Thanks,
pq

>=20
> --
> 2.31.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--Sig_/c57Shm80ZDSo3rtf=sbzay3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCCq14ACgkQI1/ltBGq
qqfhmg//XnIEQpRhkYP9VEj0V5gydZrEWKuehPTFcRkINAeMxJyBPACIWD4AkTED
NSO2UAO8RPVdxKtrFE1FvaEKQH7qW1Y53GBxNpE+kCol7pXJgYKmzQmq8kRw+N+K
aEhCPrMFYIlFgCsRXHLMr1eal/I8/LU8cqZDp1sJKPdXJ/hvY5AztCOnCJkDLlOK
KHNXDr/Ij2NcRMhwTR2+tigsNA7YEu9TQLttWBU/ZZTr/8bZHTTKgw8FsaW7HVa+
CGy0tRtZMieXD4HzJfTMrDnE/E7kLF3jgZzVhqIjwBWmZPOrVJ8MBqG4+NQvzUtm
djHIvJ9FA3tCXULYqlU9mIiHeDrXqInIq/WgFWgol3lqHoS8AritP9lwVCJAWB4C
tDGvRnUu2EDQPPNmSFz1bgJ/i5isdPxdHQoWS06JDznwQBsictaptNKQUIoHmduW
UH/lgVzIzt4nKmaK9DEoTjV1RzeYuNQdFUgghWxe4+U8yNOvnJMdVGLjVt4wgFSx
f6Fy49/XJboD31StY2f7L+gfBmb4KLCWjTJOlZG253s6uNMjkp8zwSlQnkgfIeJ+
88tb/8YYTUZeLPyONc9B1KTyUhfuEic07R4wWcZSBVo82T4AXXSrmDCB9AwM14A/
kyYSXoFVpmqFX4TFLPk6ol7Dwxb2boHlyh2mSYLBf1gOfdo3GDw=
=7X8O
-----END PGP SIGNATURE-----

--Sig_/c57Shm80ZDSo3rtf=sbzay3--

--===============1641230768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1641230768==--
