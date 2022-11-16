Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7E62B023
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 01:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7031510E125;
	Wed, 16 Nov 2022 00:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE7610E125;
 Wed, 16 Nov 2022 00:39:01 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NBkgk6ZZfz4xZ3;
 Wed, 16 Nov 2022 11:38:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668559139;
 bh=GvFgg8ljwaV0FWpRTrrGDvj7oXIjFGwZCxERL5k2fUc=;
 h=Date:From:To:Cc:Subject:From;
 b=AsWTrD1CpLc2DZxuBGrqyffMRaC7pB+ipu8VrGpqzTbbv9okrLN2g/RYHV2aMHbZN
 W1tM0BvdNP28GnNrFnWPuojJhd2mnDQMqN+n+nBnvVf83vdP7YejQIsyi4FXsPlz3m
 gTo+7mGf+fTS6rVA46vFEvINqcKw8kjmb373p2p968yig/iPBXc72KF3H31d6954by
 Rj2aZfMTiA1tYWGUCsPBMLOEWlzrMGOMEE3rldaVP9q/i4tgIxGhisMIdyp7+uFoXq
 O5wDViSwhl6ye+eJjHFr63fMNnMAOq3uJeeqcfQ6uF5wNrrp+lJUXSSFLGyiJTkyZF
 VE+49B/w/tSxg==
Date: Wed, 16 Nov 2022 11:38:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20221116113857.6b7f3a9b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J4TZlPfBEwJPSoqMkkkvSlN";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/J4TZlPfBEwJPSoqMkkkvSlN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/tests/drm_kunit=
_helpers.o

Caused by commit

  44a3928324e9 ("drm/tests: Add Kunit Helpers")

I have used the drm-misc tree from next-20221115 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/J4TZlPfBEwJPSoqMkkkvSlN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN0MSEACgkQAVBC80lX
0GxVKgf/cpJkTmRgMSuVOZvlWwzFOokwcDyFiN9l0Kl1ne5OiGjUsqwEfwU56fma
n7oNp+lZzc69c3IwlsPj8/ZRuyX+Up25ro05UtmGslqOe/p+wvLDO3PZLP1P4oPq
O/Mh+KTZnDxjGE2CTocYyhr01HtsKHSIt24p6P4JZUgV3Kkm62OQLpO/ihhX/ixp
REhE1KsmvdBs2OwilbbIwyUE7Txv+u42QAng6OKptmHns4sxX4RGziOkOEYOZUe/
AzJObp3IRhxRqtXl9rX5vF0lDkw731OfhAWIBg+W0nz+57mHZhT735Ctfm3V8Fwc
FLNglU2dtOjl3pgRIR78grL505LLng==
=AsUF
-----END PGP SIGNATURE-----

--Sig_/J4TZlPfBEwJPSoqMkkkvSlN--
