Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E91169C6BF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146410E5F2;
	Mon, 20 Feb 2023 08:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B0210E5F2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 08:33:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e9so289940ljn.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 00:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LJTUvy8xY71wq0TlD9vHOLyFegA6shkrwJNzUyoh8nU=;
 b=LTMQZquTJZ2QsKCP7CWZdfhPOtia8XPZoKnyV+7msobESOlhCSFcdSnILKuXW0bk4v
 uEghpRWEdPhG252MTVU73F9JD9/74rzUQhgyzBCpW2Ee0yU3BhzPjMj+vgZ3j7kLt+35
 fVUGP+7gDTr63k+2t5ehmXBbXCbVtQXZPcdNTS/tzc3Gz0PjsLq+o7l8WeoiQHNn0Tt9
 WF+JyYVg6F6Tyg5l9wMoI5QGm6NV/xYu8yWDTTBKD83UjNjtPArXttDNmIXdCk2sSHSp
 RN0vycaCFnELXZCWV/14Tn3JeOJ9CikapGRk/e31+/oVb1/7flMJ0c3yhGwd1XvC5EMv
 wcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LJTUvy8xY71wq0TlD9vHOLyFegA6shkrwJNzUyoh8nU=;
 b=GitUI/atqajIku6XcjDpyZeDLzMwkiBvPaxB7uAzpXCDRn7PA1QL+ZawoEcPKNO6w4
 +oHX5qLQaS8QdAjzLGEq7Oz5SA3jbM7PD7UIwR93apfnP6q8ujLpqnJWYxrPRNU/TrHp
 8lkSRroSfiJakjWM6fgKg0ZTQiXDVHEOJLYei7n/sVOIRq3d7VCmA2oYKEgyxvyECjKh
 T2gFvXA9SEm+9TcJDx4IgpSJhm6hFOmNSe6313nW3/wv3fA6gtv0oIFU4mNu8wK6y/wS
 h5ybMqXTaxfGg4xCitYqRNVeUk2TKJSBGF+GXLRQX/MhFrkG5Wu5DZXXfSmQA3XougFI
 11Kw==
X-Gm-Message-State: AO0yUKUpBKLpVRAS6tbiAfdRXbiycN2+TMHBA8YYibHtC7i/1guTVGco
 ai242rAZU/oNHgeWZmpVKfc=
X-Google-Smtp-Source: AK7set9CoFty5+BC0r0R0qoTMhWkWQI+De3Ui7CBTL3iME0kIpI/ji1nMdHUoMCb8JsKf+z6Nnp/yw==
X-Received: by 2002:a2e:a90b:0:b0:293:5108:1bfc with SMTP id
 j11-20020a2ea90b000000b0029351081bfcmr529082ljq.4.1676881989395; 
 Mon, 20 Feb 2023 00:33:09 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m6-20020a2e9106000000b002946f524adbsm7950ljg.117.2023.02.20.00.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 00:33:08 -0800 (PST)
Date: Mon, 20 Feb 2023 10:32:59 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 2/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
Message-ID: <20230220103259.18af18ca@eldfell>
In-Reply-To: <20230217162151.59996-2-contact@emersion.fr>
References: <20230217162151.59996-1-contact@emersion.fr>
 <20230217162151.59996-2-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9aNEuj.ENjLB2qY8TW3/MCD";
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9aNEuj.ENjLB2qY8TW3/MCD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Feb 2023 16:22:04 +0000
Simon Ser <contact@emersion.fr> wrote:

> v2: mention caps, note that the IOCTLs might fail, document that
> user-space needs a data structure to keep track of the
> handles (Daniel V.)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> ---
>  include/uapi/drm/drm.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 292e4778a2f4..a87bbbbca2d4 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1025,7 +1025,37 @@ extern "C" {
>  #define DRM_IOCTL_UNLOCK		DRM_IOW( 0x2b, struct drm_lock)
>  #define DRM_IOCTL_FINISH		DRM_IOW( 0x2c, struct drm_lock)
> =20
> +/**
> + * DRM_IOCTL_PRIME_HANDLE_TO_FD - Convert a GEM handle to a DMA-BUF FD.
> + *
> + * User-space sets &drm_prime_handle.handle with the GEM handle to expor=
t and
> + * &drm_prime_handle.flags, and gets back a DMA-BUF file descriptor in
> + * &drm_prime_handle.fd.
> + *
> + * The export can fail for any driver-specific reason, e.g. because expo=
rt is
> + * not supported for this specific GEM handle (but might be for others).
> + *
> + * Support for exporting DMA-BUFs is advertised via &DRM_PRIME_CAP_EXPOR=
T.
> + */
>  #define DRM_IOCTL_PRIME_HANDLE_TO_FD    DRM_IOWR(0x2d, struct drm_prime_=
handle)
> +/**
> + * DRM_IOCTL_PRIME_FD_TO_HANDLE - Convert a DMA-BUF FD to a GEM handle.
> + *
> + * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
> + * import, and gets back a GEM handle in &drm_prime_handle.handle.
> + * &drm_prime_handle.flags is unused.
> + *
> + * If an existing GEM handle refers to the memory object backing the DMA=
-BUF,
> + * that GEM handle is returned. Therefore user-space which needs to hand=
le
> + * arbitrary DMA-BUFs must have a user-space lookup data structure to ma=
nually
> + * reference-count duplicated GEM handles. For more information see
> + * &DRM_IOCTL_GEM_CLOSE.
> + *
> + * The import can fail for any driver-specific reason, e.g. because impo=
rt is
> + * only supported for DMA-BUFs allocated on this DRM device.
> + *
> + * Support for importing DMA-BUFs is advertised via &DRM_PRIME_CAP_IMPOR=
T.
> + */
>  #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_=
handle)
> =20
>  #define DRM_IOCTL_AGP_ACQUIRE		DRM_IO(  0x30)

This patch too

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/9aNEuj.ENjLB2qY8TW3/MCD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPzMDsACgkQI1/ltBGq
qqdwqA/+JY/DLMIJEU8IUykamwyJbNUG4j2N9p86A88i8r6TmBgy4Eag0bXWWY8p
sLjxuUWivD38qBnCYW5ToeNJ5dChyBFoWUF/7mfrSijGgJAtTSTWh03H2VJOUGH3
pXFT4dBxDgkwAK8YGp8Dowu37FPXPvQzEJqfrsIErtfN0+qDXPyUAQ+zfEG841O0
DG6BsRxa7GWMx/LXzRJl38v+7TOW2nvlunwp2Nwi6ryn2eZYF4MrWH1TVWZ75tul
zY72fIU9sSNfBfEA/Psd2aqpP9/EeKOgQnKoPqvg306VoMp9Ke58ZSiIxp8ZWZRo
mwYpjWVJYuzLhT1u+AC8URcVyaOot00bBaNHwF+kD6De0RmuKMbwEv5YP5gMuqCm
31xHpsbV6gFHKTW4YOszXNKKX0ak4rUPKegKntIl7qCTQYLq19Zpya0FqfxKszOp
2snErUc5FPdgZ5iqsl1mDo5+BrGcszKV02v5O4XVH4V+AlgE+yqWTUP7M4IFkMGh
7rKGo2RdV+81dnbhPE2F328bU0b2YWadyaoaP2rEuCBUwI31xrF0fzJTNrZeNm7c
T5kyaaBVnRXbUHc1oLLEvSizVShPHFbymyaIC4V8SwkS06LFGzNI0S34VLd0Aqdv
Yau0BkVgkwzrupRTZ4enrf68UFMftVR/ocvtl9/axWBN1DN8hPU=
=qln3
-----END PGP SIGNATURE-----

--Sig_/9aNEuj.ENjLB2qY8TW3/MCD--
