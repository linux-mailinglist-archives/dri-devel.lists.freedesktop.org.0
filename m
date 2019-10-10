Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797CFD27BA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 13:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12566EAFB;
	Thu, 10 Oct 2019 11:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315396EAF9;
 Thu, 10 Oct 2019 11:07:01 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B103206A1;
 Thu, 10 Oct 2019 11:07:00 +0000 (UTC)
Date: Thu, 10 Oct 2019 12:51:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191010105137.j6juxht5dsobgxph@gilmour>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570705620;
 bh=XIXoGht5sAkYqNe6zJvv60n25EPc7Wgsn4jWbF/FKuc=;
 h=Date:From:To:Cc:Subject:From;
 b=c9q3fGK8SdbMUgKefRjFZPyI9lHzXF1pSZz/RNPloZZLVMc99ywffcKdpf/V4sgTy
 n32VExRkIHBX+RnlM7HwiWTizcPJ6td6v9mhuJCk/MC8TgnEg3HXx9J1zeHDZlkboD
 nCOcYuI/DqU7Ixh8ZpEzTdwULkDwxNzdcAuXmaAo=
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
Content-Type: multipart/mixed; boundary="===============0961828470=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0961828470==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qltvgbtpm3xthqog"
Content-Disposition: inline


--qltvgbtpm3xthqog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR, dealing mostly with SPI probing
related issues.

Maxime

drm-misc-fixes-2019-10-10:
Short summary of fixes pull (less than what git shortlog provides):
- SPI Aliases fixes for panels
- One fix for the tc358767 bridge dealing with visual artifacts
The following changes since commit b6559bf3ac32acfe34e17c73d68581e7f7415785:

  Merge drm-misc-next-fixes-2019-10-02 into drm-misc-fixes (2019-10-03 10:00:13 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-10-10

for you to fetch changes up to fd70c7755bf0172ddd33b558aef69c322de3b5cf:

  drm/bridge: tc358767: fix max_tu_symbol value (2019-10-10 11:15:45 +0200)

----------------------------------------------------------------
Short summary of fixes pull (less than what git shortlog provides):
- SPI Aliases fixes for panels
- One fix for the tc358767 bridge dealing with visual artifacts

----------------------------------------------------------------
Laurent Pinchart (5):
      drm/panel: lg-lb035q02: Fix SPI alias
      drm/panel: nec-nl8048hl11: Fix SPI alias
      drm/panel: sony-acx565akm: Fix SPI alias
      drm/panel: tpo-td028ttec1: Fix SPI alias
      drm/panel: tpo-td043mtea1: Fix SPI alias

Tomi Valkeinen (1):
      drm/bridge: tc358767: fix max_tu_symbol value

 drivers/gpu/drm/bridge/tc358767.c            | 7 ++++++-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c    | 9 ++++++++-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c | 9 ++++++++-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 9 ++++++++-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 3 +--
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 9 ++++++++-
 6 files changed, 39 insertions(+), 7 deletions(-)

--qltvgbtpm3xthqog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZ8NOQAKCRDj7w1vZxhR
xXzTAPwPco7KW0PYaAHi0RfRrD5AAZcjhDcGL3s2gCz5d2DkzQEA7NoRN9dHqSo4
a6Es/Oi+gpwslvGiKZgCJwS766TPkws=
=u4qv
-----END PGP SIGNATURE-----

--qltvgbtpm3xthqog--

--===============0961828470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0961828470==--
