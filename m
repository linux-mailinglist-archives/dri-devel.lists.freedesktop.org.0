Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C43321E0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 10:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0AC89CD3;
	Tue,  9 Mar 2021 09:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B6889CD3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 09:24:23 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r3so17721332lfc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=+vi1fVtaZS5/FjMxxjrRTBv/ucbdC7cNY3fOS+Z96OA=;
 b=EF0HqVqycDx262OqlhPMnhRjR1AJ7/kXShRa8EP6sGI9Qioxmn1nFFHcgWPFcGdGTJ
 vWkuYyHcdPv9wauP/ApdqMV7xgPFLouWW0HKm49evpse9mupzd4BhbUnIczWXFJi7VBM
 0q5ffwGNhurIdh+PqEjRTZiPQYASvxEN6xY2OYYtBCVB3I5zeGUh3xYiPTRlNr+4HASJ
 6FVemhJZxqXDnfnYLCi2m0UDR/Jnm7cEadYNyy6F5qHGrp7XnEz4Orzzd0lympyKk9Vo
 IdkWm+s1cy1Q3RsiSULpqFcB95KKqQ6nPVx0fT32E0amtNwbbFmHEdNUkHtj03DAMUoe
 VVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=+vi1fVtaZS5/FjMxxjrRTBv/ucbdC7cNY3fOS+Z96OA=;
 b=Q6DM2xEfmTT3MRcM3jFmdkPRDmpIZQ2+Xt2zuzuzBPfGtOgXex74t1b3OUPU9chw0P
 sEYohqqBMJN3U9jeyN76DE4lkgos6pHeAZWClvJ2ufE8SkYYIDYPyn/N0KKJ5lkY8cBW
 5/WjcRzH33SpO7pndFQ2F8Lz+t8WEcMab5cHD48wPXtbDCxsUiHPkoRA1Yu8pv8aVv9p
 UsB13LgqqGUWcnjRlTGHsl1AWEgbYe+e+iYghnJXuDnsKGL/HlLC8dHPhxlu4VG0Q51m
 pxn53GkuqI1f/mATQfl3q/O67Qyox6WszXJwN/p80SCAuU5IJ4IojGiyG7P+DIdM0Zje
 rJVg==
X-Gm-Message-State: AOAM533MONgkl/8ejCU6tD3fInVIHewhdZmnPFMGI52sooDXtN2XJrD5
 m+XD22wI0iVDl4F8//42q+A=
X-Google-Smtp-Source: ABdhPJz+w/kzxasmLOGGjJx+B0UBGSMxEJM6QpfZZsN+qwnhVF8FFX+DowF2VSaO+RC0dGAhdVrUsw==
X-Received: by 2002:a19:8983:: with SMTP id
 l125mr16393031lfd.599.1615281861635; 
 Tue, 09 Mar 2021 01:24:21 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z28sm1873259ljn.117.2021.03.09.01.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 01:24:21 -0800 (PST)
Date: Tue, 9 Mar 2021 11:24:18 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/uapi: document kernel capabilities
Message-ID: <20210309112418.39cc5c41@eldfell>
In-Reply-To: <20210308123421.747836-1-contact@emersion.fr>
References: <20210308123421.747836-1-contact@emersion.fr>
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
Content-Type: multipart/mixed; boundary="===============2058493171=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2058493171==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L6Xy4q4Y4=O.Dtx9PSYL=PA"; protocol="application/pgp-signature"

--Sig_/L6Xy4q4Y4=O.Dtx9PSYL=PA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  8 Mar 2021 13:34:21 +0100
Simon Ser <contact@emersion.fr> wrote:

> Document all of the DRM_CAP_* defines.
>=20
> v2 (Pekka):
> - Describe what the bit depth is
> - Expand on preferred dumb buffer memory access patterns
> - Explain what a PRIME buffer is
> - Mention DRM_IOCTL_PRIME_FD_TO_HANDLE and DRM_IOCTL_PRIME_HANDLE_TO_FD
> - Explicitly reference CLOCK_REALTIME and CLOCK_MONOTONIC
> - Make it clear DRM_CAP_CRTC_IN_VBLANK_EVENT applies to both DRM_EVENT_VB=
LANK
>   and DRM_EVENT_FLIP_COMPLETE
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm.h | 112 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 108 insertions(+), 4 deletions(-)

Hi,

this all looks good to me for what I know, so:
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 0827037c5484..79e9c9d5e7a9 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,30 +625,134 @@ struct drm_gem_open {
>  	__u64 size;
>  };
> =20
> +/**
> + * DRM_CAP_DUMB_BUFFER
> + *
> + * If set to 1, the driver supports creating dumb buffers via the
> + * &DRM_IOCTL_MODE_CREATE_DUMB ioctl.
> + */
>  #define DRM_CAP_DUMB_BUFFER		0x1
> +/**
> + * DRM_CAP_VBLANK_HIGH_CRTC
> + *
> + * If set to 1, the kernel supports specifying a CRTC index in the high =
bits of
> + * &drm_wait_vblank_request.type.
> + */
>  #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
> +/**
> + * DRM_CAP_DUMB_PREFERRED_DEPTH
> + *
> + * The preferred bit depth for dumb buffers.
> + *
> + * The bit depth is the number of bits used to indicate the color of a s=
ingle
> + * pixel excluding any padding. This is different from the number of bit=
s per
> + * pixel. For instance, XRGB8888 has a bit depth of 24 but has 32 bits p=
er
> + * pixel.
> + */
>  #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
> +/**
> + * DRM_CAP_DUMB_PREFER_SHADOW
> + *
> + * If set to 1, the driver prefers userspace to render to a shadow buffer
> + * instead of directly rendering to a dumb buffer. For best speed, users=
pace
> + * should do streaming ordered memory copies into the dumb buffer and ne=
ver
> + * read from it.
> + */
>  #define DRM_CAP_DUMB_PREFER_SHADOW	0x4
> +/**
> + * DRM_CAP_PRIME
> + *
> + * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_=
IMPORT
> + * and &DRM_PRIME_CAP_EXPORT.
> + *
> + * PRIME buffers are exposed as dma-buf file descriptors. See
> + * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
> + */
>  #define DRM_CAP_PRIME			0x5
> +/**
> + * DRM_PRIME_CAP_IMPORT
> + *
> + * If this bit is set in &DRM_CAP_PRIME, the driver supports importing P=
RIME
> + * buffers via the &DRM_IOCTL_PRIME_FD_TO_HANDLE ioctl.
> + */
>  #define  DRM_PRIME_CAP_IMPORT		0x1
> +/**
> + * DRM_PRIME_CAP_EXPORT
> + *
> + * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting P=
RIME
> + * buffers via the &DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl.
> + */
>  #define  DRM_PRIME_CAP_EXPORT		0x2
> +/**
> + * DRM_CAP_TIMESTAMP_MONOTONIC
> + *
> + * If set to 0, the kernel will report timestamps with ``CLOCK_REALTIME`=
` in
> + * struct drm_event_vblank. If set to 1, the kernel will report timestam=
ps with
> + * ``CLOCK_MONOTONIC``. See ``clock_gettime(2)`` for the definition of t=
hese
> + * clocks.
> + */
>  #define DRM_CAP_TIMESTAMP_MONOTONIC	0x6
> +/**
> + * DRM_CAP_ASYNC_PAGE_FLIP
> + *
> + * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
> + */
>  #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
> -/*
> - * The CURSOR_WIDTH and CURSOR_HEIGHT capabilities return a valid widthx=
height
> - * combination for the hardware cursor. The intention is that a hardware
> - * agnostic userspace can query a cursor plane size to use.
> +/**
> + * DRM_CAP_CURSOR_WIDTH
> + *
> + * The ``CURSOR_WIDTH`` and ``CURSOR_HEIGHT`` capabilities return a valid
> + * width x height combination for the hardware cursor. The intention is =
that a
> + * hardware agnostic userspace can query a cursor plane size to use.
>   *
>   * Note that the cross-driver contract is to merely return a valid size;
>   * drivers are free to attach another meaning on top, eg. i915 returns t=
he
>   * maximum plane size.
>   */
>  #define DRM_CAP_CURSOR_WIDTH		0x8
> +/**
> + * DRM_CAP_CURSOR_HEIGHT
> + *
> + * See &DRM_CAP_CURSOR_WIDTH.
> + */
>  #define DRM_CAP_CURSOR_HEIGHT		0x9
> +/**
> + * DRM_CAP_ADDFB2_MODIFIERS
> + *
> + * If set to 1, the driver supports supplying modifiers in the
> + * &DRM_IOCTL_MODE_ADDFB2 ioctl.
> + */
>  #define DRM_CAP_ADDFB2_MODIFIERS	0x10
> +/**
> + * DRM_CAP_PAGE_FLIP_TARGET
> + *
> + * If set to 1, the driver supports the &DRM_MODE_PAGE_FLIP_TARGET_ABSOL=
UTE and
> + * &DRM_MODE_PAGE_FLIP_TARGET_RELATIVE flags in
> + * &drm_mode_crtc_page_flip_target.flags for the &DRM_IOCTL_MODE_PAGE_FL=
IP
> + * ioctl.
> + */
>  #define DRM_CAP_PAGE_FLIP_TARGET	0x11
> +/**
> + * DRM_CAP_CRTC_IN_VBLANK_EVENT
> + *
> + * If set to 1, the kernel supports reporting the CRTC ID in
> + * &drm_event_vblank.crtc_id for the &DRM_EVENT_VBLANK and
> + * &DRM_EVENT_FLIP_COMPLETE events.
> + */
>  #define DRM_CAP_CRTC_IN_VBLANK_EVENT	0x12
> +/**
> + * DRM_CAP_SYNCOBJ
> + *
> + * If set to 1, the driver supports sync objects. See
> + * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + */
>  #define DRM_CAP_SYNCOBJ		0x13
> +/**
> + * DRM_CAP_SYNCOBJ_TIMELINE
> + *
> + * If set to 1, the driver supports timeline operations on sync objects.=
 See
> + * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> + */
>  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> =20
>  /* DRM_IOCTL_GET_CAP ioctl argument type */


--Sig_/L6Xy4q4Y4=O.Dtx9PSYL=PA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBHPsIACgkQI1/ltBGq
qqcuQhAAtKN8MM/VaMMFadp53dxZViiiREo4gDdgT89R9xtraMywnnImee9Uo0xW
uKAXeM7KUs5spq/WQp11x6QJhnryYzQW/rWgjQGj7BxRSI+u7YCaLxESB1aOTPWm
Vl39V095HUJnUtjsWMU+L0LM5xaRwO1QkHpbjDDvCglMLDongX2qES6dsKZhxp9R
mCGRkQ0LWW4Pt1rVxFNkboqPjfe8WXAHaPywO0BoLFQdQygClfRXDRqkd3LqzqiF
SIT3d2ZTS8ml6vm8JwqGOWtmh42YZpVCx+HfMRN5bi6LUG30JgXbpG27A+fiLnj/
K5+13XFog5ay3FZc5qFp6QVccG0cxsICpn2beppfO9p+l00FrtcUZRCy77t/xRHM
DSzhGRGH6HZfy0GQD8IIezP98q3rIFGRZJIvGgimoIKLHqVAnPyhk260m/lkaGfl
DH/YmNwWwKEGnzHwZp6OeH4pydLZU1Xn4OqTc9axGwtu1tsBzprmvfJaHzwyOGz2
v6N7YTwCKiTU1PnIMmCg0bykiR1RqqGC1RKxrRpwWIRAS8PbaM+56zUz6as6iIiQ
yWpc08l0gfN9EnKIo+KngfbgQNMQ+5LU83w8Wno4+FVphty6IG7dybO9esopjNK5
t6R7VlzqGEWAWPXZzfXHU+RABbdXNIehjsQzUICH9/3BogyGJXs=
=DysE
-----END PGP SIGNATURE-----

--Sig_/L6Xy4q4Y4=O.Dtx9PSYL=PA--

--===============2058493171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2058493171==--
