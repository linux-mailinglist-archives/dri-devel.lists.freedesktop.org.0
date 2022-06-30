Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE856132C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 09:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357AE10E9CA;
	Thu, 30 Jun 2022 07:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6710EADC;
 Thu, 30 Jun 2022 07:24:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 928EE320082A;
 Thu, 30 Jun 2022 03:24:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 30 Jun 2022 03:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1656573847; x=1656660247; bh=maxADaF0yuVcqm7lXyEc/ZNKNGobqR89Y+j
 YROqYOKU=; b=UmLBMp8RAhW3RpTmqOCmb02tylZgdE31z/tDnHNozc0cDXFLAep
 IXaXLTPkn06jjYOZ7ma6f+tUo3geDUeFAuiKUGpRMzoHK6rKY+Adu9+d+Z6DIi8R
 j9clAvASSfNXNGa7W7miMT8Ps1DRkSgx1Dqes53gyI+6YlzGKzyLTX5K6put4/z2
 t4xY/y0psZuMuDR6B+5XOd6DWlYXqoevVzzxLDTnA2CzVu9nADSBq1nH0WOVtVq5
 jwuagSQNBRqDJRt3QneHsFyolQiET6ISmmcuxkMaI3VJpfuCmw63TN2aauNEGETQ
 SmIov2VCwU1Z+iKun/YnkIZR/srweLKLLKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656573847; x=
 1656660247; bh=maxADaF0yuVcqm7lXyEc/ZNKNGobqR89Y+jYROqYOKU=; b=T
 1VA/+DdanCKfALYWL6rIewkVN6J+1EddNG407hLGW05ZwcqW5k174YsxGi8zRWlS
 j1HKRizWxPJKdALVwAqjB2I3g7pXla2PXHyWoSjkF7+cF3mDgkwkh9j65y1AUxdA
 fQJOo+MeWZfci6n8unDerKeueWJFKrAWzfcJK17EVX63tSTkuMeDS9uSAO09iqBY
 5ibLW6+1+sVZCkKLwMXkqEvGpVKnP91Q5yBkp9VATAvzqbiKhpteeDMFOh+4K4Ri
 va4rZGWGAF2F+NY8JCM3Pl/zrgMOlTPBmHMsKP74vcqREO6I81cmXEndKnLcCivc
 K7hjpx7mHN5vyJL5MZNfg==
X-ME-Sender: <xms:lk-9Yv3PW5Tmz6u7HsJobpb_1LlJUoaKP8mIeRasDPBWZxYqr9qaAg>
 <xme:lk-9YuH4JhMTxegHJtOU8sBKZaVXHKUpMD11f8iifMzE3amBBraav1Cpk9P6IjTAJ
 G9dpxS_S2zaYistjrI>
X-ME-Received: <xmr:lk-9Yv51_q-zQxC0Y6bjjB0AzOCPovYvQ8mSqyu4QoAdJFWZfbuhRGdfBivX48uNuhpcp32WosqzxaWOdOrLLBH_hFNrvzyJ8cZYt5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudev
 jeeinecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:lk-9Yk3dZdwEzAiNtNpYw6o1I3v6O_1ZRvHxQWP5yWN-3NXeEqk3YA>
 <xmx:lk-9YiEscmEjv5IhZIsBx3hO4-0Kg-Ok6p83N9oIc1UEdklC2elCrA>
 <xmx:lk-9Yl8Mld4AYoC6QO_jWYg5NqOxgia-Z8v1AQB5Cyn4jYUYom2PZQ>
 <xmx:l0-9Yq8IsJE-eJQqR5Rck2t7MI2jkpdtSYcc-cUjk_NbLpafE0sbdg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 03:24:06 -0400 (EDT)
Date: Thu, 30 Jun 2022 09:24:04 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220630072404.2fa4z3nk5h5q34ci@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uoiphb6oa6sltavv"
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uoiphb6oa6sltavv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2022-06-30:
A NULL pointer dereference fix for vc4, and 3 patches to improve the
sysfb device behaviour when removing conflicting framebuffers
The following changes since commit 85016f66af8506cb601fd4f4fde23ed327a266be:

  drm/sun4i: Return if frontend is not present (2022-06-22 16:42:25 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-06-30

for you to fetch changes up to ee7a69aa38d87a3bbced7b8245c732c05ed0c6ec:

  fbdev: Disable sysfb device registration when removing conflicting FBs (2022-06-29 09:51:50 +0200)

----------------------------------------------------------------
A NULL pointer dereference fix for vc4, and 3 patches to improve the
sysfb device behaviour when removing conflicting framebuffers

----------------------------------------------------------------
Javier Martinez Canillas (3):
      firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
      firmware: sysfb: Add sysfb_disable() helper function
      fbdev: Disable sysfb device registration when removing conflicting FBs

Maxime Ripard (1):
      drm/vc4: perfmon: Fix variable dereferenced before check

 .../driver-api/firmware/other_interfaces.rst       |  6 +++
 drivers/firmware/sysfb.c                           | 58 +++++++++++++++++++---
 drivers/firmware/sysfb_simplefb.c                  | 16 +++---
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |  9 ++--
 drivers/video/fbdev/core/fbmem.c                   | 12 +++++
 include/linux/sysfb.h                              | 22 ++++++--
 6 files changed, 99 insertions(+), 24 deletions(-)

--uoiphb6oa6sltavv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYr1PlAAKCRDj7w1vZxhR
xWwHAP9dQSSFevh4eApwjAuf3D9sX2n/ANEJZYm9Pvy0UPDpqAD/ba3nacEI5Nph
GWnxhiJoH7xowl4rn8Byh2h7R7pQmQk=
=+62X
-----END PGP SIGNATURE-----

--uoiphb6oa6sltavv--
