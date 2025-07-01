Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB53AEECF5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 05:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D8610E25D;
	Tue,  1 Jul 2025 03:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HcLoTEkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B583310E25D;
 Tue,  1 Jul 2025 03:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1751340041;
 bh=TiZJd6TOIYdOJwulFiMyObzmR6cbm1TJXONiRpeKk1s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HcLoTEkBk5rGuHPuh4sFO/cXkZvp9p7hUcmHXzHHogHA8kp/CT6vzY2dODxjFTHxo
 C8GmnmrHf0ecfvzEv4tRK6pRjg8agaKp7ZKFBuIacLmr4xYtFugcM04PJGNdmPCzZJ
 sPbHUi8TIoJF0AWvqkrcEM/MB5wg9NHUxl9yihm3rjIlblC5YpH76WrW+ObVftG2Jr
 SwdQhlM8Ug5BanfTdN6Mub+fCT6466fj4gzdShAhhvsigNyCDDEz4+7BfKGp4yCSdK
 Iwcc9q7zyrN+A0p0LLgG1kTWNbdTEsiHOHUzovoBDr9ZYj7+mkhYY7LYcgA6XiC1OB
 63H9G/m9oAC3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWSw86ryxz4x0C;
 Tue,  1 Jul 2025 13:20:40 +1000 (AEST)
Date: Tue, 1 Jul 2025 13:20:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250701132040.4f6c04a8@canb.auug.org.au>
In-Reply-To: <20250701125705.5d5fb3f0@canb.auug.org.au>
References: <20250701125443.5ba945e2@canb.auug.org.au>
 <20250701125705.5d5fb3f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0wzreYd+=u672Vxs2YKsrcp";
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

--Sig_/0wzreYd+=u672Vxs2YKsrcp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry, this was actually a conflict between the amdgpu tree and Linus'
tree.

On Tue, 1 Jul 2025 12:57:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 1 Jul 2025 12:54:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the drm-misc tree got a conflict in:
> >=20
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >=20
> > between commit:
> >=20
> >   ebe43542702c ("drm/amdgpu: switch job hw_fence to amdgpu_fence")
> >=20
> > from Linus' tree and commit:
> >=20
> >   d0c35c84dcfa ("drm/amdgpu: remove job parameter from amdgpu_fence_emi=
t()")
> >=20
> > from the drm-misc tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts. =20
>=20
> I used the latter version of the conflicting section.

--=20
Cheers,
Stephen Rothwell

--Sig_/0wzreYd+=u672Vxs2YKsrcp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjVAgACgkQAVBC80lX
0GyUAwf+OvOFAIk64b7IWoGJEiBeZQ9N0+rzoXWAKDdU0T0NXGm47bHq5hPWnkYj
wWWnjN9DXXFJ6sjRlJy5HhkV9/5w+NJ5vFLJUlC2je4APweNKYi8xF1NoxyQDv2K
LXzSFT/SKcFBIvhE1b1VXKlOOnfMI05JgGQ8NommwNpU5Rn96z4PyDtPGLfn4yCk
DB/c9ackt7wQ5xCm7S2lLTfVfk+saMREBgIL2fR0V6tLDnq2ybfomHz8+030cAZt
CftyPfS3gSrvTy3JW43yOJNROzsNwsnBvIIR3sn2YYrZ1Sk74H3Jd91Z39MQaA8M
TGZM9L96yt9vrBTn0TsVM90ciWY8cA==
=+Jtk
-----END PGP SIGNATURE-----

--Sig_/0wzreYd+=u672Vxs2YKsrcp--
