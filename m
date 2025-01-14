Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3FA10077
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 06:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8B710E85A;
	Tue, 14 Jan 2025 05:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XPjpfOmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E304E10E34A;
 Tue, 14 Jan 2025 05:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736833303;
 bh=rqrQqAearmDXdmr9CR2Zfe3aiqb88JJ+sD4l7fyoB/s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XPjpfOmRfKLrNl918Pt85rUgpbK3qBu9+/4wzvACTAHmFtv/5/Yt/rK72tTnNAf5b
 TKPdTgkvaSbLdlTHey2M95fpNW9BIJ33vXa3UAbqm4yaI6EDj2GSkEFAd4KDFszsx2
 wKjsUi6wenAYKMKuUpV2BkOikJ/TLRTUzAvgabjltMalozSAhp4IiBW7lYCWcJ0MU8
 q+dYH4FUd/iC0j7P2AWJVTeETk6fTGX6xcqpw1HtKs0ApNB++fXoeHl1HZCGGuZjbM
 PFRZDsPJKZQSadRsz5l4tikR0EsVKFH2IowfFQ/9aRuD5oF9Ej8EK2NVFL+rgg28dd
 b1osxkw6knBiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXJ0Q4LSKz4wbx;
 Tue, 14 Jan 2025 16:41:42 +1100 (AEDT)
Date: Tue, 14 Jan 2025 16:41:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250114164149.6459996d@canb.auug.org.au>
In-Reply-To: <20241220154208.720d990b@canb.auug.org.au>
References: <20241220154208.720d990b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MxWugPJQd_bVB1qes1.na3R";
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

--Sig_/MxWugPJQd_bVB1qes1.na3R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 20 Dec 2024 15:42:08 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> drivers/gpu/drm/xlnx/zynqmp_dpsub.h:86: warning: Function parameter or st=
ruct member 'audio' not described in 'zynqmp_dpsub'
> drivers/gpu/drm/xlnx/zynqmp_dpsub.c:1: warning: no structured comments fo=
und
>=20
> Introduced by commit
>=20
>   3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")

I am still seeing these warnings.  That commit is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/MxWugPJQd_bVB1qes1.na3R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF+R0ACgkQAVBC80lX
0GxunQf/fYYDNNJXcRwZ/Ctr/FPhs/0W+1ciAoDc8CWVQ31M7wLDk9jb0gLwskdf
bmvq5wV2PQhuN1OyCP740S/NwRPCQCKmbvpLtJGFbtMz/glJ4Z/ZfOo5tkkmo+lR
UjlpcaF/TNloQFLZIz1DxGtlMFvGdoPXNHhlSW9FdBjRC8UBUmeyLDwB5oqmJ6Hl
szWrTsbiqR4NFnYxNR+868MuHC3LNmtnMDd8JfJ3qjr+5ILPL9oLd/0QR0373LK9
KeYNAdWiHJ6KA/esYzDDIDTAfwBBQPXwow+/rDHWtQaVlLx+jkv7vnkZ5mAVUhHu
CABnrl6lohbu8pgMFq+g1GZfesqydw==
=lGVU
-----END PGP SIGNATURE-----

--Sig_/MxWugPJQd_bVB1qes1.na3R--
