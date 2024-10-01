Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E6C98B2CB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 05:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1946C10E5C4;
	Tue,  1 Oct 2024 03:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aFEckqpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1288B10E5C4;
 Tue,  1 Oct 2024 03:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727754213;
 bh=HOCzYcQ02D49k4LYhDveIJyqkuDlctGzK8ZlpbqAKGw=;
 h=Date:From:To:Cc:Subject:From;
 b=aFEckqpaQCGItu5Twz3n0CCvuNG/uIJpdlQsvdYmtys2OK/7ZpraiZhAQ5CCwCtUn
 8FGS7g73NV/udNZX1uDmcbTE8Jo9wvTkQV0sdBmRDe2wzVH/XxoXc3N7X0la+LsuwL
 1NGIJ3YryZq3Or28tjaev2/Oa1E5qogmpfXrt6E9XqQKSXeyn2XsfL6Ay3mapmyBw+
 9JQKR1mjdJNntYYUB0nCntiFR0Z24u6YvDxcy7+TM800Au5wSk4fzva11jurJ2OEJY
 pwZP2DQTkkAWLARAHoo8sUD9qFTu8RoBo9W2vN3uoe4GMqWfhzSZf3nGK3k3FBBbrH
 uiVsasKbb6wkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHkLX3NxJz4wbv;
 Tue,  1 Oct 2024 13:43:31 +1000 (AEST)
Date: Tue, 1 Oct 2024 13:43:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20241001134331.7b4d4ca5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RRZ.=DI1Tlf32wO5Rudau/n";
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

--Sig_/RRZ.=DI1Tlf32wO5Rudau/n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_inter=
rupts' not found
drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_interr=
upts' not found

Introduced by commit

  3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")

--=20
Cheers,
Stephen Rothwell

--Sig_/RRZ.=DI1Tlf32wO5Rudau/n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7b+MACgkQAVBC80lX
0Gzz9gf+I7VPt66D3CDNyNL44lIdLB94LXtHzyQXBFvfWWk769QfiC0HrCBp112s
JoVZrd5mavkXq5P7Lci4t7Q6fYZaQs/k5MRJc8j0mZtTe88tnqaMrsk1Znc8GrJz
aVYLOIyaVynNMMp3A3UQu99a/8WlDdgBE9DuDOoYx9mJefjW5DaINbzq8Gl0QG+G
+IRxIRnonya4ATMjpEIJLFrBra5PQjLrKOoIoulHxrSOA0a0SHfkTDaB7edaAiCR
u3P87z0kFXIl2lqd5jpjgXauSO8FkGLOEVKjAlZYZ/Rwy4/vYIuL3FF2GP51P+Hi
kckhsUtOOVdUn3zywk269RBZe7cOYg==
=AtqQ
-----END PGP SIGNATURE-----

--Sig_/RRZ.=DI1Tlf32wO5Rudau/n--
