Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4595278D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 03:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE5410E3A2;
	Thu, 15 Aug 2024 01:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WS0lNQpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F4F10E057;
 Thu, 15 Aug 2024 01:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1723685840;
 bh=Iqpxovj7PB0EvtI0YGVxLgYHKaxYHdLqVH/H4Kykwmo=;
 h=Date:From:To:Cc:Subject:From;
 b=WS0lNQpVo3bX/JQEllwA6kB8ERNqbj3NTTd0F/jNdeTHpfZ4EtN/BwRJZkPjTe7xO
 ebE3ULO6mEArRtb5C1AnDiOFcxxK9H1gwNrdNGFZrJ6c5yLfmM3zSmGgtaJGgO5NNF
 gkb8ybUs/kpOoRIfi/9ryNrPWq911WLEgUwE0MaQ3fLHy3WRr/FxPCyQxuCEjYiUlr
 MFhOdcCG/DMgHsoq8YayLtPZ/ino3j5Z+LppldbDzfIkpACZw6/nqi021etiaHtkTo
 bHQDsvrg53QfpDEHy4OjbYWj62Xz1jL/oXABVGyEwt2LfAuEdURLGf5vP0cP+kMcca
 52Jmc1EfwikjA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WknmZ4z5Qz4wnx;
 Thu, 15 Aug 2024 11:37:18 +1000 (AEST)
Date: Thu, 15 Aug 2024 11:37:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20240815113717.1c81c44c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5wpLM/KelcHtD=jYJFI9fGn";
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

--Sig_/5wpLM/KelcHtD=jYJFI9fGn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  769b081c18b9 ("drm/i915/opregion: convert to struct intel_display")

from the drm-intel tree and commit:

  1eda95cba9df ("drm/xe: Rename enable_display module param")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index 0e4adde84cb2,56a940b39412..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -127,9 -126,8 +127,9 @@@ int xe_display_init_nommio(struct xe_de
  static void xe_display_fini_noirq(void *arg)
  {
  	struct xe_device *xe =3D arg;
 +	struct intel_display *display =3D &xe->display;
 =20
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	intel_display_driver_remove_noirq(xe);
@@@ -138,10 -135,9 +138,10 @@@
 =20
  int xe_display_init_noirq(struct xe_device *xe)
  {
 +	struct intel_display *display =3D &xe->display;
  	int err;
 =20
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return 0;
 =20
  	intel_display_driver_early_probe(xe);
@@@ -252,9 -246,7 +252,9 @@@ void xe_display_irq_handler(struct xe_d
 =20
  void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
  {
 +	struct intel_display *display =3D &xe->display;
 +
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	if (gu_misc_iir & GU_MISC_GSE)
@@@ -289,9 -296,8 +289,9 @@@ static bool suspend_to_idle(void
 =20
  void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
  {
 +	struct intel_display *display =3D &xe->display;
  	bool s2idle =3D suspend_to_idle();
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	/*
@@@ -341,9 -347,7 +341,9 @@@ void xe_display_pm_resume_early(struct=20
 =20
  void xe_display_pm_resume(struct xe_device *xe, bool runtime)
  {
 +	struct intel_display *display =3D &xe->display;
 +
- 	if (!xe->info.enable_display)
+ 	if (!xe->info.probe_display)
  		return;
 =20
  	intel_dmc_resume(xe);

--Sig_/5wpLM/KelcHtD=jYJFI9fGn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9W80ACgkQAVBC80lX
0Gwu+wf+KA7E3N8TtTf07r0R92Zt1KrviWbgyWuZZEXV1kAuNoDZfczaxue4HDkB
XNr+Vs2oER5b4MLA221DW/HzhjSV72ApxvsIbfsMb2EfQsbjBCTGbQOiN94RjaPp
ARJ7iSorlsk7GWfUnbmFyrRoRW/6ZDnK4rIzHUS1QzP3TUVl2IJfpzFt+HPGkuR4
AKIzY3bzj3yxbcKGMAtjbW5I1GDbWNm9V8n6YNO98yLZ7sDkmgKUacV6lyhnTVzu
0seJlLSvPofLeHjCwMH11WzhxWLLbM1outKnJluwIhPiCWwNrqkuYGQ+WO4PiwbW
A6J9tmw2izPa07CcNXVCfDUKBnBOxQ==
=Xf7C
-----END PGP SIGNATURE-----

--Sig_/5wpLM/KelcHtD=jYJFI9fGn--
