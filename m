Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112A2960F
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439726E0E7;
	Fri, 24 May 2019 10:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E09689F5B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:41:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 459NG51r9dz9s6w;
 Fri, 24 May 2019 20:41:33 +1000 (AEST)
Date: Fri, 24 May 2019 20:41:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
Message-ID: <20190524204130.35fd2b63@canb.auug.org.au>
In-Reply-To: <20190524201548.2e8594a2@canb.auug.org.au>
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
 <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
 <20190524201548.2e8594a2@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558694494;
 bh=ZgWKFfxHvwpM8Wtk7Zc4j9EyrdKEfULQCXmeKuMZL2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FICrb9z1efYrymNjagrBKaXUcgEciJG4KmwVwjWqcw5giDjWLEn1E6pIaIJGZxtxI
 nHaLOXkwWWGUDgMhE4MRg5JamsL2CuIE1cCNw4YGqJIhu/MmARgEJKKPakiUV0WqB8
 uYPaQb08uACB+x/E/2W0EUBS9P4+APcrop+km4tr69LGExxpbBYxv9OoGSZaG54Eyo
 30ArngiFovzt0QFTagPSOQdFRz6BX/kuA/QgdcRb36QnEgAkADF2UcqadpLqVUNV7R
 ABQlUX9QEJ+lPrVo3i+MBfUAAAbVVbG02h2Q8VEfjLgrcwf0igZiQ+wK2V//3jw5ID
 zqSuCiJinV/yg==
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1123729378=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1123729378==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=wMrdjYPpv2SAVt7Y0+ABtL"; protocol="application/pgp-signature"

--Sig_/=wMrdjYPpv2SAVt7Y0+ABtL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 24 May 2019 20:15:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Ah, in the drm-fixes tree, the definition of  is protected by
                                               ^
ASICREV_IS_PICASSO

--=20
Cheers,
Stephen Rothwell

--Sig_/=wMrdjYPpv2SAVt7Y0+ABtL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznyloACgkQAVBC80lX
0GxJbQgAj0dhFiXefIMEVotDJekVsFhb6aKrghhuZ5tUdUEO2J3VmCpA/kRwUPQj
NgfgVp3d6uOl8WKJvzKxmeH8XUQ+fr13I2rO6ltRKIODWW5Hs+iAHd5lp3EkWF9M
OFNuM2HuUFV+HIymiD6Nq1Jx8uElzK0lwlCi1LarO3Zeo4orB1B6/TdxQvXuOVTD
xXLaAM5hvuFF0e8SicPturJ16laxlfH1snCI8gtjmxol7KG1QGWQyUi+Bf3MfQQk
9tOWZ9Y5Yz3Kz8SOInDpvrEXm14nQ7OWP/n6FLVxCo0UGsL3vkJdaOyCqcr1ojMb
ZIndbfGIyM2VomQ8oZhTaC3kAjc0ow==
=rVue
-----END PGP SIGNATURE-----

--Sig_/=wMrdjYPpv2SAVt7Y0+ABtL--

--===============1123729378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1123729378==--
