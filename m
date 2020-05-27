Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04441E5958
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA776E432;
	Thu, 28 May 2020 07:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E18D6E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 95A4F582007;
 Wed, 27 May 2020 11:49:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9VNSPM39dPjV/
 5EKHPEmX5F0pfjtv/pW8b8YIRJwQsE=; b=Zu2ERzNbysuyjRUW9ui7IOax81fJn
 /PuKKzKalOtkCUNlbWOtj/awsnqJMz5hfCLySk4u2DdholnRmwlJOzECoclBO1Ll
 m/1vSvCub4hMOknEiRfnSx1Uh6eF5ZxWUqNbual67rDF7LZskuaOhhiBKE08GZxj
 o/EchnMpcZiD6Vr5raNkNp6lIlEnTZcLKSDvda46Jvh70ZUyKf8mSVIDxLs9QxUd
 sMsWGCe4JDnK4btlzDe97w6VWiTvv1oIPiFG3masPYVS8j0x4furil5JP/Tuq+7Y
 2Hy6lQwIQKZ4Q4z6QAW8oxJvaWnEayP1D9viwssMLIv1eY5FQ7qx7Yi0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9VNSPM39dPjV/5EKHPEmX5F0pfjtv/pW8b8YIRJwQsE=; b=TGcyIT+6
 ZJksWnbv04zfv4ORiD9qWzVEvqr5FW9haI32kWovSBeWt0Mfm/f0Le1mXsxHpErc
 9lBSifKVS3jaGEpQDsga7l0P4MMdKoaWD94IC4ncHRtTphGXNytbPybU2NqDUd+T
 tW4kstJWIMZIJJE1Nt8a3k9BhJyzenL+KwX6IETBs1/xd9dRt0vMEaXAIjrWO3Nw
 otNmRPqgiRbdP5l8S+nK8iOQAnygZtW3U2c0SKRZiDgnQ7N5ViToy1iNYPbSyACy
 xL74QIq1sy9ZJccKLspswGfnUMGDK5ME3bKjuR94wRHeO2RYYqHCC4vV5a/wyPv/
 dTgV80+s0eD8Dg==
X-ME-Sender: <xms:DozOXghRpF60Ats_V7Pkd_YqvkD-DOcLC2keMa3KmBPbnQJ710-HKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DozOXpDMGdhqpWrzgU4B46gDGudNCfHulI-g2mhR3I7P5YVaw2xWqg>
 <xmx:DozOXoHR5Zyv2niY-HoCGqBlEO8skX2XC9qxvxnbwu4WQC9hjqSFtw>
 <xmx:DozOXhSG440H8499WEPUXZCmFm6n9nEI-v1FHoWWk4d63jBI30TrBQ>
 <xmx:DozOXsyaz7VNj9GjcpHT0DqV2ZcxX2YHJfBhSqz-Vp3dIRiNUV5zjw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 052973062499;
 Wed, 27 May 2020 11:49:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 011/105] drm/vc4: drv: Add include guards
Date: Wed, 27 May 2020 17:47:41 +0200
Message-Id: <68e89e315c4c35b313efc277c9642eca684e0ade.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_drv.h doesn't have any include guards which prevents it from being
included twice. Let's add them.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 3b1f02efefbe..6f50a91e3933 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -2,6 +2,8 @@
 /*
  * Copyright (C) 2015 Broadcom
  */
+#ifndef _VC4_DRV_H_
+#define _VC4_DRV_H_
 
 #include <linux/delay.h>
 #include <linux/refcount.h>
@@ -897,3 +899,5 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file_priv);
 int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv);
+
+#endif /* _VC4_DRV_H_ */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
