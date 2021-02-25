Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF5D3252D6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 16:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBDC6ECAE;
	Thu, 25 Feb 2021 15:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103226ECAE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 15:59:19 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B085AB3C;
 Thu, 25 Feb 2021 10:59:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Feb 2021 10:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=+SMPealCjSq/PwFRY80381eUIB
 TCEdDPlWwxCC9pVsc=; b=nNtxGAkzeCB1X6yZKvkfF4Blbsu9aKS3pVRn//mq22
 U/115xG+7ABqKcnJO+olHyMpdyvFG62yVAdVgtmPthpGDn7tiIU35QQKbY5ylqUI
 GdKVQXN1bKWcrPpJx+N9ER57NjaiODJEQtpugNt5PgEHVPZ4bZmsfPb7oJt12ZsE
 Z510oTRVDzKp/t6dKAdwnGLsa3+Yc9XIixekEnhQfr9CUEkrc4+VRmrQWkTEfeEQ
 zH4RVf4Rf5iC5aDKmW0fJhO7b/ZWryKqGoHwi4O+5GoISxe9fFMIrndCAzVtUDie
 Vuw9jNRXl7mEivbKcTp5doz+3AFS9N/jFKy+J6Zi27bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+SMPea
 lCjSq/PwFRY80381eUIBTCEdDPlWwxCC9pVsc=; b=XkBGjbTNEoP/2XZ0G6A9Sh
 dnPqmUfDFiW3R+fwP5qFoYb+f/0bjcOzcp/94ndZsmQUY/wbI8+pUtNzsZcPLaXN
 S/Jcg3LzeOWEBI5oKUx3eLzXkImXfmh2Jkx/SxoeYZk08ebKzpJ9G/Rh1JM3Q18O
 DpAZLqUySqIC+y2x9sF8l6ypycVT+fPsN2RfmU5CJUDSg/iU4g6I3IffHt79bf0n
 lmLwAw8wllK/hzX2le/MGa62JTjFYl/Lqm+4m+w2Pv4cI6KTNattg+OYu/n0eDTI
 VH4M9X2r2fTEmhmMcSV+9Ax5Gs42qg3+lTYhdflknes+hWDfrNkD7iBulxoV8kmA
 ==
X-ME-Sender: <xms:UMk3YHbFD9pemCouU6D2WuXM6zm7sYHYJw17ueKFqWMNHKNwzEhxpg>
 <xme:UMk3YGYz3ahhSRDzjdtdp_UF6XpIjzuxkag_5vaXVGQoDEWGbaQ3Iq7YmkWVMiQN8
 _urFmigJMmBZ81eP3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UMk3YJ_exG8mUIgEVkcURn-iHV7ukSol15ZakzDoK-qQpO8ZoWONfg>
 <xmx:UMk3YNoPTdhNC0xHwR6lGl2nUR38KvVPotHIJY35ef36cyDW5N-7lw>
 <xmx:UMk3YCpgSTrU8yHGrxWdOOBE6LO1SbuxZOBcYh5CbggoGmLZya6srQ>
 <xmx:U8k3YIigYUIizC5-g3PSSHEZcePHWOeiultvpMlUePIWeOqXsQWJZo-9Pac>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 935F7240066;
 Thu, 25 Feb 2021 10:59:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Thu, 25 Feb 2021 16:59:01 +0100
Message-Id: <20210225155909.1853812-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here is a series that enables the higher resolutions on the HDMI0 Controller
found in the BCM2711 (RPi4).

In order to work it needs a few adjustments to config.txt, most notably to
enable the enable_hdmi_4kp60 and force_turbo options.

The firmware also has a glitch at the moment and will not properly release the
BSC controllers, which will make the EDID retrieval fail.

We can work around this using the following config.txt options:

disable_fw_kms_setup=1
hdmi_edid_file:0=1
hdmi_edid_filename:0=1366x768.bin
hdmi_ignore_edid:0=1
hdmi_edid_file:1=1
hdmi_edid_filename:1=1366x768.bin
hdmi_ignore_edid:1=1

A fix will come for the firmware eventually.

Let me know what you think,
Maxime

Maxime Ripard (8):
  clk: Add range accessors
  drm/vc4: hvs: Make the HVS bind first
  drm/vc4: hdmi: Properly compute the BVB clock rate
  drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies
  drm/vc4: hdmi: Enable the scrambler
  drm/vc4: hdmi: Raise the maximum clock rate
  drm/vc4: plane: Fix typo in scaler width and height
  drm/vc4: plane: Remove redundant assignment

 drivers/clk/clk.c                   | 30 ++++++++++
 drivers/gpu/drm/vc4/vc4_drv.c       | 11 +++-
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 88 ++++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  8 +++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 +
 drivers/gpu/drm/vc4/vc4_plane.c     |  5 +-
 include/linux/clk.h                 | 16 ++++++
 7 files changed, 148 insertions(+), 13 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
