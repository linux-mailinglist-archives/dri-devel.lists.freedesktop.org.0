Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3867AE4DB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 07:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4407510E345;
	Tue, 26 Sep 2023 05:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 98751 seconds by postgrey-1.36 at gabe;
 Tue, 26 Sep 2023 05:07:32 UTC
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4BE10E0B0;
 Tue, 26 Sep 2023 05:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1695704847;
 bh=rPl29/hKkAYhwb6F2YYjYbVG6pDFFsoBZrCdnWQ03b0=;
 h=Date:From:To:Cc:Subject:From;
 b=iGElojQm92YMdrvQ/mErsmobQ03a5nX7xslMdO7sUVVIoMzSs45BfPsgJbNEzO4VV
 Vwm4WNtSk9AdkL5iWsLRFKZwrSEBsmHM4ZU4JS8XflN/1MdQ49igK3yRfm1j+2owQ4
 7tClCSW+czeWtLtKKbPJvTemcyN65QacBrkOkoZysHXTCLAnIsVYdilOgkxNjqh02X
 CS+1GGzETsXwcdv9aCHeDJ73hsXsLPxaTSn0GPy4vHfz1F5iOniXToN4XIBVdsVBmm
 YYtI2mqEnB01MiYR9c+RyvGTj+8FK1tO2FW2nPjz0Hv4SAgeviwIG7RLMnPM40adXD
 4VF8MJxWUQUVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RvnmZ3lLnz4xF2;
 Tue, 26 Sep 2023 15:07:26 +1000 (AEST)
Date: Tue, 26 Sep 2023 15:07:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20230926150725.4cca5fc5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UA1dOjMCDC.F0M8CKXjUB0=";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/UA1dOjMCDC.F0M8CKXjUB0=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Error: Cannot open file /home/sfr/next/next/drivers/gpu/drm/drm_gpuva_mgr.c
Error: Cannot open file /home/sfr/next/next/include/drm/drm_gpuva_mgr.h

Introduced by commit

  f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_g=
puvm")

--=20
Cheers,
Stephen Rothwell

--Sig_/UA1dOjMCDC.F0M8CKXjUB0=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUSZw0ACgkQAVBC80lX
0GxXwgf+LffYpQq1ue5A6iy9m1V/AWULRZ83AdeMHSyEt9uZXB6wYu3aAHlyeC/O
luJoEIUpXPfE3sDxK1IkRxe4ZUwnzU/1DvZRLZgSLHfcY2iBXH1/vWswXd5vo845
kZKMr2fyJkY0s2gN1lw8gYDg0pKEqF3KzdXPpxDe6C1o/G3cqmlldQD2DsI5My+P
Obkf8V+7MC65vwIfMkyTMjAMlulI7k3p/ECk5lUx5lx7oDMxHbDsxyruNeux1iZ8
Fj4PI9StAJJE01A6xKrAR7UMminnf2vlKPeI71Bwz3J4UtPZ0jL3OkWb89wcS2HO
oIcX0V4y1U9dYBU0iupc7Sq8sfc6mg==
=BrNT
-----END PGP SIGNATURE-----

--Sig_/UA1dOjMCDC.F0M8CKXjUB0=--
