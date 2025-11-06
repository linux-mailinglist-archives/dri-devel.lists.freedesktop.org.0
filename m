Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2253C39154
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 05:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9752C10E03C;
	Thu,  6 Nov 2025 04:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R/MMluLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDA810E03C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 04:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762402922;
 bh=MRQkcWineOBwMrRNd1qXJWRdZB0PlL23f7QJgSyfj3E=;
 h=Date:From:To:Cc:Subject:From;
 b=R/MMluLQmeFadc/gNya+J3lmyPe8SmiOGFJ6K7I40HvcWO5zjPi6sQn07Z1Jzp/Jl
 CAs80KiByknpmsjl4Pwxt8x+s7uWLYcUamh0upyBOzhq9awQcYA9sCJwrGPZgBhtHx
 eREyXZ5NSSkqflEQMmPxzSsadO6HPP0Kz4NTxmcN6bF8SbNGVuLZULq9Z/1QX/xI4R
 e1C3jfexpYwJcRIxDlI0i0rhJZ3FSSu63ZyRIcdcCU1ADyrZT23sI/HtmdSUjrpgn+
 NGWxQB8773YRH/pgAjPwVoJ3lh4/g8c3hBlaJ0PtqkoMp1d0WWe9kHRaz7FHzhBnEu
 jO3eDxPdUptqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d28Cs6yj3z4xGp;
 Thu, 06 Nov 2025 15:22:01 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:22:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20251106152201.6f248c09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BNYysu0WmGJ3V1lS4mK8O3n";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/BNYysu0WmGJ3V1lS4mK8O3n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: drivers/gpu/drm/drm_vblank.c:2267 expecting prototype for drm_crtc=
_vblank_start_timer(). Prototype was for drm_crtc_vblank_cancel_timer() ins=
tead

Introduced by commit

  74afeb812850 ("drm/vblank: Add vblank timer")

--=20
Cheers,
Stephen Rothwell

--Sig_/BNYysu0WmGJ3V1lS4mK8O3n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMImkACgkQAVBC80lX
0GzEVgf/UOcduoHTMaZDA5XVaDMAD757BQ4TS29IU2ZT+JjY/s/7Ivq1xVC5aOae
QiPjvq4yrX+W863v4TslZKviFP67inr4/vXL0QvWI6VsoOqcIUSSjdNDRIAhwy3C
nlWrxFl390gjm//UoqTqJWPGcIHIxzEGthlPxgILHDVgrxNuyacbT2MF8BkJJfrL
xm3RtteztJ1oIrChN6RugSKmipDm6SVn8FDTxbo1h1QFeh2uJGkRuRck9/7sth8A
DrH+IyXtSJTp2n0M7ZCoyo3lVksF/7jZOPw5hDk73gLsAYAV87T3sq7CbnpKzb5F
GcOSesIDb1xmhRdoWaDRxDdJ8XuzIg==
=2CKm
-----END PGP SIGNATURE-----

--Sig_/BNYysu0WmGJ3V1lS4mK8O3n--
