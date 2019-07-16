Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741969FBA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 02:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C62289E59;
	Tue, 16 Jul 2019 00:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5341989E59
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 00:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 03DF910A1201;
 Mon, 15 Jul 2019 17:10:52 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id V0bKp_I3pekT; Mon, 15 Jul 2019 17:10:50 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id A9B2610A1AEB;
 Mon, 15 Jul 2019 17:10:50 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 23B042FE21E9; Mon, 15 Jul 2019 17:10:51 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, airlie@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: drm: pl111: pl111_vexpress.c: Add of_node_put()
 before return
In-Reply-To: <20190706132742.3250-1-nishkadg.linux@gmail.com>
References: <20190706132742.3250-1-nishkadg.linux@gmail.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Mon, 15 Jul 2019 17:10:49 -0700
Message-ID: <87muhebzzq.fsf@anholt.net>
MIME-Version: 1.0
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: multipart/mixed; boundary="===============2085470747=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2085470747==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Nishka Dasgupta <nishkadg.linux@gmail.com> writes:

> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a break from the middle of the loop there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> break.
> Issue found with Coccinelle.

Pushed.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl0tFgkACgkQtdYpNtH8
nuj9xhAAi9b+QoWnxgQRYhs+sulqiY5clJ7Qwlirceo+8+RWbh9CSWMHVJE/dft4
j45UhbctcsLMP7lkqrB+s/UeZjhB2lm+HdFjlhyekE1mGuTL8egKzYaUclybkeNX
9g9SLmjMp+sWZ/MFpxIocIAw8TGdCEA2z1SHjEzk8TTUFIPvprAxiRt4MiXfzMUk
o1Lnq93zm64pdbExfQtrEYx82i5s6TfvYREIqngWjfKtIfCkqghQ8Sy37QQ3AboP
HJpDBgjZZAhcYDK8e7wrA1RXSjPEHnMneqrzZiO5y3i2HfUo3yodhvaHLLFYhY2A
qJj4IfmsetdTHSlkd/8ZPwjiLV3Z68VV3hkdZmmH4/M7h6RQ9R12kRcK884R41Ak
yAuEG5N8Y4Mv+zKjhE009gb0zf3SJ5i5WqauiYPjQ/XZ4YzhX2jX2x07qeV4hKlO
pGuTtjlCdemvn9Dc8Jkb7vVg3MDZTCZy9UPdPi+17oqcukzi3zTDTIIeMk/Si5U4
MRzDnxSpfrypt3YEqjyd79PQj3oSm5ZxOLF+a9AdaYeMe5tVzuMAV+9C8i7gom1O
VyrV38mEE23YwXhUoaiuhrcoHpJHGBEwUyxQC+zA37EQur9LjmC+qn+m+j5CSb35
x++XKl4DNM6u1MEsVrXx1a8edD0N7VVwppNM/t/b0NjdEtvPtbo=
=HEHR
-----END PGP SIGNATURE-----
--=-=-=--

--===============2085470747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2085470747==--
