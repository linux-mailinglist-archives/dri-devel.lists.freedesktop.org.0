Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F6562371
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 17:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034889C88;
	Mon,  8 Jul 2019 15:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2657689C0D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 15:35:30 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45j8fP1132z9sSR;
 Tue,  9 Jul 2019 01:35:24 +1000 (AEST)
Date: Tue, 9 Jul 2019 01:35:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190709013522.060423df@canb.auug.org.au>
In-Reply-To: <233ad078-50da-40ed-fb35-c636ed3a686d@amd.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
 <20190708093020.676f5b3f@canb.auug.org.au>
 <233ad078-50da-40ed-fb35-c636ed3a686d@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562600126;
 bh=vxyFLSfBBJH3Y7Nv3aQfVqUUWv+pTXtM/NKogMH9qnM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=euW+MCESXPYou4FtkhvyThpXXET7NbT8ySOU71wo7oL2nKP2wB8DWLzcDKoLm0pkz
 JZ+4DlJwZzaKNc4k5RMASCxfI/Vg3AXQtWKMp/ASmNrOYcxSJzN5lcZlhbe57P6iLu
 a09EHfTChTBZZS86N9B8oGfaCy3lsBT7ll+wf2oighG9jD0QcDWls3D06Z07I/mtwC
 6ICU3UeAon/W3ov9YNqL4Z+VpJY71CA8YksURZaUCLPvssrLiNYdvGdAnE3u7m7TD6
 x8Jz5pNgRMzTyXOt63xFdh+ok0ThKHgE2iWqcQgzqf7kp5tZ/aTa3fXzjc2090db9L
 3jeB7hEyxDDkw==
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
Content-Type: multipart/mixed; boundary="===============1161744232=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1161744232==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Rz_UKoCs8b6c77s_a244mIn"; protocol="application/pgp-signature"

--Sig_/Rz_UKoCs8b6c77s_a244mIn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felix,

On Mon, 8 Jul 2019 15:26:22 +0000 "Kuehling, Felix" <Felix.Kuehling@amd.com=
> wrote:
>
> Thank you! Who will be that someone? It should probably be one of the=20
> maintainers of the trees Linux pulls from ...

That would be Dave (pushing drm) or Jason (pushing hmm), or both.

--=20
Cheers,
Stephen Rothwell

--Sig_/Rz_UKoCs8b6c77s_a244mIn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0jYroACgkQAVBC80lX
0GwppAgAmx7mlSoT2O2hM17aTOjMDvnqgZyqhmFembgdQk3DEyWJR3LOiZL/CgM6
iYn8A7GbtcH8vNwWB/eynjJHALs2jPcVqWu69kYAoPhDvRPNvpc6/ddaSrOKsb52
3z9K4sXwA8L9t9H0LrgSB2Bs34yL3XvULPB34Xf8V7iAnyQVx+WQ4EVTfjITxoXQ
Mx3oIqRGQ2u5qk7qPfCTCMDxIDRn7nR1qJVSqY1hLu2vnkXpbbKxKk8EEf0A21Ao
T/AqVkClnADvpfhGMAoWeXyVOFCEocpNgm6elo2+EtE8YbVNUeKXbapNg+OW4xyF
3QBceqlPmSiTGaEu3+1WJmlcJKsR3g==
=Joh7
-----END PGP SIGNATURE-----

--Sig_/Rz_UKoCs8b6c77s_a244mIn--

--===============1161744232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1161744232==--
