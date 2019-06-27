Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D098858D7F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 00:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24796E846;
	Thu, 27 Jun 2019 22:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E74E6E846
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 22:01:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45ZYkk0m0Wz9s3Z;
 Fri, 28 Jun 2019 08:01:18 +1000 (AEST)
Date: Fri, 28 Jun 2019 08:01:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20190628080105.4f88eba6@canb.auug.org.au>
In-Reply-To: <CADnq5_MOb2Fg+S4igqUrtFrmd3xVHtaLZGc02nu-m=Jn-TVtBw@mail.gmail.com>
References: <20190626212212.25b41df4@canb.auug.org.au>
 <20190627133527.391ed0a1@canb.auug.org.au>
 <CADnq5_MOb2Fg+S4igqUrtFrmd3xVHtaLZGc02nu-m=Jn-TVtBw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1561672879;
 bh=dru1e2WNl8XF+SRhnWn/YLNCM+xz01H+grIeFoUNSRg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dtEmFVpwlTJLMg5QNDLHy0ZQz30II4VVg7tEHgbhXlDVd5HqcOeQkyLLPuSARqwQG
 dm2SaLr3mdRWEhVtyZpXHDcfvrd7MAHkGLUu454k7i6HqmokIwYW2KwKE26qDdCuAa
 U+KFA4PQcMU+8QfI63aVzQCJ/hthkP0fna48T/4pQvVSOtcG1/2paW3ysgnMmwfGMa
 SaORiqNdzjelspGocWuWckMEUhEQ9ita3lCBlpN6rCvk7wEi3GPCp4dg6HMIaSgWyH
 L0ACaFj6/M0erYAvPLCgRstFXiTVEKvc//Gi391+y4lYyRl9vANEW5nwt5BKb1kVYd
 wzA1csyfGw5Lg==
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
Cc: Dave Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1656107596=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1656107596==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KADskRshsDlBe.K2D80XJg1"; protocol="application/pgp-signature"

--Sig_/KADskRshsDlBe.K2D80XJg1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, 27 Jun 2019 10:18:38 -0400 Alex Deucher <alexdeucher@gmail.com> wro=
te:
>
> Fixed in this patch:
> https://patchwork.freedesktop.org/patch/314527/?series=3D62866&rev=3D1

Thanks.  I will manually apply that to the drm tree merge until it is
no longer necessary there.

--=20
Cheers,
Stephen Rothwell

--Sig_/KADskRshsDlBe.K2D80XJg1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0VPKEACgkQAVBC80lX
0GwhfAf+NYOwaxJSl8pDn5625adqSdc80VI+FLOMPG8qHbaGpze4tjIR1RtP7d1h
XC7VwRmRy4Dswzvhdt4HYQB4p6W+BdqBU9P6lDKBd6K+I8v+4SB7XeEachavz4Vi
pAgHWjIbyYU11C9k4kYP0x561mZ6tLW4PTIhVDb2PThpEE+trEH1PD70jKqARzm6
161SCk6UIC/+SwFJRKRTudJld3SjwuvH4SfajwA7kEOIWI6NVeHb4OK5q7p1rVGe
wHKvLHVLvBF/1M/NFyXnlCUFqJdhQ8JBGNsFQCtEHCYQ6x1FRDn4nlwKCxoQuAv3
Q5SPhqCv8dUQ1Ii4zCg6vM3a6bE/8Q==
=ZnRx
-----END PGP SIGNATURE-----

--Sig_/KADskRshsDlBe.K2D80XJg1--

--===============1656107596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1656107596==--
