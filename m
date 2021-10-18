Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B843119C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 09:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0CA6E0A1;
	Mon, 18 Oct 2021 07:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB5C6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:53:44 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id t9so64827412lfd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 00:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=bxVfna16cxYfDlVbnANGIk1HnqAlhaGCp7nH9Gcyq9c=;
 b=QyLwGECEiYP1tJgmurcHjGRXiqLiWofwug6J9SuebZVlwQz8UkoJoD6p9UARsKPksg
 PvCS4852EoKb7J2dgpT1n21mSVuS9nw/yGKFRgoaIFVKr8l9lMbnCGY+GkstLoQedYuF
 djCXmmzV2NmTnK8+h2RETDke0UdWle0a6I8a0U8dhETpFX1ncNPQhGYkmEx7wjZiiLtA
 GUGK2Mk184V+bkVl75e2X2ALndjYH9/jaEfhcPe272pQpNHA1yghoJYEd5GMHfkHLPb/
 fggGNtKoY+mKYJ3yLezM23G8438PvhM62289/RhY0iG1ro3arfvQneGQmGrNtFkIYROx
 VDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=bxVfna16cxYfDlVbnANGIk1HnqAlhaGCp7nH9Gcyq9c=;
 b=veLX3QwDjoIOYhSHqrwmBl6iRHc6jj16l/Z4MyUAD7un/NUpY3F/LE/LmmQ4NJgu8v
 Asc22Sf8BKZO0uIHVre5vqVpoT8wAJilbtdCYVz8sph2i5frydRYFMLb2YNVlTR+pnUj
 1ohYH0uWiJ09Pr2S7Z5qbDxGkkxLrLhCTii8ThNWjs6Atazww+L0VQcxsmS/a9MDnnkk
 RDpX4LbhJaLzp9nbl3lVu5HpwKeQKPAC0xLXyTOIvyzC9UdPNzjRTzHzmUlNJYYHRbfS
 6izeGqwo15nQx9te7vyca+fS3Fk25+TqHhEQI4GxNa4AmecWLpbNt9W018dBgkXUiKoR
 X4dQ==
X-Gm-Message-State: AOAM533fWN7USl7DA6MZdPU+stg6kRdvYpWImr98frz9qaAglOZJGltS
 BQ2n8eO2ZJD2Mup6+P57yBo=
X-Google-Smtp-Source: ABdhPJwNxZP5kz/BgybStPT9EfAJaqXhusTVgcjXO5hDjCD2qbaxLsRU94qz33GF68bDyLtUOTV41g==
X-Received: by 2002:a05:6512:31b:: with SMTP id
 t27mr28619056lfp.688.1634543622240; 
 Mon, 18 Oct 2021 00:53:42 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h23sm1541000ljl.35.2021.10.18.00.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 00:53:41 -0700 (PDT)
Date: Mon, 18 Oct 2021 10:53:33 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: Re: [PATCH 0/6] Refactor the vkms to accept new formats
Message-ID: <20211018105333.5f1bf9fe@eldfell>
In-Reply-To: <20211005201637.58563-1-igormtorrente@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R_1IcPyF+kFhqCYh6Korsfw";
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

--Sig_/R_1IcPyF+kFhqCYh6Korsfw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  5 Oct 2021 17:16:31 -0300
Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:

> XRGB to ARGB behavior
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> During the development, I decided to always fill the alpha channel of
> the output pixel whenever the conversion from a format without an alpha
> channel to ARGB16161616 is necessary. Therefore, I ignore the value
> received from the XRGB and overwrite the value with 0xFFFF.
>=20
> My question is, is this behavior acceptable?

Hi,

that is the expected behaviour. X channel values must never affect
anything on screen, hence they must never affect other channels'
values. You are free to completely ignore X channel values, and if your
output buffer has X channel, then you are free to write (or not write,
unless for security reasons) whatever into it.


Thanks,
pq

>=20
> [1] https://lists.freedesktop.org/archives/igt-dev/2021-October/036125.ht=
ml
>=20
> Igor Matheus Andrade Torrente (6):
>   drm: vkms: Replace the deprecated drm_mode_config_init
>   drm: vkms: Alloc the compose frame using vzalloc
>   drm: vkms: Replace hardcoded value of `vkms_composer.map` to
>     DRM_FORMAT_MAX_PLANES
>   drm: vkms: Add fb information to `vkms_writeback_job`
>   drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to accept multiple
>     formats
>   drm: vkms: Refactor the plane composer to accept new formats
>=20
>  drivers/gpu/drm/vkms/vkms_composer.c  | 275 ++++++++++++++------------
>  drivers/gpu/drm/vkms/vkms_drv.c       |   5 +-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  12 +-
>  drivers/gpu/drm/vkms/vkms_formats.h   | 125 ++++++++++++
>  drivers/gpu/drm/vkms/vkms_writeback.c |  27 ++-
>  5 files changed, 304 insertions(+), 140 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20


--Sig_/R_1IcPyF+kFhqCYh6Korsfw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFtJ/0ACgkQI1/ltBGq
qqf0HRAArta1tWtQSDyslMERLLK3UK0+yHfQBtIIII8mW2/1JMShM7dwdnB/CJGb
7J+135bmSCr0WV1pm2LTSOjfSN5Z+9OZvdUgqY2/l7aWGRcK9jMfm6sndwI+PW1y
WOXhpmkT0dKAjPMAKRKpnUSi9+msjEMqBc/vB4rWYciYNc3vhS1Mj5HWJTUT8FUg
cCWSNUfzjCZ8zBWEvEQODJDUXK/XhND9OhFN83PYcDKcalSt1sA6waVDbi0IlH/S
l7Qm2MwdGrF3KsHqwqciMHyo8i2B5+Ty1u4TBC7pB9NXv4U7jx6osfHhMThsnHRH
ZMf17yMftnZMYgH3WSLGPoRswWwl/J6X72CbHhAz3TKrjDPkbNFxH1pLfSUeosLz
3gRNgJ3noTSTV/0Zbd9AXX61R4MoyWoiW6+k0Sh4GQxu9drNkUrcXnvj3tsst5c6
MFEiQoOeVoaSSrc1w3oJ1TS8HFpS831NLuSg2zG3H1OBSkEWLLU3Sc1fi3APYfzd
xWHZFUUN9waAZhqqD3T50FTkgGyvCT+Y2Nim/PDdMZAL8IZq8ZTFB1vSrK+/sN91
/YlJOvXvWVZW1BWvf/8jZTcLjxOGP+PVxj+wZypA1EhFNIE0MhMbsOsfjrOOYdE4
y2T6KudEskkKtG9e9VzrGAI1c0MajORuqAtuaUOQJyAtDh5gUKo=
=Xvh9
-----END PGP SIGNATURE-----

--Sig_/R_1IcPyF+kFhqCYh6Korsfw--
