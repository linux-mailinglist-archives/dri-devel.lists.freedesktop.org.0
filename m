Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F539EA3A8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 19:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0376ECF7;
	Wed, 30 Oct 2019 18:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8CB6ECF7;
 Wed, 30 Oct 2019 18:54:52 +0000 (UTC)
Received: from localhost (unknown [80.215.218.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4F68204FD;
 Wed, 30 Oct 2019 18:54:51 +0000 (UTC)
Date: Wed, 30 Oct 2019 19:22:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191030182207.evrscl7lnv42u5zu@hendrix>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572461692;
 bh=GFVqJUqPBwUOhJ9x3594RHCMO78ZYHk1qH/IrMdpehQ=;
 h=Date:From:To:Cc:Subject:From;
 b=GbsmNo3wNE/Nv/yyMUwItV5LfsImZzs6iYKxglc4togod9AjyQRZwuOW+OGXYHP1z
 nE8jJ37ctN2lH40iqIcfZdU2zbRALWGZtW/iBO8vDgQxC+dnv+6KHYN9RKMpln24qE
 aCAwzZnTFgs7PhAuCeKq9bk/0WX0bPdwi88RZPlE=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1148817720=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1148817720==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="atr2ofodgat77gis"
Content-Disposition: inline


--atr2ofodgat77gis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here is this week's round of fixes for drm-misc.

Thanks!
Maxime

drm-misc-fixes-2019-10-30-1:
 - three fixes for panfrost, one to silence a warning, one to fix
   runtime_pm and one to prevent bogus pointer dereferences
 - one fix for a memleak in v3d
The following changes since commit 8ae501e295cce9bc6e0dd82d5204a1d5faef44f8:

  drm/komeda: Fix typos in komeda_splitter_validate (2019-10-21 14:50:51 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-10-30-1

for you to fetch changes up to f70744c68779c8a72a0c82294e3233b994af656d:

  drm/panfrost: Don't dereference bogus MMU pointers (2019-10-29 13:18:17 -0500)

----------------------------------------------------------------
 - three fixes for panfrost, one to silence a warning, one to fix
   runtime_pm and one to prevent bogus pointer dereferences
 - one fix for a memleak in v3d

----------------------------------------------------------------
Navid Emamdoost (1):
      drm/v3d: Fix memory leak in v3d_submit_cl_ioctl

Robin Murphy (1):
      drm/panfrost: Don't dereference bogus MMU pointers

Tomeu Vizoso (1):
      panfrost: Properly undo pm_runtime_enable when deferring a probe

Yi Wang (1):
      drm/panfrost: fix -Wmissing-prototypes warnings

 drivers/gpu/drm/panfrost/panfrost_drv.c     |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c     | 15 ++++++++-------
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  1 +
 drivers/gpu/drm/v3d/v3d_gem.c               |  5 ++++-
 4 files changed, 14 insertions(+), 9 deletions(-)

--atr2ofodgat77gis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXbnUzwAKCRDj7w1vZxhR
xQeRAP9wVath9vl4ihyjZgE1fQfEbGauFflbX8G665qzgASpiQEAooCercElnvr6
b5BPbltgXLI6TD9sB+8sF7SQidMy6gs=
=9ptt
-----END PGP SIGNATURE-----

--atr2ofodgat77gis--

--===============1148817720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1148817720==--
