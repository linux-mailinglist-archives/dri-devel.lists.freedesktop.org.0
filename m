Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811325B5295
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D64B10E1C9;
	Mon, 12 Sep 2022 01:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F6C10E1C9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 01:46:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MQqFQ13vpz4xQs;
 Mon, 12 Sep 2022 11:46:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1662947179;
 bh=JUzNdbpckONCPuzlpTFdYGw3om0b8qs7vClxseI5AVo=;
 h=Date:From:To:Cc:Subject:From;
 b=ck2q9FiMxiOBXWQFWBSt93y5QHJ6RBgVGLmnzZZxT1/hz+RPN3IA0LOOyA1Jao9Pr
 mxNYfAFmqWX9xHwE5BwBMaM6Ua18no84r2gzH8HiDJKqaE/mQceNEyCTGS0Pg2S5yw
 CmsznClDbHXym7wTV8PUEVUTK9HruVAjAdwMrn3rZAzN3h2MYNbtv0tVseguVA7Wbm
 DgimpTj65kNVXydg/X1dOzdRUic9yv2LgipTKV050X8BFv2olJxLKUtmf6UjVohOHq
 A/i61nncbvwyps6TwywUx/Plh7eZtaO5zMvk638MyxlpVIQ462QIdiMsXmZwDeUVjv
 U63vob3T1uB7A==
Date: Mon, 12 Sep 2022 11:46:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20220912114616.5f686243@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hVOi3.2gqwmVBO2k/pK7a+T";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hVOi3.2gqwmVBO2k/pK7a+T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_pm.c

between commit:

  254e5e8829a9 ("drm: Remove unnecessary include statements of drm_plane_he=
lper.h")

from the drm tree and commit:

  42a0d256496f ("drm/i915: Extract skl_watermark.c")

from the drm-intel tree.

I fixed it up (they both removed the same include) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/hVOi3.2gqwmVBO2k/pK7a+T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMej2gACgkQAVBC80lX
0GwrQggAmnmujkHXbD/S5DiS5MZe4j48iwDviIOAZtN+L/JmyMRkC2B/TAQ8UHnJ
bsvsJm+G+b1k2UDssP4ZScBqdvRTfEmKDW6EVIJa3OhulvDi6Usw+mpJVLiJbirq
O4q3/vfDyY95k8y/99K60ERH4YYEFHz4bBkdUC6XvEp9OuPNoJFANQOyZfcvaM12
Fo5OwR0sC8492F34rW6qOIDLsBAqIfFIbgq8wB9WErTZUYS4NxC4D5hdSnuYnLfn
fceRlJpjuyLAz1q7NWuBcbrd+JVBl66T5b4B5sGUjm4GcEgFK6xcYcPl3aqrcqoP
5HKIrrHwlD73tXhZNnvKP/I4XJbFjw==
=2h2g
-----END PGP SIGNATURE-----

--Sig_/hVOi3.2gqwmVBO2k/pK7a+T--
