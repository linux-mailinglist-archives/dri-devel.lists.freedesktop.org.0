Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED486A054
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E413D6E071;
	Tue, 16 Jul 2019 01:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA58C8952F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 14:27:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24AF8AF10;
 Mon, 15 Jul 2019 14:27:47 +0000 (UTC)
Message-ID: <481382385e1916edef81cd1219d695b045e0a20a.camel@suse.de>
Subject: Re: [PATCH 0/2] Staging: fbtft: Fix probing of gpio descriptor
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Phil Reid <preid@electromag.com.au>, gregkh@linuxfoundation.org, 
 bhanusreemahesh@gmail.com, leobras.c@gmail.com, nishadkamdar@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 devel@driverdev.osuosl.org
Date: Mon, 15 Jul 2019 16:27:44 +0200
In-Reply-To: <1562833913-10510-1-git-send-email-preid@electromag.com.au>
References: <1562833913-10510-1-git-send-email-preid@electromag.com.au>
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
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
Content-Type: multipart/mixed; boundary="===============0082617120=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0082617120==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-gKBUbqe+P9k3BDYCtp9q"


--=-gKBUbqe+P9k3BDYCtp9q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-11 at 16:31 +0800, Phil Reid wrote:
> GPIO probing and reset polarity are broken.
> Fix them.
>=20
> Fixes: c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor
> interface")
>=20
> Phil Reid (2):
>   Staging: fbtft: Fix probing of gpio descriptor
>   Staging: fbtft: Fix reset assertion when using gpio descriptor
>=20
>  drivers/staging/fbtft/fbtft-core.c | 43 ++++++++++++++++++--------------=
-----
> -
>  1 file changed, 20 insertions(+), 23 deletions(-)
>=20

You can add my:

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

The only issue I see is in the second patch, who should also have the same
'Fixes' tag.

BTW, while testing I found another issue, I'll send a fix shortly.

Kind regards,
Nicolas


--=-gKBUbqe+P9k3BDYCtp9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl0sjWAACgkQlfZmHno8
x/7ChAgAnqe9gOqVqsH2hZYK+itU2ED7RijpJpZvjzGHFbAKc6LK7YYhCkT6yUBG
uo98pK18pjUtaTdvhrnToLWqU1Utr87sDjVfwIdduDSmAnyM36P26NVtXPtr+atl
iL9BpNNhkG0/ZveKtm3zv1ql0kfDxgCfcSrAWnAo/nJ83jmeObEOrZHJY4EVZwB1
kQc4McdlGxqrmuvuY12a+ixc73AdlUArDJCWsbu/n1TKER3J6X5zFkZmZWDRqGZS
8i61Iz2TNQl+k9J/ts0Y5S3RguweADMj+Q+rMmTmdMsGduOp5T6KpXfQoq89HAtc
fO7UVjl6ssxy8EDCh6bO02G+Enw2+A==
=0/r6
-----END PGP SIGNATURE-----

--=-gKBUbqe+P9k3BDYCtp9q--


--===============0082617120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0082617120==--

