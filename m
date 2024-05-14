Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2C8C4CAF
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 09:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F72D10E2F9;
	Tue, 14 May 2024 07:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uREJm44h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F174710E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1715670858;
 bh=OW8ww9loR9RfCx+NN+4ltvUd0I6KWOej7/iAa3BTV+A=;
 h=Date:From:To:Cc:Subject:From;
 b=uREJm44hE0Vf2rREWdcJPdjx77hb3OBPS3qSgL3oY9Qcs5MMFaMythSHu0HzyEO3p
 dew2PlraD7Ruly8KacjDb3GCXIpOy5BpO8m07LWhvReKHfWO/dQ5vtIoBFDtxO3o9o
 ssKEh3M25v/Ti2p2mIEPEGOV4u9iNaFSrKZPXQwdZaLtadlaZOemU+xJxijehRsu0+
 NborkPiED1lIhs6xwy3Hp1idNP4kl1k+vlwd/bLPKUD9mSGzf8nbvHZ4DvVWVjLnAE
 ODqA73jZ65JTN0q7dtj2UwCeOVP8QsraYbsERHBGsAYmQ1h1MPSGY3voz6isdSTERX
 TZ55iUV/GQl6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdnfL3PvTz4wby;
 Tue, 14 May 2024 17:14:18 +1000 (AEST)
Date: Tue, 14 May 2024 17:14:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240514171417.492a1301@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R";
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

--Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/include/amd_shared.h:110: warning: Enum value 'AMD_IP_B=
LOCK_TYPE_ISP' not described in enum 'amd_ip_block_type'

Introduced by commit

  a83048bfa402 ("drm/amd/amdgpu: Add ISP support to amdgpu_discovery")

--=20
Cheers,
Stephen Rothwell

--Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZDD0kACgkQAVBC80lX
0GwEPQgAoUs/hR6H8Rmz2/jozYwpfnYX0DonDzksBxV/uDaaD25zCnKfH3Zd4QDv
1blzoQ9GegOtzR77akoutYPLE+f0gKewk02X8n7yPG01CXu+WAtMHy+OFz4HJIPs
frJrS7lgoR6YmPRq4j5PQjc1tM/amD9kU0XZaFlp3wwJ6KN9O8VqejOBijYTHWqp
GIrCLvcpXG2y5KQpK5S/q/lEZARIn6QR/odG0xIfBPkBT3tej2oOK6dMq6EKxVHU
RNAwvK07HwnZDpSZX8owlnE+A07JH2JPLPz8VcoxONF+mh3qB8vNLA9r+hgFDbD/
UCzHUNpS5vLjlYp1Yp7xf78iYqrKfg==
=siMs
-----END PGP SIGNATURE-----

--Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R--
