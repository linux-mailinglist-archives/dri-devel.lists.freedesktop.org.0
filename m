Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C842A23A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 12:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6916E8EB;
	Tue, 12 Oct 2021 10:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304CD6E8EE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 10:36:10 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HTBsN1Lrbz4xbG;
 Tue, 12 Oct 2021 21:36:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1634034968;
 bh=vRx++bFEsl2BHQylnM8wJf19bltnXOc8oVnJQjBbxlg=;
 h=Date:From:To:Cc:Subject:From;
 b=Efnx+GnCL5bVan4SV6G0SiX2Fo7Z/go9a3VnOKNOhHowLyaoE5GZy+1HKiLctc0sD
 eK5UopbqodTXKP9ai+uXjQ+l4HoIcj3nKHVHP7hNpPQr+scIBGd7tIE0Dl2HVysE46
 mwe01CAPgptyLjbDIxYm/p2qwDeydLrup47SYhk+ElS7vs67F7y6ywe8FFIJ1l3bVi
 vfsOEuwwlUtegTT32M+VfCrPp6AkBoaDl2g9LBSpcniLs0ly0tNAuaLfG8NLr9S5TT
 CtOda2HDYMHJaohLSdMzmXKLquO7GyKSGWM+JCgdAjNaF9PqZJxzxmilOoQ2p5kJea
 Hckl1p35NU5jg==
Date: Tue, 12 Oct 2021 21:36:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Rob Clark <robdclark@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Message-ID: <20211012213606.54facf76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1D0Ff+Y3RpH3B89yFf9vBpZ";
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

--Sig_/1D0Ff+Y3RpH3B89yFf9vBpZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  654e9c18dfab ("drm/msm: Fix crash on dev file close")

Fixes tag

  Fixes: 86c2a0f000c1 drm/msm: ("Small submitqueue creation cleanup")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/1D0Ff+Y3RpH3B89yFf9vBpZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFlZRYACgkQAVBC80lX
0GzUYQf+Pz9ExFYDVBQLwV3s3M0NIvT88yFegdS2IHylosvgMkJXyXMMbEIaM+Ea
sfZkRX1DrMeqjVD/CWL9asDyHKRn1hUtYy/dBOZb42YCBUb/bcflBS0b4eOmIdnM
XeqlsthOoAMVuIUmLJwPCt1kKn1G+CICHK6a0+E2ZvU/1sddNV0FnhrWbmT4ea11
zW/wKAt2WaZiJ+DATTEOB0IJyIN93Ix4ZbkySFfBTPE83fcmkrqWBhYr1YGNDu9W
Jc7W/ULVRAZfzkr8igVcCXJBZa6xMyQSWch5wIaeAyNjQ1S+aW4rWRLkKf2+bprU
KZWL/tkTz8hsU9qysHjG8g4zuJauKQ==
=hdGd
-----END PGP SIGNATURE-----

--Sig_/1D0Ff+Y3RpH3B89yFf9vBpZ--
