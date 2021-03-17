Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5633EAAD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 08:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6473289A62;
	Wed, 17 Mar 2021 07:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D643289A74
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:42:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0hvg315yz9sRR;
 Wed, 17 Mar 2021 18:42:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1615966960;
 bh=9B1kDwqk2Aq7cnBTJ/I8PjOF7FYoKDp9U+aU5IvgsTM=;
 h=Date:From:To:Cc:Subject:From;
 b=EMKtdlMbtZUkDYlV1t/0TUE9oY8RFcuASR3/Aa00ANZliq9pCmc3dX4nMH7gMBnNi
 rMl+VTM98i1nOVxhGJj0JRhuVc++a7ZsLfqLNSPuz+hJbpzPs6G425ozbiJi46bwqf
 z3MkbenalvyMxMq68A6aU5EYkZ/4W49wni8lV5DoQyOb+ChTJveuuTxSBnDxOJM0zu
 LrvG0anUyW63M/cYgNiSzZnvr3y0LRj8okjues/DyGlyS6HMmyBAvEOD5gJb2etGd7
 KXOoCMoI37Gc3mfm5aVyhoGGwvgNWPEFG02r4Kf7dmgLXEYAu9WbTNV9Q4eVsNAlEo
 B70OTcpGHzYuw==
Date: Wed, 17 Mar 2021 18:42:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210317184237.7b0de3db@canb.auug.org.au>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1909048256=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1909048256==
Content-Type: multipart/signed; boundary="Sig_/VFXPai4zRYQv_2HI6H6V7tJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VFXPai4zRYQv_2HI6H6V7tJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

include/drm/gpu_scheduler.h:304: warning: Function parameter or member '_sc=
ore' not described in 'drm_gpu_scheduler'

Introduced by commit

  f2f12eb9c32b ("drm/scheduler: provide scheduler score externally")

--=20
Cheers,
Stephen Rothwell

--Sig_/VFXPai4zRYQv_2HI6H6V7tJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRsu0ACgkQAVBC80lX
0GyNPQf9E2nEPp3fGgyYTtoL5IqYrtgq466WBskGcOMNzFfPGq8m72yrRKMYMP69
Jx/Aclzhij8qYHVTtGukAACD/HRapGOFcMuy0Bjkha9305D+oeNFv6R6uOHEoxYT
HnuN4QvMhYJC6IWi1XW51dX+R3qyF6pjPcqsx9Y0kPdsExOSHeVIJEPaUa0XVn4P
ZmNyc19/BigZhlAVIKYV6uLetMeaKGA/pv3zVXnnUAwqgDrvbFiaGYgbGt5qItDf
r9aj5LzMImCaRqJUjblsFHbbrx5QytAwUd80I5vO/xMRi2TNYKGotpxB2w5qarUs
8nj89Bg8e3BFCejd41GDRR5fBWbdNQ==
=1WmV
-----END PGP SIGNATURE-----

--Sig_/VFXPai4zRYQv_2HI6H6V7tJ--

--===============1909048256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1909048256==--
