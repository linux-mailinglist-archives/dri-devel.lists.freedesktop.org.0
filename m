Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77628419B6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 03:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537010F14D;
	Tue, 30 Jan 2024 02:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FF3112C91
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1706583387;
 bh=0+EOYfajcZ/TV+MFrlf2z5WbLeXPsYHm5PqylBzh6Vk=;
 h=Date:From:To:Cc:Subject:From;
 b=jg+p2ZatK/eC2s7rUc+v7K0ejBoocfJRSQOFYbeyha3DL8ocF7twEWJ52UbG7EO8P
 jjd9jvPywQUUENjc8nB+tojgdwskRWwX+55cl+omn2/gle1idU2EQABfL5KVkid3b+
 HlcQLFxektR1FXnzqvZVV8BSjvcjXxeLDFcPxqTYI8bHIWKH1u2Ss5BHSYuSl7FrNd
 GsR0/efc1DQUugBiKf8YlV96GG7kMatkjdct+8+X7efScmPb2+FakvGHwBGc9YJKe+
 ImASSNncaicoRGM6fvkaWRG/PhKuutnqx27O9p0zrLGFTnIqLT+I/pTecNKuR3oKKp
 o+i7GftnB+5bQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TP8vH4Hmxz4wd4;
 Tue, 30 Jan 2024 13:56:27 +1100 (AEDT)
Date: Tue, 30 Jan 2024 13:56:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240130135626.312c7ebd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yC9TqX/56zDEg2S45L_X2UM";
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yC9TqX/56zDEg2S45L_X2UM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no str=
uctured comments found
drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no str=
uctured comments found

Introduced by commit

  d79833f34bdc ("Documentation/gpu: Add entry for the DIO component")

--=20
Cheers,
Stephen Rothwell

--Sig_/yC9TqX/56zDEg2S45L_X2UM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmW4ZVoACgkQAVBC80lX
0Gw3zwf/anEpXHd5gKFWQB4oHjXW0ubKX3GOREnVx2bDMhw31uwilKykLMHrZmGf
dkgUSj1PIevfecSsiuZ8fatDizTPFMXM27cSlQDGyKqHRB7eUuikYQlS1MqqR/Zl
VnK2+HDzqqgbh5rZi5PMVeLHNY7ayr/mNGX2Gstr0YU40XiojL4ZWxZrXNbVWgB8
xa2n0cqUdc4jzyiB5dD6z2W+bRsaw0GhlPjZo860oQl7LMnsDEaBcm/6K17oy/h3
NcLjoZzXr5Pn6QjTo17srl7gpqtl2ldCEb67rUcxYQzfs1XUeRYbdMcmZLjcFNIM
CZFuwwvkcV14erWSrbEI0GIIoYRbjA==
=nkZd
-----END PGP SIGNATURE-----

--Sig_/yC9TqX/56zDEg2S45L_X2UM--
