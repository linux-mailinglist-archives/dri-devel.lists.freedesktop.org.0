Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223B4C61FE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 04:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483F010E123;
	Mon, 28 Feb 2022 03:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B80510E123
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 03:46:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K6RBr61M6z4xcZ;
 Mon, 28 Feb 2022 14:46:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1646020006;
 bh=JGeeaVAR5956bwfVVgljUJh68aZ9vFPGConLJVz+HF8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UySSGqPFeHqrJ8DdAdVjqez3Z+EoXiBnuLCJlFMUZszuZz5W8fizV8abvPrbnB7zK
 llUkOCRb9hb8Qsxelwanz+yS6OpJmqqkvKQjTpph5UwxFJpbF5Tzp87H3t+nKoi45P
 01BuNuexuhbDuRQ6bYqFKh6/yAql05eBPfOLYOD6wINjAZFLpMkAXtlN06/M+sGWn4
 yWqGJAo3jXTGjcusgRtBnx2VC8XVejTJVLZYbshBQYjwMtQ/rqfa/zLODGl2Ypredr
 PK5ctK1TnTbx1ntzI0OacpbQIQ07JRpPeX1PN2pxDEhlt7asCdVRFDFLxsFLMLno+h
 Mi0bxki9tzpAg==
Date: Mon, 28 Feb 2022 14:46:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20220228144644.776c5261@canb.auug.org.au>
In-Reply-To: <20220225164231.904173-1-broonie@kernel.org>
References: <20220225164231.904173-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xcldGrkYlQDSe48aCywZHIr";
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
Cc: Allen Chen <allen.chen@ite.com.tw>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, broonie@kernel.org,
 Robert Foss <robert.foss@linaro.org>, Hsin-yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xcldGrkYlQDSe48aCywZHIr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 25 Feb 2022 16:42:31 +0000 broonie@kernel.org wrote:
>
> After merging the drm tree, today's linux-next build (x86 allmodconfig)
> failed like this:
>=20
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c: In function 'receive=
_timing_debugfs_show':
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array=
 subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[20=
0]'} [-Werror=3Darray-bounds]
>  3077 |  u8 *str =3D read_buf, *end =3D read_buf + PAGE_SIZE;
>       |                       ^~~
> /tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while r=
eferencing 'read_buf'
>  3076 |  u8 read_buf[READ_BUFFER_SIZE];
>       |     ^~~~~~~~
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   b5c84a9edcd418 ("drm/bridge: add it6505 driver")
>=20
> I have used the drm tree from yesterday instead.

I am still getting these errors and so used the drm tree from
next-20220224 again.

--=20
Cheers,
Stephen Rothwell

--Sig_/xcldGrkYlQDSe48aCywZHIr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIcRaQACgkQAVBC80lX
0GxUyQf/WHKezO+KT8gBi/Py4nVVfOkOJWyyes2+r4+S4bKBGRVb4tfhRR10fswy
/tOxorz+iAW++BRqJzf5vfNqtIgmmHn8oD7sGQzb0h2chbRCs86g/5hWIg970ET1
AFht11bLIv/QuIEd5fzZEt1qjFZSxNB0MupR1f+hQuqtV57LMj4WvtQsdJG75y0h
i5ApJzWWUIcojgunD742cE0+G4QnjKEawlK1oZJW6j0rWQurAFzK11u9DrJUOWdK
UGvFOxmCFg7hTlPl549WilBwBJkI24t5f7JyW8dweJrKCznG9Dk7Ek5m9SJq7GpC
SI98fu6ugnYPC6DcvRJlXi5hHjxSIg==
=69Je
-----END PGP SIGNATURE-----

--Sig_/xcldGrkYlQDSe48aCywZHIr--
