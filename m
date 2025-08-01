Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879FB17C27
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 06:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE96E10E3A0;
	Fri,  1 Aug 2025 04:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d8g3JG9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68710E2EE;
 Fri,  1 Aug 2025 04:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1754023205;
 bh=E1s+P0XagDZNpW3tmeEcdaQR8X7L6waJy5qRcoaQkzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d8g3JG9SKJ5d8rTJ3TcUFsb3J2CLyNadA1hahWlAnvlvf08ZUZJofH/5AtD27lfgv
 ryvXDe+Iq+fkLoZltpaFspCQ6e2IC3gEFju8D0/PmZhSHPCX1XfRaFe6FElW/2+KBl
 WWuJwoTgLaVgD18w7WI0MnRkbxij5fT6x5QbZECkwCWQ434qGkohdk+Bn5xtdKsMwd
 nQ33Db4ENQtpIzmjlBoxLug4I7vOZ/vFFAeIEHfqsFrx+fhck0I6Yvm9eujIN0sAjm
 MaDHmXlwkS8kcEXNT47xdOQyaV9DrNsChQXL8p4ClHRe8iLc8gIUj6axJS5a51kzpQ
 ILn4yRA1555zA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4btYCS6sVsz4x6n;
 Fri,  1 Aug 2025 14:40:04 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:43:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250801144354.0ac00f39@canb.auug.org.au>
In-Reply-To: <20250716203115.6e02e50c@canb.auug.org.au>
References: <20250716203115.6e02e50c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ArZk5=GT1Ros.GOqjtnvG0p";
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

--Sig_/ArZk5=GT1Ros.GOqjtnvG0p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2025 20:31:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct =
member 'connector' not described in 'drm_bridge_detect'
>=20
> Introduced by commit
>=20
>   5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hoo=
k")

I am still seeing that warning.  That commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ArZk5=GT1Ros.GOqjtnvG0p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMRgoACgkQAVBC80lX
0Gw2ogf9FaHkFEghSGGBEBG3JDl1dHYs+Cnc9wIuUOFdV/PQi1YCh4QA5vIOGqRN
w18kWcXwsIyDPIHldj7qV+RoIE4MQmACRYXxjBC9AKNjz25vP98WDAe0JFXPoHKY
E+OOr+4OsKukcOAeYk5e2PQXVrAuN7fF9kbLtJveunWV+daHk5Ht161OyrQFRvL+
ZtGO4NQd+ormTpUMbUY3/Nf6Du5kedtcdsL9zNmJbibVR9XzJhM/BIx7FbifCHRJ
dNfwp17lvvIl9YO7WszqiwrOOuoKR+3iNJMTHL1PN0MZwTUFK1it71hBEljhKO/l
2uZcgrA20P+QfSWP2NoOUMggCuOYOw==
=OflU
-----END PGP SIGNATURE-----

--Sig_/ArZk5=GT1Ros.GOqjtnvG0p--
