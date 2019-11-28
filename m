Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664410CF9F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 22:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692BB6E039;
	Thu, 28 Nov 2019 21:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1191E6E039
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 21:55:15 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47PBJX4XFfz9s7T;
 Fri, 29 Nov 2019 08:55:08 +1100 (AEDT)
Date: Fri, 29 Nov 2019 08:55:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.5-rc1
Message-ID: <20191129085502.3e9ffed4@canb.auug.org.au>
In-Reply-To: <CAPM=9tz3pFTOO45pGcZv+nGf29He-p03fXHbG4sNoCYxZzXkRQ@mail.gmail.com>
References: <CAPM=9ty6MLNc4qYKOAO3-eFDpQtm9hGPg9hPQOm4iRg_8MkmNw@mail.gmail.com>
 <CAHk-=whdhd69G1AiYTQKSB-RApOVbmzmAzO=+oW+yHO-NXLhkQ@mail.gmail.com>
 <CAPM=9tz3pFTOO45pGcZv+nGf29He-p03fXHbG4sNoCYxZzXkRQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1574978113;
 bh=wDOEHTT2VT0N4HQGhjLn9Chl3FGBwKvE3eeR1urev6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bKFNLi7zkmqOeXD/Q0QRNd02NEkjI7RMb56KwQkR9B0TZ6SQ5Bxohlr9Oy9TOjdC/
 KddeXzrEtstGonqvE1f01MfH91a6RqLzh3pA7wgzHksTXWno7fAnIp6/GT87AU21rN
 cg2bn3pLvCtaUrG7nSvoy+CCLmzTx5lkTPjl9tmKmtRg59Ix5rKwHgqzAI59vW83LL
 gBWiIisoCchhQdJA8b7JR8UnDbpGITHS0iYj48UASH8vpfgVJhqr26aOHUcpziR1Vg
 G0JF5H+Oht+G0z3olcT7dX/xEOq93lhHuBjvtDzQAuK2G6Ap+jRWi6j22jgF8TRLHZ
 dUhsu17pNbk6Q==
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0997934254=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0997934254==
Content-Type: multipart/signed; boundary="Sig_/ZHBqmpetsqfe9gb0w_/ensF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZHBqmpetsqfe9gb0w_/ensF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 28 Nov 2019 12:37:06 +1000 Dave Airlie <airlied@gmail.com> wrote:
>
> > And apparently nobody bothered to tell me about the semantic conflict
> > with the media tree due to the changed calling convention of
> > cec_notifier_cec_adap_unregister(). Didn't that show up in linux-next? =
=20
>=20
> I can see no mention of it, I've got
>=20
> Hans saying
>=20
> "This will only be a problem if a new CEC adapter driver is added to the =
media
> subsystem for v5.5, but I am not aware of any plans for that." when I
> landed that
> in my tree, but I assume the ao-cec change in the media tree collided wit=
h it.
>=20
> But I hadn't seen any mention of it from -next before you mentioned it no=
w.

See https://lore.kernel.org/lkml/20191014111225.66b36035@canb.auug.org.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/ZHBqmpetsqfe9gb0w_/ensF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3gQjYACgkQAVBC80lX
0Gw+xQf9EfqDG+hyyKDMpFDzsioShRwkxiEQQdwY7wriROmDZYr1asgEseGTmxRZ
XepkDQjhuiosXW20SXUuD74auSAQ3t6DZei+0vAuK9mbuJmg39j1apLLpZPswRxr
eDullesmFbIfwRMllaeMlHg4lMS0TopOfUY6GHOub01X7LRPJd632LfDVNM1kwHn
kAsE0kY3P2WW1KX6dfcrqhZVZl4aLbo6y/keT7QV+812AkfIEcu6Opz2ziB2x01O
moQOiaFk33uIkwtDtYmBGbin5Fc/+42YW521nqD875/qZbbCouFBpJdb0Zx4uLR9
NdRbw2cUQZTK1N7XuaEhvVN9X/LENA==
=pRe1
-----END PGP SIGNATURE-----

--Sig_/ZHBqmpetsqfe9gb0w_/ensF--

--===============0997934254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0997934254==--
