Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27C6EFD45
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2D10EA29;
	Wed, 26 Apr 2023 22:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344EB10E55A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 22:37:22 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6C3E920210;
 Thu, 27 Apr 2023 00:37:19 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Apr 2023 00:37:18 +0200
Subject: [PATCH v4 04/22] drm/msm/dpu: Reindent REV_7xxx interrupt masks
 with tabs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v4-4-27ce1a5ab5c6@somainline.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use tabs for consistency with the other interrupt register definitions,
rather than spaces.

Fixes: ed6154a136e4 ("drm/msm/disp/dpu1: add intf offsets for SC7280 target")
Fixes: 89688e2119b2 ("drm/msm/dpu: Add more of the INTF interrupt regions")
Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 85c0bda3ff90e..17f3e7e4f1941 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -32,15 +32,15 @@
 #define MDP_AD4_INTR_EN_OFF		0x41c
 #define MDP_AD4_INTR_CLEAR_OFF		0x424
 #define MDP_AD4_INTR_STATUS_OFF		0x420
-#define MDP_INTF_0_OFF_REV_7xxx             0x34000
-#define MDP_INTF_1_OFF_REV_7xxx             0x35000
-#define MDP_INTF_2_OFF_REV_7xxx             0x36000
-#define MDP_INTF_3_OFF_REV_7xxx             0x37000
-#define MDP_INTF_4_OFF_REV_7xxx             0x38000
-#define MDP_INTF_5_OFF_REV_7xxx             0x39000
-#define MDP_INTF_6_OFF_REV_7xxx             0x3a000
-#define MDP_INTF_7_OFF_REV_7xxx             0x3b000
-#define MDP_INTF_8_OFF_REV_7xxx             0x3c000
+#define MDP_INTF_0_OFF_REV_7xxx		0x34000
+#define MDP_INTF_1_OFF_REV_7xxx		0x35000
+#define MDP_INTF_2_OFF_REV_7xxx		0x36000
+#define MDP_INTF_3_OFF_REV_7xxx		0x37000
+#define MDP_INTF_4_OFF_REV_7xxx		0x38000
+#define MDP_INTF_5_OFF_REV_7xxx		0x39000
+#define MDP_INTF_6_OFF_REV_7xxx		0x3a000
+#define MDP_INTF_7_OFF_REV_7xxx		0x3b000
+#define MDP_INTF_8_OFF_REV_7xxx		0x3c000
 
 /**
  * struct dpu_intr_reg - array of DPU register sets

-- 
2.40.1

