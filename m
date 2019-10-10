Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEFD27E7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 13:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE33B6EAFF;
	Thu, 10 Oct 2019 11:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32536EAFF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:23:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46ppcL5t44z9sPL;
 Thu, 10 Oct 2019 22:23:30 +1100 (AEDT)
Date: Thu, 10 Oct 2019 22:23:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191010222210.1365d50b@canb.auug.org.au>
In-Reply-To: <20191010080207.GA22099@gmail.com>
References: <20191010131448.482da2b2@canb.auug.org.au>
 <20191010080207.GA22099@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570706615;
 bh=SKvuq9XCZSxjTmAESVOMU/T/c3K6J/ZB921ZjzgPyK8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gArhLL17y49ll02VycRXfx2H0amayp6lE4CpKDGv/uf94p+05FRR+ILB9oru1h2Ms
 l4o83nNWJQJO81H9oaTIKzA/rXVrlNh8v+pmOn63t/hhqOzuiWNnfApBX2vg6HOB1+
 Nca+/j/U9XmEf/f+e+CGncdo9MbPGVX5IVn37HQywUQaGfosqhJLwHbgq+wO6dd9Ly
 pgqLv/cGngabnX/dCr+iCXEVV50YU+jfLs36QGMhB0l106wCCWYiUW86euMM9ar1Zu
 2eUIRbuFMr/eb80KnXrhZKhk72I59fS8cmHFbLbu3rL859Jdt/Hjf51xt4AqCqfmAC
 G//cs8IN7Ar+g==
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@elte.hu>
Content-Type: multipart/mixed; boundary="===============1665344316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1665344316==
Content-Type: multipart/signed; boundary="Sig_/R2lbok_WC7n/wPBSA32mK._";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R2lbok_WC7n/wPBSA32mK._
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 10 Oct 2019 10:02:07 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
> I suspect -next will have to carry this semantic merge conflict=20
> resolution until the DRM tree is merged upstream.

Yep, its not a real problem, I get a few like this every cycle.

--=20
Cheers,
Stephen Rothwell

--Sig_/R2lbok_WC7n/wPBSA32mK._
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2fFKkACgkQAVBC80lX
0Gxk2Qf+O7qxMGH0AbcdDkqDOFIScBIa9xy0yrxppIhsVr6Q9Pv9EzY0BsJ4Dabh
diDN+NEj1/JMU22gVBUCHqoPjWcFHPGp83PZX8VEC2Sherq54a3ModGTkx7ydgTa
TV4x3ZJoRNGrjbEqaGwwRav8HrNu4cg3EMi6schpiSfyAX3CgQGD42s/ciOKDSUS
klcFr1/1ct579cXMmQS+CU0OKfGDmYKNSXFHGRe8o1IPXFFAT9HlRl4qp9RIq4PK
A6l3b4nhwoeJlkQq/nnOmmgTsYCCxmMAl6qfLiC3zXd4P7e3dQj/kYs2PMlrO8or
0MfJW72cLArYva06fCV/BrOyWNVIcQ==
=pG6L
-----END PGP SIGNATURE-----

--Sig_/R2lbok_WC7n/wPBSA32mK._--

--===============1665344316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1665344316==--
