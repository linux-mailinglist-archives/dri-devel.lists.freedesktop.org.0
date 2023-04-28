Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AA6F1908
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87D410ED4F;
	Fri, 28 Apr 2023 13:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03C010ED4F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:12:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4ec816c9d03so10984944e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682687549; x=1685279549;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ONlv/pBnNzNsJzOVny7iGg8MzK+2uBB+rwoCToG/N4o=;
 b=aw17PQrgJMSm9BUhI9IZ9+6y47ET8u+e+Rl2lXxNBXkmu5WKNI7eGA0M2vvw/txLTV
 UejNf5mfZrUyrTV/vL00OmXO4/n6SQxDmOwyCb0MBxRof3rjocHMKjZgz9jleztEvpb4
 Yw5ojmV5mxHj4s5I6KitDIWYZ2fCP8OQKqnv6ZUne136ipLSgKcUyn5qh+hDpQnoM0Kw
 3+KEF1y9dNa1eue9d0Wz4C1Ud4Q78KbD7pdkMQ/g+n/mOVOJ1HN+STP0vM2fiph3vhFa
 Fqkv7rrYFEs/ezy5xZh4tPkOlQcZuP9x0l/cp6U5dWvobuxq4z2sStFwvLhszzpZ1cIw
 Gc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682687549; x=1685279549;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ONlv/pBnNzNsJzOVny7iGg8MzK+2uBB+rwoCToG/N4o=;
 b=XXpco9LQKPevB0hz5P/zDecIa1kFSA3DI9br/gLwdnbVor6mUZueaPURcq1tMtBl9/
 /Jzrm2IT1NA4JDC+NPrt9Rh36hAIaHz+hV2VsdCKcBA5nkyO7pwgWHwx/qTbAWDaocaU
 8RBj3m0I9dJvbP5mP2OXhOabLYbzmRGJQJR4QfWn7tq55NtikYr8j8JEUGnU2VHPWtIh
 eaCAY5SptrQWG3yJkkVoaZrX7yt6JVOLGtyxFhpxyW0N9ipfs8PqX1bQBKbpN/S8s7rp
 QEOCTprBWI/AQ5zOkp/HlShbRtCwnvNGBpHaA5GwJ5hk0gV6SzuD6UI//PmvvXx1VoEY
 h+yA==
X-Gm-Message-State: AC+VfDzpNOaBtRao6I9Lx7mZ8IeO/bs0KuusOBlEL3rMB107EPJo3nRf
 5J67Yaj+4pMs5++JKB2gDP8=
X-Google-Smtp-Source: ACHHUZ6WYixetXxqscnEuaye58EHNCfk7U2R+MR+HHdutBLP3n0D0AInyIH0o5xQZgTALwu/XZmzpQ==
X-Received: by 2002:ac2:4895:0:b0:4eb:30f9:eed7 with SMTP id
 x21-20020ac24895000000b004eb30f9eed7mr1419264lfc.22.1682687549169; 
 Fri, 28 Apr 2023 06:12:29 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w20-20020ac24434000000b004cc8196a308sm3362954lfl.98.2023.04.28.06.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:12:28 -0700 (PDT)
Date: Fri, 28 Apr 2023 16:12:18 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/3] drm: add define for Static_Metadata_Descriptor_ID
Message-ID: <20230428161218.338591a4@eldfell>
In-Reply-To: <20230428100115.9802-2-contact@emersion.fr>
References: <20230428100115.9802-1-contact@emersion.fr>
 <20230428100115.9802-2-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7AesK.59JS9abN2Dz7e=47p";
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
Cc: Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7AesK.59JS9abN2Dz7e=47p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Apr 2023 10:01:29 +0000
Simon Ser <contact@emersion.fr> wrote:

> This avoids hard-coding magic values in user-space, and makes our
> documentation clearer.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 997d23fb2d68..c0c40dc9e2f1 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -849,6 +849,16 @@ struct drm_color_lut {
>  	__u16 reserved;
>  };
> =20
> +/**
> + * enum drm_hdr_metadata_type - HDR metadata descriptor ID.
> + */
> +enum drm_hdr_metadata_type {
> +	/**
> +	 * @DRM_HDR_STATIC_METADATA_TYPE1: Static Metadata Type 1.
> +	 */
> +	DRM_HDR_STATIC_METADATA_TYPE1 =3D 0,
> +};

Hi,

the subject says "define" but this is an enum. No big deal, but the
thing I started wondering is how I am going to use these in userspace.
There is no #define I could test to know if I need to provide a
fallback definition. What's the migration plan for userspace to start
using this and patch 3?

Nevertheless, these are good to have.

Oh, is it a libdrm version check I should use?

In that case, patches 2 and 3 are

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq


> +
>  /**
>   * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
>   *
> @@ -866,6 +876,7 @@ struct hdr_metadata_infoframe {
>  	__u8 eotf;
>  	/**
>  	 * @metadata_type: Static_Metadata_Descriptor_ID.
> +	 * This must be &DRM_HDR_STATIC_METADATA_TYPE1.
>  	 */
>  	__u8 metadata_type;
>  	/**
> @@ -925,6 +936,7 @@ struct hdr_metadata_infoframe {
>  struct hdr_output_metadata {
>  	/**
>  	 * @metadata_type: Static_Metadata_Descriptor_ID.
> +	 * This must be &DRM_HDR_STATIC_METADATA_TYPE1.
>  	 */
>  	__u32 metadata_type;
>  	/**


--Sig_/7AesK.59JS9abN2Dz7e=47p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRLxjIACgkQI1/ltBGq
qqertg/+N077B6lwTPas5wigfehFNdnZO27q+T5K5wCeLIP/aPBPVW/WoEGvJ7IV
b0/3B9jnzcyxKcxW1FI9aCGnXCUEgswmNMD72usYlWyJlq6rb0C/rVeZQ7NhW9I0
JQryx6DMyVtjrLOX7gqLZ2P1uF7WUNtuYOI9wjKJfqEabTTYcJHrQnrc9YZSPHH9
RLx4eBBLZi2OhyunhM/tvaN1sPz6CQQ9fRjmdfWLCbQREjytt0FYzRjRg70Cfrr8
rMxFFr1yk5vocOMF9rhXnYaymMs2kMMyrjBEjgjBUYm1Ipue7FlAbnqlTH5+UeFb
xE4IP81at2/Zus2BAre2c81/kx0snSj+3q9vVpnUUBwasTWsssjDSiw1Liq+jUxQ
eQc3SfryWTVOFdGqL0/jPtTAefO3KT3pOA5yc+Yv2WuR5re2wXUyH0KZacSVhOMm
XOR1dvaTcTXZ30C8GJDwQ7m6x7pdIsE9uW4edYqYbi/cOck/OijAPm7vPbQMp8/y
Z41sQuEBFmHmpUebfCY860Wrtrx0ByVdmwducC4W4Wha1aa3efqibdB2hVETrum/
zyhOff2vKk8fWa6QPBsGHqgiAJc20ueBtrTV7E8jmiI9RcWP9Dvf/zvMNEUiEzOw
CSmNsQIYzoGsUrLhJ8cMm20M8C3fW2xlJFfCDstxKb2bXWL3fXw=
=UQRu
-----END PGP SIGNATURE-----

--Sig_/7AesK.59JS9abN2Dz7e=47p--
