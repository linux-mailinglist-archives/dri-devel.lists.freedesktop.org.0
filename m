Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BF2FF9A4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 01:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E536E980;
	Fri, 22 Jan 2021 00:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B6A6E980
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 00:59:29 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMLWH56wLz9s2g;
 Fri, 22 Jan 2021 11:59:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1611277165;
 bh=5MOIKx6UAY7cemlTgtirL6yvU+TcKElOkiV4i4zzUd8=;
 h=Date:From:To:Cc:Subject:From;
 b=TypTUPS08a2PlfNI7bWmc1L4OatjR4NLEnxlaiUIBkP3Mx9SMbbMUUaTQWsoN5Kqk
 KlQwskmmxmvvxsIpOT6d34UEq0Z/O4i2y6wlSAlKf7sz7yJjkYNfJ1l5wKSRVEN2jj
 MYrLvzqsplvnPizQJev5wJgzoTIGWhYjHUUMECnV+YzZjWLkN9xYj2dKqcDMRHjz8e
 b4sKnBZlPdWMS6rY942PCNG3KB5QnDVUhWHWX6yuovQUHsRIFq813HJ6Yt1bS6nBdN
 0eY2dSkE+HYjcy/zQgL6J4elWY+cPZvOQrh72Olc8kBpnH5YQ9YgdTFoWyvQjhcQx5
 LzTcIgz2E4coQ==
Date: Fri, 22 Jan 2021 11:59:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210122115918.63b56fa1@canb.auug.org.au>
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
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============1332573836=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1332573836==
Content-Type: multipart/signed; boundary="Sig_/GdWx3aZncyw8SWUmKZ=fJhu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GdWx3aZncyw8SWUmKZ=fJhu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: unmet direct dependencies detected for DRM_I915_WERROR
  Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] && !=
COMPILE_TEST [=3Dy]
  Selected by [m]:
  - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I915 =
[=3Dm]

WARNING: unmet direct dependencies detected for DRM_I915_WERROR
  Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] && !=
COMPILE_TEST [=3Dy]
  Selected by [m]:
  - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I915 =
[=3Dm]

WARNING: unmet direct dependencies detected for DRM_I915_WERROR
  Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] && !=
COMPILE_TEST [=3Dy]
  Selected by [m]:
  - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I915 =
[=3Dm]

Maybe introduced by commit

  4f86975f539d ("drm/i915: Add DEBUG_GEM to the recommended CI config")

--=20
Cheers,
Stephen Rothwell

--Sig_/GdWx3aZncyw8SWUmKZ=fJhu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAKI2YACgkQAVBC80lX
0GzTqAf9GEMrVgQiHntaHpFKvx3v4XfjPvmjNemLl3YjrVlmcynz/eF5F0L6sZ9f
JyCEOYi5wt4PAWXthiazKz0dRxXeOdtRIJ/CMF17NWY7DRntx4hAyFkADPU6qmjm
Xv/nSfrzNVGAdrJ08Ri6OExtKH4XafvzYP7VNXJ93ea0CkQCoKpd59OEDtIEyYMM
D8M7p/VU1Z2VnJVtgty8JfTrmp3HZI/qXH2uV8ZuN1EZ4rcE8Zdwab+I9rngJifs
36hxiW4RjM/4sBbF3ichvXYc1dtukaK1mS8R0+jUSIPmbdQ5SKZsxJ7mZOK/jTw+
o/8HAzJHeis8xgPyTWyuKgzizJ/giw==
=Ae35
-----END PGP SIGNATURE-----

--Sig_/GdWx3aZncyw8SWUmKZ=fJhu--

--===============1332573836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1332573836==--
