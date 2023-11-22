Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2507F3AD6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 01:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EE510E120;
	Wed, 22 Nov 2023 00:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BFD10E120;
 Wed, 22 Nov 2023 00:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1700614300;
 bh=5Y2aSfjsCdGy6qFz2dwjuQl2kp/3JDymxNRBgtubDA8=;
 h=Date:From:To:Cc:Subject:From;
 b=nBRZfI6pFAAPFgya7CKcjI66blAYxQYN5+eyug6nkowRsBesBCXMoB4Oxa9Lxescg
 GWbdXi8H3OcOpzp58h+tJ6Du/kTunWzaNDJz2dTsEbcHk45WCyFI7LM0WGZ1FTwAQ8
 fUYpwZmn3G1q2mntV1Lu7TTdckX/yD8MDqDoBgFREq8pUmqIDjo+66cjhKbrfwB3Ik
 vaNPXu+O8Sg/vusu4aLUk7kiett3RAIGUnoJQ/titb7LcN4OBOLthywrlMWlWidPJo
 e/iWV6fV0GjHsY3ThtOh3nHI/rV7Ck2RKmnGTW8pcjoayo6MfgM6/UWynSjjg1+Stn
 R5T8EDqIDKUcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZjP70df2z4wx5;
 Wed, 22 Nov 2023 11:51:39 +1100 (AEDT)
Date: Wed, 22 Nov 2023 11:51:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20231122115137.04a33a6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I2H4f6VqQn9wBne0MzTm_OF";
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
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/I2H4f6VqQn9wBne0MzTm_OF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c

between commit:

  9031e0013f81 ("drm/amd/display: Fix mst hub unplug warning")

from Linus' tree and commit:

  191dc43935d1 ("drm/dp_mst: Store the MST PBN divider value in fixed point=
 format")

from the drm-intel tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/I2H4f6VqQn9wBne0MzTm_OF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdUJkACgkQAVBC80lX
0GzV1wf9Gz35ouxAlzrIOa/+NQj7wvVFopvSvxFv+GEE8UCRSrnkbg96TFLa+4of
vlG5Bvbtmd0N9OoNKGminwK3T5ghQNa38oZ9Ic1tSXEcJY+5W5XuN+PqFRU2eupv
8owuRqF2dH424CfbV0EE5FEr5hDJWNY6e3hFl+hUcH/CF9Z9UYImw51LZxSQyF4d
LhDqVlKq0bgBID6zDTWMRzRB188rdVN+EGjxz+xsO5ysPh7OLLdMdZL5RbcpfE0F
uUVvCDb9ksqZ5HElFgz5sEiYmOVv9ba1u93TtuPrIzLiF69x7VHqhH7cTSOJ9ODJ
g50onkxt3YOqEiasXkAqBMlhGbOCGQ==
=W9Ap
-----END PGP SIGNATURE-----

--Sig_/I2H4f6VqQn9wBne0MzTm_OF--
