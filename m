Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C86E2AE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 10:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B449C6E5CE;
	Fri, 19 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C3C6E5CE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 08:41:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45qkxS29Drz9s3l;
 Fri, 19 Jul 2019 18:41:15 +1000 (AEST)
Date: Fri, 19 Jul 2019 18:41:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Fixes tag needs some work in the drm tree
Message-ID: <20190719184112.6bae9eb0@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1563525678;
 bh=AfUDJOPkyWvFlrjo9LOtQTi3KuQ2jyPwaXYtid1vbUA=;
 h=Date:From:To:Cc:Subject:From;
 b=SoJAOSLvodpm3XsS0DYUx4yRIOBTR/CfEYkJCpmFjpVrHwpoPpzz0d5Jlw9J5+kg5
 ZfrULMMvxaOXD1qs1g/Si+NVk+TRuWa/RpnnZ5XT9oXp2mcBNXhLvUcORDooJKwYHb
 EA7hGHWEWGLL++vy+pFJnDiknZHU9JAvQTvVFZoj4yMsWaWioZPUgvpqgxIuzaGSf+
 pE3nt0V2YpzvmlNOmNyKV8cU69LlZ6w+2/GQmnTO5zmyQF4ZFXNeGJVKD9f/JFFzli
 hi/ZxUy/5M15dobvhqZFKBa7LoT7fV9picb3x50dm5nXwypFbv2nXaOHOvYX2SIGsi
 EQIV7A1I8k8sA==
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
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1774115659=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1774115659==
Content-Type: multipart/signed; boundary="Sig_/G9MxQIo.QHoane_qfAxQ+/p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G9MxQIo.QHoane_qfAxQ+/p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b7019ac550eb ("drm/nouveau: fix bogus GPL-2 license header")

Fixes tag

  Fixes: b24413180f5 (License cleanup: add SPDX GPL-2.0 license identifier =
to files with no license)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/G9MxQIo.QHoane_qfAxQ+/p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0xgigACgkQAVBC80lX
0GzKoAgAh+uW21gJ4l2i2YQ2jCrg6wg09OmYZVZ94eOrBiO4mTaArQaQlWxijWKQ
9UIGzkGuWuoAy9PbfmYC/TJ4xkQO8gvzaS5paJjnXnsWzUrtJDRsyby7pHSq0536
PzQXXcgCo4ZNQXyJZBlxgNm2YhtO/4u8SVQ9042JvBAaD7zXItdpqwZF+oC2+0nY
7IPzOOs3QkpEPZ8XEgQJx2eg4DlbVDU+BhSezlttp25yAZsEIUo5Rtpe+ZyIzxAd
8xh/3IGgZaoLsCjWT+AaazKmEK9FwWbBjV1IGIg1xUosj8WqrCnOeen8qeO48T35
HAJu5h6cV9xHli2JsKcj78X1z9qEuQ==
=TSzi
-----END PGP SIGNATURE-----

--Sig_/G9MxQIo.QHoane_qfAxQ+/p--

--===============1774115659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1774115659==--
