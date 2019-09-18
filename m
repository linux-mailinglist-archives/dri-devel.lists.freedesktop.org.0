Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798CCB6584
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5E06F3A5;
	Wed, 18 Sep 2019 14:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2F46F3A5;
 Wed, 18 Sep 2019 14:09:30 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CEF8218AF;
 Wed, 18 Sep 2019 14:09:29 +0000 (UTC)
Date: Wed, 18 Sep 2019 16:09:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20190918140927.lfhbzkkr23woafvu@gilmour>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568815770;
 bh=GZ8g/Pn4Ho3wcDeSqgFDYCeXhBZwE8Pxs984lDP1Zcg=;
 h=Date:From:To:Cc:Subject:From;
 b=uHwCFmINpWFrmxgfyxufI2N5ly+qUopoe861qKaZcN+z68xg672tSu5LueeGlTIW6
 YHC7K/k4DlUy5p7/ujtj7OuddZLkEu614MvCJW4mObMqTby6md3eIPAuQGz5vX9t4z
 kekudtmyRk4ni+QYeHykF6EyD+U2uXJnf5oxy9/o=
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
Content-Type: multipart/mixed; boundary="===============1469600531=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1469600531==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hdhbdmdeetjebe3m"
Content-Disposition: inline


--hdhbdmdeetjebe3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here is a drm-misc-next-fixes PR, with two fixes that should go in
this current merge window.

Thanks!
Maxime

drm-misc-next-fixes-2019-09-18:
  - One fix for the KMS object lifetime checks with DP drivers
  - One revert for an ADV7511 probe breakage on older systems
The following changes since commit 88537ddbbe4c755e193aa220a306395edf08a4cf:

  drm/mcde: Fix DSI transfers (2019-09-04 22:05:34 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2019-09-18

for you to fetch changes up to e0f32f78e51b9989ee89f608fd0dd10e9c230652:

  drm/kms: Duct-tape for mode object lifetime checks (2019-09-18 11:27:18 +0200)

----------------------------------------------------------------
  - One fix for the KMS object lifetime checks with DP drivers
  - One revert for an ADV7511 probe breakage on older systems

----------------------------------------------------------------
Daniel Vetter (1):
      drm/kms: Duct-tape for mode object lifetime checks

Rob Clark (1):
      Revert "drm/bridge: adv7511: Attach to DSI host at probe time"

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 +++---------
 drivers/gpu/drm/drm_drv.c                    |  4 ++--
 drivers/gpu/drm/drm_mode_object.c            |  4 ++--
 3 files changed, 7 insertions(+), 13 deletions(-)

--hdhbdmdeetjebe3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYI6lwAKCRDj7w1vZxhR
xX60AQCD5qDLS+sWMA0CNUy3iLBFNAAvhMNR8OgdplwBE7OktwEAuFQ2zoExcdxt
aE1E9/29O0C0Sn7fpHIe5nltZByb1g4=
=1Flv
-----END PGP SIGNATURE-----

--hdhbdmdeetjebe3m--

--===============1469600531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1469600531==--
