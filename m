Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DAFB289
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 15:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5153C6ED36;
	Wed, 13 Nov 2019 14:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC396ED36;
 Wed, 13 Nov 2019 14:26:48 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1B70222C9;
 Wed, 13 Nov 2019 14:26:47 +0000 (UTC)
Date: Wed, 13 Nov 2019 15:26:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191113142645.GA967172@gilmour.lan>
MIME-Version: 1.0
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573655208;
 bh=jQcMxVxTh8e3rcJ9n8BUVRaPcyBYltdYRGDB4x3AeT8=;
 h=Date:From:To:Cc:Subject:From;
 b=fYquv2UhbBy+Zh7+T6ys2wZFR7Bw0e2TAASJ9QHl64fysW7gBdQFyfNPSEXUkPz4j
 Xo2c5Gs7GAwJ9WR4wohvub5dvMkNlmU74BW4m5bSGfof3mDPZkqdPBiY3qVqfHU3HX
 GeYMqS832GmeJRrZn52xieuxhn05Bd43AHqniKvI=
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
Content-Type: multipart/mixed; boundary="===============1252393309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1252393309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's a PR for this week's drm-misc-fixes.

Maxime

drm-misc-fixes-2019-11-13:
- One fix to the dotclock dividers range for sun4i
The following changes since commit 105401b659b7eb9cb42d6b5b75d5c049ad4b3dca:

  drm/shmem: Add docbook comments for drm_gem_shmem_object madvise fields (2019-11-06 17:57:42 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-11-13

for you to fetch changes up to 0b8e7bbde5e7e2c419567e1ee29587dae3b78ee3:

  drm/sun4i: tcon: Set min division of TCON0_DCLK to 1. (2019-11-13 15:20:33 +0100)

----------------------------------------------------------------
- One fix to the dotclock dividers range for sun4i

----------------------------------------------------------------
Yunhao Tian (1):
      drm/sun4i: tcon: Set min division of TCON0_DCLK to 1.

 drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcwSpQAKCRDj7w1vZxhR
xYPhAP46zWBSPkN4Hbmy6giypiuN4BLkIS7CUbkCb+/F4m6a9QD/SBl/NdJf8Z82
mmcIBmmrybjG8UqpTCedPeRxgFi97wA=
=d6IC
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

--===============1252393309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1252393309==--
