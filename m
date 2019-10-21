Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E2DF752
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 23:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FADF6E25E;
	Mon, 21 Oct 2019 21:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466366E25E;
 Mon, 21 Oct 2019 21:09:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46xq5m1LT2z9sP4;
 Tue, 22 Oct 2019 08:09:48 +1100 (AEDT)
Date: Tue, 22 Oct 2019 08:09:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al@freedesktop.org, "Viro <viro"@ZenIV.linux.org.uk
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20191022080947.246a5bc5@canb.auug.org.au>
In-Reply-To: <20191022080734.41955464@canb.auug.org.au>
References: <20191022080734.41955464@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1571692189;
 bh=dPFfxtnU7BY2MrEwZ5nExFxlJNe5ewc7n0KJ3d57yUU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S/l+NnuBZ1SfsWYo/YyFxqtewCfgifCnxXoNlTtSUPzkmF0PY9soxrTce+/WQy5J3
 rlezn0i3x8SOx8vSkieg6WsuyLWUxRq8+WRWiC/bUCWzyUpUyL3C+XI8AYBZeLahpx
 WjugDovwxgz6PPm35NXgkXhA/+Pjn1Uk1yNPVnr2kLxIa9JAGGHAXrNlBFZgkHqlnN
 2o7cKG2t5VNVHEMeBBOw75VRgtPJpApl/tS4O1/fvXss2n3XO+fT6GoeIasm0fEL7W
 qKr4ISCt///pQZn1OBSqOD8HH2AhP4SIrAi84QDN57Z4iyACdpVcRwvhzTShLSU2Go
 xorZogridZU+A==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Guillem Jover <guillem@hadrons.org>
Content-Type: multipart/mixed; boundary="===============1206330778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1206330778==
Content-Type: multipart/signed; boundary="Sig_/TCl9sYZkRxEv6Z+J7/HdopN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TCl9sYZkRxEv6Z+J7/HdopN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This should have been reported against the vfs-fixes tree, sorry.

On Tue, 22 Oct 2019 08:07:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the drm-misc-fixes tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> In file included from include/uapi/linux/posix_types.h:5,
>                  from include/uapi/linux/types.h:14,
>                  from include/linux/types.h:6,
>                  from include/linux/limits.h:6,
>                  from include/linux/kernel.h:7,
>                  from fs/aio.c:14:
> fs/aio.c: In function '__do_compat_sys_io_pgetevents':
> include/linux/stddef.h:8:14: warning: initialization of 'unsigned int' fr=
om 'void *' makes integer from pointer without a cast [-Wint-conversion]
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2196:38: note: in expansion of macro 'NULL'
>  2196 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
> include/linux/stddef.h:8:14: note: (near initialization for 'ksig.sigmask=
')
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2196:38: note: in expansion of macro 'NULL'
>  2196 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
> fs/aio.c: In function '__do_compat_sys_io_pgetevents_time64':
> include/linux/stddef.h:8:14: warning: initialization of 'unsigned int' fr=
om 'void *' makes integer from pointer without a cast [-Wint-conversion]
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2231:38: note: in expansion of macro 'NULL'
>  2231 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
> include/linux/stddef.h:8:14: note: (near initialization for 'ksig.sigmask=
')
>     8 | #define NULL ((void *)0)
>       |              ^
> fs/aio.c:2231:38: note: in expansion of macro 'NULL'
>  2231 |  struct __compat_aio_sigset ksig =3D { NULL, };
>       |                                      ^~~~
>=20
> Introduced by commit
>=20
>   de80166a573d ("aio: Fix io_pgetevents() struct __compat_aio_sigset layo=
ut")

--=20
Cheers,
Stephen Rothwell

--Sig_/TCl9sYZkRxEv6Z+J7/HdopN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2uHpsACgkQAVBC80lX
0GyToAf8DBPSQT84aCv3I5d9R2MbpGK6vazN8l7jnH3VAYoqBs+3nn2qg99WcnIu
XS7Op9lVRe6KjezTOkFQAWKck4r2TXFBX8Nk2KLGyGcUt1ZTouvKPGsRVc5Exp7W
PY2BbDDHCJpo6wCP3fcKUVoh3TRGzUwLaBPicvBoap6aoz3v2IFCfc+wwv/womSL
HxLgirZlJboeWnfQTv83mtoxT2Y3DBZRdmg3iqhhbDK0VbIKDsL9mvNTRHGaD6br
el3xuN2SfWBNpPc6odwht7Fdp1Dbi0Ht6NwSnf41hzwFES8NZXDclP6ZJjYIcfCn
P6q8N9zKyby84DSlrjKzcQzlkmfMYA==
=//rr
-----END PGP SIGNATURE-----

--Sig_/TCl9sYZkRxEv6Z+J7/HdopN--

--===============1206330778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1206330778==--
