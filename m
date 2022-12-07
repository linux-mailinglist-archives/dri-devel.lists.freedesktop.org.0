Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA45D645113
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBC610E17E;
	Wed,  7 Dec 2022 01:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6E210E167
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b13so15480031lfo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDsYBVCwBeS0Phubq4Y5R1Q3bo1kNIeEHtnGSCsuvdc=;
 b=WIeRLvryx3Aig7sR+0eNRODQewWhB11fKBZEyycLmhb2SPYjCKnIKl02tC8ABUfos1
 qjk7fmZldSf8gmuwaLzRmyYivjrfXEvylLhukbhF9dUrorJBj9PiInkmFBwaizq0W3bq
 C+3LYqTpyii6bEI8z9wBwPrdT2nzLbP9vKTomKHqwIgQ2eGGGrjZVkIlZPL4Ydjk7WWa
 0AA4T1BMjwMaSKOsPhD0Xv2G61t94X2qZHnIfi5nKWxLyb4pEDIoyExTqRCPcJMR1YS0
 xs7eKGrNezMjBo8cTg2BM9EcZ0fBVYjwDL0P0uc+H5/7dz9JyMw0eGjHHO6yYJhSBlyg
 fMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDsYBVCwBeS0Phubq4Y5R1Q3bo1kNIeEHtnGSCsuvdc=;
 b=SGjDMlhG0j+SvIT0EqpVqgC/eQikRZ6ObdbErXHq7YqJQnHJVorRltKQQzonWU/OFZ
 v2IYwzPCpX//0k0w07euAdQ0ajZoMYnlFa+dYojFdikNsKELY2JysNYNCN5F5ANnFvZ8
 ehiV/aUJWgsuHP6GjbjT1LpEKtLYPgfYjPRhc5kRexZ1a/FBqA1lUViyNGCTf7isQp2k
 mPG1pz7tIbb39+WNxHW73rtZZIVNUgeFK3lX8QaziQs7wDkhHHdRS59WiEoI/ZYFPfQ4
 PBd5JgtUNm7I9mLWgxerfn74EzETmJQ0BPAH5u4TdcrxxtOQifUrzCDXtB7z2Fb/UCwl
 JnTg==
X-Gm-Message-State: ANoB5pnBTmF4kx4A/noenIpKgYoAuggo3SzVtu4FkdnyOvsd2CGIYoIz
 sfnNNpM+VZu+TI5SnkTmG21ViA==
X-Google-Smtp-Source: AA0mqf72ZeS3Bvn49p/dDmTgu2JYJRpMCCYkvQjZJPMT+0IsM2oqrwbbL2aUpYZPBAHHEOp7Ow9aPA==
X-Received: by 2002:a19:2d52:0:b0:4b1:dc42:6f85 with SMTP id
 t18-20020a192d52000000b004b1dc426f85mr28435282lft.568.1670376159274; 
 Tue, 06 Dec 2022 17:22:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 08/11] drm/msm/dpu: merge all MDP TOP registers to
 dpu_hwio.h
Date: Wed,  7 Dec 2022 03:22:28 +0200
Message-Id: <20221207012231.112059-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a separate header containing some of MDP TOP register
definitions, dpu_hwio.h. Move missing register definitions from
dpu_hw_top.c to the mentioned header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 25 ----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h   | 18 ++++++++++++++++
 2 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c3110a25a30d..2bb02e17ee52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -7,40 +7,17 @@
 #include "dpu_hw_top.h"
 #include "dpu_kms.h"
 
-#define SSPP_SPARE                        0x28
-
 #define FLD_SPLIT_DISPLAY_CMD             BIT(1)
 #define FLD_SMART_PANEL_FREE_RUN          BIT(2)
 #define FLD_INTF_1_SW_TRG_MUX             BIT(4)
 #define FLD_INTF_2_SW_TRG_MUX             BIT(8)
 #define FLD_TE_LINE_INTER_WATERLEVEL_MASK 0xFFFF
 
-#define DANGER_STATUS                     0x360
-#define SAFE_STATUS                       0x364
-
-#define TE_LINE_INTERVAL                  0x3F4
-
 #define TRAFFIC_SHAPER_EN                 BIT(31)
 #define TRAFFIC_SHAPER_RD_CLIENT(num)     (0x030 + (num * 4))
 #define TRAFFIC_SHAPER_WR_CLIENT(num)     (0x060 + (num * 4))
 #define TRAFFIC_SHAPER_FIXPOINT_FACTOR    4
 
-#define MDP_WD_TIMER_0_CTL                0x380
-#define MDP_WD_TIMER_0_CTL2               0x384
-#define MDP_WD_TIMER_0_LOAD_VALUE         0x388
-#define MDP_WD_TIMER_1_CTL                0x390
-#define MDP_WD_TIMER_1_CTL2               0x394
-#define MDP_WD_TIMER_1_LOAD_VALUE         0x398
-#define MDP_WD_TIMER_2_CTL                0x420
-#define MDP_WD_TIMER_2_CTL2               0x424
-#define MDP_WD_TIMER_2_LOAD_VALUE         0x428
-#define MDP_WD_TIMER_3_CTL                0x430
-#define MDP_WD_TIMER_3_CTL2               0x434
-#define MDP_WD_TIMER_3_LOAD_VALUE         0x438
-#define MDP_WD_TIMER_4_CTL                0x440
-#define MDP_WD_TIMER_4_CTL2               0x444
-#define MDP_WD_TIMER_4_LOAD_VALUE         0x448
-
 #define MDP_TICK_COUNT                    16
 #define XO_CLK_RATE                       19200
 #define MS_TICKS_IN_SEC                   1000
@@ -48,8 +25,6 @@
 #define CALCULATE_WD_LOAD_VALUE(fps) \
 	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
 
-#define DCE_SEL                           0x450
-
 static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 		struct split_pipe_cfg *cfg)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
index c8156ed4b7fb..86c423e63b61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
@@ -16,6 +16,7 @@
 #define INTR_CLEAR                      0x018
 #define INTR2_EN                        0x008
 #define INTR2_STATUS                    0x00c
+#define SSPP_SPARE                      0x028
 #define INTR2_CLEAR                     0x02c
 #define HIST_INTR_EN                    0x01c
 #define HIST_INTR_STATUS                0x020
@@ -28,7 +29,15 @@
 #define DSPP_IGC_COLOR0_RAM_LUTN        0x300
 #define DSPP_IGC_COLOR1_RAM_LUTN        0x304
 #define DSPP_IGC_COLOR2_RAM_LUTN        0x308
+#define DANGER_STATUS                   0x360
+#define SAFE_STATUS                     0x364
 #define HW_EVENTS_CTL                   0x37C
+#define MDP_WD_TIMER_0_CTL              0x380
+#define MDP_WD_TIMER_0_CTL2             0x384
+#define MDP_WD_TIMER_0_LOAD_VALUE       0x388
+#define MDP_WD_TIMER_1_CTL              0x390
+#define MDP_WD_TIMER_1_CTL2             0x394
+#define MDP_WD_TIMER_1_LOAD_VALUE       0x398
 #define CLK_CTRL3                       0x3A8
 #define CLK_STATUS3                     0x3AC
 #define CLK_CTRL4                       0x3B0
@@ -43,6 +52,15 @@
 #define HDMI_DP_CORE_SELECT             0x408
 #define MDP_OUT_CTL_0                   0x410
 #define MDP_VSYNC_SEL                   0x414
+#define MDP_WD_TIMER_2_CTL              0x420
+#define MDP_WD_TIMER_2_CTL2             0x424
+#define MDP_WD_TIMER_2_LOAD_VALUE       0x428
+#define MDP_WD_TIMER_3_CTL              0x430
+#define MDP_WD_TIMER_3_CTL2             0x434
+#define MDP_WD_TIMER_3_LOAD_VALUE       0x438
+#define MDP_WD_TIMER_4_CTL              0x440
+#define MDP_WD_TIMER_4_CTL2             0x444
+#define MDP_WD_TIMER_4_LOAD_VALUE       0x448
 #define DCE_SEL                         0x450
 
 #endif /*_DPU_HWIO_H */
-- 
2.35.1

