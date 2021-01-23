Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726C301441
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8A66EA9C;
	Sat, 23 Jan 2021 09:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xanadu.blop.info (xanadu.blop.info [178.79.145.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F7D6E064
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jan 2021 08:06:07 +0000 (UTC)
Received: from [127.0.0.1] (helo=xanadu.blop.info)
 by xanadu.blop.info with smtp (Exim 4.89)
 (envelope-from <lucas@debian.org>)
 id 1l3Dvn-0005xT-T6; Sat, 23 Jan 2021 09:06:03 +0100
Received: (nullmailer pid 5746 invoked by uid 1000);
 Sat, 23 Jan 2021 08:05:48 -0000
Date: Sat, 23 Jan 2021 09:05:48 +0100
From: Lucas Nussbaum <lucas@debian.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] drm/vc4: Correct POS1_SCL for hvs5
Message-ID: <20210123080548.GA5452@xanadu.blop.info>
References: <20210121105759.1262699-1-maxime@cerno.tech>
 <20210121105759.1262699-2-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20210121105759.1262699-2-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: Dom Cobley <popcornmix@gmail.com>,
 Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1079239411=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1079239411==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 21/01/21 at 11:57 +0100, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> Fixes failure with 4096x1080 resolutions
>=20
> [  284.315379] WARNING: CPU: 1 PID: 901 at drivers/gpu/drm/vc4/vc4_plane.=
c:981 vc4_plane_mode_set+0x1374/0x13c4
> [  284.315385] Modules linked in: ir_rc5_decoder rpivid_hevc(C) bcm2835_c=
odec(C) bcm2835_isp(C) bcm2835_mmal_vchiq(C) bcm2835_gpiomem v4l2_mem2mem v=
ideobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common videod=
ev mc cdc_acm xpad ir_rc6_decoder rc_rc6_mce gpio_ir_recv fuse
> [  284.315509] CPU: 1 PID: 901 Comm: kodi.bin Tainted: G         C       =
 5.10.7 #1
> [  284.315514] Hardware name: BCM2711
> [  284.315518] Backtrace:
> [  284.315533] [<c0cc5ca0>] (dump_backtrace) from [<c0cc6014>] (show_stac=
k+0x20/0x24)
> [  284.315540]  r7:ffffffff r6:00000000 r5:68000013 r4:c18ecf1c
> [  284.315549] [<c0cc5ff4>] (show_stack) from [<c0cca638>] (dump_stack+0x=
c4/0xf0)
> [  284.315558] [<c0cca574>] (dump_stack) from [<c022314c>] (__warn+0xfc/0=
x158)
> [  284.315564]  r9:00000000 r8:00000009 r7:000003d5 r6:00000009 r5:c08cc7=
dc r4:c0fd09b8
> [  284.315572] [<c0223050>] (__warn) from [<c0cc67ec>] (warn_slowpath_fmt=
+0x74/0xe4)
> [  284.315577]  r7:c08cc7dc r6:000003d5 r5:c0fd09b8 r4:00000000
> [  284.315584] [<c0cc677c>] (warn_slowpath_fmt) from [<c08cc7dc>] (vc4_pl=
ane_mode_set+0x1374/0x13c4)
> [  284.315589]  r8:00000000 r7:00000000 r6:00001000 r5:c404c600 r4:c2e346=
00
> [  284.315596] [<c08cb468>] (vc4_plane_mode_set) from [<c08cc984>] (vc4_p=
lane_atomic_check+0x40/0x1c0)
> [  284.315601]  r10:00000001 r9:c2e34600 r8:c0e67068 r7:c0fc44e0 r6:c2ce3=
640 r5:c3d636c0
> [  284.315605]  r4:c2e34600
> [  284.315614] [<c08cc944>] (vc4_plane_atomic_check) from [<c0860504>] (d=
rm_atomic_helper_check_planes+0xec/0x1ec)
> [  284.315620]  r9:c2e34600 r8:c0e67068 r7:c0fc44e0 r6:c2ce3640 r5:c3d636=
c0 r4:00000006
> [  284.315627] [<c0860418>] (drm_atomic_helper_check_planes) from [<c0860=
658>] (drm_atomic_helper_check+0x54/0x9c)
> [  284.315633]  r9:c2e35400 r8:00000006 r7:00000000 r6:c2ba7800 r5:c3d636=
c0 r4:00000000
> [  284.315641] [<c0860604>] (drm_atomic_helper_check) from [<c08b7ca8>] (=
vc4_atomic_check+0x25c/0x454)
> [  284.315645]  r7:00000000 r6:c2ba7800 r5:00000001 r4:c3d636c0
> [  284.315652] [<c08b7a4c>] (vc4_atomic_check) from [<c0881278>] (drm_ato=
mic_check_only+0x5cc/0x7e0)
> [  284.315658]  r10:c404c6c8 r9:ffffffff r8:c472c480 r7:00000003 r6:c3d63=
6c0 r5:00000000
> [  284.315662]  r4:0000003c r3:c08b7a4c
> [  284.315670] [<c0880cac>] (drm_atomic_check_only) from [<c089ba60>] (dr=
m_mode_atomic_ioctl+0x758/0xa7c)
> [  284.315675]  r10:c3d46000 r9:c3d636c0 r8:c2ce8a70 r7:027e3a54 r6:00000=
043 r5:c1fbb800
> [  284.315679]  r4:0281a858
> [  284.315688] [<c089b308>] (drm_mode_atomic_ioctl) from [<c086e9f8>] (dr=
m_ioctl_kernel+0xc4/0x108)
> [  284.315693]  r10:c03864bc r9:c1fbb800 r8:c3d47e64 r7:c089b308 r6:00000=
002 r5:c2ba7800
> [  284.315697]  r4:00000000
> [  284.315705] [<c086e934>] (drm_ioctl_kernel) from [<c086ee28>] (drm_ioc=
tl+0x1e8/0x3a0)
> [  284.315711]  r9:c1fbb800 r8:000000bc r7:c3d47e64 r6:00000038 r5:c0e595=
70 r4:00000038
> [  284.315719] [<c086ec40>] (drm_ioctl) from [<c041f354>] (sys_ioctl+0x35=
c/0x914)
> [  284.315724]  r10:c2d08200 r9:00000000 r8:c36fa300 r7:befdd870 r6:c0386=
4bc r5:c36fa301
> [  284.315728]  r4:c03864bc
> [  284.315735] [<c041eff8>] (sys_ioctl) from [<c0200040>] (ret_fast_sysca=
ll+0x0/0x28)
> [  284.315739] Exception stack(0xc3d47fa8 to 0xc3d47ff0)
> [  284.315745] 7fa0:                   027eb750 befdd870 00000000 c03864b=
c befdd870 00000000
> [  284.315750] 7fc0: 027eb750 befdd870 c03864bc 00000036 027e3948 0281a64=
0 0281a850 027e3a50
> [  284.315756] 7fe0: b4b64100 befdd844 b4b5ba2c b49c994c
> [  284.315762]  r10:00000036 r9:c3d46000 r8:c0200204 r7:00000036 r6:c0386=
4bc r5:befdd870
> [  284.315765]  r4:027eb750
>=20
> Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-By: Lucas Nussbaum <lucas@debian.org>

- Lucas

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE/t7ByzN7z1CfQ8IkORS1MvTfvpkFAmAL2NwACgkQORS1MvTf
vpmlJQ//YSw0b8K3qpaz1eYxSuOyjlywod1riJvEMKQRnUe5gsxonIAqb7K9m5uu
8g2shurHKhF1rbo25/FHtDCBL0fpx1HvPNcW2Q3m/TT6q44j2R84bbiTTC2Hnvvf
aAwQ8v6fyzITKmkn3ccvaHQP21aFksdvkUGkfyMbS7Z96wPDdd0ceBAtsAnsSuhM
GC3KoRq3vIE2y31mjTy1NDiyqFzz50JfPuaca4bkpLdD628pvQ1vDLRez/DyYjSk
91yto4uFBsxGp7uKE0fmjqe+uGBw0syc14Sbz+fQ+EqV42AG/T3ewrI8v0IYbtnd
TrKmLdOWt4xH4DpWlWHuURpys6H7T0l0rwjQjHeOOWYZoslTNwfzM1lOZ5rTKztP
s5iZZacNT6ZGQMrzphNcJM2JX95YtV/LTlrJPcSuiO23UrTQc+FblzpT9DaSvmjD
aDPwuKFV0qVxoWDiG/cbIfwhx4tJRhiQbg7qIGqM2+4h61p8Sjb9rQ72r6EGXWh0
IB5N0Jd7vNUGvhare7V93nAsXPlEn3BApQRYmzaqgTyBS50JHihlDNhssuYZxd41
pe1CbhyITc1i/cMS4tfnzQZE0JERCffMt+Rrnj59bgA3KR4s5OaZ90JTe+wbkbEh
3OOVESnxClFjhnmM2qm/UmMoh4DUj/4VZq9NqNumyZrPjkSL0xY=
=mvNS
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

--===============1079239411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1079239411==--
