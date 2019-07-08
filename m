Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A362CCE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 01:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF24689811;
	Mon,  8 Jul 2019 23:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0665E89811
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 23:54:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45jMk20xDHz9s7T;
 Tue,  9 Jul 2019 09:54:17 +1000 (AEST)
Date: Tue, 9 Jul 2019 09:54:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the drm tree with the jc_docs tree
Message-ID: <20190709095417.01294540@canb.auug.org.au>
In-Reply-To: <20190624134147.4950d388@canb.auug.org.au>
References: <20190624134147.4950d388@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562630058;
 bh=gOYRu03WWqu7L/f3yQkGINmxsWCd6L335EB9ew580Rk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Be2aSVix6DOPCOLNTiWbVWlGKyMny0xjLT4kvGujkvFmQ4ozD1GmxLdf9JueCKwBq
 ZS7oWqJq5vLePh4kF7PFz7EtBVpri5HiYUcj6ddnhxPclUovv1qnYhEzmYoTHI/yVk
 VMEWl98NPHlEf4NW0H0QLN1C6HhOHA2Ny5VftP2dAlc02l+F/p+lJoFcsHBk7sa7I7
 DZTd83bLjtmI9junTvpQ4abcuEO3NURSAgiU9poowiTWPNMTBkp4uz976Hxe+FZkJf
 Dw1a+6DvNN/Nj7hByw541T57Vsi4qlmGPN1AChZeHz/hjjTulAKO6HJjFLNDnv5aMA
 z1IQ376Q2/AVg==
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
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0096895346=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0096895346==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NatE95c_++FnJscnxmHTBtt"; protocol="application/pgp-signature"

--Sig_/NatE95c_++FnJscnxmHTBtt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Jun 2019 13:41:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   Documentation/fb/modedb.rst
>=20
> between commit:
>=20
>   ab42b818954c ("docs: fb: convert docs to ReST and rename to *.rst")
>=20
> from the jc_docs tree and commit:
>=20
>   1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflection on t=
he commandline")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc Documentation/fb/modedb.rst
> index 3c2397293977,1dd5a52f9390..000000000000
> --- a/Documentation/fb/modedb.rst
> +++ b/Documentation/fb/modedb.rst
> @@@ -45,18 -45,29 +45,32 @@@ signals (e.g. HDMI and DVI-I). For othe
>   is specified the output is disabled.
>  =20
>   You can additionally specify which output the options matches to.
>  -To force the VGA output to be enabled and drive a specific mode say:
>  +To force the VGA output to be enabled and drive a specific mode say::
>  +
>       video=3DVGA-1:1280x1024@60me
>  =20
>  -Specifying the option multiple times for different ports is possible, e=
.g.:
>  +Specifying the option multiple times for different ports is possible, e=
.g.::
>  +
>       video=3DLVDS-1:d video=3DHDMI-1:D
>  =20
> + Options can also be passed after the mode, using commas as separator.
> +=20
> +        Sample usage: 720x480,rotate=3D180 - 720x480 mode, rotated by 18=
0 degrees
> +=20
> + Valid options are:
> +=20
> +   - margin_top, margin_bottom, margin_left, margin_right (integer):
> +     Number of pixels in the margins, typically to deal with overscan on=
 TVs
> +   - reflect_x (boolean): Perform an axial symmetry on the X axis
> +   - reflect_y (boolean): Perform an axial symmetry on the Y axis
> +   - rotate (integer): Rotate the initial framebuffer by x
> +     degrees. Valid values are 0, 90, 180 and 270.
> +=20
> +=20
>  -***** oOo ***** oOo ***** oOo ***** oOo ***** oOo ***** oOo ***** oOo *=
****
>  +-----------------------------------------------------------------------=
------
>  =20
>   What is the VESA(TM) Coordinated Video Timings (CVT)?
>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>  =20
>   From the VESA(TM) Website:
>  =20

I am still getting this conflict (the commit ids may have changed).
Just a reminder in case you think Linus may need to know.

--=20
Cheers,
Stephen Rothwell

--Sig_/NatE95c_++FnJscnxmHTBtt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0j16kACgkQAVBC80lX
0GyHugf/cB5q+pSMiS9D1HbmvmkcDZN3tIJrTHqTztcvFVnIlUpWF2ni04Wf5MDP
Tkjnb83+eXbn0zvdfXNDNN1DJR3qgAB/Kf6yyRoBs197XjFQu/9ixtTt5Bd7NdCs
uLXciLdxnjTV+PGZ2eUswnwvRTyGckMids+AyPFq08PbA8EulrsLy04bzlVfiVCe
0d4hO90luHI+mG3FAv1VsJQbX9/hw2ItIhnuT4EBQmKGsic6vXTZVGhUzknLlUnt
Rj/WA+dPJGgqujkUZIwMHS0c4HRKrVvA5IMy6VqqGo4ROK0NFlB/wLJsm66FyEhZ
wCM5sRACpJtPh62/zM3e0UlTHfIXuw==
=gUp1
-----END PGP SIGNATURE-----

--Sig_/NatE95c_++FnJscnxmHTBtt--

--===============0096895346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0096895346==--
