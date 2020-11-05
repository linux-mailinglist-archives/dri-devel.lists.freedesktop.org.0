Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 605252A77AC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 08:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E0D6E160;
	Thu,  5 Nov 2020 07:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5EC6E160
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 07:02:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRZGg4ZTPz9sRR;
 Thu,  5 Nov 2020 18:02:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1604559772;
 bh=nEdqWIEn4Nyxp+L6qrWiIf+S+H0p5Py4owMWzit1mHE=;
 h=Date:From:To:Cc:Subject:From;
 b=MboyPFwMIzg5Bw4PqMU+Gtx1nXlZtSrzg1Eb4f/+SXw93wKbI59Vl8Dc+YwMZGS48
 f2n7EOK7CdM7WCTn1Vzk9SKlebLAOBspDIovgT0uvirZ+0FQEqj9I3RnY+6J021Rmo
 RD6UoE/N1p+7klRJi5L3rUHcQlSn24soOtqur0fMoLJALpBDxNVsOrY4NNnCugTc2g
 IRIXzrgEUcYOIDR+Qf8onSptTo84Nhs/d9fl8WNW3d880qOdLxyBdMIaAKJtipTirg
 J0D2/i8Dd8IzMx1FohqHb7VQSFN0wdIBpuJx8qZZE2jh57x5qe97HBQ7ohsKBASg95
 pCKyysGA292Qw==
Date: Thu, 5 Nov 2020 18:02:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20201105180250.549f2eda@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1175135053=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1175135053==
Content-Type: multipart/signed; boundary="Sig_/0ZM48yCRrDs4kWhOFVSialW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0ZM48yCRrDs4kWhOFVSialW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/gpu/drm-kms:466: drivers/gpu/drm/drm_crtc.c:236: WARNING: Une=
xpected indentation.
Documentation/gpu/drm-kms:466: drivers/gpu/drm/drm_crtc.c:237: WARNING: Blo=
ck quote ends without a blank line; unexpected unindent.
Documentation/gpu/drm-kms:472: drivers/gpu/drm/drm_blend.c:203: WARNING: Un=
expected indentation.
Documentation/gpu/drm-kms:472: drivers/gpu/drm/drm_blend.c:204: WARNING: Bl=
ock quote ends without a blank line; unexpected unindent.

Introduced by commit

  5c759eda9b04 ("drm: Introduce plane and CRTC scaling filter properties")

--=20
Cheers,
Stephen Rothwell

--Sig_/0ZM48yCRrDs4kWhOFVSialW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jo5oACgkQAVBC80lX
0GwU6AgAmQIQwCcPiYZRd4AeSw1oKw3HXZgyhllrBk4a+++twJ1mxSYEGSjs/jb7
r/pa1kAp5W/B9rDklMIIhX853RkjFf3ojFRsJLs9M4i5M52qe/13VdGa3rCatdaY
Qp3SHCd3NuuUjGfx8anll7mab65vLZza0UpN9wZlMUjkxXKacI+2JT3XxTd82N0f
zdtXBFZ4+WyiQjlmOtWjNXUm7KIjMUB47QfAPfoFvmYK2V9OFV2essPxVrkQcUJn
FzkiqWcxoYA3kY5tWi8FpN5iRFMqELhdYJyL2Jjtj7WQ6JchOOoC6S2E5l/7T77n
3PUxADoywoRQqF0tjwPtJQTPdO9jhg==
=0inX
-----END PGP SIGNATURE-----

--Sig_/0ZM48yCRrDs4kWhOFVSialW--

--===============1175135053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1175135053==--
