Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2CF50078
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 06:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D02898CE;
	Mon, 24 Jun 2019 04:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39629898CE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 04:15:57 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45XGDq0h5rz9s3l;
 Mon, 24 Jun 2019 14:15:54 +1000 (AEST)
Date: Mon, 24 Jun 2019 14:15:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the fbdev tree
Message-ID: <20190624141554.7aafe108@canb.auug.org.au>
In-Reply-To: <20190624114538.3531b28d@canb.auug.org.au>
References: <20190620114126.2f13ab9c@canb.auug.org.au>
 <20190624114538.3531b28d@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1561349755;
 bh=9riMMsbTfWEXQ3lscKQPqLcoMaG3jMzOSISEUDt+ogw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EStluEZ6UYgr0Dv05TMk1GsyB3Sah4JQ5RKyjvx+lIueiqPVzw8XhfUt28AAEgCTF
 QrFYIOQp5hbTz3ZzL9O3/6Cz9j8trzYvvCtpFs8+coto0Asmu/o8QN3vr8tx5ekVGF
 giVBwxrCQJerzzLns8TMVLIFn+XHpMONHNHYgRarXUMrUo7cMuwaDDc4U68cDSKcGc
 GOmPuAHgIqyDjVtZUPtVtOxgJRr+zTiJGPLX4+nJqWq6JDWP5QrApSOCimQY3UYnc2
 sRPr3tuTlCSk3jNSDMoWin4Ci2uJEFH5+FF6sD3rTV71Z1U1HlydW1HjhpCljb4a5u
 rpbO0Baqzk/PA==
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
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0263810465=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0263810465==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mk3Ou2z25S+CbuKHtZ9n4iV"; protocol="application/pgp-signature"

--Sig_/mk3Ou2z25S+CbuKHtZ9n4iV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Jun 2019 11:45:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 20 Jun 2019 11:41:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the fbdev tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > x86_64-linux-gnu-ld: drivers/gpu/vga/vga_switcheroo.o: in function `vga=
_switchto_stage2':
> > vga_switcheroo.c:(.text+0x997): undefined reference to `fbcon_remap_all'
> >=20
> > Caused by commit
> >=20
> >   1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
> >=20
> > I have used the version of the fbdev tree from next-20190619 for today.=
 =20
>=20
> I am still getting this failure.

This has now been merged into the drm-intel and drm trees :-( .
Something has gone wrong as Daniel was cc'd on the original build
failure report.

I have reverted commits

  1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
  fe2d70d6f6ff ("fbcon: Call con2fb_map functions directly")

for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/mk3Ou2z25S+CbuKHtZ9n4iV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0QTnoACgkQAVBC80lX
0Gxubgf9GSTtt9btn00u94XXVVz1g0pGwGhvhNCUWJfaafnmo8vOZOVyby1wG/Qe
oLSIorvCYPMTaKyKuYOXx7CXaSq0//+rQCcRYal1qd/A+zBGZzYZsG2flIxNnoBm
fJDxhZt2U8uY5N6XKokKtIf/39s5Xumchn6LHGHT8Yepk/yLk5VqJc04rMeWyjJg
UihzpQG7CHna7sKtYlZRpCsUbOkLNTbkvcuNZbNx2EWmAVqsenbmaZz8Dcg/S3nS
7ooa3d7/g4peTZEs+RdN4bnH2m12vvzX7pfimD2B7Rk1gIe2qbcVnQw9G+D1/eYx
mjintqUpgjoPJR4FPPFyGODUgF0hyQ==
=DhjA
-----END PGP SIGNATURE-----

--Sig_/mk3Ou2z25S+CbuKHtZ9n4iV--

--===============0263810465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0263810465==--
