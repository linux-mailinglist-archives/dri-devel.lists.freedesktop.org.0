Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9462D261D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D394E6E9A8;
	Tue,  8 Dec 2020 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F0689BA5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:39:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BEA82580363;
 Mon,  7 Dec 2020 08:39:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 08:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=TzrIZIDDLs6j6hdJRZtOUdOhji
 Fbus5VsgWdAOip2YQ=; b=WAzYVXPnOxTpBDESAlRJL/B71zHIAVVjyCVg5zyX9b
 V9QMByU+OCAnnMbNVctX5gtqKy5zStoLM15Nqn6EWwMgzIHgKDi31sv22VS/7C+o
 CVmakP08hlnJpBp/vnHDtgZgN2HV+7aQF+TNlhhAkfVA/s06bzO/l/kC88tSnmrI
 KkeWUIOq31RpnvI+M+ndPBD7io+E/nDPQ97podcPbF9xwSGCbOJeNXLrq2ulN4zf
 4UYoK1LQF6EmyAdkRuMKB43mIMEYGUBi7VF755nv+Udk5kO+ZRYanjQsJ1rZnnJ3
 S8jnirT2HEIYmMQZfZk/FYIGqIOIuXA4oa+pR+vOloUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TzrIZI
 DDLs6j6hdJRZtOUdOhjiFbus5VsgWdAOip2YQ=; b=cjVdhpYt3gEVy3r01bTbjN
 XY91kzjwk76m3ua8gJHe9p9y1vOzGYc9fZxEsCH/Zx9C9oLaPpT3QBMKcvIUZcex
 TbLKMUg4Mo1T9dqxhiREkcau9jNLR2BrIp/2u++gQlXJeLp0cibSJIJ/v0zx3Lqr
 SROMly/DjRcwC61slHJkMh8IfsA+tQ+4ze9Xgx4MNfeUOLwzL501SyUMWQHuV5FX
 dWCb9s2ZN2XPqIVfE56FJm4jFqrcOCOTOYQURC5rFSk3Uoc8eNX6NAQWXnjOc3wV
 xE0YMr47dgNPJ4NyeczYaYXPGeBgNBj9P+g+Bjlr56fbSgwV7simxQLk5KGJY4fA
 ==
X-ME-Sender: <xms:pjDOX1YIOdHhpS-QWqowlzbmGLBTA2c5Y8OuxipuvlGbriVZurf-Gg>
 <xme:pjDOX8bsA952i1tGV0KGOgDB3gGf3jhuDeykeUzWvr_I7YfrYNZPwKFSC8-eipGck
 OODCN21bu9jCmzIdxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pjDOX38MTgDvubkmKu-AvtE768GTXJbAD1wjykhF8ELl7XOSbfMbdA>
 <xmx:pjDOXzrYbCw9_mLOmbQtXOngLbUT53y5dJp8746jYYwFJuK1zeKGpQ>
 <xmx:pjDOXwrxV5La6o7mQxKsiK8iTCmho57k6dvbvbRCPrplK9Gwc65u-g>
 <xmx:pzDOX8cSJTF2IvB8-RLC7J_wiv0G-KU7x73WSaZPym-HcomMmnxLuA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 114D4240064;
 Mon,  7 Dec 2020 08:39:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 0/8] drm/vc4: hdmi: Support the 10/12 bit output
Date: Mon,  7 Dec 2020 14:39:40 +0100
Message-Id: <20201207133948.2109194-1-maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
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

Changes from v3:
  - Don't dereference the connector->state pointer if kzalloc failed

Changes from v2:
  - Rebased on current drm-misc-next
  - Fixed a bug that was dropping the refresh rate when the bpc count
    was increased

Changes from v1:
  - Added the coccinelle script to the first patch
  - Fixed the pixel_rate ramp up

Maxime Ripard (8):
  drm/vc4: hvs: Align the HVS atomic hooks to the new API
  drm/vc4: Pass the atomic state to encoder hooks
  drm/vc4: hdmi: Don't access the connector state in reset if kmalloc
    fails
  drm/vc4: hdmi: Create a custom connector state
  drm/vc4: hdmi: Store pixel frequency in the connector state
  drm/vc4: hdmi: Use the connector state pixel rate for the PHY
  drm/vc4: hdmi: Limit the BCM2711 to the max without scrambling
  drm/vc4: hdmi: Enable 10/12 bpc output

 drivers/gpu/drm/vc4/vc4_crtc.c      |  22 ++--
 drivers/gpu/drm/vc4/vc4_drv.h       |  14 +--
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 151 +++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  21 +++-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |   8 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   9 ++
 drivers/gpu/drm/vc4/vc4_hvs.c       |   8 +-
 drivers/gpu/drm/vc4/vc4_txp.c       |   8 +-
 8 files changed, 193 insertions(+), 48 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
