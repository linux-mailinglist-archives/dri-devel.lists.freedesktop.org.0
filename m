Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5D974C2E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D9210E867;
	Wed, 11 Sep 2024 08:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IQQD/vZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337AB10E828;
 Wed, 11 Sep 2024 08:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1726042063;
 bh=J9I9AywEtirK5ot8lZS/W21rZh4OTYU8/w4W+v+ZHNo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IQQD/vZGwJplY2+gBHMq1gfhZ3pY9+dWMsq/1l7hxyEwNCN02IlhvahPce3b3/+U4
 2m/lwHJLSZgLcOLJpsYBuYOeFZ+SNRQAN1hg1+uL8ZN/CS5zvr3DRWHREfhpOQdd7C
 xN4h2WNA+W8q9kAsiga/JdfB19DPFskud497oIzWPIbTxBYRRVpLxf4i+kg1Si6Nh5
 /jcysHmVyEkcPxyc1ik9GM0hJUUeX+4c4y+du9mx0tN77p4kmlVZKrnOrV4pBxZtM/
 Sdap3XiUHuz//TymKUOvlyILxtH6nK1R3Rp8p84VldiZ0xmq3KKCvV4+CTkt32cqxa
 pMRehrU77w07A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3Y8Z4czxz4x21;
 Wed, 11 Sep 2024 18:07:42 +1000 (AEST)
Date: Wed, 11 Sep 2024 18:07:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20240911180741.45311006@canb.auug.org.au>
In-Reply-To: <20240904163018.214efaa7@canb.auug.org.au>
References: <20240904163018.214efaa7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HcZ+o.Rshuv9TMmXsqwKYFu";
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

--Sig_/HcZ+o.Rshuv9TMmXsqwKYFu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 4 Sep 2024 16:30:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c
>=20
> Introduced by commit
>=20
>   9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")

That commit is now in Linus' tree, but I am still getting the warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/HcZ+o.Rshuv9TMmXsqwKYFu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhT80ACgkQAVBC80lX
0GwODAf/UAM20a1Ws0VJcWEjEeidMaYtGA+dNaXqpjv5I/ImROV0Zy+eFBZrrwYB
UX2uYTBs00+KXmhhbF8JRnvlX+4gcqzH4OVGmKDEsheq/XI5jxpQcjviNB8d2IVY
2twN3PpFIn7ZarAfOCdlcUI7whbTxyZ+AxyqJ76iFh3CKlwgSUuN/gZRlzzEhGXU
Wh7LaTMDpv0qM/TdPP8MlkeoPteaPKknD33HTqdHZNltowB2GLieRvmQnS9Adxlf
4havsHjP7/vHSVqHb3Eeux1h4Su9tj/Z2FD1To9B4bTeLd3r4ObxsveU6fc6cSEr
mkPTndtAOWHsAJmmC4sh3e+Hdn4uiA==
=7hK7
-----END PGP SIGNATURE-----

--Sig_/HcZ+o.Rshuv9TMmXsqwKYFu--
