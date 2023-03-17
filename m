Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D06BE30F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BF110E3C8;
	Fri, 17 Mar 2023 08:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16E010E3A8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:22:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8EAB6220B;
 Fri, 17 Mar 2023 08:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D623C4339B;
 Fri, 17 Mar 2023 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041348;
 bh=yZJ5IBm9dFS2XXYpL5CBZgVVsT35Dw5hBK+6hvNUT8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bnt5dwRXzAT8g8Rn+stCTxR51oyWxbmHW+3VzZNWAahyag/ZkBNCj23EblORlaoEv
 VG1OYG55040uESW1g9p3+xYEqlg3qLmGA/QxK/xM4xoDkHbrcdOqwTeWPNfF+6WHp2
 16gWT8Y8ZihSZQYa4P5VYMBsq52ayKpqXtaIJt+Ft+8l714nkLIalqLVnl8Qk2EcF2
 Qsb3knnNgv3zLNSsMu0okXpOtL1ZUOfEWBir1LWcFlW/ejQVCmGo+vzzk6S8u1ee69
 lo60b4Rmb47etsAigUq7hjfA0mL36PIvI1wSAqmRhHgdxqoHTjlTahC1Du/lowDOaq
 Kya+jk0hUuZ6w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/37] drm/xlnx/zynqmp_dp: Fix function name
 zynqmp_dp_link_train() -> zynqmp_dp_train()
Date: Fri, 17 Mar 2023 08:16:45 +0000
Message-Id: <20230317081718.2650744-5-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/xlnx/zynqmp_dp.c:793: warning: expecting prototype for zynqmp_dp_link_train(). Prototype was for zynqmp_dp_train() instead

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 0a7b466446fb6..a0606fab0e22c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -784,7 +784,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 }
 
 /**
- * zynqmp_dp_link_train - Train the link
+ * zynqmp_dp_train - Train the link
  * @dp: DisplayPort IP core structure
  *
  * Return: 0 if all trains are done successfully, or corresponding error code.
-- 
2.40.0.rc1.284.g88254d51c5-goog

