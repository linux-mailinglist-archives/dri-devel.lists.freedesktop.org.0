Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78C22ED8E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 15:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F5689AFF;
	Mon, 27 Jul 2020 13:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8DB89B65
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 13:38:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFgqv3gfBz9sR4;
 Mon, 27 Jul 2020 23:38:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1595857115;
 bh=lrjDWpJO5W1X98Ew79jqZzE+XYvUfd6gy7qsjnl8u74=;
 h=Date:From:To:Cc:Subject:From;
 b=cmbsuozRy6HtgiJ/fAbJpPKx/9jKpgYUOkuFbVe7xLGyVaQpDNVGpvdNvIP89tEQm
 NuhKPUmHvAN+ZpkdrXahENkaUwlepvlmJvy6r5xvOljt2mTP1+ti9ijDedIAI9viF/
 vrNT5G9usTBAPbCd2mit6ZFgt2GMU7tGCJtKrc5IgiCwL58j0qBIqTOO4jGoIwxAqz
 5WzvNKFel8dFVukmbphISqipOX1OjExEj6CVFONQcWs+Nt8YDhwXHgncA/08iSOE4a
 dEXht1xN9XqYpg//KnhMklhaZBh/tNXs/m0ary0sPxuBN3IFdhOpzjzx1TVBCKUkde
 HkKVaeMCAjQRg==
Date: Mon, 27 Jul 2020 23:38:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Message-ID: <20200727233833.05e48968@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============0653027041=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0653027041==
Content-Type: multipart/signed; boundary="Sig_/Co/4Bcm5QQidkYLxcFUhXqx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Co/4Bcm5QQidkYLxcFUhXqx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  163d5446c37a ("drm/nouveau/disp/gm200-: fix regression from HDA SOR selec=
tion changes")

Fixes tag

  Fixes: 9b5ca547bb8 ("drm/nouveau/disp/gm200-: detect and potentially disa=
ble HDA support on some SORs")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Co/4Bcm5QQidkYLxcFUhXqx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8e2NkACgkQAVBC80lX
0GwAggf/ZE9yqLMQZdDvhVq4R9E8Ba61mMPfHQyuDi2NNouo69KZxO/aieZOok/+
q9a95BG+f58FeymHHAfdztrTUh1LtQyPE26rCaGb3ipFmIr6tNTR20ktOVgqtNbQ
B20WH44+6lAk4zrAWt6T6BynwdIRBLXASKGBSbYvzKaSi+dQ0bXHVurHDVvNruoi
zCpFDRLKptRU4YnYCw+mssPvMJlVk4kcsusEoYhXRe0DK7dIrAfC+bu7SzAFTZs3
SK8rQs2kXn9xPq8tlAvYFdS5kvuZFLSjbBDQKeXy4cq0Wm4DAH1rH8522g+68oij
nNH2EdqBQtuDulXL6HDUD9bfyqQ54g==
=V+os
-----END PGP SIGNATURE-----

--Sig_/Co/4Bcm5QQidkYLxcFUhXqx--

--===============0653027041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0653027041==--
