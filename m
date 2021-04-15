Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6C3602A4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 08:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E156E0FF;
	Thu, 15 Apr 2021 06:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249926E0FF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:47:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLVJl6lPwz9s1l;
 Thu, 15 Apr 2021 16:47:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618469260;
 bh=R5LUy5pjaeLxiJym25jOcWLIKuHSmBUrMVbjBrEUoEE=;
 h=Date:From:To:Cc:Subject:From;
 b=ZC1Rn3qDDfSUgI1ENprMbTM9EXOG0xLdfAZLhDV1SVEO1FHHdeTw0UG/iKicRjjRT
 k+M5MhcFhJjtjZITFXMZ39g9dGcdLdFDkOhLvItsmaYJUWG39FYLZKStBCY2afKwB/
 szsCwl7y8CYw8CKXHxAZsXfNoVUpAZV9axrJ4QH2ibsGArUZs1BoY7SMARsl3OZ86Q
 C23jEg3KNW8lHSup1SEpJSfEGOmIKXs5U5aw6RJCwMI3Uhe1ICUMKEKDU3Hgbp76vJ
 5SHdsafyoe2t7YTw1iNL436iiMNo5X0KCRm6UbeTAZGthr/lzs2j6fSX/wlkKlAWXl
 oJttncC85wZBA==
Date: Thu, 15 Apr 2021 16:47:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex.williamson@redhat.com>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20210415164734.1143f20d@canb.auug.org.au>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1513093590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1513093590==
Content-Type: multipart/signed; boundary="Sig_/x=GVyj4HwY=icfJeVJ6Gf8Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x=GVyj4HwY=icfJeVJ6Gf8Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  drivers/gpu/drm/i915/gvt/gvt.c

between commit:

  9ff06c385300 ("drm/i915/gvt: Remove references to struct drm_device.pdev")

from the drm tree and commit:

  383987fd15ba ("vfio/gvt: Use mdev_get_type_group_id()")

from the vfio tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/x=GVyj4HwY=icfJeVJ6Gf8Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB34YYACgkQAVBC80lX
0GxlBwf9GwbxaLS1q+d0lcqr+GclIfWkGkY4xoLYvRlHqedpOJInqdwWb7tivxaA
n8p0o7wiQ04k+2FkSXz91q0VLardEbI9Q7/JUgFOhKd2XFVih4ibxjGMk946KINB
Z2U85LrdiLvKJwfgznX2uKJ4CnJm9yJV2K19FdmJoberb/Iq2RvsBpXX7TzSOY2d
5IxAwSLHR0k/O9NclVkPU/ajy1xDkkHwa4iMtVgwkFgYk4pnMejJH5b/GNSbCz0V
1Aar7icfTf++ru3vD5+8jPRr9dwNEwWNJnzUhSNv8P04RXSKgu7UnGR9ULAGVshh
4llM/LYsxqGYZ1Mi0XvbVG3JlJqXNA==
=Ag7H
-----END PGP SIGNATURE-----

--Sig_/x=GVyj4HwY=icfJeVJ6Gf8Z--

--===============1513093590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1513093590==--
