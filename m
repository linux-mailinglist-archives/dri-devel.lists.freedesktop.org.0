Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17173F1B17
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 16:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E08F6E98C;
	Thu, 19 Aug 2021 14:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A173A6E98C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:00:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 40B5C2B00973;
 Thu, 19 Aug 2021 10:00:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 19 Aug 2021 10:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=N3jSN24OkJ7Dh
 /8CWHl9T0L42ugnuJaEB9P5An/GD+g=; b=ePvi3Mnh3YLXbZZIsBDANoJ4LPuL5
 BrU2VEQO5uFxEvPuwgp7+nB843ZngA/6PmVWUJuGsI8bVLnBlwTGUglWifYytP8r
 jmh2e6xFbOp4Qpe7nt+MUmQLQo8YGox1A9oDZY+j6eO6byttcSRBDfy0TJ4a3eKY
 Uyt1DvW4Ye5ku9f+9VPosiSoAeF579A++LVPpqjNtYDwgmgkqZe6U9RwZAo+5frU
 SN842X6zO98gFQKDIqopA6kcWHv/qeB3zvpx9BV5nc+vccHG4cZ39aNrBYkDZY1c
 jpmAcx3RHykJ+w9iRggJLTwwpJKKMuO6OYlroNTdBnAbRsQ72/KtGtF3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=N3jSN24OkJ7Dh/8CWHl9T0L42ugnuJaEB9P5An/GD+g=; b=QfByrOPv
 wIO7bt41iSdpU4PMJ/8JfsjLGcTz2484pwMs76C4JCPCrgldag5S3EAIlYV5ka+/
 BrzHPMS8Dpa9AsJCdBKSmucUV2R7Cwr440BzwRxxaecwpGmr+J76TuZC4xWVrrt5
 ljKsWD2Xo5yDGV+AkNT+FOiaiSKABtgRexNP1dmzwqtbOjFs/gfhnRupAN/o8vyB
 7Q5Teaq5ELHQeInVpqPYVl61ZGWYLcUV9SNsbIdcXRUubdHOrk0QoEkEe5fhsSZV
 q4AQxwS0/THR+3h37EhPo03GiGPUYyRaEwtd1c4kySyJFPpykogs3ZAUGC+Bxmya
 y46ao/bQP5ifEg==
X-ME-Sender: <xms:4mMeYTiCsQLcdqefM9b9LfPbT987pw19NIjWS7q2nSbU25xR0bFvZA>
 <xme:4mMeYQDeKIRvUKIno7TNo_ebntGhYEeY8j9RkNbhjr-mmX_9C7Jzg7k_bw1mXzrFH
 LqcMJ6R0hXrIuzrHM4>
X-ME-Received: <xmr:4mMeYTHeOpya2hScQDWHenCswdbf9ZDRXvGXHZ4MvfKISMgjPmOdoW30UOkneTI8a1SU1mEu8kgX0vSx9b1yy6cpjyjRMvNNlwVE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4mMeYQQNwAAVOioWkfdbZQgIWfqDYM3AYQTpZ3tTQ5x-nSihkfshLg>
 <xmx:4mMeYQznapFvQNRZjdTWHagJKEXBioRlsjO90hk4cVwtuTYEkSxepw>
 <xmx:4mMeYW7ED95sWShh6nuJ6iA9zVobIMSB8_bDcb5yoBotOKZEvRLw2A>
 <xmx:4mMeYVhl0ugsFAIdMBX5bgKQpLIIUzLj2Gh29dt1HqqisPk8LvFFz6sDN9I>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 10:00:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 6/6] drm/vc4: hdmi: Warn if we access the controller while
 disabled
Date: Thu, 19 Aug 2021 15:59:31 +0200
Message-Id: <20210819135931.895976-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819135931.895976-1-maxime@cerno.tech>
References: <20210819135931.895976-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had many silent hangs where the kernel would look like it just
stalled due to the access to one of the HDMI registers while the
controller was disabled.

Add a warning if we're about to do that so that it's at least not silent
anymore.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 19d2fdc446bc..99dde6e06a37 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -1,6 +1,8 @@
 #ifndef _VC4_HDMI_REGS_H_
 #define _VC4_HDMI_REGS_H_
 
+#include <linux/pm_runtime.h>
+
 #include "vc4_hdmi.h"
 
 #define VC4_HDMI_PACKET_STRIDE			0x24
@@ -412,6 +414,8 @@ static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
+	WARN_ON(!pm_runtime_active(&hdmi->pdev->dev));
+
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
@@ -438,6 +442,8 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
+	WARN_ON(!pm_runtime_active(&hdmi->pdev->dev));
+
 	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
-- 
2.31.1

