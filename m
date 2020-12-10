Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F42D5E66
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6616EA8E;
	Thu, 10 Dec 2020 14:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333746E8C0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 065BFF9E;
 Thu, 10 Dec 2020 09:23:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 09:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=DsgLTJhvc8nwfd1y0/A2XeroZM
 evSaYLMWMlFJAKNKg=; b=FPmjw5lVcrgwRZtYfmQ40wtiSFP4eK9jmtbg7iacE7
 lM/FkSfTAykVtydDSDPXgUAt+d/l+nWoABGR7gRo5Pi8UguAvl3oNlMaXkscPuFU
 bHQbH49dF3/oOq4c472kXNAPZe7nt1z3kqYlBe4zoSHxbYZsrLVBk8ON0hD1CS7X
 YkN9kJ95sGWNBJQ7PXg7MlVFQRpqIvVKJYDGEiVWF4QsefJ4s5ft3E8I2DHVLQfB
 0/ACDA/8Be2QF+sYxqviBXyYZnVGsiEGUf6rIsCj+NrOXxL/u2xYAvrHU2187BRV
 1fR0Q4gVtFiIvIRI0Jp5JzcG3ZqSCRL/R4tUz1YZkBjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DsgLTJ
 hvc8nwfd1y0/A2XeroZMevSaYLMWMlFJAKNKg=; b=m72M8mzg8NT/7VZ6azDsUF
 zL422tXTBP72MXQaF11SwnEJatcXj9qEjF/zHgx/0R7M+yFs61PuqjGj2ZrkwRn1
 q27jiTB9Cfmf1M0jxpiMke2SgKdyCYb4HRw1Uf3L40om/himmPZP3bR5BlcoucnP
 iXfL44Tm2u9Vr8XH31jJRDLsqaZ/EBFIE6UaIA9DP2r5730elBXmvEI17LcTG9Qc
 R9ZKbfFVhrnRyR+pEnKkNlC0V4bmlFjYJ9+e9wjVCMoLoF7qUW+QxlB8dPKM1O/j
 bXZ0hbYt0n3cSJExoTmx7Jg+kxKmxaZQksCiQsbA1+LzKZIoRM/rCcTpSgcWSlLw
 ==
X-ME-Sender: <xms:Yi_SX2m0SyfH9LED6JkxQ6i0Ahp2gQ9Jgp2BAz9HUx7KhFMOWQDt9A>
 <xme:Yi_SX91CFGbMVrZwuPdn5FyrMhbb4AMm5bc-PY8lzUYLw61kfFAvbpc_a3kkipc4w
 TdCwopzKICzYVoH5uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Yi_SX0pez-seWQVrCkDK_qVexaFHWgfTWmU9QM3NjQSLWHcSI1evJA>
 <xmx:Yi_SX6kNHROxpDYfeR00ommsbpB97opQzKX6Eu4xVUvK6WZWMM4zMg>
 <xmx:Yi_SX01rtJ8rIAUt9nzQcGPiXhlgpDEvRJYRTuuSNrvVw4xEMJvV5g>
 <xmx:ZC_SX1Jtmi9p2vqOA_DsFTgEiNCbsmF3AjEYtRAEc2lR1aqbSHbSJGudu_M>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A42624005B;
 Thu, 10 Dec 2020 09:23:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 0/9] drm/vc4: hdmi: Support the 10/12 bit output
Date: Thu, 10 Dec 2020 15:23:20 +0100
Message-Id: <20201210142329.10640-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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

 drivers/gpu/drm/vc4/vc4_crtc.c      |  22 ++--
 drivers/gpu/drm/vc4/vc4_drv.h       |  14 +--
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 156 +++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  23 ++--
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |   8 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   9 ++
 drivers/gpu/drm/vc4/vc4_hvs.c       |   8 +-
 drivers/gpu/drm/vc4/vc4_txp.c       |   8 +-
 8 files changed, 200 insertions(+), 48 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
