Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE1B41442F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FE36EB18;
	Wed, 22 Sep 2021 08:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE636EB18
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:48:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u8so8830713lff.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=xDTpESJ2z1mKMqQoLO7M5y7KnxXyxwzqWtz/XajKrc4=;
 b=EP8tz3zwtzg0Ls6XAAa3k28kJQBDq2Wu70knAGBL8G6+9SLixuoufH/IXVFYHKdn+o
 F24FR4Wiz+fSL88YJjODKYB4oM6GSoM0aT+TiNJd4oA5OleHR1fOhha2Tw75f3KxBTIY
 yuqRV6KQBvb5cJIm9HVyiAc6nb0GRI1cP0zrFzw0omZVMvCobmobWwcEZESTYgahnEeF
 cEQE/+7XJB1/wKWhpQKhm2bNRs30C9RQK9OHkWcLXF2/CLO35pDNtuRKGaJopQ5+rVfa
 kurPOtMi6KMe3s1HP8Xy3fRHao1WuvyvSr5sLZq+WVf6i3l/z5JVN9dWz0XhoRutK9CX
 +dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=xDTpESJ2z1mKMqQoLO7M5y7KnxXyxwzqWtz/XajKrc4=;
 b=boY66/O5wATtfloc4OJ6FR2rQOdrbO7kBxcZJVxgBymc9hsPnf8xlVo2ycEUvfEQIi
 TxxDySYVBi8ShIotxwGF5OiEfLQm21NPuZqAAhac2wkz/IAA0lRh9Uw+fHx5HCja/UHX
 S7upYUVuNowOTRFDec8LL7QsAbbCYA0Mf2L+CWDtC6quYhVypCfYs1P2N24q20iq61v5
 RuUSuq+1H6DWDshD9iHVvM1Z45OtgRmHT7BjcaiVc2YLChusBfZiWREQf+f0qoCxSlsP
 AQBAaVuKeqkjd7ydv0Mg9nqf4aeN7ql0oFECh5wFf/mgIyta/vxGJmmjfFvYJpOc15Ay
 MO6Q==
X-Gm-Message-State: AOAM530vQf6UkPuLh8MksO6h803LiRU59TQnZ6+sa0txJ6Wz+E6g2pmJ
 H0LTUj1JEoJWEa3WKo6TNjk=
X-Google-Smtp-Source: ABdhPJwbG8FRr3MLPLrsgLcIGO00WzurqrAChJoVpVA3mCBOwXF+BjhWPOZZHrlvSZjVOzDfsUiNOA==
X-Received: by 2002:a2e:9d01:: with SMTP id t1mr21266612lji.34.1632300527589; 
 Wed, 22 Sep 2021 01:48:47 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h10sm172996ljb.140.2021.09.22.01.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:48:47 -0700 (PDT)
Date: Wed, 22 Sep 2021 11:48:44 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Stone <daniels@collabora.com>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <michel@daenzer.net>, Emil Velikov <emil.l.velikov@gmail.com>, Keith
 Packard <keithp@keithp.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/lease: allow empty leases
Message-ID: <20210922114844.67ed5697@eldfell>
In-Reply-To: <20210903130000.1590-2-contact@emersion.fr>
References: <20210903130000.1590-1-contact@emersion.fr>
 <20210903130000.1590-2-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M8T5o6H52OaV1+8t17unO8O";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/M8T5o6H52OaV1+8t17unO8O
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 03 Sep 2021 13:00:32 +0000
Simon Ser <contact@emersion.fr> wrote:

> This can be used to create a separate DRM file description, thus
> creating a new GEM handle namespace.
>=20
> My use-case is wlroots. The library splits responsibilities between
> separate components: the GBM allocator creates buffers, the GLES2
> renderer uses EGL to import them and render to them, the DRM
> backend imports the buffers and displays them. wlroots has a
> modular architecture, and any of these components can be swapped
> and replaced with something else. For instance, the pipeline can
> be set up so that the DRM dumb buffer allocator is used instead of
> GBM and the Pixman renderer is used instead of GLES2. Library users
> can also replace any of these components with their own custom one.
>=20
> DMA-BUFs are used to pass buffer references across components. We
> could use GEM handles instead, but this would result in pain if
> multiple GPUs are in use: wlroots copies buffers across GPUs as
> needed. Importing a GEM handle created on one GPU into a completely
> different GPU will blow up (fail at best, mix unrelated buffers
> otherwise).
>=20
> Everything is fine if all components use Mesa. However, this isn't
> always desirable. For instance when running with DRM dumb buffers
> and the Pixman software renderer it's unfortunate to depend on GBM
> in the DRM backend just to turn DMA-BUFs into FB IDs. GBM loads
> Mesa drivers to perform an action which has nothing driver-specific.
> Additionally, drivers will fail the import if the 3D engine can't
> use the imported buffer, for instance amdgpu will refuse to import
> DRM dumb buffers [1]. We might also want to be running with a Vulkan
> renderer and a Vulkan allocator in the future, and GBM wouldn't be
> welcome in this setup.
>=20
> To address this, GBM can be side-stepped in the DRM backend, and
> can be replaced with drmPrimeFDToHandle calls. However because of
> GEM handle reference counting issues, care must be taken to avoid
> double-closing the same GEM handle. In particular, it's not
> possible to share a DRM FD with GBM or EGL and perform some
> drmPrimeFDToHandle calls manually.
>=20
> So wlroots needs to re-open the DRM FD to create a new GEM handle
> namespace. However there's no guarantee that the file-system
> permissions will be set up so that the primary FD can be opened
> by the compsoitor. On modern systems seatd or logind is a privileged
> process responsible for doing this, and other processes aren't
> expected to do it. For historical reasons systemd still allows
> physically logged in users to open primary DRM nodes, but this
> doesn't work on non-systemd setups and it's desirable to lock
> them down at some point.
>=20
> Some might suggest to open the render node instead of re-opening
> the primary node. However some systems don't have a render node
> at all (e.g. no GPU, or a split render/display SoC).
>=20
> Solutions to this issue have been discussed in [2]. One solution
> would be to open the magic /proc/self/fd/<fd> file, but it's a
> Linux-specific hack (wlroots supports BSDs too). Another solution
> is to add support for re-opening a DRM primary node to seatd/logind,
> but they don't support it now and really haven't been designed for
> this (logind would need to grow a completely new API, because it
> assumes unique dev_t IDs). Also this seems like pushing down a
> kernel limitation to user-space a bit too hard.
>=20
> Another solution is to allow creating empty DRM leases. The lessee
> FD would have its own GEM handle namespace, so wouldn't conflict
> wth GBM/EGL. It would have the master bit set, but would be able
> to manage zero resources. wlroots doesn't intend to share this FD
> with any other process.
>=20
> All in all IMHO that seems like a pretty reasonable solution to the
> issue at hand.
>=20
> Note, I've discussed with Jonas =C3=85dahl and Mutter plans to adopt a
> similar design in the future.
>=20
> Example usage in wlroots is available at [3]. IGT test available
> at [4].
>=20
> [1]: https://github.com/swaywm/wlroots/issues/2916
> [2]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
> [3]: https://github.com/swaywm/wlroots/pull/3158
> [4]: https://patchwork.freedesktop.org/series/94323/
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Keith Packard <keithp@keithp.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/drm_lease.c | 39 +++++++++++++++++--------------------
>  include/uapi/drm/drm_mode.h |  3 ++-
>  2 files changed, 20 insertions(+), 22 deletions(-)

Hi Simon,

that is one awesome commit message!

It explains everything I might have wanted to ask. I also agree with
your analysis, so this is an easy:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Of course, I can't say anything about the actual code.


Thanks,
pq

--Sig_/M8T5o6H52OaV1+8t17unO8O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFK7ewACgkQI1/ltBGq
qqcNABAAjZSs9+/erB9foS1XPHq6RJFG8d2wUxblTVeQxtCB/dhStGCcc4yXV2+r
o6Iq18b+dA6Hed8g/nsfmp++q7qm6SwF0NHEzJCSxt4snoha/CY6/RgIrdoi93vD
45omCrFxsTKvpEeAa2PJfHeV3ixEIxbaZVJJq4mY8AWPRYHZ4GJNcf/DaucU7nPb
fxz30mHJSLXCgJNx+y5PaWXrTjqO+XMVlzJz2/okrj2JifqVDQOHt9mfF5HMPLUj
pv5CKsabfwCeHXkVkdX5rVtyJoc0i6LuOhwU6T/n3EFYyxD7j9oU/De0JUNBA64T
ljzaDjtJR30C8HoZxN4gqP9b94136YyNV6UVQoyoaGF/h2ZolkrS3JL01MR897/I
ubORpPaOX6CDNSPR5T+xvyDBhnvXUfK7wCENCzUww3t2UKDle8qCk3WKdr0uBQNy
AaZw+PMq+KUAFQ/ARF1Nt2GAoBlb1aAbKyIV+U8ezbDoFTUY0yhO1hqJjqVNvzol
t4Tq4gbKxUCi6HvuGZgDNys/IlvOoxUpF1kgAWvVsTxadND1QqULNAM0whGZkmVl
PPD5kM+GwyfDLbhC1z0ooRCkt+kCwYCfHZGBWoAPHdWqvqioz8JpgW4kORuBj6m7
7Nr4nYXZHsq5yS5pUzqMlISh7ZHTYzRZy2CTNQ8kQvABbDOEMKA=
=0qHy
-----END PGP SIGNATURE-----

--Sig_/M8T5o6H52OaV1+8t17unO8O--
