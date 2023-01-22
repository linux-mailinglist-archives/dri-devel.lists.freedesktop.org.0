Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D062167728A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 22:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DC510E1B5;
	Sun, 22 Jan 2023 21:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAA010E1B5;
 Sun, 22 Jan 2023 21:06:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P0QlH2l2hz4xyY;
 Mon, 23 Jan 2023 08:06:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1674421597;
 bh=B7Zeq6Me9MxVHnA1Aqf/fs0uZqZlqdTaA1IhVPM79E8=;
 h=Date:From:To:Cc:Subject:From;
 b=p7HOUPFPzR2Ye48SR4s4XjO0r9EfUVvps0mHCH8ht51QavLHqcmVGqJxLV5YTu0xq
 fGGqplQZQoXoGBbsRo3wOJy1pZ/HlbzO3CNovxUsZZP2YPa63EdYXBQKrThFFXOQeX
 ZyA/cCmWpD1aJ0kTfVg77FgVq1wegKK2R/Mm6rf/RldZWXurw6rYlwerMAznCfFax+
 /NUDmio//shPOSW+C4UH8l/kmRLAKzAhfCh6+0Pg6cPkTaeTo5pvMbokWR9nRm1POD
 80R23FFt1RFMkUQuZGwd6dnSCbtsxU7uWtuClALRKe/wh/b1EWpjm2Z9aqv2Ou8EEb
 dJjrOWhC3YzAQ==
Date: Mon, 23 Jan 2023 08:06:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: duplicate patch in the drm-intel tree
Message-ID: <20230123080633.2279dd52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VPE/3vaDF41VYhjI7dlMAx4";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VPE/3vaDF41VYhjI7dlMAx4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0fe76b198d48 ("drm/i915/display: Check source height is > 0")

--=20
Cheers,
Stephen Rothwell

--Sig_/VPE/3vaDF41VYhjI7dlMAx4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPNpVoACgkQAVBC80lX
0GwMVwf/Y3bMOlR3dore7xhMZF5XdqlaH2lPaOIU3Bny8VXETBAExqcNhNt7gpDn
oTwIscw4ES7JKhDKgp9xIL/Rae9nlu83vac53ati41UHepCUKX30BE0ms3gtCpyi
tKCbr7P/I0QtNPNI10xLrxLtJtXsWXP/ovsuZvl3dloplWQCoBk3vpKKYtKyqi9z
KMOfVrHe6K5mA6RoiAqastw1moTBRLbZFA72K/gfGSknI7NtNtEeur2Y7f5018Yt
pMpDuhmqv3+KEIU9u5qwe949mTNqGltZ1viVCE2XgzxoNbZr7zpTYaCNyqOnYN9s
kcwWu2MJxn3ZeQSY6597wNo2ZPjSJQ==
=TIJ9
-----END PGP SIGNATURE-----

--Sig_/VPE/3vaDF41VYhjI7dlMAx4--
