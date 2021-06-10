Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F93A26FD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 10:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84886EC7D;
	Thu, 10 Jun 2021 08:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FA16EC7D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 08:27:47 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i10so1896930lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=314AL+WKww6UhsuzdmdR2oOTEYEkQioeiN5z4QlMN2Q=;
 b=g0ttUab7GleoKVZEKlXZiqvCT6lAQgAflxE03XAmDi7CidNE5G4fUWoZv9RTzaXr2c
 TgLglvAPsSicUJen3GtCw72g1k9w++THC+0pAhqa81dI0YlP4Url7zVaPKWG9ONwzGtk
 0jXCt075ZKTb0YsLj7SRJciStpHDZqABmZbKPDiAkroNq3KhzfbxKhU5pBK4rQfM81N5
 euYkIIPDhFPuxLkmFcxvH2eVg4vZZty7BqBEjwvEYFDmid+Pr0RWcnR0u5JY/O635LZP
 G7aCledvvfszQV2sS2t65yI67iMWoDJB1sZPINvL0zJNa9cHRAfTz7N9hUYmV3Tyy0YE
 msUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=314AL+WKww6UhsuzdmdR2oOTEYEkQioeiN5z4QlMN2Q=;
 b=MWtZXU8hf1SlCxuErQPlLuZqUnTmfwTjIHz6pIA9vc7RpBWh5H7416CoczYsYC0dhs
 OFV68KRqM4dhGgbZhUAygg5P4ILBoqY/w2oszMsiBmqtN0Cu4HGR6gA+nSiX2TxxabE5
 dVizyIla8o4lUDPm9avReSSKNuovMCHAm4Oj4uhgCoeT3r2S758nyyvUkvg2XPw5frbm
 c7Ea2h9GUXq2Jcya4UkwH6L3t4R4E/YjYwilICuQctM8I4a68NX2uNn/KZFuLP+UHwpM
 PAhPORX/KZ9o6pA23/Yk7KfP3G6ChDm4IfSQ5gkCRlchZaFXiwqD9UBS4QeWGJhDZFjP
 IhXA==
X-Gm-Message-State: AOAM5322qWTzdtnP7uDMHa/qYT9VQJpU8PYuMm0Od4WTxSCUusWT/FDG
 LjMDPd2zpVG4zhJtllJ7Q1A=
X-Google-Smtp-Source: ABdhPJxiZ2m0rXwe7RPNWOcoeXtJjomU5GZ69PyMqQjyK3wF7wbTq5jzryBbL4o8m3ildsWBIwnf4Q==
X-Received: by 2002:a19:650f:: with SMTP id z15mr1190021lfb.511.1623313665508; 
 Thu, 10 Jun 2021 01:27:45 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b11sm228271lfi.292.2021.06.10.01.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:27:45 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:27:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v4 1/2] drm/doc: document how userspace should find out
 CRTC index
Message-ID: <20210610112742.17d21f7c@eldfell>
In-Reply-To: <20210609230039.73307-2-leandro.ribeiro@collabora.com>
References: <20210609230039.73307-1-leandro.ribeiro@collabora.com>
 <20210609230039.73307-2-leandro.ribeiro@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Vh1flrlQxVn5sANVLKAdX+g"; protocol="application/pgp-signature"
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

--Sig_/Vh1flrlQxVn5sANVLKAdX+g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed,  9 Jun 2021 20:00:38 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> In this patch we add a section to document what userspace should do to
> find out the CRTC index. This is important as they may be many places in
> the documentation that need this, so it's better to just point to this
> section and avoid repetition.
>=20
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  Documentation/gpu/drm-uapi.rst    | 13 +++++++++++++
>  drivers/gpu/drm/drm_debugfs_crc.c |  8 ++++----
>  include/uapi/drm/drm.h            |  4 ++--
>  3 files changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 04bdc7a91d53..7e51dd40bf6e 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -457,6 +457,19 @@ Userspace API Structures
>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>     :doc: overview
>=20
> +.. _crtc_index:
> +
> +CRTC index
> +----------
> +
> +CRTC's have both an object ID and an index, and they are not the same th=
ing.
> +The index is used in cases where a densely packed identifier for a CRTC =
is
> +needed, for instance a bitmask of CRTC's. The member possible_crtcs of s=
truct
> +drm_mode_get_plane is an example.
> +
> +DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC =
ID's,
> +and the CRTC index is its position in this array.
> +
>  .. kernel-doc:: include/uapi/drm/drm.h
>     :internal:
>=20
> diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debu=
gfs_crc.c
> index 3dd70d813f69..bbc3bc4ba844 100644
> --- a/drivers/gpu/drm/drm_debugfs_crc.c
> +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> @@ -46,10 +46,10 @@
>   * it reached a given hardware component (a CRC sampling "source").
>   *
>   * Userspace can control generation of CRCs in a given CRTC by writing t=
o the
> - * file dri/0/crtc-N/crc/control in debugfs, with N being the index of t=
he CRTC.
> - * Accepted values are source names (which are driver-specific) and the =
"auto"
> - * keyword, which will let the driver select a default source of frame C=
RCs
> - * for this CRTC.
> + * file dri/0/crtc-N/crc/control in debugfs, with N being the :ref:`inde=
x of
> + * the CRTC<crtc_index>`. Accepted values are source names (which are
> + * driver-specific) and the "auto" keyword, which will let the driver se=
lect a
> + * default source of frame CRCs for this CRTC.
>   *
>   * Once frame CRC generation is enabled, userspace can capture them by r=
eading
>   * the dri/0/crtc-N/crc/data file. Each line in that file contains the f=
rame
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 67b94bc3c885..bbf4e76daa55 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -635,8 +635,8 @@ struct drm_gem_open {
>  /**
>   * DRM_CAP_VBLANK_HIGH_CRTC
>   *
> - * If set to 1, the kernel supports specifying a CRTC index in the high =
bits of
> - * &drm_wait_vblank_request.type.
> + * If set to 1, the kernel supports specifying a :ref:`CRTC index<crtc_i=
ndex>`
> + * in the high bits of &drm_wait_vblank_request.type.
>   *
>   * Starting kernel version 2.6.39, this capability is always set to 1.
>   */
> --
> 2.31.1
>=20

Hi,

with the caveat that I didn't actually build the docs and see how they
look:

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/Vh1flrlQxVn5sANVLKAdX+g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDBzP4ACgkQI1/ltBGq
qqe6tw//YUqiG/G8MBKyeAFgfJXi/Axk4sNY8594/BNqQMqs3rWarFpse/4/XIfv
Lva/4NtSGKZJvRqQrO9Wjo9Gv4cE+A38mqJmhQOE8HcLsntKdf/R+m/WmYhHxYVv
zZcnXe81l4zVlqyF0KHH2zv5isMl1M1Wqn/A5m+TUxo0LXZuw2dXsglJrIWAFTLv
U/SY6EHZC9RTGNVZaX86bmWw7KaiaFCyJynohNCITP7opGLd7M/kWjjJuE0xrPEd
h+MgAike3W8JAexBRBNH4l5FtRVx7l30YOIfEdVjqR4uQiLGgVimubGh7YsCTWU6
WXZ7ANEU4YHDR+gxUxRTkB1YyGB33nf2ZlB0pXFq0dQW6jheOyJYewAw4TXT6eJP
Vy0d9jZ0ynLzGFzMqlghMxLNlK0WoxHXDcjQICsTRCC8LFtUVd8oXXa36irpakTS
Ur3Gfj7gNgxgIb+yAgEzIqKeXPB1gq+XPiSrk3YFENLXFDYo8xhePt88rEBn7PSq
mfNVUGL0dOKkL6kYSF6oL9//m0YBbYYbe7Lnsz1slpVF88z9CxbD9tD3sJrDjaIm
gZE0Vm4blmBudc2VUrtUvbtRbFrxHk1FJ1kCiWObU9q8GSDi2ulZSwq4fpJz8JQd
6H2HvX2by9XFPjEIAr9vCl4ijis4Cz9N0gr/6pmsvJ7El9ZgRug=
=Zx/Q
-----END PGP SIGNATURE-----

--Sig_/Vh1flrlQxVn5sANVLKAdX+g--
