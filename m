Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786D574FCA2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 03:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEA510E47E;
	Wed, 12 Jul 2023 01:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EC310E476;
 Wed, 12 Jul 2023 01:20:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36C1KNbB031305; Wed, 12 Jul 2023 01:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=UNus5En0R4zSB7syb+kg5kv8dC4rtQLAT1UfM9TCbfA=;
 b=R38t+N8SDhz5x9T7QeZG69ejOdPZf19W8K56PnNNJ5hfwwRAn0/Hs68QKgV/15WWMd98
 Ztwbt49FnHCLHjpLm6sIf0+QwhuG+5hPXo3OpIWW+F5YEm1LcHgZ6bovlrQlhkA1AaBI
 p5jooNTiFCxu57p1Shu/AMzSehwcy84j/R0OPBuceWBtZ1QfzITqhgT0VPel8MsE5RmL
 k8XsRAEVB8tMlcN0CNDHRK6dglDzjioOQmG4cJIbr37nZ9lXR0eX7iJSXhsdnXcK3+9P
 RIbK6g982LRP2d5FwiIGBfJ+hsDqm78n57zgn2dhEjW3uVYJyiumluCqXII8mLkCqqqd wg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rshyu816j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 01:20:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36C1KLJ4003497
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 01:20:21 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 18:20:21 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v5 3/5] drm/msm/dpu: rename all hw_intf structs to have dpu_hw
 prefix
Date: Tue, 11 Jul 2023 18:20:01 -0700
Message-ID: <20230712012003.2212-4-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
References: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eWh3qssYzlEEEDRqQniD8vrS4ZQYA7zL
X-Proofpoint-ORIG-GUID: eWh3qssYzlEEEDRqQniD8vrS4ZQYA7zL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120008
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpu_hw_intf has a few instances of structs which do not have
the dpu_hw prefix. Lets fix this by renaming those structs
and updating the usage of those accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h    | 12 ++++++------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 662d74ded1b9..c2189e58de6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -40,7 +40,7 @@ static bool dpu_encoder_phys_vid_is_master(
 static void drm_mode_to_intf_timing_params(
 		const struct dpu_encoder_phys *phys_enc,
 		const struct drm_display_mode *mode,
-		struct intf_timing_params *timing)
+		struct dpu_hw_intf_timing_params *timing)
 {
 	memset(timing, 0, sizeof(*timing));
 
@@ -114,7 +114,7 @@ static void drm_mode_to_intf_timing_params(
 	}
 }
 
-static u32 get_horizontal_total(const struct intf_timing_params *timing)
+static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
 {
 	u32 active = timing->xres;
 	u32 inactive =
@@ -123,7 +123,7 @@ static u32 get_horizontal_total(const struct intf_timing_params *timing)
 	return active + inactive;
 }
 
-static u32 get_vertical_total(const struct intf_timing_params *timing)
+static u32 get_vertical_total(const struct dpu_hw_intf_timing_params *timing)
 {
 	u32 active = timing->yres;
 	u32 inactive =
@@ -148,7 +148,7 @@ static u32 get_vertical_total(const struct intf_timing_params *timing)
  */
 static u32 programmable_fetch_get_num_lines(
 		struct dpu_encoder_phys *phys_enc,
-		const struct intf_timing_params *timing)
+		const struct dpu_hw_intf_timing_params *timing)
 {
 	u32 worst_case_needed_lines =
 	    phys_enc->hw_intf->cap->prog_fetch_lines_worst_case;
@@ -196,9 +196,9 @@ static u32 programmable_fetch_get_num_lines(
  * @timing: Pointer to the intf timing information for the requested mode
  */
 static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
-				      const struct intf_timing_params *timing)
+				      const struct dpu_hw_intf_timing_params *timing)
 {
-	struct intf_prog_fetch f = { 0 };
+	struct dpu_hw_intf_prog_fetch f = { 0 };
 	u32 vfp_fetch_lines = 0;
 	u32 horiz_total = 0;
 	u32 vert_total = 0;
@@ -231,7 +231,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_display_mode mode;
-	struct intf_timing_params timing_params = { 0 };
+	struct dpu_hw_intf_timing_params timing_params = { 0 };
 	const struct dpu_format *fmt = NULL;
 	u32 fmt_fourcc = DRM_FORMAT_RGB888;
 	unsigned long lock_flags;
@@ -522,7 +522,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 {
 	unsigned long lock_flags;
 	int ret;
-	struct intf_status intf_status = {0};
+	struct dpu_hw_intf_status intf_status = {0};
 
 	if (!phys_enc->parent || !phys_enc->parent->dev) {
 		DPU_ERROR("invalid encoder/device\n");
@@ -651,7 +651,7 @@ static int dpu_encoder_phys_vid_get_line_count(
 static int dpu_encoder_phys_vid_get_frame_count(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct intf_status s = {0};
+	struct dpu_hw_intf_status s = {0};
 	u32 fetch_start = 0;
 	struct drm_display_mode mode;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index d766791438e7..7392880d736c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -95,7 +95,7 @@
 
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
-		const struct intf_timing_params *p,
+		const struct dpu_hw_intf_timing_params *p,
 		const struct dpu_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -244,7 +244,7 @@ static void dpu_hw_intf_enable_timing_engine(
 
 static void dpu_hw_intf_setup_prg_fetch(
 		struct dpu_hw_intf *intf,
-		const struct intf_prog_fetch *fetch)
+		const struct dpu_hw_intf_prog_fetch *fetch)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	int fetch_enable;
@@ -286,7 +286,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
 
 static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf *intf,
-		struct intf_status *s)
+		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	unsigned long cap = intf->cap->features;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 3b5f18dbcb4b..bd6f54208d44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -14,7 +14,7 @@
 struct dpu_hw_intf;
 
 /* intf timing settings */
-struct intf_timing_params {
+struct dpu_hw_intf_timing_params {
 	u32 width;		/* active width */
 	u32 height;		/* active height */
 	u32 xres;		/* Display panel width */
@@ -35,13 +35,13 @@ struct intf_timing_params {
 	bool wide_bus_en;
 };
 
-struct intf_prog_fetch {
+struct dpu_hw_intf_prog_fetch {
 	u8 enable;
 	/* vsync counter for the front porch pixel line */
 	u32 fetch_start;
 };
 
-struct intf_status {
+struct dpu_hw_intf_status {
 	u8 is_en;		/* interface timing engine is enabled or not */
 	u8 is_prog_fetch_en;	/* interface prog fetch counter is enabled or not */
 	u32 frame_count;	/* frame count since timing engine enabled */
@@ -74,17 +74,17 @@ struct intf_status {
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
-			const struct intf_timing_params *p,
+			const struct dpu_hw_intf_timing_params *p,
 			const struct dpu_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
-			const struct intf_prog_fetch *fetch);
+			const struct dpu_hw_intf_prog_fetch *fetch);
 
 	void (*enable_timing)(struct dpu_hw_intf *intf,
 			u8 enable);
 
 	void (*get_status)(struct dpu_hw_intf *intf,
-			struct intf_status *status);
+			struct dpu_hw_intf_status *status);
 
 	u32 (*get_line_count)(struct dpu_hw_intf *intf);
 
-- 
2.40.1

