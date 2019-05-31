Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19B3085C
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 08:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8AE89228;
	Fri, 31 May 2019 06:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0024589228
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 06:11:07 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45FYwm0K0Vz9sBr;
 Fri, 31 May 2019 16:11:02 +1000 (AEST)
Date: Fri, 31 May 2019 16:11:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Message-ID: <20190531161102.4d0b2c97@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1559283064;
 bh=/DGdUvmIazHQUlf9mPACspVIRRRB10dQrvQwR2BJVz4=;
 h=Date:From:To:Cc:Subject:From;
 b=r3GwtRCrb+PP1SY1KvU2xNj4uU9qxEjbZFYSQU0GnienHfUtUFjPmi6R9Lql2Yozn
 N5dGINjtS+6GzqoZ2RO1U70UmbQ/eLmzFG0L5ky3FU0slqu+iOS4etuRAQ+RCUbGTd
 I+i0Xj2Q7h/kmEVe04MOBZNUPbQqynEb7bx+zOdZwkdw2TOA5KJC1Ylo7tquHBx7LN
 jw4W6DKbhaEuPMH31F+Lv7S3+/tILVQ7CkEdlraAQA7soCFF0HnsmMCGBQ9CHAqX6R
 NdqfFDc8qCsSZ2HWiZXywRPJmhIpiMwRVB5+AVdcOR8Y+AfMrwsasZ65nrNnOlz7Zk
 tuzxv96CykbcA==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1108641912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1108641912==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UapcH+QXdAMGnKLiDJYuPms"; protocol="application/pgp-signature"

--Sig_/UapcH+QXdAMGnKLiDJYuPms
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  137caa702f23 ("drm/imx: ipuv3-plane: fix atomic update status query for n=
on-plus i.MX6Q")

Fixes tag

  Fixes: 70e8a0c71e9 ("drm/imx: ipuv3-plane: add function to query atomic u=
pdate status")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/UapcH+QXdAMGnKLiDJYuPms
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwxXYACgkQAVBC80lX
0GwAJAf9EZ4F+IIwdZgVNyjEgLVKZbCJaJCYG6klilNRKDn+LpUeAudzXvxr5BnD
OVvt/z3EGsnkEcnbLnMNxNNfl3GBDr5oLMOBWyoJcRmG2dlpYnh2A5OVBezvRLlO
G9/OnmM/b7Az6QKNvTC9GyneIviCOhyLculeOjjskqAZE1N6k8n7n+3Y3hFdxq3V
RaINsrVHP6icyLGb/VzuSqva/WZGETQwRyeizhmdJ66jWbHFi2vUtwp5ePn5X3XV
UGtIucKXbE93oksslaHh7yyPSO7drGQOKG183aJFPyqudle8l0PhT4PDe/LDrGUX
DGsqz0YLYvkpaOCL4nh4bq+r0I8e1A==
=PFWD
-----END PGP SIGNATURE-----

--Sig_/UapcH+QXdAMGnKLiDJYuPms--

--===============1108641912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1108641912==--
