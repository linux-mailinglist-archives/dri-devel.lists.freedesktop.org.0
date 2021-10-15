Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68742EE48
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 12:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C616E252;
	Fri, 15 Oct 2021 10:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2049 seconds by postgrey-1.36 at gabe;
 Fri, 15 Oct 2021 10:01:06 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABC36E252;
 Fri, 15 Oct 2021 10:01:06 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW1xY1k4vz4xbZ;
 Fri, 15 Oct 2021 21:01:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1634292065;
 bh=ePlUuskm7Uh1T92kQwaDXV03zpWjKXjp9IdGIQb+1sE=;
 h=Date:From:To:Cc:Subject:From;
 b=WvMApseMyxCOwHT5CGq5gW9iOzN9H64/pNRS96pdFeUZ1rjxlOz/vaLyooA1vhyEF
 hSjaUTXU3pMZHe7N+covA+uk/Lkcq+L1iTuaBHvlsUzkfRBgfhAFpEsnKxNcXE0K4Q
 +wozaULg+ysGVhu74dojJlLhNDHxJ2h0kPAGR2Xl+eT1F2AUSBoXhBdKKo3cjbwbic
 zjPS+yU26DLGw/0hNFWn9Kb15wrh9XJp96rr588tRnu1AtMt2OT0ur5DKqzaTgrkaN
 84Ng44+ntzNaHdESRTNSxhU86nQwZf0K+tuLxYl+nuoFHYhixH7FmzsU/TMmP5AOkn
 bZyeX02a4jyYQ==
Date: Fri, 15 Oct 2021 21:01:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211015210104.0f034544@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_0tl3R1kvydS7IvFTEMBN1_";
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

--Sig_/_0tl3R1kvydS7IvFTEMBN1_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_modeset_lock.h:74: warning: Function parameter or member 's=
tack_depot' not described in 'drm_modeset_acquire_ctx'

Introduced by commit

  cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks wit=
hout backoff")

--=20
Cheers,
Stephen Rothwell

--Sig_/_0tl3R1kvydS7IvFTEMBN1_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpUWAACgkQAVBC80lX
0GzqrQf+N1xOEMVqO2cgDgu2fjyQXEpwfvRikemEywpVlBT1dngt2Dns4dOQMk8o
dO/kg/fG5wREvKoKir5ulnqWHXsAIlVaG0bZSgVJIgYJIZJP/jG6AOuBtKk0qnfb
uaoh8E/leGM3+Ge4mVfFulKSDr4BzrCb/Ff8jvunONx1yfhJrl07jVT+9axRTBNI
Mx7dA7CAH5douU5gramPQpls9/3v6JDvgaTnACKuNtnnZ1nuZnyL8XKhdpqWRmiG
I2KbZNDBSenQO7dLMECej55VfBRqE/QVdtgnV2eygL+WYG+zhVA77zhA8vDKW55v
yh5m2XMmNWtDOLuLLYBzFRceQ3oSrg==
=MSo2
-----END PGP SIGNATURE-----

--Sig_/_0tl3R1kvydS7IvFTEMBN1_--
