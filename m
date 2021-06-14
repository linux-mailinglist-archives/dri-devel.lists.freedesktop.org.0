Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6723A5D82
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 09:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BF889CD5;
	Mon, 14 Jun 2021 07:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A82D89CD5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 07:14:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h4so4548356lfu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 00:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=RGWSLXaNQ+I3qBfPdjfvRNTiqVBUCjvHUr0w7x+79y0=;
 b=P0pniJmuJWGjff070E45zTjaS54NaZ+8tmY+DlfEIql7SKNpXYY+PfxD8Yeq1F0jIc
 PTAxMKBNMwFYXVIMAMai4+gG+pjGEwvbn3duMb26+kYIA3X1RpDJ+pVTOWmN1etA1rWT
 RS8lCzSWQHa3sAUiZ/pEWTjYJjx6mAOGGgDf6xjPL3RtqF8VxIPnAze6Br/kkkBKH3cG
 J5BXhIf9eDUH+gigyS06p+kORrfXo8KHwPRHoQrkVGTRM8hveS76iMbiiJmQKJH4Eq//
 uCiDJSR2IDoXu15ULf7L/NSMEa/OAde5I6SvBv2dvYuB5pIrdLAyloTqLPlKqqz4tIrD
 d+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=RGWSLXaNQ+I3qBfPdjfvRNTiqVBUCjvHUr0w7x+79y0=;
 b=EDZn1nHrLzMi+go4f/vuQWIaMtFxNprk203FbKiKhV9h9CavFAdRTKput1l4Kf/A3J
 NOq3W4z50XoDAN3ucMYE9gzKu9J483paoCJ0naTUUlCuo80gWNj59s/iUVTZVt1HAdPz
 o5rdfVlJC0RklANXP8Y6+0yFPZNB/PAQorvrS4PqlpVJnNtDsgj3oFS0H+DR2RGVbopx
 wWumkkfvwJMID8nYhxLg0cYdBj2LY1P/MrtebXoQ1zC0n1SN3q4D3dwvFykYH52SyMth
 JO92BATqeg4Os+P0ILCWndqQbtJU3kwC9sOp1Q6W2fi+5rwEpUQEC+09v28oEoyhLpzv
 Hpng==
X-Gm-Message-State: AOAM532Z8ZWSYoKXzRY1znqS5L8FHEyi0xSvZOhXeppTAj9ykvma6N+Y
 V25YGvC8R51DdW0ccAUpM1g=
X-Google-Smtp-Source: ABdhPJzF4pb4eHcoEceS38hvR6gE9wzbFcdPgVNq4D/k4WuZ4d8E1QpxARgJkzkw6N8O/rqA7IvNhA==
X-Received: by 2002:ac2:551d:: with SMTP id j29mr10983358lfk.319.1623654882252; 
 Mon, 14 Jun 2021 00:14:42 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f5sm1385866lfh.178.2021.06.14.00.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 00:14:41 -0700 (PDT)
Date: Mon, 14 Jun 2021 10:14:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v6 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <20210614101430.02901892@eldfell>
In-Reply-To: <20210611213516.77904-2-leandro.ribeiro@collabora.com>
References: <20210611213516.77904-1-leandro.ribeiro@collabora.com>
 <20210611213516.77904-2-leandro.ribeiro@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mCrc_meftW/P3IoqN9dVk4="; protocol="application/pgp-signature"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/mCrc_meftW/P3IoqN9dVk4=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Jun 2021 18:35:16 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> Add a small description and document struct fields of
> drm_mode_get_plane.
>=20
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Hi,

my

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

still stands as mentioned earlier.


Thanks,
pq

> ---
>  include/uapi/drm/drm_mode.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 9b6722d45f36..98bf130feda5 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -312,16 +312,48 @@ struct drm_mode_set_plane {
>  	__u32 src_w;
>  };
>=20
> +/**
> + * struct drm_mode_get_plane - Get plane metadata.
> + *
> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
> + * plane.
> + *
> + * To retrieve the number of formats supported, set @count_format_types =
to zero
> + * and call the ioctl. @count_format_types will be updated with the valu=
e.
> + *
> + * To retrieve these formats, allocate an array with the memory needed t=
o store
> + * @count_format_types formats. Point @format_type_ptr to this array and=
 call
> + * the ioctl again (with @count_format_types still set to the value retu=
rned in
> + * the first ioctl call).
> + */
>  struct drm_mode_get_plane {
> +	/**
> +	 * @plane_id: Object ID of the plane whose information should be
> +	 * retrieved. Set by caller.
> +	 */
>  	__u32 plane_id;
>=20
> +	/** @crtc_id: Object ID of the current CRTC. */
>  	__u32 crtc_id;
> +	/** @fb_id: Object ID of the current fb. */
>  	__u32 fb_id;
>=20
> +	/**
> +	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
> +	 * are created and they receive an index, which corresponds to their
> +	 * position in the bitmask. Bit N corresponds to
> +	 * :ref:`CRTC index<crtc_index>` N.
> +	 */
>  	__u32 possible_crtcs;
> +	/** @gamma_size: Never used. */
>  	__u32 gamma_size;
>=20
> +	/** @count_format_types: Number of formats. */
>  	__u32 count_format_types;
> +	/**
> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> +	 * supported by the plane. These formats do not require modifiers.
> +	 */
>  	__u64 format_type_ptr;
>  };
>=20
> --
> 2.31.1
>=20


--Sig_/mCrc_meftW/P3IoqN9dVk4=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDHAdYACgkQI1/ltBGq
qqc/qQ/9EwJLQjVbz8C35kPmp2yE7fUQglsrNk939x2CNvhDDOs2S2MpvaVYKqNN
xNEaRo2RuZfz66cv/GMLlul12qunR90LGVSEFX12+uu8dVoVkwzVJKiDUmoDYfoF
sJPtAdxmZDxqE0ryrvp8RdlLwqKGwNIu8kGlYHnYDRsExbnW3dlh892jwGHjmk5m
N9isv5Y3otOGyMQbxE3I0WFM0E3St54YZEu2JP586CBbYxFf/I/mxPbmwGl/1K/b
zCLJw/DLZ7ZpzoEs/jvrMX97NZqZ4bIu7ahbfwWmq4RDK81SCPCI7PyiL0JCqfY1
5Z4OkHsmt039env3Ogr4Mai66fA/dNPReNsY4vkYJAZ8WfQl8WmHZMBVchYa+nwc
SE6a0BPDLc42rPhRagAdH0hcD1oSy9VgW/Cl2LZ++3qEQRPqQOF0xpUcEUwOZMAh
1W0QJeIzIKn0NDQujd7zf+owxc4uFcC2t04Ku5yz4wYGo73BCkkQKCjl/n2QS4kZ
w1W6BCP24EdXgISe06onzfGNSMiEZjkkexil/B9z25JV0Z1d2TJBTyugWam6OSk9
wJfQHMwTslKERmo7juj/XbxPjzGs6ODupPooU1pXvSeIFgIya9dmIk9sOHAAZf1L
VJ18QJd543X4U1t9gTFN0JF8woixOzEmz+8Q9LjS9JbzYqnosIE=
=C9fG
-----END PGP SIGNATURE-----

--Sig_/mCrc_meftW/P3IoqN9dVk4=--
