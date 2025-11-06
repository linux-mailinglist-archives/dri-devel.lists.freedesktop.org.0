Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3BC390DE
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 05:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD87010E6FB;
	Thu,  6 Nov 2025 04:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nabP6++f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405CF10E80B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 04:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762402043;
 bh=sMNsGWknN/JaYt72ZThqTIrgZsi0hfoUuuQT8aPOHL8=;
 h=Date:From:To:Cc:Subject:From;
 b=nabP6++f34bizm7G6AWBLhfZBKVKTxtp0dbrKFEoH9c1Rx8s6koeRYWq7MCWZ9t++
 9L+h7FVwfiqUOfP/QLdvYNcLB4kHxqhqTO0EvB9oMS/4G8TiauM3h50gG6FvB6oLfo
 KYSYaOUeAl2agEy2eONPIlEt0o21Y8XMLOiwpIhzglMC2y3TzQptamgvzxm4JrNGWf
 IRo4vc5KbT3qWIo5b1msNWquNR4RIk3lNg2TDPoX0s09Q8JOxyQGpsd4VgohkoesrF
 wwfVHIBxZ1QXIr7Ri6/0kXjqjJ6opGv7L3RR3ShvjHnYw6eeSkaHzrngXNVNWaxy0p
 a0TJP+o4/rRvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27tz5mT4z4wM2;
 Thu, 06 Nov 2025 15:07:23 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:07:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, YiPeng Chai
 <YiPeng.Chai@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20251106150723.72ef9e86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HTr.bcjM88iwQINF/laxE=R";
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

--Sig_/HTr.bcjM88iwQINF/laxE=R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: drivers/gpu/drm/amd/include/amd_shared.h:113 Enum value 'AMD_IP_BL=
OCK_TYPE_RAS' not described in enum 'amd_ip_block_type'

Introduced by commit

  7169e706c82d ("drm/amdgpu: Add ras module ip block to amdgpu discovery")

--=20
Cheers,
Stephen Rothwell

--Sig_/HTr.bcjM88iwQINF/laxE=R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMHvsACgkQAVBC80lX
0GwPOQf+J4ssFYzPj28KjB40p5sVNr9eHRGyCH+vl12nepM1gYRJDSJYGwQihtQ5
SWX3i1SCj7NgDGKmvPGZBPwfZZfqkkI/M9FLuKf+q5N2sBzFexN6qxzCDU5hzmix
QWQZvWYXoaSGho73Wep5dPITITKf/WEPyhujCDryfvmFrd6adyJy2lMOmm683wA9
6O2sbZdsDGAk64pCfGqKGTvBrjSbhflE2cY8Fz6XSzJAEedUAyF5Q4uo6G4Lx23A
LBuyDMhT5rW24JGGxsoYxctEMuUVHz9H5Aa2IkVsD9sMwC/5NjjNdSsslGvIRhOi
WOzhxBcPQtk5uQagdqUX1iR5hg+oTg==
=a+fz
-----END PGP SIGNATURE-----

--Sig_/HTr.bcjM88iwQINF/laxE=R--
