Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58B29E5EE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33E36E860;
	Thu, 29 Oct 2020 08:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD56D6E511
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:41:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1B0D458011D;
 Wed, 28 Oct 2020 08:41:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 28 Oct 2020 08:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YV64uopMbyk+l
 jh3jD2H2gsU90HCtGrUQE6tlckPFVY=; b=TpPxR9ywpYvwMADzDxd5Kc1DB0Si3
 D5qSoP4QV6pEbt/C/0yzv662lwI3BpW5V7PlgkMnfDRN4AYIx7CAkFlLesulMn3G
 lHpBsr2nSmwbXOaRP+xGmRVKTOFYe+PG4EI42qDERiUaEh9y9Vu3yYM7NjwgLANn
 fm+QEUHP3qWt2McoTXy8XdIbbm/TXmWfWd/M2Rrso4fBXr/zJltPZxzBvyOWeFNv
 ZlMMswj1kOR5huMXTJMZA3U3dCm+jYWtq3+mS5yjbrqtwUs+stSyy78E9JSREP+n
 eOa7vky2oThikhndk/8GG0MIr6EbUTIYfa7yQIMTP5Id/rkC8/4pymiBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YV64uopMbyk+ljh3jD2H2gsU90HCtGrUQE6tlckPFVY=; b=A05QqL/Z
 GBE1MQumV9YLoAr8F4jm+PyAHO4raGnQ8Td5IPPI4iNJO7Py+JVK1uf2g9qTNZ8q
 1MD21sBMg0BmKvpC9VEZ9sihYsTRZdLs3NFcdMUI3onaAIsB64JQ5oO5q3i/SB+N
 9IM/1FPRXYPxVXpknZtxNyn4+LBFLXd6aYdbu3YC4OGlRmxLExnmjNgJKESgmxcQ
 caz8eHzixZEdQ5KViMWqwOEwY7wssUAXxoHac5Dy7QYzJurzdp5q3obZw4eDFel4
 Q9ofBp58EGqZhjDhdBtjEKCDETE6g3U+NL7nd+cUiL7z2dJkh7r7mJs6AWIHlOIA
 h59ltZB0+uiy4w==
X-ME-Sender: <xms:5GaZX8LrwV4HgxsHHwurjY2yaYQpAzewhv3EwwS2p_Cp_TThXUQAJg>
 <xme:5GaZX8LJL20K3TwHVuvL3A-KDQv8UDxIbbSEM1eCmtXC4BVG8b30pHXhcVOghQ1gc
 -IRJNBjjANXqWMcDyk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5GaZX8uL1Z7Oz6ovNeAJLJ0HSmA4Zu09jJ-2CG57Ij8IGlnupDjqbg>
 <xmx:5GaZX5ZTjKoCYLLOJVW4AcG0ArXPsZmUN3NHNHbN3hl_E1NqsL5-0w>
 <xmx:5GaZXzYfZA9vo-AqKIM2YwhpHY0s9C3hnVSCHhmu-T_jtzvcrA-81Q>
 <xmx:5WaZX0KmCmL5_MdE5eNS8zhxKTtThHWIhhEmN6F9jXInDXqauoH59Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FFDC306467D;
 Wed, 28 Oct 2020 08:41:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 2/7] drm/vc4: kms: Rename NUM_CHANNELS
Date: Wed, 28 Oct 2020 13:40:59 +0100
Message-Id: <1e4559e4018d360f0bc6b6ee287a96f94954d9d9.1603888799.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NUM_CHANNELS define has a pretty generic name and was right before the
function using it. Let's move to something that makes the hardware-specific
nature more obvious, and to a more appropriate place.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f8081c996193..80378c74fcd6 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -24,6 +24,8 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
+#define HVS_NUM_CHANNELS 3
+
 struct vc4_ctm_state {
 	struct drm_private_state base;
 	struct drm_color_ctm *ctm;
@@ -609,12 +611,11 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 	.atomic_destroy_state = vc4_load_tracker_destroy_state,
 };
 
-#define NUM_CHANNELS 3
 
 static int
 vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
-	unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
+	unsigned long unassigned_channels = GENMASK(HVS_NUM_CHANNELS - 1, 0);
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
 	int i, ret;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
