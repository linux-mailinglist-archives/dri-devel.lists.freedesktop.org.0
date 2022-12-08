Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D394D646ABD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 09:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F182510E474;
	Thu,  8 Dec 2022 08:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA2B10E480;
 Thu,  8 Dec 2022 08:40:47 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 05AE358034C;
 Thu,  8 Dec 2022 03:40:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 08 Dec 2022 03:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1670488845; x=1670496045; bh=bxFDNCpEngZHFDwZMuAFYGZfgDIx948azuj
 u7JpMwUQ=; b=Fqc7I7SL3zaTMnfQHU27ECUfiALmaX6HQqnxLwLkO0tF4oo0YD8
 yiVqJk7YlR1m8nMu6MQ780LeC99wGlC+jkgSR51NooTnCA97jzCOKNI/GkHVAL7S
 grBx8PK82Rqq8gOKf6OlPn0TSj5SVIV5OGfyYlXn9BGdQ0YQ255qQvWBmVQfaaDF
 HcLGVb9nbLEg5m+1veCpeJkzcRMYt5SH6ywLFbcBTwKXGtbotYszON8UIfpX2na2
 hO+esf7JiAhb27sqLvdsGoyDyuxlWAGJ76q/XqUnI38XOjfnz+4X5yTRmpwj1Lu8
 PwgSmemlOuyNCAKILOa5WYeH20WDJS0bDuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670488845; x=
 1670496045; bh=bxFDNCpEngZHFDwZMuAFYGZfgDIx948azuju7JpMwUQ=; b=V
 ChWM3+B6CLL6PN95BSve6zqvFP9d5vtRO6e75fkI/8ZOfJ+WtTmspp6PqrmsBEcQ
 uMFKaslREJw1niTeYs1sFcL91X9NpXYt3j72CL4onUMSydNkaQGHA0dJom+RTBnI
 HZ+M2sWXyWq/RKUw7WT8KmJHmcu2uUIujA/1BqDW4Z/iGDk0v63ADqHqUShexJtg
 RBPOx4Emi+THiiAHKJ+5vxtmnEEeQ8TrrAuQ2BOWU4ysI3qI9xNu1Nd1WOZ5kBQD
 gIfC8ZDBPqxFxjA9mt+ULE239gaiW8hsNJkn5ikMuHaDpvZen8BphsVRVE0C1xtA
 NF6ceihS0XLVqBNvYKAmw==
X-ME-Sender: <xms:DKORY__XYe2ouF-WRxp-jHurAomV70CasNAlviP4Zsncc3IO8Xplvw>
 <xme:DKORY7stwoOyvRuMef5-gU0krfAdCoelm3WJvdDU6e_KQ9NDGzkrrzR8-kXg0hA9p
 xzbWR0nMJeCX7bH2dY>
X-ME-Received: <xmr:DKORY9DSh9gmP-dFP1qyfXwylFE0hL1kJDW4IrunVHwW6TRUT5ys_5K4V8bEI0MCRpxAci_PCotHYzdUHuTR1zVQx6cG5Fy725ugFMidNDI99w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:DKORY7cO3zUmaw5zOPbUkayfN4XqewKUZQrVX6gOIOY_Gz4GFTE-Zw>
 <xmx:DKORY0NyKdYVzgT49iydWQ3SCG5T7oAD8oSCnOGYkQ2KRHTBEiePGQ>
 <xmx:DKORY9l0-Fy_KZunEE0xJHlbvhXC6Lg9OiBnMBR98hVsGThMRyxKNQ>
 <xmx:DaORY7_dNfxfaLdrynPw4CSVChXUin5W0Q0cNiHCBHd1yZUS9RpUoQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 03:40:43 -0500 (EST)
Date: Thu, 8 Dec 2022 09:40:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20221208084040.yw4zavsjd25qsltf@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ksafdulhcxpv4tpm"
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


--ksafdulhcxpv4tpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-next-fixes PR

All of those patches seems to have been applied to both drm-misc-next
and drm-misc-next-fixes and were part of the final drm-misc-next PR for
6.2.

So we shouldn't have any new patch per se, but it aligns all our
branches and fixes this odd situation.

Maxime

drm-misc-next-fixes-2022-12-08:
Some deferred-io and damage worker reworks revert and make a fb function
static
The following changes since commit 3d335a523b938a445a674be24d1dd5c7a4c86fb6:

  Merge tag 'drm-intel-next-2022-11-18' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-11-23 09:15:44 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-12-08

for you to fetch changes up to b02897e56b4e1fa6445be695ce5d605bb098435c:

  Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper" (2022-11-23 09:11:32 +0100)

----------------------------------------------------------------
Some deferred-io and damage worker reworks revert and make a fb function
static

----------------------------------------------------------------
Thomas Zimmermann (6):
      Merge drm/drm-next into drm-misc-next-fixes
      Merge drm/drm-next into drm-misc-next-fixes
      fbdev: Make fb_modesetting_disabled() static inline
      Revert "drm/fb-helper: Remove damage worker"
      Revert "drm/fb-helper: Schedule deferred-I/O worker after writing to framebuffer"
      Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper"

 drivers/gpu/drm/drm_fb_helper.c     | 30 +++++++++++++-----------------
 drivers/video/fbdev/core/fb_defio.c | 16 ----------------
 include/drm/drm_fb_helper.h         |  2 ++
 include/linux/fb.h                  |  3 +--
 4 files changed, 16 insertions(+), 35 deletions(-)

--ksafdulhcxpv4tpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY5GjCAAKCRDj7w1vZxhR
xX5kAQCy0oEFupsANm7sTZNvZQRG2fcjhpWKbXzL5m3RVC9KbQEA6mIXTeiXTGvl
NjJW8o+JHKirkyn/W+XLSNLr9yYCCA0=
=5GW/
-----END PGP SIGNATURE-----

--ksafdulhcxpv4tpm--
