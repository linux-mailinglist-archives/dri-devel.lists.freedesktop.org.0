Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE2930C13
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 01:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426B110E215;
	Sun, 14 Jul 2024 23:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J6qSNOv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F3A10E215
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 23:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1720998131;
 bh=BNPl9Tm4jDF6f9rKk18fzIBf3KQ7iCYeyQfTpgvsz8g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J6qSNOv8RAfXGCpBM1rtGbD27BNf/suhclwsAvUve/u8sD4ZTZ+6+dUpV5zgUgLL2
 AGaX5WW5YdcERK6Q2Ce6o0YE8ar6UZK+20HlU+HpA+MU7nIZ01O1WOvb2gpWc5iSxD
 sXTZkFOeuPhBSk8V72pI9tz8nvAw83famVB8hw8ejYiN+P6CrB5PTv2cNJvBm5VU/a
 bKz6sUdggzrIdesTCCRa/SKEq8G/Lc+BtscrZAzfGvjURYZFl2sZ0bEzcic73+xB0d
 dpUu2UqMiJHOb0VuVANjn1dz1Jba8u7xI0LkXD/KjGIzn/V5PDquNNyzr4hZFm/XZp
 o4fOiZvxPALdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgnv5d4pz4x12;
 Mon, 15 Jul 2024 09:02:11 +1000 (AEST)
Date: Mon, 15 Jul 2024 09:02:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Roman Li <roman.li@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240715090211.736a9b4d@canb.auug.org.au>
In-Reply-To: <20240501151929.219916ee@canb.auug.org.au>
References: <20240501151929.219916ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aGoR9.QStVhwAN_BATWChi1";
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

--Sig_/aGoR9.QStVhwAN_BATWChi1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 1 May 2024 15:19:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:581: warning: Function =
parameter or struct member 'idle_workqueue' not described in 'amdgpu_displa=
y_manager'
>=20
> Introduced by commit
>=20
>   afca033f10d3 ("drm/amd/display: Add periodic detection for IPS")

I am now seeing this warning after the merge of the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aGoR9.QStVhwAN_BATWChi1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUWPMACgkQAVBC80lX
0Gz1cggAiNx8YXEdah8JnorbyqQW1zOJ2GMhgJ9gsrIb7TQUrbQXSS6pZlr3wRLD
hyHpYM38ViLli2ACZVpzM6/DRZb1cQlR6oVX9XK2M8tYEvrPYLaBIp1Kptx1p1uj
KHpILe6D+hooy+DlAyiAYJvrjneFrFDw8scZ3SIU1fJSd93CFRiz/nD1TWj3zhpH
pYQQIAjhCOM7tDwxeHa2r9GMRScerAjo5kQwFHFdwUHHhiQ/4xAI/O7NcNFNguKn
UvYOmgGNo4lQKhDnH+fwGeFaEhLqhP+Qd8zdkQOmVA+pBU6wKrPDt/niSswUUj3R
MYxOhhInb62ut0Sc2PCHxm27lwsEeA==
=AeM/
-----END PGP SIGNATURE-----

--Sig_/aGoR9.QStVhwAN_BATWChi1--
