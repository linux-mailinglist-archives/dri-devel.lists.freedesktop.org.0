Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438E8AC22E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 01:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92F910E9E7;
	Sun, 21 Apr 2024 23:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oHWaDGYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C4E10E9E7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1713743689;
 bh=nOY1bidZXLe1LL6DXEqZZevYwkgvHkMUXe1AqTNSE9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oHWaDGYAt+be/T/zHol66P4ETziWsGKBBLBAeFYeYedccxR/0/A+y/zVcmhzB6fEO
 amgKmr3n/Om23OZbNBurqRDtIEou8FLbRbl/QRIAij+8AkcH3Gw/ARb7mJa11h7xMc
 enPI+1fCrCB5vrcdwAG6e0pZJeaYE1q6HFk8fKqrKB0Vzo6xvx2BWQNKdNND07oQsm
 z7Hw3aUUgOOmleO+/KKBFFsYSUJ9rhH7d37QCggS3ZaKQzfcPoMMBcTUCew4r6pT7i
 KPgjUWEbVFXk0VHvLbUN8Xx3vEWta9T4aMzopzB47PfoNatE08FoMj87Yuwz9FP86p
 RQYbw2dwc6baA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VN4xP41KZz4wcq;
 Mon, 22 Apr 2024 09:54:49 +1000 (AEST)
Date: Mon, 22 Apr 2024 09:54:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240422095448.18c9a566@canb.auug.org.au>
In-Reply-To: <20240130135421.19907631@canb.auug.org.au>
References: <20240130135421.19907631@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bfv2gk8fEV.QlP1gUBjCM=x";
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

--Sig_/bfv2gk8fEV.QlP1gUBjCM=x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Jan 2024 13:54:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured com=
ments found
> drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured com=
ments found
>=20
> Introduced by commit
>=20
>   0fba33311e63 ("Documentation/gpu: Add entry for OPP in the kernel doc")

I am still seeing these warnings (as of last Friday) but the above
commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bfv2gk8fEV.QlP1gUBjCM=x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYlp0gACgkQAVBC80lX
0Gwdnwf7ByIdqK0W/BOCudq2toHzDhSZhqSIlVpTqPtu8TTSQKqWDTozvkx8BLPH
oDaMRRZbRJ7TMDztsYSp4jFetjQ4OgHgHwvw5C9Yh7zuuyK4OQKIoiyKaXUUFHr9
R660ArmLAOfCq2zvaarEJnkwUr2MH5ID94YdnnbpyjsMo18ULFfwQnItX3X5WlUs
1x99Fv+2JgZYumqdqoSpHqQyF2c7HkLAUN6pmqC5Irv9mu9BtJdXP11SsCawwjmL
hYWZB5eAQ5YY8CK/385hyuiLGo7B7qkUyNt3MmWG5n0RHqmcnjCeCKx4uFDDS642
OYPqU+fZ+Ramm6fheJnqo0wv9kfx7w==
=bgOJ
-----END PGP SIGNATURE-----

--Sig_/bfv2gk8fEV.QlP1gUBjCM=x--
