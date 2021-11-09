Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E170544AA9D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265586E880;
	Tue,  9 Nov 2021 09:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142D6E880
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:32:58 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id k37so134610lfv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 01:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=dzyWiDThp/QV7JKGlHW50JaZTqERXeMkLjZLJt4dQow=;
 b=OtzfHnSTQNB+8d4DyuAB70dD8NuK4jteiL0Qrs27E9mmcFrFaRA61+dyn9BLZ9ff9G
 zPludr90KCtXPCTtrxg2o6EJ7X8aO5FZi579coLi3/2TLg02Q+mClu9eZf2EaAGgQMXa
 2cxu+jGqmy/gxSzVDMKTF+JXE3vGb1DRFbnzrwXuogyIN9334tXAVq3lyjkvQuh5q35u
 UvgJx/XYVivby9CVUymSECVuRyJEZsjcfWpeuqwB4BCM86IFK5nDNVTlu/wcuTQDYUu3
 ZI5MIqvCfvJQNT2aYQaZz5iUHyV8yqp+31isfTXzMlm6kBG0v3QrHgLNZ9SyoGvbU8OZ
 3drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dzyWiDThp/QV7JKGlHW50JaZTqERXeMkLjZLJt4dQow=;
 b=JSbJ7+wFlxWnthCARv96IQ/D6G5PCAavLPl8H0Owy3keVs2KfX4YjN3qMEThs9Wm1B
 pHaAkRYTtYlI/o+PtdZTgGZ+HXO9aaBAC7w/JZttGkXFUbJs1ynBkWWSm/hiv8HxCuzN
 sl4nKZE+72dyOEQgWdrIIYxfwN+uu/yb+Wvp1G8sNYRmIUeIDhjm6v8D4TUlHt8i+LRt
 cbo30oP2K9AaYlyPGh1TtBBZjGBypLp5UahP8ByxpbnDcESMWNhb4wztekXSPHs8vkbk
 xti+zkGpC4wx1Sxt68S+1t6A/3E5ocuAH2ZqcjA2EfS+ehbBc2XacxqIIG2f7HfuMvpF
 jcrQ==
X-Gm-Message-State: AOAM533MbKwTO7DjPROlE5Im5RBUBdcbha80AMq+Tj+soc03OAacVZAR
 oNna5MeMC7Yf1ALa9uKRjEM=
X-Google-Smtp-Source: ABdhPJw5q6RjuoyWANzEgq/dteOIN+M1peHkqbIDrK5qeyjCoin00pT3vLFSDau9Q3v4rS6QBx6MAw==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr5690318lfr.415.1636450376909; 
 Tue, 09 Nov 2021 01:32:56 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q9sm1679210lfu.232.2021.11.09.01.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:32:56 -0800 (PST)
Date: Tue, 9 Nov 2021 11:32:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v2 0/8] Add new formats support to vkms
Message-ID: <20211109113253.480ee93b@eldfell>
In-Reply-To: <20211026113409.7242-1-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8754mvM9oDV9wpyJwjAnbuL";
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/8754mvM9oDV9wpyJwjAnbuL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Oct 2021 08:34:00 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Summary
> =3D=3D=3D=3D=3D=3D=3D
> This series of patches refactor some vkms components in order to introduce
> new formats to the planes and writeback connector.
>=20
> Now in the blend function, the plane's pixels are converted to ARGB161616=
16
> and then blended together.
>=20
> The CRC is calculated based on the ARGB1616161616 buffer. And if required,
> this buffer is copied/converted to the writeback buffer format.
>=20
> And to handle the pixel conversion, new functions were added to convert
> from a specific format to ARGB16161616 (the reciprocal is also true).
>=20
> Tests
> =3D=3D=3D=3D=3D
> This patch series was tested using the following igt tests:
> -t ".*kms_plane.*"
> -t ".*kms_writeback.*"
> -t ".*kms_cursor_crc*"
> -t ".*kms_flip.*"
>=20
> New tests passing
> -------------------
> - pipe-A-cursor-size-change
> - pipe-A-cursor-alpha-transparent
>=20
> Performance
> -----------
> Following some optimization proposed by Pekka Paalanen, now the code
> runs way faster than V1 and slightly faster than the current implementati=
on.
>=20
> |                          Frametime                          |
> |:---------------:|:---------:|:--------------:|:------------:|
> |  implmentation  |  Current  |  Per-pixel(V1) | Per-line(V2) |
> | frametime range |  8~22 ms  |    32~56 ms    |    6~19 ms   |
> |     Average     |  10.0 ms  |     35.8 ms    |    8.6 ms    |

Wow, that's much better than I expected.

What is your benchmark? That is, what program do you use and what
operations does it trigger to produce these measurements? What are the
sizes of all the planes/buffers involved? What kind of CPU was this ran
on?


Thanks,
pq

>=20
> Writeback test
> --------------
> During the development of this patch series, I discovered that the
> writeback-check-output test wasn't filling the plane correctly.
>=20
> So, currently, this patch series is failing in this test. But I sent a
> patch to igt to fix it[1].
>=20
> XRGB to ARGB behavior
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> During the development, I decided to always fill the alpha channel of
> the output pixel whenever the conversion from a format without an alpha
> channel to ARGB16161616 is necessary. Therefore, I ignore the value
> received from the XRGB and overwrite the value with 0xFFFF.
>=20
> ---
> Igor Torrente (8):
>   drm: vkms: Replace the deprecated drm_mode_config_init
>   drm: vkms: Alloc the compose frame using vzalloc
>   drm: vkms: Replace hardcoded value of `vkms_composer.map` to
>     DRM_FORMAT_MAX_PLANES
>   drm: vkms: Add fb information to `vkms_writeback_job`
>   drm: drm_atomic_helper: Add a new helper to deal with the writeback
>     connector validation
>   drm: vkms: Refactor the plane composer to accept new formats
>   drm: vkms: Exposes ARGB_1616161616 and adds XRGB_16161616 formats
>   drm: vkms: Add support to the RGB565 format
>=20
>  drivers/gpu/drm/drm_atomic_helper.c   |  47 ++++
>  drivers/gpu/drm/vkms/vkms_composer.c  | 329 +++++++++++++++-----------
>  drivers/gpu/drm/vkms/vkms_drv.c       |   6 +-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  14 +-
>  drivers/gpu/drm/vkms/vkms_formats.h   | 252 ++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c     |  17 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  33 ++-
>  include/drm/drm_atomic_helper.h       |   3 +
>  8 files changed, 545 insertions(+), 156 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20


--Sig_/8754mvM9oDV9wpyJwjAnbuL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGKQEUACgkQI1/ltBGq
qqch8g/7BQwZ1d5VQOrWESLJsHzLFjMK1PBpACEBb/5Bx6IQnMkiQud36VPeAHSK
0CH4E7pWH3InVJu0kM1XftvOHpZRJidWVATZAZh5/VwKhvuW7G9fGoEG6lmDbsQB
wUdpE5pBRBpTz5HAnN7e4CuCswerK5tbHwhJN+N4z4sFprYzJzvabVPIhAX2pXeu
tKZpXsb1Oy8Fyiq/vp+3ib9NAaajQsy9tVVYkn+IB2W30cGc4PnUl3lmOUYTceJr
Uus94enu4XD3atwJMBMNc443SHDuvheMmP6be5TT/J0YF3NiKtZI4CkliO/UvXWq
eWxKO2ncboCdGkfn7gw/se+/UYlehg+X0HbzZl8IoyAmGoKe5lyS66cSEN+4l60O
AKTJOrA9iBMvrxxeLSIwbAFLDQMxVy1O7Gu0tMdt+Ghf5njCuNMqjbpL+cg8snMD
TudwpwdsEfVIWXXNWGWTXAn/U4R5uO7rZ3aFo5y578v7s3jfAeqEBURHiH3Ex2X2
sCmMgjvQvpi6zKgwzscLUJnnlxXX3d8iZ4wdODmYRRwNfPGwZxKBYtHgaW1MUNOZ
FnKbDIrop9YSkAwoK9snAnGkG+gLxGunZ0ESGcSiNx9lPrAPMs+msP/MEkynj4CU
Au320wT4HHPr9Sr10QJ4F4dyJy2SVmiPzOqVIqIsBhSjNdh6UA4=
=Gmsl
-----END PGP SIGNATURE-----

--Sig_/8754mvM9oDV9wpyJwjAnbuL--
