Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1EDF74D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 23:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030C16E25D;
	Mon, 21 Oct 2019 21:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074A66E25A;
 Mon, 21 Oct 2019 21:07:39 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46xq3C3xCSz9sP3;
 Tue, 22 Oct 2019 08:07:35 +1100 (AEDT)
Date: Tue, 22 Oct 2019 08:07:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20191022080734.41955464@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1571692056;
 bh=pWe9VsFRQMV5crZi/BoRRCzFy5+IboAIVfcQQ7DGp6I=;
 h=Date:From:To:Cc:Subject:From;
 b=R87V6UQ5J80OIucGaxPcct/zIiRHB+oJ9qkCTXaR//sKBknUHeiz3UQEnYY6cycLn
 jeSO2Wi75FKTeB70cbBai93HvgZBmdgyWhNnuN9z1oB87kamQIKUZCE3cniN3p1gnk
 A8Dg2TZkakoPgYXYJcyF/sFi1LMmYhV+4djbYokQtti/Ksur/Qwi4Id8Al0ChQ/Yi4
 6aJmLG115oV26NwrUkkHpTl07RXlxg7HWColy41iLpSAk9vOaTwZW0U9qDCXgYd4So
 2GZXT5f02+QVKeCpyv7vPZ9LtSIcrwDvht8T73xVowfjsPVYiteUH0oR+5v1kZvHXS
 FY8UjJcS2YdVw==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guillem Jover <guillem@hadrons.org>
Content-Type: multipart/mixed; boundary="===============0644993244=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0644993244==
Content-Type: multipart/signed; boundary="Sig_/7+Mx3FL7wh_1DROrLXtWV4P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7+Mx3FL7wh_1DROrLXtWV4P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/uapi/linux/posix_types.h:5,
                 from include/uapi/linux/types.h:14,
                 from include/linux/types.h:6,
                 from include/linux/limits.h:6,
                 from include/linux/kernel.h:7,
                 from fs/aio.c:14:
fs/aio.c: In function '__do_compat_sys_io_pgetevents':
include/linux/stddef.h:8:14: warning: initialization of 'unsigned int' from=
 'void *' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^
fs/aio.c:2196:38: note: in expansion of macro 'NULL'
 2196 |  struct __compat_aio_sigset ksig =3D { NULL, };
      |                                      ^~~~
include/linux/stddef.h:8:14: note: (near initialization for 'ksig.sigmask')
    8 | #define NULL ((void *)0)
      |              ^
fs/aio.c:2196:38: note: in expansion of macro 'NULL'
 2196 |  struct __compat_aio_sigset ksig =3D { NULL, };
      |                                      ^~~~
fs/aio.c: In function '__do_compat_sys_io_pgetevents_time64':
include/linux/stddef.h:8:14: warning: initialization of 'unsigned int' from=
 'void *' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^
fs/aio.c:2231:38: note: in expansion of macro 'NULL'
 2231 |  struct __compat_aio_sigset ksig =3D { NULL, };
      |                                      ^~~~
include/linux/stddef.h:8:14: note: (near initialization for 'ksig.sigmask')
    8 | #define NULL ((void *)0)
      |              ^
fs/aio.c:2231:38: note: in expansion of macro 'NULL'
 2231 |  struct __compat_aio_sigset ksig =3D { NULL, };
      |                                      ^~~~

Introduced by commit

  de80166a573d ("aio: Fix io_pgetevents() struct __compat_aio_sigset layout=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/7+Mx3FL7wh_1DROrLXtWV4P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2uHhYACgkQAVBC80lX
0GzAWQgAghqJx0OCN3Zexk2nGXPMhdOhx7kvE/o/p1ktaIlP5yR3YCiVvvBxr66I
FPnka6qfPHPwHSiDi8364tABAyezb+YpKKGMk1DkFjhmHPo8ST0/WloTYz3+PjF8
JpXpii+n/Z7/lp1oLh8ZeXxxyng9DS0viDC0Xctr2H6Hp5efXTcJIFBATfCtAcaa
ewlckCUY4T3e2J/BUVRzwY5ZzgkJZ02u8Whkm0r2KXG+XJmSEgA5Y6KrU6YN0BoR
SJ0i8tkFCTD1i3oBdFbROWlEyEH482mbJX7Uo5JIUs64VTyhopYPIH+WR2EmqQ02
Vs+ulLLAiuz7RUXQRTPEKEWehG1QKg==
=gXoK
-----END PGP SIGNATURE-----

--Sig_/7+Mx3FL7wh_1DROrLXtWV4P--

--===============0644993244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0644993244==--
