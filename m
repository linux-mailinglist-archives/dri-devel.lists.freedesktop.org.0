Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C93D1F0B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630FD6ED13;
	Thu, 22 Jul 2021 07:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770E86ED13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:32:22 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f30so7038069lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 00:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=V7RbGsMvuQWWw/jEOCkURCfPBnziiB0dA80nvk3WUcI=;
 b=vCfWmpEkJOlPr7i0mICszS/MDLJdtToJkeGy9qfhXYnb4Ivsxk4GbAtn2EomfVEUia
 BLchxmloI0M0S1t99zbYYi1szrKSDbRMJlIJco/OX22mSL1/D92Vni6SQod3wsnxjXcL
 kbk9NGUPpzjpYdkZWBAf8wlDkPaKcJJ2gTF0K/BSQ4I+VZReWJCX4BO/I8OsmttBCK2q
 N8E+9U4HEJ40AjCIQsPII+RazaXtGmLTTQdTW9keF9Ko1n2La6w9u+EspqrNrbvpa0sq
 IdQMzoJcMAijLtCcW31hcymEHT44J6yWpBPGpJZ3hIKnkpTHNk8K4FQBBNxoDb7hJHdX
 FV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=V7RbGsMvuQWWw/jEOCkURCfPBnziiB0dA80nvk3WUcI=;
 b=JXe9gmufxzZ1sBXcVglBVNkc3cC0OlKAwnqjC7iegNNVYOwqlMx9ZDk63Tb/Zqqeps
 BjiVACJ9j+4164N0dC4Oc+DbdHp5z7WR2MBsXKNBJTS4zsN++kuHm7EAFbkn4doiGS2S
 cjz9sKmZQgC7ag9O3AV8PtVj8hpqStkbvRPPunh/3ueedk5uCrH3i4/oMxJ9nyxE7FUf
 HzeSZ3iyLkU2iChc7vMI9OhNnPJey4ojZNDWmpF4NHfVRnGw9TYHI6IY0hGYhae/18uY
 4eGIYlE7eg+DyuoVWTiNRQqQjHhIc8XOEPN/Re/YlRBIhVx9kQc303G1fUa6ferN1xJ/
 cOFA==
X-Gm-Message-State: AOAM532sdnoGxlydTRDTkKnGMmlRUFc2Li7S2INOsqAEWIufJYmxfplq
 UJFOF+c4NdTXH8sI395o1ww=
X-Google-Smtp-Source: ABdhPJzT8E0b89RjOMV/gF5kzpyTCevkfyruWaM1npTEQt97I1eXfls41XjEilV/Se8xoeebGUeV1A==
X-Received: by 2002:a19:791b:: with SMTP id u27mr28647300lfc.101.1626939140834; 
 Thu, 22 Jul 2021 00:32:20 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o19sm1909448lfk.299.2021.07.22.00.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:32:20 -0700 (PDT)
Date: Thu, 22 Jul 2021 10:32:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_mode_get_property
Message-ID: <20210722103210.3fd9b2ae@eldfell>
In-Reply-To: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
References: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GTmfXP8c8a+quAAAK/JoneV";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GTmfXP8c8a+quAAAK/JoneV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jul 2021 06:49:32 +0000
Simon Ser <contact@emersion.fr> wrote:

> It's not obvious what the fields mean and how they should be used.
> The most important detail is the link to drm_property.flags, which
> describes how property types work.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 52 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 98bf130feda5..dfdb595875aa 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -546,17 +546,61 @@ struct drm_mode_property_enum {
>  	char name[DRM_PROP_NAME_LEN];
>  };
> =20
> +/**
> + * struct drm_mode_get_property - Get property metadata.
> + *
> + * User-space can perform a GETPROPERTY ioctl to retrieve information ab=
out a
> + * property.
> + *
> + * The meaning of the @values_ptr field changes depending on the propert=
y type.
> + * See &drm_property.flags for more details.
> + *
> + * The @enum_blob_ptr and @count_enum_blobs fields are only meaningful w=
hen the
> + * property has the type &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK. =
For
> + * backwards compatibility, the kernel will always set @count_enum_blobs=
 to
> + * zero when the property has the type &DRM_MODE_PROP_BLOB. User-space m=
ust
> + * ignore these two fields if the property has a different type.
> + *
> + * User-space is expected to retrieve values and enums by performing thi=
s ioctl
> + * at least twice: the first time to retrieve the number of elements, the
> + * second time to retrieve the elements themselves.
> + *
> + * To retrieve the number of elements, set @count_values and @count_enum=
_blobs
> + * to zero, then call the ioctl. @count_values will be updated with the =
number
> + * of elements. If the property has the type &DRM_MODE_PROP_ENUM or
> + * &DRM_MODE_PROP_BITMASK, @count_enum_blobs will be updated as well.
> + *
> + * To retrieve the elements themselves, allocate an array for @values_pt=
r and
> + * set @count_values to its capacity. If the property has the type
> + * &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK, allocate an array for
> + * @enum_blob_ptr and set @count_enum_blobs to its capacity. Calling the=
 ioctl
> + * again will fill the arrays.
> + */
>  struct drm_mode_get_property {
> -	__u64 values_ptr; /* values and blob lengths */
> -	__u64 enum_blob_ptr; /* enum and blob id ptrs */
> +	/** @values_ptr: Pointer to a ``__u64`` array. */
> +	__u64 values_ptr;
> +	/** @enum_blob_ptr: Pointer to a struct drm_mode_property_enum array. */
> +	__u64 enum_blob_ptr;
> =20
> +	/**
> +	 * @prop_id: Object ID of the property which should be retrieved. Set
> +	 * by the caller.
> +	 */
>  	__u32 prop_id;
> +	/**
> +	 * @flags: ``DRM_MODE_PROP_*`` bitfield. See &drm_property.flags for
> +	 * a definition of the flags.
> +	 */
>  	__u32 flags;
> +	/**
> +	 * @name: Symbolic property name. User-space should use this field to
> +	 * recognize properties.
> +	 */
>  	char name[DRM_PROP_NAME_LEN];
> =20
> +	/** @count_values: Number of elements in @values_ptr. */
>  	__u32 count_values;
> -	/* This is only used to count enum values, not blobs. The _blobs is
> -	 * simply because of a historical reason, i.e. backwards compat. */
> +	/** @count_enum_blobs: Number of elements in @enum_blob_ptr. */
>  	__u32 count_enum_blobs;
>  };
> =20

LGTM.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

You can keep the ack after addressing Daniel's comments, too.


Thanks,
pq

--Sig_/GTmfXP8c8a+quAAAK/JoneV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmD5HvoACgkQI1/ltBGq
qqd7ZA/8CxRCl79220UIHUa8tmJxqB7mOpUB08recNy1QiWBy2n7dFZp4KBlZ8YJ
NSI/oZRPtMjsys3p0+AkKCM7stvz+0/saW2Tme3HGsopkozBsUkS8f7hjaHszVkt
ZMpClwl/Ze0Sai0qKvWZkjLatLBW+bbXk2hPu0mj7npHJwmDJmeUw1CeSc1i4B2g
zkd66EOJR1X3uDkjPMx/9AtrNmfCWwYL6AZvDzvO11Bzx/oYC/XLn3FKEAWckN6B
i7lZLWVPza66jxCKpUoGLVRkiTTNmu9S82mbhyJet9t4U+qOHipimYHqK6rJkQeR
VlhQaY1eBb4T20fYArVYNKwoLazxbXnuQsxoGIyBEWv9MHWkJPlAAm5I7RwzupCr
PbQUTVgALs07fz2/143YLTNQqA6fD+/CE2TmmiG0lDWlzQMhfqzjhviSVHBGrvp1
J1fGPLUuv0xGM4VGp/yVRxxJcpZxPLbuLeSMrmBzk26CO+guG4lUgfXfpAystP14
EfXQlyev5xANpVsUYgaXzAX4z8ZBYqyj/EphYZ4NSY+W4eZBVwAVst15q7nrhgHe
U4NFHE1aEo2ltlCTncmUhE56aDU03LDB3lzeo2PPq0VoHWm4Bs46q8mBa/9cGqNF
WfnOMAJ8RkSYaHr4fKN0JxlB4y03SeKw4i3IeLw4gbZgFTmnaIw=
=UTwt
-----END PGP SIGNATURE-----

--Sig_/GTmfXP8c8a+quAAAK/JoneV--
