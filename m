Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383EA5EE9A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 23:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254966E1FB;
	Wed,  3 Jul 2019 21:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD93A6E1FB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 21:33:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fDrJ03Pnz9s8m;
 Thu,  4 Jul 2019 07:33:51 +1000 (AEST)
Date: Thu, 4 Jul 2019 07:33:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190704073350.1776b317@canb.auug.org.au>
In-Reply-To: <a9764210-9401-471b-96a7-b93606008d07@amd.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562189632;
 bh=Os+jzgQMICZR69IdtZ2LPrWGr3wL6t8dfhpo9PW9CTc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BvceXGMmlD2pgIGNG4nRkkfwbZOsnSGFutgb9K7qpsyEMTPB+3lIDosiN7RYgY+6D
 P7OD5zI76p5WSsPw6OB/AKHY2QrJU7vzHtRsvz/Z42ZznveL6e1r3id+GYPtQih/qY
 kZqHCBDlUJqF2iE6Jkt8MEI+GzYmJX9Bvg+CuQBx0L+BPw4ggURceiRfx2Fg1jRCh3
 RwLod3wU3Eey0ZiFBf0Cj4fi7HemDArKarPKAUKrkVN1Ny/nFVAJQFnCKkTA5ncOUF
 McZOsnicRdX4IwPaMR/kCLxAVzSz6Fs5xJROthl7FeZE3KR2d1RbhmQ0KZgcMBOi+P
 Z5cdAmX544oTA==
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1018760513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1018760513==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//OkC/dWzQJ./2kmAlmbmsCZ"; protocol="application/pgp-signature"

--Sig_//OkC/dWzQJ./2kmAlmbmsCZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felix,

On Wed, 3 Jul 2019 21:03:32 +0000 "Kuehling, Felix" <Felix.Kuehling@amd.com=
> wrote:
>
> It looks like Stephen already applied my patch as a conflict resolution=20
> on linux-next, though. I see linux-next/master is getting updated=20
> non-fast-forward. So is the idea that its history will updated again=20
> with the final resolution on drm-next or drm-fixes?

linux-next gets rebased every day (that is its nature).  Do not worry
about that, I will cope with whatever you do.

--=20
Cheers,
Stephen Rothwell

--Sig_//OkC/dWzQJ./2kmAlmbmsCZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0dHz4ACgkQAVBC80lX
0Gxxdgf9E2csugoLApYbShqrhYZvNZV6CSi5bk64nkcRGjGhYrf/iOJKJFYLu8ef
N2UJofT51bVSvo5N4jHHXznLj5BYaPfpk7ZnOWBrcT96QFZQJ3pUVGwwcBU9Vfvi
MjxDEhNsbKvG987UnTXy4M3s9ZQ3h+YDrWv4gHZACBoTXFHJtpQWzlq7KuI2qVei
YPVWtEA18ygX1C6yAkKcaqeI4BW+43xio9ZLvCy86DFouyF0+cLkJAi+oe2eysX+
RKsrOjnEIdKlq1xKV0OGuT6ovuEHqUBj1vm6AFUZQ0XoUATrvSt7xtWYvETG1seN
RQ51nmJ3eG1uft0nzra48IztE1E6lw==
=QFow
-----END PGP SIGNATURE-----

--Sig_//OkC/dWzQJ./2kmAlmbmsCZ--

--===============1018760513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1018760513==--
