Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB581108C96
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 12:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199466E137;
	Mon, 25 Nov 2019 11:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B86E6E139;
 Mon, 25 Nov 2019 11:06:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t26so15431051wmi.4;
 Mon, 25 Nov 2019 03:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LP4ruR3l8U8jOVtJh9rj4vJon13MDWrKBNh0vRk+V8g=;
 b=pg1ZcBsG20J8g2LvbjBq0Lxwc7lVi0Nw7yZA9NgVs+/fBDO3ifd8B0lGEJVuqugMn5
 zjs66V0ZURLAoYaaYAkEbGG927szufmH9fGGjzUDQhEt/JIugDhWnY5sSJ4sbS9yNfIp
 bopMMVLU4Gt9RWF5GV+QWfbX95J1Lc/2CXi7I3qwkMx1TeEOyzAdEIiF+clKuyXbq6Is
 JZehObf35W/N9Imw0mvuMZN6JXeNHcpFm9EGU/kMjNwjwphVeb2Vpglo99PIJvGQXoyN
 kRCeJEWnKbj38+f+XPQ2UAPtQAYi/LiYDyNXqyVGa3EFWdZJvH4sfzQQA1ZLrvkc2cdU
 SjZg==
X-Gm-Message-State: APjAAAWMaAHVsrPWLAH0jLYZxzpSrhLXApYDt2RWlvMB2Y5UDlsySgoO
 URwtpcTlU4QlYHBFLTJEoGc=
X-Google-Smtp-Source: APXvYqxhK5BrJlrj5nlHZWUcvie5k7xHpkQdCSJkMyneCP6NcvgKpneX8mON58HTSgUpiYUo1Z1CfA==
X-Received: by 2002:a1c:46:: with SMTP id 67mr29793076wma.51.1574679968492;
 Mon, 25 Nov 2019 03:06:08 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id q15sm10246754wrs.91.2019.11.25.03.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 03:06:07 -0800 (PST)
Date: Mon, 25 Nov 2019 12:06:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 08/15] drm/tegra: Remove dma_buf->k(un)map
Message-ID: <20191125110606.GJ1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-9-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LP4ruR3l8U8jOVtJh9rj4vJon13MDWrKBNh0vRk+V8g=;
 b=iN/NHjotEqu4HB2HiKrLQTO9c41pQ/u/KCZEjhITSlOKW6soiGMM6yVi6/13U/ccnn
 z6RKwe985J5G5TX3d448JZCvaVQR7Y6wux6/LPz863vXyqKbqhwLNj+EPtdoq4L5onAY
 zwnhBQ3LCWaDMcuXJk/D8W2JilaLc3W5o9JO1vkinS7C4ARr53edlG0rLJdCPlWbZpSb
 coNawyqp5myA1l9tBRg6bXHwuAbHrZvfT8gvk6YU3ap0e0RWbcDQPGqqrKBrMKrkSPbO
 efelmzKfAmzpchklCArKtZbctd7JcUu1IDIS6r954hGP4Kq5NgLzS4lA7hL8E+Kn4BLR
 jmOQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1040076768=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1040076768==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MzdA25v054BPvyZa"
Content-Disposition: inline


--MzdA25v054BPvyZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:35:29AM +0100, Daniel Vetter wrote:
> No in-tree users left.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/gem.c | 12 ------------
>  1 file changed, 12 deletions(-)

Same as before, I don't see any regressions when running some of the
grate tests, and there's obviously no longer any reason to keep these
functions around given that they are no longer used, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

--MzdA25v054BPvyZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3btZ4ACgkQ3SOs138+
s6EBQA//fk5PmctnVvlQOE/mbBb4DbiuQwzB80jnUxJzXO6zy+zkPP6rbQ/EMps3
FOJ0tXH+IW0sqNtNut1nuBFounofQejEt+Km2mDa8EAXf7Eq2cckxZjP0kRIJUGb
sjsB3GtJmt/lte/Nni/TRKuZ4vvCG8F2cYUHXR11USBx4POjAP4E8uACGjejlYHZ
8RtGO19/7PbdyADTDqJkh0Q6c96cvWbc8sXAud8hJrBgc4IjX1Hq/alRvqqwj6ET
5nWQvflhdzcwMurhY+FtItmUBkUCXSRU+c+dqhhEbjwOmjodJqrqDW5eUYDfvA0p
26NCb8svcq0vuTzOLkP+++UBxL2ZM1ZpS15NZ4nCh7z5ilZHupK8gqXQCBU2CKTC
xqqtwZcjsPp5H57gDjBAJ8NkORLbL9GyTxTIJ29tUHf6LJYf9pKSoUk9lyWuYb/4
cWJlzCXVS3brX6jhFBozE4MHjstiDnWi3au/IIrgWAjiFEGQihMvGV70fMg/pTUn
LX+qb6oJzZuPLco2x8kNoYVEbDA2RNYDaj74VsIHxLCu/4EAB+STkzj4iaM92WoG
FNMaMdx1QU22xy806UUA5G5iV3JQU8kuoy0BqmXiNc5O6E/zFH/YWYKXct89YU8G
WpAwoNdRCNByLGSOBk3yJymyzrNAQDPadju66SN5f/WS5zOKiv8=
=KGzu
-----END PGP SIGNATURE-----

--MzdA25v054BPvyZa--

--===============1040076768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1040076768==--
