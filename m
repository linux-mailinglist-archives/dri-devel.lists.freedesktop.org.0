Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78654AC4A03
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 10:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D184810E3EA;
	Tue, 27 May 2025 08:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XJSkoORp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8ED10E3EA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1748333953;
 bh=IkH/TjEBQZFcqklxj9RA7ACaXu1fGvMgB4+ZHug+VWs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XJSkoORpg0nunY/AMe6ymS3VeMtzR2WFIHRZCND3xjFlID73t3pDL3wkC1zAidtVi
 umc9A2Raq5KIyejSDDFk4zut5MNUkimG/V3FiC6acBipVxlmGYb8fiiqR1Psd0ms59
 MbW+MWLn9h2FszHQSZIYM4cxbtLKAFL6unScOr17kcZlV89039n6Mc0X27B9+M99D2
 I+vBUfAbnnfCWePFBq2hHlPspMh6QS0fU86okW+fls4/m4x7OUHoF+CCgGgSeo51h6
 /I6nccr6QhWpPyWiyx8zxKh2gDeVWe/Ekg7kVSXgt3i3Y1NgZ7j7/lkPXJcza8d57L
 5WU6gKYneTWsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b65Bm5xPdz4x0L;
 Tue, 27 May 2025 18:19:12 +1000 (AEST)
Date: Tue, 27 May 2025 18:19:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20250527181911.2c497df5@canb.auug.org.au>
In-Reply-To: <20250521204911.0266f4d3@canb.auug.org.au>
References: <20250521204911.0266f4d3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mFdbfBKYirkcxtm6N5Vc7HN";
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

--Sig_/mFdbfBKYirkcxtm6N5Vc7HN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 May 2025 20:49:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Error: Cannot open file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>=20
> Introduced by commit
>=20
>   c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/=
rm/r535/")

I am still seeing this error.

--=20
Cheers,
Stephen Rothwell

--Sig_/mFdbfBKYirkcxtm6N5Vc7HN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg1dX8ACgkQAVBC80lX
0GwXFAf/U0NsocTa0gniqfcIPGqqv2TLXUaC3tF+r60wLVcFlRMWcTMYXw4Om4RW
DI9aLEM4m6j5dWHN1NM6TJ+JX4u+kExVOwXFAkTlfuyiP/qarW9rReFlcnek71pA
LQGJVTtMPPC/H0nv0MMs3Wpki35DR3ZZEPeUDiEDhVKiL+Q9XT25hwhkiHXuv2eg
jHwPbTD01RN32m0ehThJTOkZ3pzs66qm2XuxqOkhaUc4gb9baG0E1niDIbeh3L5Z
xehxJhYzU2G6A3/AnGhUNip2+xPSc4XjTCRlma/UBdmyckcLMDYX4OebOET3b3DC
V3MXvcJxAqWP85maNwstVu0hOVmfdA==
=hQIZ
-----END PGP SIGNATURE-----

--Sig_/mFdbfBKYirkcxtm6N5Vc7HN--
