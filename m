Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B24062B637
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8905C10E44E;
	Wed, 16 Nov 2022 09:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF90D10E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:17:21 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C08A5C0151;
 Wed, 16 Nov 2022 04:17:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 16 Nov 2022 04:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1668590237; x=1668676637; bh=MCvPBYbjxykSnjdfqUtaIxnpE
 1B6yqqF7GXfuyGvVOI=; b=dO/v0G3wJ8TREFwtdS1CDz3bKPHvIqpmc3GtXX/fq
 3dDT5mnZ3Ng3zriziW+FVjmrlZzIEH8GVXALhg2T3CtS9fpr0P4y1BYfQdJN7uCe
 lzXiYYDeRqcVWBBwyXfog0SFXO86EvvGbD7qMVmntb6+IZd8W1zLrZ7F2J6+TFs9
 qDCTA0zYDwleITAF7aLQbqUpQCUkGNP1++Kl91SvpX68aDJ7rD3XSZh0O95uL6jM
 xnMoxBSKakLo9bdEDwllaYJP7vgyn+K2cjD86CqlkO0XPYUcWsoceyZsVoyl8s7A
 MYQMulYXC+7KPQRifCB4yhZFioMpxEko/4JdmN5koF6bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1668590237; x=1668676637; bh=MCvPBYbjxykSnjdfqUtaIxnpE1B6yqqF7GX
 fuyGvVOI=; b=nPLgsbc+B49vRy2dxVrxPDnqox7ZyDozmKjSCQIrTANbMAawYYi
 cd3+8ni5Q4IBIEUMH/0Er8BBLOroMEZJibkccb31d5M6mdjIj2yTA6U4i41q0KLg
 pGFD2Kjj6jLlobZGM2WnLaIVi+DlVIWsCcoT3ylPSWOXZkT575tZTwdA47QbAjOr
 MdNnzsIpWj7FDmdF5aTo9gh1TNZzW0Mprzcwr8gIcAh3AmdK3vRiM3s6oMPsIwkC
 XoIe8w6rGOnrDz2EC+ng81QyWFDLysDfxh7UxIKWA+RFHCQv7RMCXZK5VC3i5FWc
 Xgfo9H7rUfvRZQg5RVmjryaKAakAaHUzCmg==
X-ME-Sender: <xms:m6p0Y_9kg2vixKun5LJhw0gZP0UGsBsw2EutFC5_vnt1umRI5hkKAg>
 <xme:m6p0Y7s2uViLAysaIAOztmgarOW5rnE-APSEr_x-2oNDC0N_0vq4r25jsqLgsB9XV
 CBJx6660utbYFk4Ht4>
X-ME-Received: <xmr:m6p0Y9CnzMOW16-Sw1p30D4PyPZUzfOvOZwReBK6SJIQkXSRmWhcOiC7lFGOQBVrG4G86KuqU5SvLirB1ZVeweVmdYVGhG8yDRJfhoL7KrbJbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:m6p0Y7e_i5XLD_P5gERVk9oUxuEF9pXe0xnvDqzfUc9jCIy4HYNwLg>
 <xmx:m6p0Y0PPtuXu3vxRal5aIAP2iCJxH7Mpa84s7iOlmNg8gYEIyE3Efg>
 <xmx:m6p0Y9kNt7lAaJXsTkujjsnCcRP9_CNQcoNAtJj0UxJT-wvc0_v6wQ>
 <xmx:nap0Y_ECN7Cteb8kZaDfYJvvR_8SqVG-w2jEcujq816oBXWt_jknUQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 04:17:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/3] drm/tests: Include helpers header
Date: Wed, 16 Nov 2022 10:17:10 +0100
Message-Id: <20221116091712.1309651-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kunit helpers code weren't including its header, leading to a
warning that no previous prototype had been defined for public
functions.

Include the matching header to fix the warning.

Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index d3f0d681b685..dbd8ec24d4be 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -5,6 +5,8 @@
 
 #include <linux/device.h>
 
+#include "drm_kunit_helpers.h"
+
 struct kunit_dev {
 	struct drm_device base;
 };
-- 
2.38.1

