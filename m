Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1797C998D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47C16E2B2;
	Thu,  3 Oct 2019 08:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658C96E2B1;
 Thu,  3 Oct 2019 08:10:34 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFEC4222C5;
 Thu,  3 Oct 2019 08:10:33 +0000 (UTC)
Date: Thu, 3 Oct 2019 10:10:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191003081031.oykms5fg4tijvdri@gilmour>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570090234;
 bh=XMzLxYb8470smlObYGDxsMqu/npzCN821cFQTITLx0I=;
 h=Date:From:To:Cc:Subject:From;
 b=y73Buv143qr4n0C5E+L42gBykUVeWCkJq1qmwUieJN3GCVZqOHIZ1ZfkRA/l3NzrL
 5HhCEm8FmYfTjsF1D42y1ce7BZgIGMjpLON4Ucl4B2u6c1lBg3kxd6TfOVso/XY1IQ
 X2Bcvv6Epq2yyVIYLoFEeIvTj+lqGVViZg7nKp6k=
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
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1965524604=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1965524604==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tflrsorfsx3wyuns"
Content-Disposition: inline


--tflrsorfsx3wyuns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here is another attempt at a PR for drm-misc-fixes, after the attempt
I did yesterday.

Maxime

drm-misc-fixes-2019-10-03:
 - One include fix for tilcdc
 - A clock fix for OMAP
 - A memory leak fix for Komeda
 - Some fixes for resources cleanups with writeback
The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-10-03

for you to fetch changes up to b6559bf3ac32acfe34e17c73d68581e7f7415785:

  Merge drm-misc-next-fixes-2019-10-02 into drm-misc-fixes (2019-10-03 10:00:13 +0200)

----------------------------------------------------------------
 - One include fix for tilcdc
 - A clock fix for OMAP
 - A memory leak fix for Komeda
 - Some fixes for resources cleanups with writeback

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tilcdc: include linux/pinctrl/consumer.h again

Lowry Li (Arm Technology China) (2):
      drm: Free the writeback_job when it with an empty fb
      drm: Clear the fence pointer when writeback job signaled

Maxime Ripard (2):
      Merge drm/drm-fixes into drm-misc-fixes
      Merge drm-misc-next-fixes-2019-10-02 into drm-misc-fixes

Navid Emamdoost (1):
      drm/komeda: prevent memory leak in komeda_wb_connector_add

Tomi Valkeinen (1):
      drm/omap: fix max fclk divider for omap36xx

 .../drm/arm/display/komeda/komeda_wb_connector.c   |  7 ++++---
 drivers/gpu/drm/arm/malidp_mw.c                    |  4 ++--
 drivers/gpu/drm/drm_atomic.c                       | 13 ++++++++----
 drivers/gpu/drm/drm_writeback.c                    | 23 ++++++++++++++--------
 drivers/gpu/drm/omapdrm/dss/dss.c                  |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c             |  1 +
 drivers/gpu/drm/vc4/vc4_txp.c                      |  5 ++---
 8 files changed, 36 insertions(+), 23 deletions(-)

--tflrsorfsx3wyuns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZWs9wAKCRDj7w1vZxhR
xRzGAQC0Mv4ClkaQPiaUZUgmLDzVaWtkcEbAlmI3nlQZ+PQRtgEA0883xmmReKNy
xIyZlr49S066AY3EWZXyaZpOWhOcrwc=
=G5YU
-----END PGP SIGNATURE-----

--tflrsorfsx3wyuns--

--===============1965524604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1965524604==--
