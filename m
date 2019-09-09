Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E79AD69F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 12:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BE5899EA;
	Mon,  9 Sep 2019 10:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD508899EA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 10:21:57 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46RkjV2x3Mz9s4Y;
 Mon,  9 Sep 2019 20:21:50 +1000 (AEST)
Date: Mon, 9 Sep 2019 20:21:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190909202128.0c420ddd@canb.auug.org.au>
In-Reply-To: <20190909201159.778590a0@canb.auug.org.au>
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
 <20190908141307.GA7115@pc-sasha.localdomain>
 <20190909201159.778590a0@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1568024515;
 bh=fyZY9MX63OH0n6q0z5DZK7nEg/98r9px2uwAS1QIXsE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D7Fs1Mvyh3q7HoysKEaj3i1Mmt+6OADTYf3vTqhmBJ6L/LC5GJy/3h/Zjq7O/KnWX
 vmD5qQYwiwJaAwaXnosX4joQeVlOM3cY/tzyINbkDlJby82pY5qCJ0w//EOSfk24j2
 QHFmDDMvrft8PtIZU4FQVkwBHmgGzrpKiyJZE5LrSU5jRq9469FJHj3AodMCi544zr
 FqESRpGNy567NB8OF29cENG8dqfn1jvor0H69YAC6ezWdPiDYNGTvd0rY+vJROQnE5
 tSUn091oUa1EQBbtbywGY20MTgT7SKwu2vc8vLLqKCaDyWPnXINKJX3W5xZD1PSawZ
 tTYhw3Cq2VHvA==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, mripard@kernel.org,
 linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1005927297=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1005927297==
Content-Type: multipart/signed; boundary="Sig_/l+GqJrN4iAZNpgJN4bQkHoX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l+GqJrN4iAZNpgJN4bQkHoX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 9 Sep 2019 20:11:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> If you are bisecting linux-next, I will suggest bisecting between the
> stable branch on linux-next (which is just Linus' tree when I started
> that day) and the top of the first linux-next that fails.  (Assuming
> that the stable branch is good).

Actually (since you won't be bisecting the latest linux-next), you
probably want to use

git merge-base stable next-20190903
	(or whatever linux-next you are bisecting)

as your first good commit (assuming it id good :-)).

--=20
Cheers,
Stephen Rothwell

--Sig_/l+GqJrN4iAZNpgJN4bQkHoX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl12J6gACgkQAVBC80lX
0GzcJgf/TuR5t/iDv0PgFYFYxLltTSfnfqvQNfWn5bh6AylC/2B62cPp6jgBOg0D
gW0JT9Fp4kSAjFGR6KW0IMSXiJoLJAHO2b2atR6ET29yeAWQG/iPkZz6b9IimqIL
4g1YdcQZ3iLtVCOqkf0QD0NDLdCukIVhkTNuyjXgs+boATWRt/+ppnA0l+hQSnjK
WWI/oCviGpIwYcVfNVfRhstXWYoXmdEULvJ4AK0AsmPPlLOqnpTTl0rUnANgyC7p
cKk73j1s15YO7KQzHkXLtXWzHF2/lj7dY/0soS/D5720h4F5SYBh/PdN8sXPo7Al
NOwmDjgqOkd+N5jNrDM7mXr2N9xQ+g==
=B+WT
-----END PGP SIGNATURE-----

--Sig_/l+GqJrN4iAZNpgJN4bQkHoX--

--===============1005927297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1005927297==--
