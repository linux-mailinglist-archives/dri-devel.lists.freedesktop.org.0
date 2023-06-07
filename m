Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B072522A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 04:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34B910E411;
	Wed,  7 Jun 2023 02:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2995F10E411
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 02:46:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbWtY6qPhz4x2c;
 Wed,  7 Jun 2023 12:45:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1686105958;
 bh=GWYw5pjorMTHElsEXkmFoNYtJ2ldLswJsh2/Zn2bMd4=;
 h=Date:From:To:Cc:Subject:From;
 b=MwuKeOZF4g/ZnOoE5aC5HVdLTFs4H6KR7lMCYeQEJra5Zy0YHk7GPVtcxj0+96qxR
 IZgOA8NXAu7L6alMS3VUMOoX3vqYoy1SX3DZVErMbA/1eAzWkIuZKbeHufO1K53pGZ
 8HHkhVbTyWMM/jIT+FANPYf4lsjThSoRmuLT9BW1xVSupMiirFScJDxziuUUNdRImZ
 lAJqeVvQPwRJEOJyhSgjkvPsrWbISGXGnR/amWTuVGosnLVTyv9p0iAje0qfU4GRsr
 trp0ZeiyFHce6UfNPpR2NTDBF311A9VYuPFebrFfj4i7PTyhSO5jMVdPf+oyxcpILW
 u00NGx8oU3qLA==
Date: Wed, 7 Jun 2023 12:45:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20230607124556.2ce61b71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ob0149gf4=BUqE8rR._kXBz";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alvin Lee <alvin.lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ob0149gf4=BUqE8rR._kXBz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/dc.h:900: warning: Function parameter or mem=
ber 'enable_legacy_fast_update' not described in 'dc_debug_options'

Introduced by commit

  4164998e0a9c ("drm/amd/display: Refactor fast update to use new HWSS buil=
d sequence")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ob0149gf4=BUqE8rR._kXBz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmR/72UACgkQAVBC80lX
0Gxuxwf3X30Y/iw0mMEMDmiGoLEDmY9T5+uVl78mcLHbm91FSTyNLwiMl1xskOK6
uDH6/iJ2I1cqHodwQESTxKTYui4eGbzbEeqRH8Z0vD78fdObBuoj+RO4Wicd2F37
J3Xuukyw9+2xlMePYpLgQ9J/WwTG0GMqwRT1IHYgvrhXZQzx61TdsOsMskcAneGN
AwdD512hGuIv2WzPv5kIF4MPf11T4oH1z6hkj78rUKs89aGJeSqTfezlx8agV/ur
wMb0kUa/5yvfn/3S0KczDxvpPX9dfbCk1oWiu3qq9cykINbHrS2+sqtGQaRfnFJp
1pIfym4KWv8xloFOm3GWmsX3KFF1
=+C6U
-----END PGP SIGNATURE-----

--Sig_/Ob0149gf4=BUqE8rR._kXBz--
