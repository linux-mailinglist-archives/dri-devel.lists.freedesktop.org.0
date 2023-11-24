Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E67F6A9D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 03:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3A10E796;
	Fri, 24 Nov 2023 02:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97B910E796
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 02:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1700792587;
 bh=BdxTtBTNwuZ3yFojTPPgGifFlNF6nKUbtqaHvUDgjYU=;
 h=Date:From:To:Cc:Subject:From;
 b=KRbPi7TYYoa06NOJRQXSiVSixgI/CJ98J/E+WVFsCiwGKZm54sKh6CpXLAkoc91wK
 0AJgX+aARIHDSqhiA0ozrNfUtkDGkWlf4MnW+68HQ/hfE1QBIiGgLN6r/6UAz27HLh
 B0w/eOxlTVDDV2Jlz928NvczTqKAmM72l7HWSoUaS7FYARPOCd/HH28O4/YvC2qZ83
 xoohmkCy9C3Lq93ai6NFZxa7e8Txmj9BocpTl4duluZ2Tgc/94SM+VDJcf+IVm7vbP
 s+m2G2wX59CBnfNQm5EcBnzf+ajEtE6kn5yVx+LXhXHxkUKHNpPlxFhNM7ZSgSVwIi
 tQjnE3sch2apQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbzKl3kZjz4wx7;
 Fri, 24 Nov 2023 13:23:07 +1100 (AEDT)
Date: Fri, 24 Nov 2023 13:23:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20231124132306.71dc0b00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kwqQ2nWEleYn6NbZ7dx/r13";
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/kwqQ2nWEleYn6NbZ7dx/r13
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/imagination/pvr_drv.c:1: warning: 'PowerVR Graphics Driver'=
 not found

Introduced by commit

  815d8b0425ad ("drm/imagination: Add driver documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/kwqQ2nWEleYn6NbZ7dx/r13
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVgCQoACgkQAVBC80lX
0GwEZggAgNCZ6cOdLAXtf4EfHDn14njznByiG7UJTeYEfZpHHDZbw4sBVdOghNjC
wp5Ikc4JFUH+idv0L/5CCk3ZXGSPL/trXNuesgecQYdtbM5Z/5jXjlBKdp7GZ90F
TZtdphvyeP27vf4EW1Zr93+hLoYpDo612KH9vBDsGp1Orh5qntDxXSD5T/XxQve1
c/71mDQkz9k++1gbcoy2bxC3mOjswyxWxtrb4QaYUIP55AF3p0hWiHFI8JCdD/Dh
Uf/Po3HzhsrzAa5qDstJOaS+SpeRlYWOolAnkVO2/o559cw8QE3Xlznxi++KFKl2
+W1DzZXyptwZ40q3Q4jWepWQvU/3ug==
=WEuO
-----END PGP SIGNATURE-----

--Sig_/kwqQ2nWEleYn6NbZ7dx/r13--
