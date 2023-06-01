Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E622271F007
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E9410E591;
	Thu,  1 Jun 2023 17:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7818610E247;
 Thu,  1 Jun 2023 17:00:24 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 15043CFC92;
 Thu,  1 Jun 2023 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685638822; bh=Jm/DdiEm/EekWEu0ec6gDTbUQ0p4VEB89p93cuEm6n4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=AlU5UvedF4QUAVYwX4BDXDHpiAuc4iOLwpIdq39UeU8zYn0OTNsV6dQZAjUwXPtKo
 JBZ7/NgEH10zNtk3VVzwQbZziA7q5rfsWGvlkTaobCTYvN39DXml4jCsXHEJ+nR6Lx
 eZTMyZMWSQprU8YFYbFthPh+HmmHbt7+WYO0FsBw=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 01 Jun 2023 19:00:11 +0200
Subject: [PATCH v3 4/7] drm/msm/mdp5: Add MDP5 configuration for MSM8226
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v3-4-b6284145d67a@z3ntu.xyz>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=Jm/DdiEm/EekWEu0ec6gDTbUQ0p4VEB89p93cuEm6n4=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkeM6fYU+7o/XkxueT0obX8SuJUz4ZGFUVdqcb0
 sha9DpnFO+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHjOnwAKCRBy2EO4nU3X
 Vkl3D/0XJavl8qtEyvMTHH4vkLUEAc0Zx5egxwfV/0TpHTmC0VGddlo/czdAKGuJ19vdWDiDuIJ
 dQzmegIs0katqQzMl/MOkNr/y6KHGovc403DCZMdj8nmjQNZa/l3pY5OmuJ4FjyBv/qyppj6owo
 JcUPzkTmRgIR1cYoN02Bcjo4AWbk5oK+uaXvNNzEiE4+DIqtQhBhuJ5CFmBWHOqUtOiMiUWB0FR
 wjgnpHFPyAmlHDS3W3dxXXLrOKVEFXYlbMqxOmDstzf+2MIcXOEXPcsu8z+z+FDPDiCXOooWf1D
 R9DF+i/x428eyS/3MkVUgprJWk1Z9AcXRC53y9yd/HzKFYl5F8lf60rswmphgubUnhHir85CCXr
 j9eX4vDHX1FTWbtAe9uZLbalQXn6pm0ufxUvJ26gCzG2Dsx3tRP0+0ipDaFiC7BTzTVpS5Wl668
 o7CqAnZXU7oVOkhebQ1PeSHz1uiYtuC4IGOzrRuYrrQEUuPqt5UHsfuB7tpxbgM99ixZ6IFQFwJ
 RGTCKFS7/FvgfwhXV/aD4jALXBKAkWeREkkEfuwl4W5VlFbIcntFjtiAXCNbHwby5sDJDq0UVTB
 VoS0perIoe2cwXx/rV3oB1I7MTX08Ncdbhf0jmPmxVcKVbEqJduwEB+No1eIqd1mt7KnNUNW04+
 mNStLDtRH0J7GLw==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the required config for the v1.1 MDP5 found on MSM8226.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 2eec2d78f32a..694d54341337 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -103,6 +103,87 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
 	.max_clk = 200000000,
 };
 
+static const struct mdp5_cfg_hw msm8x26_config = {
+	.name = "msm8x26",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_SMP |
+			0,
+	},
+	.smp = {
+		.mmb_count = 7,
+		.mmb_size = 4096,
+		.clients = {
+			[SSPP_VIG0] =  1,
+			[SSPP_DMA0] = 4,
+			[SSPP_RGB0] = 7,
+		},
+	},
+	.ctl = {
+		.count = 2,
+		.base = { 0x00500, 0x00600 },
+		.flush_hw_mask = 0x0003ffff,
+	},
+	.pipe_vig = {
+		.count = 1,
+		.base = { 0x01100 },
+		.caps = MDP_PIPE_CAP_HFLIP |
+			MDP_PIPE_CAP_VFLIP |
+			MDP_PIPE_CAP_SCALE |
+			MDP_PIPE_CAP_CSC   |
+			0,
+	},
+	.pipe_rgb = {
+		.count = 1,
+		.base = { 0x01d00 },
+		.caps = MDP_PIPE_CAP_HFLIP |
+			MDP_PIPE_CAP_VFLIP |
+			MDP_PIPE_CAP_SCALE |
+			0,
+	},
+	.pipe_dma = {
+		.count = 1,
+		.base = { 0x02900 },
+		.caps = MDP_PIPE_CAP_HFLIP |
+			MDP_PIPE_CAP_VFLIP |
+			0,
+	},
+	.lm = {
+		.count = 2,
+		.base = { 0x03100, 0x03d00 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				{ .id = 1, .pp = -1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB },
+			     },
+		.nb_stages = 2,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x04500 },
+	},
+	.pp = {
+		.count = 1,
+		.base = { 0x21a00 },
+	},
+	.intf = {
+		.base = { 0x00000, 0x21200 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+		},
+	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 125
+	},
+	.max_clk = 200000000,
+};
+
 static const struct mdp5_cfg_hw msm8x74v2_config = {
 	.name = "msm8x74",
 	.mdp = {
@@ -1236,6 +1317,7 @@ static const struct mdp5_cfg_hw sdm660_config = {
 
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
+	{ .revision = 1, .config = { .hw = &msm8x26_config } },
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
 	{ .revision = 3, .config = { .hw = &apq8084_config } },
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },

-- 
2.40.1

