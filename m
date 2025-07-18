Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D1B09A9C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 06:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4F10E101;
	Fri, 18 Jul 2025 04:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BpkmQrQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AFB10E101;
 Fri, 18 Jul 2025 04:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1752813574;
 bh=JeavPSIrkxNZAXoNhH/veRqbvwQUMoU2cFs85kP8w3o=;
 h=Date:From:To:Cc:Subject:From;
 b=BpkmQrQ+WRiFI7VEYcQR2Zkyow6MPLgbOQMIlNY3cSPk6k7nNi2XGkvPWAl/hTS+8
 8RO1WasNl6Vax83Bd9AGgBsm5h0Ij5cn8MSgDkRp/jCsVoJjRSuv5/2+R0l43y7KfF
 uemSnWFPqH5BDWK0a/xVkIXcOQapPWC7z7hONXvr5FAnNYYYEMZP+KAaFdpztQKLvj
 GbNkVMrZEZJsw+zqyOPj2RHkJAV8L5PISOBK0biLEqFdipu7gI410zugsmtKW/quEc
 sGXB38ftq+PV6TXoz1/sqa3Dl4ecwJXjLxV1OeuV9FAWPoHeCKjj+tbKVyl7aq/jD/
 pJQyjWgb8T/gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjxsJ4R9bz4xQN;
 Fri, 18 Jul 2025 14:39:32 +1000 (AEST)
Date: Fri, 18 Jul 2025 14:41:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20250718144140.202fcca5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sr6znU7d7YfW2jYBh6hCX8n";
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

--Sig_/sr6znU7d7YfW2jYBh6hCX8n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/virtio/virtgpu_prime.c

between commit:

  0ecfb8ddb953 ("Revert "drm/virtio: Use dma_buf from GEM object instance"")

from the drm-misc-fixes tree and commit:

  44b6535d8ace ("drm/virtio: Fix NULL pointer deref in virtgpu_dma_buf_free=
_obj()")

from the drm tree.

I fixed it up (I used the latter version - reverting the former by hand)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/sr6znU7d7YfW2jYBh6hCX8n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh50IQACgkQAVBC80lX
0GxGUggAhJGJXYOxtwr9+wnw3DqoCsV8Y+o8O8v5PM0oYFAUiP0/3CYcEbPshFm2
N/vGlPdVD9u4x9Q92iLALsDyPYrgS8OIIZsi3lt4M2WpSsc1oCV/JmgEolUm0oKH
IXdS0nzFdsJU7rXvv8ttLpGoG7GaMop3KA6kbW24i0QYLtSwXzq0GlmA/khuC6dK
t7Sf7jpUt1SSk2U8xYkimCU8H8Fe7UhPSatoXhU/FY8Og95bVqGkitY0jEzfNIPT
c8HHgFNWquCNNzmMZil0BzkX+ZTzjk5aceaEkiIvW8UeLKV8crPCvlFz7aAq9Q2O
7XYKVYAqmV+Re8RHT+rSd+ka4zxaJw==
=HD98
-----END PGP SIGNATURE-----

--Sig_/sr6znU7d7YfW2jYBh6hCX8n--
