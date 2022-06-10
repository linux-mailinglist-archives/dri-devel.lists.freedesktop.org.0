Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D035546603
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DA810EB94;
	Fri, 10 Jun 2022 11:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E88B10EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:51:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 242985C00E0;
 Fri, 10 Jun 2022 07:51:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 07:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654861914; x=1654948314; bh=FqSJusMSjb
 80rjELRVC6a5o0kfLsO0t1hy51mNjQ4fI=; b=GFG3AOlpUwDYSZcdT6z505tSTG
 iYhDnoQ8IW+wT32VqeO0FBgO1Wv4uxD6ljP19ZfzFGDJjK9vMY66ezxSEj2/OlqO
 gPlDmC26uMFM8iKdcRHrwUUHJXDMwjJVwZdbnfdMB8n+D3mlXPP9p0Bj4XUisvfb
 /oXouOupuIEyu3r7xc3J0HuriA8bWYEfy9grgQ+GrXuCLVT/G+Dgw52X1Up+un8z
 z4lu8e5KRW0W5nX7ItAIKMoQn9/R/xnjcyMagVEtagKid+tXe91R+7N7IdEA2qOG
 WWX6OxAsFcSzDraL+OXLB08KFlPllIVg+Ifeylca8Q+wj9WIo/9UGkxh3C9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861914; x=1654948314; bh=FqSJusMSjb80r
 jELRVC6a5o0kfLsO0t1hy51mNjQ4fI=; b=JxsOZV/DbO5HCbn30VOtpCoA5OC32
 3AFi/lbk/zNOWU8SHeCdRAwlzcZGuzbl+7mQ8Ta+R/FXAvcKsruvb2cjx5JLl5d6
 aqS361gIvMO5z5QmLF46T9dEWQF3eRXQvjwdSHvOs4mzlz1AjAyrbSq37tSQ0682
 9k9ScujPujHSn5WAkvHfjT8xfGAfeSJTGKLiO9WMQLQ96B2NjhAJ+nXN5a8XcLjo
 ZyLwQVB8+hkOgP+ABgc/3eqygjhil2ifJ3ESQHIKEjX/Gh2xeLF7zUQEcyCtUOj3
 Fw7JdwjZhHEcOc5BDnD1IA7JR9Az2FsrbPomdeqCCjx8gM5vMkiUwcxLg==
X-ME-Sender: <xms:WDCjYuHzUtZux1ipzZknq52hHci4tX6qYDERA0gy_0txoB34C55PYQ>
 <xme:WDCjYvUY0AHcMUmyuNBjgnm32Hut03Z2OoTopHoFmD4wUXgQpOGYI4IbSJOenCD3V
 IE7UhHy40cnyWNN1fA>
X-ME-Received: <xmr:WDCjYoIWQyu-xxDjkwMLEAc4CVo3d2XdihOFHcbujJEvd5ZrhDwE_dCDIMtxBDxfSAtO1ImcCgUEFt4QFIpnBis_xOgb6U4wm8oajd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
 geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WDCjYoHNhHKqyva7W6XRAXfVoRTZsOiYZ_-b_HXPDqYRrViJH14Rdg>
 <xmx:WDCjYkUqXaDatHTAV8L5YW9UvsI7uG6KXs1ce0DgrmLLHRVYA9_HHw>
 <xmx:WDCjYrOZJ0pc00PjdIqeWWpzMTjOkd8Foxdkg27i5E1n01ae1PrBjg>
 <xmx:WjCjYueWM_hPu8DRiAt0ZcoNC85J6yDxQ24wCeFxdaaEjpkz4QWlmQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:51:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 00/14] drm/vc4: Properly separate v3d on BCM2711,
 and fix frame ordering
Date: Fri, 10 Jun 2022 13:51:35 +0200
Message-Id: <20220610115149.964394-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a series that fixes a significant issue we missed when adding support
for the BCM2711 / RaspberryPi4 in the vc4 driver.

Indeed, before the introduction of the BCM2711 support, the GPU was fairly
intertwined with the display hardware, and was thus supported by the vc4
driver. Among other things, the driver needed to accomodate for a bunch of
hardware limitations (such as a lack of IOMMU) by implementing a custom memory
management backend, tied with the v3d hardware.

On the BCM2711, that GPU got moved into a completely separate hardware block
and thus we gained a new driver for it, v3d.

However, when we introduced the display support for the BCM2711 in vc4, we
didn't properly split out the v3d-related functions and ended up reusing a
significant portion of the code supposed to be backed by the v3d.

This created a bunch of easy to miss issues that would only pop up with IGT
tests, or when heavily testing some features (like asynchronous page-flipping).

This series properly does the split now by creating separate code path where
relevant, adds a loud complain when we use a v3d entry-point on the BCM2711,
and fixes an issue where we would just ignore any fence on an asynchronous
page-flip, resulting in frames appearing out-of-order for some workloads.

Let me know what you think,
Maxime

Changes from v1:
  - Rebased on current drm-misc-next
  - Renamed vc4_dumb_create to vc5_dumb_create
  - Fixed intermediate compilation error
  - Fixed call to dma_resv_get_singleton
  - Complete async page flip immediately if there's no fence
  - Fix null pointer dereference on the Pi3
  - Collected tags from Melissa

Maxime Ripard (14):
  drm/vc4: plane: Prevent async update if we don't have a dlist
  drm/vc4: Consolidate Hardware Revision Check
  drm/vc4: bo: Rename vc4_dumb_create
  drm/vc4: bo: Split out Dumb buffers fixup
  drm/vc4: drv: Register a different driver on BCM2711
  drm/vc4: kms: Register a different drm_mode_config_funcs on BCM2711
  drm/vc4: plane: Register a different drm_plane_helper_funcs on BCM2711
  drm/vc4: drv: Skip BO Backend Initialization on BCM2711
  drm/vc4: crtc: Use an union to store the page flip callback
  drm/vc4: crtc: Move the BO handling out of common page-flip callback
  drm/vc4: crtc: Move the BO Handling out of Common Page-Flip Handler
  drm/vc4: crtc: Don't call into BO Handling on Async Page-Flips on
    BCM2711
  drm/vc4: crtc: Fix out of order frames during asynchronous page flips
  drm/vc4: Warn if some v3d code is run on BCM2711

 drivers/gpu/drm/vc4/vc4_bo.c               |  62 ++++++-
 drivers/gpu/drm/vc4/vc4_crtc.c             | 200 +++++++++++++++------
 drivers/gpu/drm/vc4/vc4_drv.c              |  97 ++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h              |  19 +-
 drivers/gpu/drm/vc4/vc4_gem.c              |  40 +++++
 drivers/gpu/drm/vc4/vc4_hvs.c              |  18 +-
 drivers/gpu/drm/vc4/vc4_irq.c              |  16 ++
 drivers/gpu/drm/vc4/vc4_kms.c              |  24 ++-
 drivers/gpu/drm/vc4/vc4_perfmon.c          |  47 ++++-
 drivers/gpu/drm/vc4/vc4_plane.c            |  29 ++-
 drivers/gpu/drm/vc4/vc4_render_cl.c        |   4 +
 drivers/gpu/drm/vc4/vc4_v3d.c              |  15 ++
 drivers/gpu/drm/vc4/vc4_validate.c         |  16 ++
 drivers/gpu/drm/vc4/vc4_validate_shaders.c |   4 +
 14 files changed, 482 insertions(+), 109 deletions(-)

-- 
2.36.1

