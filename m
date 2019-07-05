Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEBD5FF93
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 04:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583A46E3F5;
	Fri,  5 Jul 2019 02:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447AF6E3F5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 02:50:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fzqT23JJz9sNf;
 Fri,  5 Jul 2019 12:50:45 +1000 (AEST)
Date: Fri, 5 Jul 2019 12:50:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <20190705125044.12c10552@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562295048;
 bh=CwZDWdAbth5jMXxyrhGjRXLrCsjjva+ka1rJPIeETBQ=;
 h=Date:From:To:Cc:Subject:From;
 b=GspxrCerJBkI4HWmoseCoWFshTlm0tHa8iIvKzWu/9rHtGNBL6SxdGH2KdCAtsRXU
 UuOVgHCDAVFs6qFPGmsbAMIIR/pJE5+a4Q26hPSGtRS4yUAoW8zu0RpKfIQUs/xs4a
 BILCYzFtKpXYgAHDTbArdYj3i/0uPo5EpY+Bch33wGNF7/M4ftcuH3UI+qjYqj3How
 AifyIKLkMZpdDfhY2XsSCSYYsFKkgazqvB/lmro1CN+6KS3FZ4DFt7Wa/S3tKcQrC2
 C2xRegzXbspyDdTxnfl5NRhzsjzs8Gss7oJkh+wSO7aTWJl0C/mwNof+NJw79DwjQq
 6JIdB8FK/66Sw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Trigger Huang <Trigger.Huang@amd.com>
Content-Type: multipart/mixed; boundary="===============0446100530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0446100530==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8gZKdzyZ.MTIruRd3tsn7Vg"; protocol="application/pgp-signature"

--Sig_/8gZKdzyZ.MTIruRd3tsn7Vg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c

between commit:

  25f09f858835 ("drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE")

from the drm-fixes tree and commit:

  1bff7f6c679f ("drm/amdgpu: RLC to program regs for Vega10 SR-IOV")

from the drm tree.

I fixed it up (the former removes the code modified by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/8gZKdzyZ.MTIruRd3tsn7Vg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0euwQACgkQAVBC80lX
0GwLyAf8D4+tM3UyxYIbHzXNp9lsJcqI9EKjnUB2NwnC8c1FqTZA0Bd5HYv12wfT
UxqGMCmUXZm8r12CFt8b48WFofS2q8sMSGJh0l/IyR+D3xPjxX/OWhXkAzDbiSfL
OwBwlqDoazWuzfjatt5l4kNYE+R6K756TgHUvf4/PqQ0xhaI0CZ2PsfFPmMER4a7
5d5Oq9V95vZwI0H1cipa3EvL0nHBB0KWhBRvsLI13ImT0WrC3QOkhWQ54CrpIaL0
QBcO0ybBRNxeERjb20hYMSzvbaQw4jEolefXdklbxYX66hAwWSYN9Wc3+Exaqflx
jK4R8KSdDqhBgNX2EHrNQENhzvNazg==
=Jo7x
-----END PGP SIGNATURE-----

--Sig_/8gZKdzyZ.MTIruRd3tsn7Vg--

--===============0446100530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0446100530==--
