Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095C26D5B5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE746EB3D;
	Thu, 17 Sep 2020 08:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970B16EA6E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:05:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 9357629166C
Date: Wed, 16 Sep 2020 13:05:16 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/3] drm/panfrost: add Amlogic integration quirks
Message-ID: <20200916170516.GB2543@kevin>
References: <20200916150147.25753-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200916150147.25753-1-narmstrong@baylibre.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: tomeu.vizoso@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1264377285=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1264377285==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

series r-b, nice!
On Wed, Sep 16, 2020 at 05:01:44PM +0200, Neil Armstrong wrote:
> The T820, G31 & G52 GPUs integrated by Amlogic in the respective GXM, G12=
A/SM1 & G12B
> SoCs needs a quirk in the PWR registers at the GPU reset time.
>=20
> This serie adds the necessary quirks for the Amlogic integrated GPUs only.
>=20
> Changes since v1 at [1]:
> - removed the BROKEN_SH quirk after [2] was sent by robin
> - rebased on top of [3] by steven and moved the vendor quirk in the prope=
r quirk function
> - added PWR_KEY unlock definition, and cleaned definition
>=20
> [1] https://lkml.kernel.org/r/20200908151853.4837-1-narmstrong@baylibre.c=
om
> [2] https://lkml.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com
> [3] https://lkml.kernel.org/r/20200909122957.51667-1-steven.price@arm.com
>=20
> Neil Armstrong (3):
>   drm/panfrost: add support for vendor quirk
>   drm/panfrost: add amlogic reset quirk callback
>   drm/panfrost: add Amlogic GPU integration quirks
>=20
>  drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 11 +++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 15 +++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.h    |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |  4 ++++
>  5 files changed, 35 insertions(+)
>=20
> --=20
> 2.22.0
>=20

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9iRcwACgkQ/v5QWgr1
WA16Ww//cCG6HDblemm8T2W/m5FqeFuVtTwp2eNVCNN2pyJPT9FzLLtGMWPeAozs
6c4+3NCIJJX9ysEz9L1q5g7a5DbaN+4C7Z6FRJ3Ss1sNi/PmAlh0donBt5oiHAyJ
hptyz1bSM7ZyUDYuH564so9MpQRaBcR7Iz1gexVyhDO8Yi/rG133BgPOQ30EokTy
Kj42cVrmGxQg8rb64NTlDLf3nOYmSSWQN5z87v1mFMEzeZCWmm7gtbOicSQ8xV8a
xqCrm6he8ZHE6/3Ddmkw/IBeRrpD20d7TTcnzsvYtJeIGhTwzmlF8i/3ULYNsVvn
lCP7TMXxv50LUZM96wgSXetEOmZVDAWQG11Dxr7pTBx/DqYHOiGrqjqN87+g6wK7
TFsb4HbJRYguALvLaxLFhLUlMExYuiXJFkAYULJ/YudmVhBRwl/ZZfYNjeAyjzPd
TZ+aWkMrLaf3tXwV2h73EiqGrMb/48AJzOxntUCz9dFmEqPZLmjcX3uHb1HbYsdK
RdcIGA6Lr4M8ImKmBzJPnJ5G0QWFM2JzZAFWoiZvAEk2vSIHx2Tcou1zGXzJF6oH
O/jXUB8CL3D+lCF8z4eDv77dTiZ/W1qlTJmpQ2aFx4Kf3Q/sS4R+MG0e168cOGK4
yfGXfv1CWz9wPd4GSgcSed+SYWMqKzGGL0LCDgtdoEiez2X+KLA=
=7+0X
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--

--===============1264377285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1264377285==--
