Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E205A7C5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 01:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FB96E98E;
	Fri, 28 Jun 2019 23:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7206E98E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 23:50:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so7817282wrw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aNV4HFwYEt0yMBPXIayN1RSWc1G6NoGgFBBw4GTp5vk=;
 b=tMYmVbC5xlQtQeKruAAnS0xETVJO37Qc1pvjMb6nM3XFnRz47Qa99xEuvqw3PwxmuK
 dNsiKbCi+3jnIWZnd14mNLbETWNtYrpF1dcnQt49NlziqMCrfmRtM6zKFR2X4CaNxkhQ
 WvyDDYMMoPagEsdY6u8eYStDotuX2ZGSlKuxmRXXLTmrkwJfkwbnlgMTgSURv6QGaH4+
 GCwx8J3b70BwypHkpEcZgsmuoyDEqDRmLudeB82p/G7Z+Sny+h9mNY6ygUIVUbWmgT9r
 t7x3QEYoGOOHoW79epfetg+Noro2aQaWUDysintHF66k09fvh+qTtN3/5ymyokllEHOQ
 542A==
X-Gm-Message-State: APjAAAU0cPNsQ/qr71AJ0DFvyW9lUyYozQZluiRwrNZ8WfTMAn0ikw74
 fnI1aUnqOEDEGbrPyJvkwxU=
X-Google-Smtp-Source: APXvYqwqZ6SOsptqFa/q0p+yLVXdp/0KY0BruP6v8sEZ6TBSCu0PSTL3/w4chYZ3COstYSLzG9RhTw==
X-Received: by 2002:adf:de90:: with SMTP id w16mr9322571wrl.217.1561765830682; 
 Fri, 28 Jun 2019 16:50:30 -0700 (PDT)
Received: from localhost
 (p200300E41F2AB200021F3CFFFE37B91B.dip0.t-ipconnect.de.
 [2003:e4:1f2a:b200:21f:3cff:fe37:b91b])
 by smtp.gmail.com with ESMTPSA id n2sm423403wmi.38.2019.06.28.16.50.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 16:50:29 -0700 (PDT)
Date: Sat, 29 Jun 2019 01:50:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 4/7] drm/panel: simple: Use display_timing for Innolux
 n116bge
Message-ID: <20190628235028.GC1189@mithrandir>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-5-dianders@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190401171724.215780-5-dianders@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aNV4HFwYEt0yMBPXIayN1RSWc1G6NoGgFBBw4GTp5vk=;
 b=ntcAz/iX3Za+9ICjms1KoX9O6oWxXHxtQyDQwCbgMtkqPtk18/HptKLGS6omz63608
 bJU9/zeMqmKOPtdM+RoyfYd/q8NZtn+hlFteOxVYWQ0baUiHP/Dp7qn1LHLcwe1/NQTF
 n58RcsjDnxlmuKe688QDphz0tSXV7FlLD0WGnmmEK08j/NRUNmJCIhyDnpiZzzGeqGi1
 azbIwGfNPGLKNPk0FUf+HxtcM5FpYTc48xjxV6euLmPHk0U7vh2n2FD25akO0letVvPY
 m4XD1MGVns6LUmGSq736lCwKlUDkxZFJenjANpe2th+KMb8U6FD3xp3Jc38BO7m5keTh
 x+wg==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric =?utf-8?B?QmFsbGV0YsOy?= <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 mka@chromium.org
Content-Type: multipart/mixed; boundary="===============0090060638=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0090060638==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:17:21AM -0700, Douglas Anderson wrote:
> Convert the Innolux n116bge from using a fixed mode to specifying a
> display timing with min/typ/max values.
>=20
> Note that the n116bge's datasheet doesn't fit too well into DRM's way
> of specifying things.  Specifically the panel's datasheet just
> specifies the vertical blanking period and horizontal blanking period
> and doesn't break things out.  For now we'll leave everything as a
> fixed value but just allow adjusting the pixel clock.  I've added a
> comment on what the datasheet claims so someone could later expand
> things to fit their needs if they wanted to test other blanking
> periods.
>=20
> The goal here is to be able to specify the panel timings in the device
> tree for several rk3288 Chromebooks (like rk3288-veryon-jerry).  These
> Chromebooks have all been running in the downstream kernel with the
> standard porches and sync lengths but just with a slightly slower
> pixel clock because the 76.42 MHz clock is not achievable from the
> fixed PLL that was available.  These Chromebooks only achieve a
> refresh rate of ~58 Hz.  While it's probable that we could adjust the
> timings to achieve 60 Hz it's probably wisest to match what's been
> running on these devices all these years.
>=20
> I'll note that though the upstream kernel has always tried to achieve
> 76.42 MHz, it has actually been running at 74.25 MHz also since the
> video processor is parented off the same fixed PLL.
>=20
> Changes in v4:
>  - display_timing for Innolux n116bge new for v4.
>=20
> Changes in v5:
>  - Added Heiko's Tested-by
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 37 +++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 14 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Wp8QACgkQ3SOs138+
s6EONRAAnI/lLg3nbvC+NPG+zh2EdypmFBjJwDAq/ZiG0VNTPe0pgjIbyg+vVcKD
TS4SdyIlPL3I043HPwObBM/Y+O1MOcWwuEMxlnTSN0+R0pgyifAawX55sCE14MW0
gf0GUEJcysayA0957o8Zfrvlh74nTmNOPyfp0MlpIXMoKZ7Zh3TMD7i0e4J7rfxM
39xPhrNSLUYM0+fiTAYO3hcy3KGZ01CpLP17+djBgsDDjV+0uDXl6I6FNm9oHvNa
bgbwx2urFytaX9PkFc/DfYYf6o/olkB1XZHxRRJfMZuys2L1cjQB+5zy6PjQ8GIM
mScJALEwkxAKaidmyZ9lPm+a4CsMJF/s+XeG5MpVp6J63w8RdRCyqPRYQFcJkExR
FyxI76LaRZ/wntJOBPgayCa19n3eNyL8KzEy259zNvOhluuzYpKQA+rqjGk2iXy/
hQPgNnKtbu9x2Gh3AnzfxDwqalLX7/+ksHbTDXoXnuxa9HMlBDXuwbw721MMmzea
k4MfVF5pUkQAFp5OODbhg5tlZH4zV0RIZdMvHR2/elsSP23+27kgvxqS7tDor493
jUnLz3GuOGarkedkx9ywBbiNZJOlr6xAJlxW6jgr/hUNmaZ5Da4JwJr8S/3MCUyD
xxMPQvzI/Sacn0JL2kD9cE1ojFOJOxLskiTWEv0tZtChQR2hoXk=
=ZuxI
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

--===============0090060638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0090060638==--
