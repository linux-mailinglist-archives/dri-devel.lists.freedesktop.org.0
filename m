Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1404A6AB4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 05:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214E810E60F;
	Wed,  2 Feb 2022 04:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A45F10E60F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 04:02:08 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JpSmV6BSkz4xmt;
 Wed,  2 Feb 2022 15:02:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1643774523;
 bh=Lf+09FPz+AsupNmt8Jv19VeJanlFKZqU5/Va7Xk7MDI=;
 h=Date:From:To:Cc:Subject:From;
 b=fmMmX/IIo8EnKkZEWxqUWcfGksncK3ykupr7JB9ypGDOLFYqnON2oZuGW3APj6xIz
 fbHPs+wBjtvZnhuw7Zx/mya0I7qK3uez9f9MLwUgAPaEKn0pLJt/iKOXDu51m98LQP
 Yz0K81BXUi8d8hWsjY9h5tiWTJ3EUMLTBMZonbAsH6+uM5yB1ON7h1mrADyGlAJbPq
 0YSzye9UeEXbtj3iB9hLMSELazXdiA3O6Pf5XA8sbcsntwedoxBBD2chtlIMRZOLY0
 +FGRcrCZQAWfivG5bPkJ+IM6Mqf7W/P4maxtkj08wQtq7rNo33SRVsN12dQ8aOOZjS
 Fov4RaOCa51Lg==
Date: Wed, 2 Feb 2022 15:02:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20220202150201.290c7d3d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4EtkP4fYGFj1I_pOB2dAkP8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rajat Jain <rajatja@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/4EtkP4fYGFj1I_pOB2dAkP8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/drm_privacy_screen.c:X: warning: Function parameter or memb=
er 'data' not described in 'drm_privacy_screen_register'

Introduced by commit

  30598d925d46 ("drm/privacy_screen: Add drvdata in drm_privacy_screen")

--=20
Cheers,
Stephen Rothwell

--Sig_/4EtkP4fYGFj1I_pOB2dAkP8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmH6AjkACgkQAVBC80lX
0Gz3wgf/ey1x92zgIE+ZncuNaepOqFQDUV4X8gRagDpaF6MaDhyBlsO2y9kEDDo9
pJOuhErrOqgLLDtjToViDXx8svpeR3egiZ4CS6RTmja8P78KV6AOiqchr6pkRje2
/L71JHp2KArZfcQKx6Q3Ef6hUnTYwQQGZcsEpqaAr9zoLAqw1l9oqcpB1+wTSU+J
Yirz0qanxH9jXOkJ2AhqsEQ0VQt6gejqI8V9byEdeouy3zoANBBxcto/EBXLhxnd
AGHCGifpM+U1d6Z4599XVvBOX04bkKvnqNoJEc5HwLCiVCQP6KmQHllIkEbwoTni
RfYAqhMTszisrKIMSTdb81Nmu40osQ==
=4eBH
-----END PGP SIGNATURE-----

--Sig_/4EtkP4fYGFj1I_pOB2dAkP8--
