Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B46E51A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A0310E5E6;
	Mon, 17 Apr 2023 20:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9B310E5DA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 20:21:49 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BE0B53F8B8;
 Mon, 17 Apr 2023 22:21:47 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Apr 2023 22:21:45 +0200
Subject: [PATCH v2 06/17] drm/msm/dpu: Remove extraneous register define
 indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A bunch of registers are indented with two extra spaces, looking as if
these are values corresponding to the previous register which is not the
case, rather these are simply also register offsets and should only have
a single space separating them and the #define keyword.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 41 +++++++++++++++--------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index b9dddf576c02..1d22d7dc99b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -38,26 +38,27 @@
 #define INTF_ACTIVE_DATA_HCTL           0x068
 #define INTF_FRAME_LINE_COUNT_EN        0x0A8
 #define INTF_FRAME_COUNT                0x0AC
-#define   INTF_LINE_COUNT               0x0B0
-
-#define   INTF_DEFLICKER_CONFIG         0x0F0
-#define   INTF_DEFLICKER_STRNG_COEFF    0x0F4
-#define   INTF_DEFLICKER_WEAK_COEFF     0x0F8
-
-#define   INTF_DSI_CMD_MODE_TRIGGER_EN  0x084
-#define   INTF_PANEL_FORMAT             0x090
-#define   INTF_TPG_ENABLE               0x100
-#define   INTF_TPG_MAIN_CONTROL         0x104
-#define   INTF_TPG_VIDEO_CONFIG         0x108
-#define   INTF_TPG_COMPONENT_LIMITS     0x10C
-#define   INTF_TPG_RECTANGLE            0x110
-#define   INTF_TPG_INITIAL_VALUE        0x114
-#define   INTF_TPG_BLK_WHITE_PATTERN_FRAMES   0x118
-#define   INTF_TPG_RGB_MAPPING          0x11C
-#define   INTF_PROG_FETCH_START         0x170
-#define   INTF_PROG_ROT_START           0x174
-#define   INTF_MUX                      0x25C
-#define   INTF_STATUS                   0x26C
+#define INTF_LINE_COUNT                 0x0B0
+
+#define INTF_DEFLICKER_CONFIG           0x0F0
+#define INTF_DEFLICKER_STRNG_COEFF      0x0F4
+#define INTF_DEFLICKER_WEAK_COEFF       0x0F8
+
+#define INTF_DSI_CMD_MODE_TRIGGER_EN    0x084
+#define INTF_PANEL_FORMAT               0x090
+#define INTF_TPG_ENABLE                 0x100
+#define INTF_TPG_MAIN_CONTROL           0x104
+#define INTF_TPG_VIDEO_CONFIG           0x108
+#define INTF_TPG_COMPONENT_LIMITS       0x10C
+#define INTF_TPG_RECTANGLE              0x110
+#define INTF_TPG_INITIAL_VALUE          0x114
+#define INTF_TPG_BLK_WHITE_PATTERN_FRAMES 0x118
+#define INTF_TPG_RGB_MAPPING            0x11C
+#define INTF_PROG_FETCH_START           0x170
+#define INTF_PROG_ROT_START             0x174
+
+#define INTF_MUX                        0x25C
+#define INTF_STATUS                     0x26C
 
 #define INTF_CFG_ACTIVE_H_EN	BIT(29)
 #define INTF_CFG_ACTIVE_V_EN	BIT(30)

-- 
2.40.0

