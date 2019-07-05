Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCED5FFAD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 05:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BB66E3FE;
	Fri,  5 Jul 2019 03:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769846E3FB;
 Fri,  5 Jul 2019 03:14:40 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45g0M01Bpkz9sCJ;
 Fri,  5 Jul 2019 13:14:36 +1000 (AEST)
Date: Fri, 5 Jul 2019 13:14:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
Message-ID: <20190705131435.58c2be19@canb.auug.org.au>
In-Reply-To: <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562296478;
 bh=9605ZP4bn3MDqq1dxNaUUk8pwn4UP4BwvE48o+dZvLc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GhC55MLdQI6+V6yk9r3D9bck989EmS1gkht04wQVl4SzEPMOQYHM/P5vA63uV7sqg
 FN+idxpEy1o7z/fQ33UoAB7/CqSXXme3SgQrm0EIAYsAVnWT4VXNRh+aCNM7xZiwOh
 wIextEEub2oHRaqXTc+x6FzGXhtvwK3ly1PNvJurf4J43hMZJ37/caL8YSp5W8PNTI
 EEJOFnmWsUbaWQ+0RRkYBowGKqsPL9Uy3JWkfYLYXGRfv7NIWOTi+s2IrIuSWkiNkr
 P5fYU/z0+rTc5hjbZExP4Q+2OsKXy8bD3CoYWNRAwIR6BXe6faQASmYntNmoEtbEeX
 XJ1xe+wWT0B2Q==
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
Cc: mm-commits@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: multipart/mixed; boundary="===============1755559074=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1755559074==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cNeLSVReMpluqwcRRAFLlp8"; protocol="application/pgp-signature"

--Sig_/cNeLSVReMpluqwcRRAFLlp8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, 5 Jul 2019 12:05:49 +0900 Masahiro Yamada <yamada.masahiro@socionex=
t.com> wrote:
>
> On Fri, Jul 5, 2019 at 10:09 AM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> >
> > I get a lot of these but don't see/know what causes them:
> >
> > ../scripts/Makefile.build:42: ../drivers/gpu/drm/i915/oa/Makefile: No s=
uch file or directory
> > make[6]: *** No rule to make target '../drivers/gpu/drm/i915/oa/Makefil=
e'.  Stop.
> > ../scripts/Makefile.build:498: recipe for target 'drivers/gpu/drm/i915/=
oa' failed
> > make[5]: *** [drivers/gpu/drm/i915/oa] Error 2
> > ../scripts/Makefile.build:498: recipe for target 'drivers/gpu/drm/i915'=
 failed
> > =20
>=20
> I checked next-20190704 tag.
>=20
> I see the empty file
> drivers/gpu/drm/i915/oa/Makefile
>=20
> Did someone delete it?

Commit

  5ed7a0cf3394 ("drm/i915: Move OA files to separate folder")

from the drm-intel tree seems to have created it as an empty file.

--=20
Cheers,
Stephen Rothwell

--Sig_/cNeLSVReMpluqwcRRAFLlp8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0ewJsACgkQAVBC80lX
0GzYcQf+OqWJhVTJLbJLiBqRgQanYK7S/8DokAFj+dkgb9foQZIjp8ln1by3QDXg
gGAcxB9xEuIW1oxR6QUXlrWJtEJuC55Ka6LHo9DzUxF1ul9WgHLnWftKegzKG6+d
5mcol7HG8rVryx7FeEErXxZmubGS/Ws/1kh8KuZriCw2bgyZFp4Y73gqwrfGi7Pl
+PDWw1W9dnZj+mrwFMFGOA7CTKFab2paP+YOXTjrdjc0QxzaCNZjBpjT1Mo0nNbm
IJQwtCSQWTmLwfK+GEuxAQO3Z37B92G9ckWHqysmubvaWpYop3V2QUUN0PKfPdgN
s/qoynBRgRZo5pZ+E+9pICS8pwhjSQ==
=Z/Nz
-----END PGP SIGNATURE-----

--Sig_/cNeLSVReMpluqwcRRAFLlp8--

--===============1755559074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1755559074==--
