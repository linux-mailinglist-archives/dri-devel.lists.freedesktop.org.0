Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D502DBD14
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17A089ED3;
	Wed, 16 Dec 2020 08:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3DD6E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 8E725435;
 Tue, 15 Dec 2020 10:42:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Dec 2020 10:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Lg4neL9ZugxBQTIbWDnPbthuy6
 QqWV/ujkN+uYSF8c8=; b=TIUbd120C6l5c8cYza9HsWQiHsYkKhJNtFNAuN99zG
 ccJDPeVAKQdW3WfX5GM4Bs9P91zAe0xKnlNTcCAiSXNDy5QIcyeQP0mjIICue/aR
 gGcp5QaAcC6Kazn8VTGP16GDbCTXWFtfPrwq17YXL38fj0MVO+0DsXLmldruWlAb
 /SuUIQN+V5c76ph6lBicluNGNhQubPQ7LuXE4v5bivNYg/WWvCxt6qpb9P+lFnz5
 TixhXeRlEqdhHCczXbqmcHVUBZLv+KfBa7DpbEjLPZ5x4T/xvlR/pO6Nv2r5kTpo
 zpzlJFUdz58yKyHNw5clw2Rwkiwvjqx6etecHg/V6/Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Lg4neL
 9ZugxBQTIbWDnPbthuy6QqWV/ujkN+uYSF8c8=; b=FbOxE7C72IGaOc2mCZm74N
 fKfmLL3dHoF9Sn+visx5keJUkuQ0SkQlMzf12g6ke4lkfQYsw9igzjtU1f8v5AWY
 heAzWPwBbZZJY5jdaVG4DIu7FMzz9gsUvmmi9oVVyzuA58G29/ItTJmXNsSObMDx
 MZnAuuy1JJaTkeV8M4E0Lu1xRZm8Z1F9d++kXO4xERls6TbREH7lguAwQ93UAUBv
 c3zs4pHhvkEL73mCSdTjeoiUpw+R/e6vIViZ9+imVax+XH8KdVEWmK3TKQv1tV/o
 X2vZmY267ioZEsqvtRFJ0+5AUTpItIR5Sh8svM5dJxY6pfU/pa+2lznBpOZ99+Zw
 ==
X-ME-Sender: <xms:ddnYXxEQ2h8rneD86X51dpIGU_FZObHNnMAmO4pcPflaRf_lVUo5Rw>
 <xme:ddnYX6kSGamV939I6A3AcUGFXwuNa5DCrvMdwXd3FankyymTwlhn71q6jthauBnyA
 8H7k517ea9-c2hmoTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ddnYX-K05wn_l5owMMEzFLj1Z7-X3B8A16kgR2UAFcNWVVCrqGMVXw>
 <xmx:ddnYX7YZgi8ZDuNLeuxzrWPw57ci-uoSn_0xFDoajddA2ra1eFrn9A>
 <xmx:ddnYXwYW2n3ya4qefYqtcetsBM9-TE7QgZ-QhcAQX9_37dmGMs8FLw>
 <xmx:d9nYX_0wBLONV5hsiG-yJ2M6Bqfzxrc_z5Afsqn1rKcvpo1oMsJVw3xwE0o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 53C7E108005C;
 Tue, 15 Dec 2020 10:42:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 0/9] drm/vc4: hdmi: Support the 10/12 bit output
Date: Tue, 15 Dec 2020 16:42:34 +0100
Message-Id: <20201215154243.540115-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
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

Changes from v6:
  - Addressed the issues pointed out by Dave
  - Rebased on current drm-misc-next

Changes from v5:
  - Fixed the connector->state access in the connector state reset
  - Added the tags from Thomas and Dave

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

 drivers/gpu/drm/vc4/vc4_crtc.c      |  24 ++---
 drivers/gpu/drm/vc4/vc4_drv.h       |  19 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 155 +++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  23 +++--
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |   8 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   9 ++
 drivers/gpu/drm/vc4/vc4_hvs.c       |  18 ++--
 drivers/gpu/drm/vc4/vc4_txp.c       |  10 +-
 8 files changed, 208 insertions(+), 58 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
