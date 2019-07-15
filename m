Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7168A58
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 15:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6DF898CE;
	Mon, 15 Jul 2019 13:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D66898CE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:21:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45nPLT6CQjz9sBF;
 Mon, 15 Jul 2019 23:21:21 +1000 (AEST)
Date: Mon, 15 Jul 2019 23:21:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: DRM pull for v5.3-rc1
Message-ID: <20190715232120.18d2c8c0@canb.auug.org.au>
In-Reply-To: <20190715122924.GA15202@mellanox.com>
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1563196883;
 bh=AA15GNxzRcD/Gft7h69NVL53UNTyAKxicfRiGRl7Er4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d80lYJjWekSjCPVKaVb1uWeIQd8a28XjaegeSiFCYBNnxXzfs4MMzPwxNlcWmhPsA
 8Waycfa9hZgS6vx1btcziQG07IEws3GBoA0GxRHRviISkhB0Ez7HLZagmuHHPhgJTn
 hP1sX2i/FnrErv6YBCTUIAiMSyxWaEIQclJOi72Nt1k/UBWVE1G76carXeNLZMSzio
 DZWWxqbbbVh8zx7O452Khr6v6bcoFEd3nAQzWU91LZ2XcdbUVlVM+0nevtUSoz0cN3
 v53ITbc5XTi4u33Zz4xE5IolqFGD0d8/sk9sExEavxEBYd6c4CyTYrt93gEMv8Zwns
 T6YKb3rHMPJig==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1267898169=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1267898169==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VW_C7TdGe9E+EtWOg93jd33"; protocol="application/pgp-signature"

--Sig_/VW_C7TdGe9E+EtWOg93jd33
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Mon, 15 Jul 2019 12:29:28 +0000 Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Mon, Jul 15, 2019 at 04:59:39PM +1000, Dave Airlie wrote:
>=20
> >      going with it for now until I get push back). They conflicted
> >      with one of the mm cleanups in the hmm tree, I've pushed a
> >      patch to the top of my next to fix most of the fallout in my
> >      tree, and the resulting fixup is to pick the closure->ptefn
> >      hunk and apply something like in mm/memory.c =20
>=20
> Did I mess a notification from StephenR in linux-next? I was unwaware
> of this conflict?

That conflict was with Andrew's akpm-current tree, not the hmm tree ...

(on June 24)

"Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/memory.c

between commit:

  29875a52915e ("mm: Add an apply_to_pfn_range interface")

from the drm tree and commit:

  e972cea08fb3 ("mm/pgtable: drop pgtable_t variable from pte_fn_t function=
s")

from the akpm-current tree."

--=20
Cheers,
Stephen Rothwell

--Sig_/VW_C7TdGe9E+EtWOg93jd33
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0sfdAACgkQAVBC80lX
0GwXWQf+JoydCHiGtYJAiKoodhkxfj5Tv12MQFrM61Vj8TXMiH8047YuRQ1/nIRQ
KgL8i/l6KpXDAkcB3PKqdI8b6Mk2JhDSe5+z4WE2s/dAsHphBsrU+fyqTuByZm5s
PwHS9nqqK2UzsOOJN+15MH6VDieVzyOqUgAqdZep2EkUaRkstXYkSaWuCfQcOXQF
yqnB/NPgQ04RZhUTFf9v1JpUhU/LvDMkQz2YWOEL+LemzE9rE3CT++aPXB2zw5EE
bu9UToeusFqyiEPxIOo937xj+8hbtedzxEZlVs+S1jFpUkLy6wkV13ELG8mWIYOE
4dqb9BWTXC0xVpvIN/AVo4xYpqKDBA==
=3QeO
-----END PGP SIGNATURE-----

--Sig_/VW_C7TdGe9E+EtWOg93jd33--

--===============1267898169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1267898169==--
