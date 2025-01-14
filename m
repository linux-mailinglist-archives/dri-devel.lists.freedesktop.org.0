Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C9A1007C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 06:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AE410E85F;
	Tue, 14 Jan 2025 05:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OkrDxKe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 12114 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jan 2025 05:43:29 UTC
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AE210E85E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 05:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736833397;
 bh=DwziEcEwv1vToKct69Vw9CAHmaInbStwYSnb6ldXUDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OkrDxKe9D0sxOcDiZ225/gt59VwDT3P4q/noGInZAueES9bPXAbL0Yjx2+8G2eUWT
 V49mTPxUyQyvGz1eyCOhLMQruS1LtA6LBawUd1KiFOJUexhKijXF6QBO2Y0YgZbanw
 NN+uHkYJ6SMnRhoElRCHKvTUZXnECPC1fy6FeQfBn52X6UE6bCH4NV0yD3+KkJuypu
 +Zb1rYsCTRHxg7wTxmGghOg3a2fvrAS/8j9S3VYP7hiFBImnFStkDZhehSY/BmuNKI
 AvpOzM53QfPBOMkLWCy/R/ulRVBwCIb0fM4jMSCbXKF+zSFheD7yQ4DKH7Q+HcD8O+
 KZjPKFEz6gWmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXJ2F3yJ3z4wc4;
 Tue, 14 Jan 2025 16:43:17 +1100 (AEDT)
Date: Tue, 14 Jan 2025 16:43:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250114164324.3a42700e@canb.auug.org.au>
In-Reply-To: <20250106174645.463927e0@canb.auug.org.au>
References: <20250106174645.463927e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O.uwERtL87GhFS5mROHCxje";
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

--Sig_/O.uwERtL87GhFS5mROHCxje
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 17:46:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/drm/drm_bridge.h:738: warning: Function parameter or struct membe=
r 'hdmi_audio_prepare' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:738: warning: Excess struct member 'prepare' des=
cription in 'drm_bridge_funcs'
>=20
> Introduced by commit
>=20
>   0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framew=
ork")

I am still seeing those warnings.  This commit is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/O.uwERtL87GhFS5mROHCxje
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF+XwACgkQAVBC80lX
0Gzp4gf5AXex+pDdNVcPjbuuwj/G+S6EuuUJRb9J9EWg6submCBzhlh4xFXf01uS
d9mZey+rNrKzc9TdPDpIzUQSu5SDh6bnB8G69Y0JJ0nwhabLJ9PUtdS388evTXYg
9v4f4xITaavelvthxhQ4s42Nx7+UdNeSCDzQ7YULzUuTSIssQXrJFElEAW37pO71
TnhY0j8Iiq0m+NrPCejXbPbHNrKg78JWJH3hrHiE7/CLOY3+rWP+HV4R5nLWjiDl
p9np+nID9S2Uv2n3995hwWGlC19sQWa19iKgGiMdcF6/ib6MpBbJYUje+j/AXYNd
LExTpmCZn/zmSobsL5am5MoKVFxYrw==
=g+20
-----END PGP SIGNATURE-----

--Sig_/O.uwERtL87GhFS5mROHCxje--
