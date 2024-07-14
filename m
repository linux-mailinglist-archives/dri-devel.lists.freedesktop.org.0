Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E54930C0C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 00:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7182610E213;
	Sun, 14 Jul 2024 22:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VvY/ixG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77F10E213
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 22:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1720997959;
 bh=cXP3bCEOsBRgK4CgO+y3pcrCAh0xhl9P25icE6xJpjg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VvY/ixG+x0fi0fYGrl2CX246zSxkLiTOUvmZB7HKPMfZowqqTHWXIy3lmPuQJTd4j
 DdHh4pPI2CnaqmDEQfy04JkyB1ATLw//l+Q9WnzeM577CilGdkxQc6K3GfWeM/Prxg
 qqYc0ahdcxZChE+J4NV1OC6xXox56Fy6fK/+do4drTInFwQ4Rx+FvAQMNESbAQQuFB
 yXekQKkG3XgYlbKW0Ikd5em6yOWWr/lYYWPxi17nuWZ47BAqUbVQqT/LHwGMDLLd9S
 7Zuf8mrkTp7zrPfeQ7DT8jaTQkyhIqXNAB/Dyo89hajHdA2kfR5Icf7RJg5ibUhzvC
 Cx2Um70OTKaSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgkb2vZ4z4wbh;
 Mon, 15 Jul 2024 08:59:19 +1000 (AEST)
Date: Mon, 15 Jul 2024 08:59:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240715085918.68f5ecc9@canb.auug.org.au>
In-Reply-To: <20240422095642.41892152@canb.auug.org.au>
References: <20240130135626.312c7ebd@canb.auug.org.au>
 <20240422095642.41892152@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qjyhDBeNGGB9.2nzMjMJSut";
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

--Sig_/qjyhDBeNGGB9.2nzMjMJSut
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 22 Apr 2024 09:56:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 30 Jan 2024 13:56:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > After merging the amdgpu tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no=
 structured comments found
> > drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no=
 structured comments found
> >=20
> > Introduced by commit
> >=20
> >   d79833f34bdc ("Documentation/gpu: Add entry for the DIO component") =
=20
>=20
> I am still seeing these warnings (as of last Friday) but the above
> commit is now in Linus' tree.

I am still seeing these warnings (as of last Friday).
--=20
Cheers,
Stephen Rothwell

--Sig_/qjyhDBeNGGB9.2nzMjMJSut
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUWEYACgkQAVBC80lX
0Gw3XQf8DDHi32HSHzjOPVIzzobML4OYKEKVB04H/HXFLVYhdXvDjtE3uvmWZslI
PlSr57zMPjpTUJOz3/1ZxDFFbHGUppgAfh7pXw+tkz2WSVuhyXmuGaf2JPMU5xgd
SRbo/Y3uuvvG7VuvbH53nWutexKQl2aop2G3MtUvpzMv8nreUNXDPKwr6FxMf8pm
c2syTu92Uh9klYAJ0iUECHiBlEIugwbSXkFHdVTKT98HluRhGs1XxHfky4DV30cn
m2q3DVO/lyj64XLcEDlbzBD9PdvG5u292Uy6SH2asfE2XHZOVmssm7tCBVc82gh4
iFuQVh41mP05/ztHkqVFrFpKwyzB/g==
=2WRY
-----END PGP SIGNATURE-----

--Sig_/qjyhDBeNGGB9.2nzMjMJSut--
