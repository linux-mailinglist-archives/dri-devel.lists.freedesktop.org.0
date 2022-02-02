Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFA54A6CF8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702F010F9E6;
	Wed,  2 Feb 2022 08:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CAD10F9D8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:36:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u6so39054514lfm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 00:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=lMYq3dawn17r28cJOnpZ7CNqUjijOPT/dKM7dDpKkw0=;
 b=JxSiDq0vmM/LwtdmDj7HNJw2EZgl0vmRpB8q2QFkfBrBJ9Ns8TOO+QjUyTPazV/Jto
 JrVQI38WdeaWjpkcID3uZat/+NDslBNM3YJCVL06VqpjfZR+CrTsPoa5oqo4iRUG3aN7
 Li7rbfX++IFaomV7NPQjWtENE1g2MBDspkmITpErWa1gZrjcaZrfu02bFg8O9rS2ACj7
 mHqAHogjJdUgkEXMaLQN6gv0vr3S9BI5vpt/aiB6hqSyUkotHxIf5dgKj6KygcAxVgmX
 9gS7qGXlzkLLglJnhEKft5xLGUcdgZpP8sy5Z/pXbzDzQ0oQ8BpyLtPODdSNnAhZBsCc
 0OVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lMYq3dawn17r28cJOnpZ7CNqUjijOPT/dKM7dDpKkw0=;
 b=FqLsD4nnvVV6vJI5zosU6am/sBSNovL0e1s0rdlQYmi3jVD7fF51O4We5eWtPntZ4q
 1I0TJ7x5JPERvEPsg8iNdtwReK0yhss5rDLbq0X/18fA2UjL6z2sycLVOPHKIQ7YhI6E
 8XdxrTeHeVs1p4JLbpLy264MHXQ8jfj0QGgvOPnvG2nFyNZx/E9mNyC7vYorm3eqhXRL
 nqJxzktK/FxwNYM3XzDQ8kQe/ppZx4be4TQsO+mzAtS+3/A6kf2yraUA9fR6ORTmYU4M
 U7FSYrzddM1ih1IQwsuyQxBkdVFDxAb9Rk11MLp4Y/0UfSHB324lKpsg01ryT/45FLXi
 15Sw==
X-Gm-Message-State: AOAM532xiWHWcA6niwX+mex59slQGDwI57sWG7vAW/zh7Z0AGXVZ7L0A
 JFISuYFftI7KUccKKA8aots=
X-Google-Smtp-Source: ABdhPJzrUE8bsuY0pBB+B3Q6IWRUIm27iOaQpp2E3rTZZjjbnzbciJzZV6ukgKSZ0B64juJG+bei0g==
X-Received: by 2002:a05:6512:3086:: with SMTP id
 z6mr15989328lfd.85.1643791008657; 
 Wed, 02 Feb 2022 00:36:48 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i21sm3784299lfr.85.2022.02.02.00.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 00:36:48 -0800 (PST)
Date: Wed, 2 Feb 2022 10:36:33 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document struct drm_mode_fb_cmd2
Message-ID: <20220202103633.64a08a21@eldfell>
In-Reply-To: <20220201094101.92472-1-contact@emersion.fr>
References: <20220201094101.92472-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2jzO6nHSu7b3mnuEueEk1hx";
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
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2jzO6nHSu7b3mnuEueEk1hx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 01 Feb 2022 09:41:20 +0000
Simon Ser <contact@emersion.fr> wrote:

> Follow-up for the DRM_IOCTL_MODE_GETFB2 docs.
>=20
> v2: (Daniel Stone)
> - Replace fourcc.org with drm_fourcc.h because this is the
>   authoritative source and the website may have mismatches.
> - Drop assumption that offsets will generally be 0.
> - Mention that unused entries must be zero'ed out.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Stone <daniels@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 88 +++++++++++++++++++++++++------------
>  1 file changed, 60 insertions(+), 28 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index e1e351682872..a345404dd315 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -663,41 +663,73 @@ struct drm_mode_fb_cmd {
>  #define DRM_MODE_FB_INTERLACED	(1<<0) /* for interlaced framebuffers */
>  #define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifer[] */
> =20
> +/**
> + * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
> + *
> + * This struct holds frame-buffer metadata. There are two ways to use it:
> + *
> + * - User-space can fill this struct and perform a &DRM_IOCTL_MODE_ADDFB2
> + *   ioctl to register a new frame-buffer. The new frame-buffer object I=
D will
> + *   be set by the kernel in @fb_id.
> + * - User-space can set @fb_id and perform a &DRM_IOCTL_MODE_GETFB2 ioct=
l to
> + *   fetch metadata about an existing frame-buffer.
> + *
> + * In case of planar formats, this struct allows up to 4 buffer objects =
with
> + * offsets and pitches per plane. The pitch and offset order is dictated=
 by the
> + * format FourCC as defined by ``drm_fourcc.h``, e.g. NV12 is described =
as:
> + *
> + *     YUV 4:2:0 image with a plane of 8 bit Y samples followed by an
> + *     interleaved U/V plane containing 8 bit 2x2 subsampled colour diff=
erence
> + *     samples.
> + *
> + * So it would consist of a Y plane at ``offsets[0]`` and a UV plane at
> + * ``offsets[1]``.
> + *
> + * To accommodate tiled, compressed, etc formats, a modifier can be spec=
ified.
> + * For more information see the "Format Modifiers" section. Note that ev=
en
> + * though it looks like we have a modifier per-plane, we in fact do not.=
 The
> + * modifier for each plane must be identical. Thus all combinations of
> + * different data layouts for multi-plane formats must be enumerated as
> + * separate modifiers.
> + *
> + * All of the entries in @handles, @pitches, @offsets and @modifier must=
 be
> + * zero when unused. Warning, for @offsets and @modifier zero can't be u=
sed to
> + * figure out whether the entry is used or not since it's a valid value =
(a zero
> + * offset is common, and a zero modifier is &DRM_FORMAT_MOD_LINEAR).
> + */
>  struct drm_mode_fb_cmd2 {
> +	/** @fb_id: Object ID of the frame-buffer. */
>  	__u32 fb_id;
> +	/** @width: Width of the frame-buffer. */
>  	__u32 width;
> +	/** @height: Height of the frame-buffer. */
>  	__u32 height;
> -	__u32 pixel_format; /* fourcc code from drm_fourcc.h */
> -	__u32 flags; /* see above flags */
> +	/**
> +	 * @pixel_format: FourCC format code, see ``DRM_FORMAT_*`` constants in
> +	 * ``drm_fourcc.h``.
> +	 */
> +	__u32 pixel_format;
> +	/**
> +	 * @flags: Frame-buffer flags (see &DRM_MODE_FB_INTERLACED and
> +	 * &DRM_MODE_FB_MODIFIERS).
> +	 */
> +	__u32 flags;
> =20
> -	/*
> -	 * In case of planar formats, this ioctl allows up to 4
> -	 * buffer objects with offsets and pitches per plane.
> -	 * The pitch and offset order is dictated by the fourcc,
> -	 * e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
> -	 *
> -	 *   YUV 4:2:0 image with a plane of 8 bit Y samples
> -	 *   followed by an interleaved U/V plane containing
> -	 *   8 bit 2x2 subsampled colour difference samples.
> -	 *
> -	 * So it would consist of Y as offsets[0] and UV as
> -	 * offsets[1].  Note that offsets[0] will generally
> -	 * be 0 (but this is not required).
> -	 *
> -	 * To accommodate tiled, compressed, etc formats, a
> -	 * modifier can be specified.  The default value of zero
> -	 * indicates "native" format as specified by the fourcc.
> -	 * Vendor specific modifier token.  Note that even though
> -	 * it looks like we have a modifier per-plane, we in fact
> -	 * do not. The modifier for each plane must be identical.
> -	 * Thus all combinations of different data layouts for
> -	 * multi plane formats must be enumerated as separate
> -	 * modifiers.
> +	/**
> +	 * @handles: GEM buffer handle, one per plane. Set to 0 if the plane is
> +	 * unused.

Hi,

should there be a note that the handles may not be unique? I.e. one can
use the same GEM buffer for more than one plane.

>  	 */
>  	__u32 handles[4];
> -	__u32 pitches[4]; /* pitch for each plane */
> -	__u32 offsets[4]; /* offset of each plane */
> -	__u64 modifier[4]; /* ie, tiling, compress */
> +	/** @pitches: Pitch (aka. stride), one per plane. */
> +	__u32 pitches[4];
> +	/** @offsets: Offset into the buffer, one per plane. */
> +	__u32 offsets[4];

Would be nice to mention the units for pitches and offsets.

> +	/**
> +	 * @modifier: Format modifier, one per plane. See ``DRM_FORMAT_MOD_*``
> +	 * constants in ``drm_fourcc.h``. All planes must use the same
> +	 * modifier. Ignored unless &DRM_MODE_FB_MODIFIERS is set in @flags.
> +	 */
> +	__u64 modifier[4];
>  };
> =20
>  #define DRM_MODE_FB_DIRTY_ANNOTATE_COPY 0x01

LGTM!

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/2jzO6nHSu7b3mnuEueEk1hx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmH6QpEACgkQI1/ltBGq
qqdNKw//Zd/ASd38WxZqBquITdh+7Sztc8keDGvYeyMOBrE1uHHaSAHb9wkaPaJO
nw8EQ+ruVTh2Nue8NSuwXjvcctJtLwVcftbl1RY11U0vOK/hWmEal24DuaxRjPpg
K+BMbMWDbAe1Tiqc9RcQt2hAYN0/FyEwuTBwlBCJMX+8pzKi9xxkrUoy4wBBqtmX
JIdfY9Z81FVsUhPkLu4ZWdCiZXCZ/pNIqBAhft2Rmb8j0PjgMRkQfo7BeCJCPSte
wb31pXsRM1+f5C/nn96ymyt5xK7ryLCX1gE2FVHLmcg+JDtkHOets8Vb9g7qVooQ
KJA7BlFwlsyEKnxJ+aqtB4m9tsIIYJ1IIkL1y9XI6fvRfuIO22Imevv1VtlBmySw
cafRSCL0LddhjYZpCwfswmiMBOjBfrUC/Qps6prtUY2Xszzznsg9FHt0qUry2+wE
Z4PkNGS/dyMRfC1o1n9EyuVmAEb+Q/Zz/AiEw5ukUVx9u3bADULBoCGH71Br/0gB
Pb7k3LcttUqhIPhu1CCi6/w+v4JVXbHPLd9ojamZ7fu3Ps+TvvS8QQdtTciCkiaY
B0E7ob4XgmrGLKSW4mZKVZnQvwdHMwmIAnZ6s8crwMfryqJwvC6b6+VgzWH7zqcK
MLEQb9oJyKn9Jsvs51MvtqPXX5jGzb5DLszQ/3CiHEFQv4nZi2s=
=j+dt
-----END PGP SIGNATURE-----

--Sig_/2jzO6nHSu7b3mnuEueEk1hx--
