Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EFF2D25F1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285DF6E94A;
	Tue,  8 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1108F89933
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:57:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 606A0580237;
 Mon,  7 Dec 2020 10:57:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 10:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=TtGQA1h6fp+ZI8YL2Jf+o7p869
 HAvITYSWkhrx1Th78=; b=kppA39ZUbBzIf6so0mmK/FcoZZHlUUZRk9LJQOWyhM
 SwthP/ml3mo5IptZIeF0eJU74aokzQ7HEuxyYA61b4XX5S/TEBdSM8c4CsVLzOLW
 Kmbqh7pUDtu/vZWefWsZPYsQhbWwsz+S+baEilpU6c2BHgvzCHQQjRTWWqbVdXE0
 HGq0zEeoNqE0iBpXze9fo984waCOCqE5e969JrgyCLqRCubW49Mbni79SxpvefTJ
 kljadZvBD5KZuOBGLkfnx57f9q5TLyPLXVazzStQFIyeccfgShhLWTXQL1y0LfV9
 KAhvd2KpjBcse/L9HO7IN8ecvlw9Yu50p+pjOkFv0sZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TtGQA1
 h6fp+ZI8YL2Jf+o7p869HAvITYSWkhrx1Th78=; b=aV3cn64Xwn+kXxDcsEfJUv
 IF2xM31yAz0uUQCaP10eWoHCNneqWy6OvWq6uUCp3TMffqa1tXuLGI2Zkna82Mft
 9iu7R0Rmf+6tiYcKO6LYiuizdRucKXjjP0u+Sjx+173LkSTQ2f4BTZjCU+37gs/L
 x5ni19C8Gp8Mewkt3XSSTVHpgUVvUxGinIKeTwKVP8a4S76A5DIEzhObqY+xx+tk
 I3h3aOAw8e9AD0AIJc2KiYUPTnpwnP8eoeTfmFFHe5k3JaB5uQfrQsT9olSyncEJ
 tYr9BezNAN1cpw6NOfflf5jvbtRdaDcaG08ddSytWVTlWj/E7zJ3CuJKNBAy/BCw
 ==
X-ME-Sender: <xms:4FDOX4pX5-g1W20rNogClefXlX8M4I8Ct1UYaXLaLzJIAlX_EP9Oew>
 <xme:4FDOX-pdVKr3eJBuKVOAZLO2JV7sWSJmpmxyFJuzUEMF3_qwEVc7kuTvw35lE18FA
 qKXO6hwUOX5S_216Pc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4VDOX9OQZMlCMUHC_xhIN9x9b-Iwx7sYPommc2MBdimBhtSTkXZo3Q>
 <xmx:4VDOX_6nVtuyjFDj9IomRg6GIAiyCzh-M-IztxV_w7HY11poFdquZw>
 <xmx:4VDOX35_P5242ILWPaZb8hbA9GmiSe3SZ1RzgEfO2rLHBZ5AJXwxUA>
 <xmx:4lDOXxtU9eJmxuMKi7yh_z1tij8n5M3zfeOxs4RmPYGsnjXhPtUZIA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BCE631080063;
 Mon,  7 Dec 2020 10:57:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 0/9] drm/vc4: hdmi: Support the 10/12 bit output
Date: Mon,  7 Dec 2020 16:57:10 +0100
Message-Id: <20201207155719.17149-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's some patches to enable the HDR output in the RPi4/BCM2711 HDMI
controller.

Let me know what you think,
Maxime

Changes from v4:
  - Added the tags from Thomas
  - Fixed an issue with the clock doubling
  - Changed a comment to match the code being introduced

Changes from v3:
  - Don't dereference the connector->state pointer if kzalloc failed

Changes from v2:
  - Rebased on current drm-misc-next
  - Fixed a bug that was dropping the refresh rate when the bpc count
    was increased

Changes from v1:
  - Added the coccinelle script to the first patch
  - Fixed the pixel_rate ramp up

Maxime Ripard (9):
  drm/vc4: hvs: Align the HVS atomic hooks to the new API
  drm/vc4: Pass the atomic state to encoder hooks
  drm/vc4: hdmi: Take into account the clock doubling flag in
    atomic_check
  drm/vc4: hdmi: Don't access the connector state in reset if kmalloc
    fails
  drm/vc4: hdmi: Create a custom connector state
  drm/vc4: hdmi: Store pixel frequency in the connector state
  drm/vc4: hdmi: Use the connector state pixel rate for the PHY
  drm/vc4: hdmi: Limit the BCM2711 to the max without scrambling
  drm/vc4: hdmi: Enable 10/12 bpc output

 drivers/gpu/drm/vc4/vc4_crtc.c      |  22 ++--
 drivers/gpu/drm/vc4/vc4_drv.h       |  14 +--
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 154 +++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  23 +++--
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |   8 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   9 ++
 drivers/gpu/drm/vc4/vc4_hvs.c       |   8 +-
 drivers/gpu/drm/vc4/vc4_txp.c       |   8 +-
 8 files changed, 197 insertions(+), 49 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
