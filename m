Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7791621B7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83D16E14F;
	Tue, 18 Feb 2020 07:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4AA6E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 23:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id D5DBB28B55B
Received: by earth.universe (Postfix, from userid 1000)
 id 952973C0C81; Tue, 18 Feb 2020 00:00:13 +0100 (CET)
Date: Tue, 18 Feb 2020 00:00:13 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 00/51] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20200217230013.eqrt5jn3p5kvhljk@earth.universe>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: multipart/mixed; boundary="===============0480289614=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0480289614==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zrgnrk4rxb2p2aye"
Content-Disposition: inline


--zrgnrk4rxb2p2aye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 16, 2020 at 11:02:17PM +0200, Laurent Pinchart wrote:
> This patch series is the sixth attempt to (nearly, see [1])
> complete the rework of the omapdrm driver to move to drm_bridge
> and drm_panel.
>=20
> Version 2, available at [2], explains in its long cover letter the
> rationale for the changes. I won't duplicate it here as it is
> still valid as-is.
>=20
> Compared to v5, available at [3], this version has been rebased on
> top of drm-misc-next, and minor bugs have been fixed, including
> interlaced modes support with VENC.
>=20
> The patches can be found at
>=20
>         git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
>=20
> [1] The only notable exception is the omapdrm-specific DSI panel
> driver that implements a large number of custom operations. This
> is being addressed separately.
>=20
> [2] https://patchwork.kernel.org/cover/11102445/
> [3] https://patchwork.kernel.org/cover/11349617/

The series is

Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Testing was done on Droid 4, DSI command mode panel is still
working. I had to add the following patch because of the base
you chose for the branch. Might make sense to use 5.6-rc1 instead.

https://lore.kernel.org/lkml/CAHk-=3Dwh8VLe3AEKhz=3D1bzSO=3D1fv4EM71EhufxuC=
=3DGp=3D+bLhXoA@mail.gmail.com/

-- Sebastian

--zrgnrk4rxb2p2aye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5LGuwACgkQ2O7X88g7
+prU4RAAo4jgeDqZjVIeZT3LGCOkVNeBWL6C1LFfjxOApLtu1FC9f0KbDnpvVfao
/0PSgJaA6KeEjp0zhhGkbD0ucpcaS+YKDUPzsyqz8MoiRzr6dPlg+Af8VvdjgwLx
h+9Atl5kLQPBvPMssjOh0LhFLuWKynzI/66tP/nCQ5/M8i4prBkNZlKvlsFxlsE3
ZzEqBesV3nOvtGFXsUrqwponocUv7+WGfFAU7ovJXD26C+Ek1u1+TByUHDU+zt8A
lldsTzN8ErwYpUkbtUJ+gxHwtFjhD+3d6jgZrjiVVUX7DdmXRG6LzWwg/Kb1k0MM
sMDujByPaMtBe22uzHOPzNJwMxqE2QeKkYNgG1JmAcIbvYboZeMJ83TuGLGacmcV
cE62Pq8bvyLwtSzBMz0U6MwuzIxBI8v7+Bk/+50yHk2MbgEp8mIMQW4MzLVqGT8s
+I7/l+L+R7lF8gNSXaQJd27FLeko76l44mFP52f9zaFtAQ6WqgNIpTq1KAWBW8jj
4biRqAaIKIESgI6N/lR0NIMUm3neDrbq9B2JLPc/uTh+D+MIN0/alOq74MWwMs3S
9xHp0kONSfuhp2toP6VACq6nfccW9leHrL1KXGdCgxCcmWe5tAqw/PsVMRy70e8u
zCmetBbuBKWfyP9OMWURnDj+W717v0Sl8OiUCFD3jSro57SqzmA=
=8P3S
-----END PGP SIGNATURE-----

--zrgnrk4rxb2p2aye--

--===============0480289614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0480289614==--
