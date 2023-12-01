Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2C800106
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 02:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBE810E79A;
	Fri,  1 Dec 2023 01:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8210E798;
 Fri,  1 Dec 2023 01:31:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B10L6iB000664; Fri, 1 Dec 2023 01:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=/NU2dbFQNyWKS8CYNdbXTOILj/VJ3QBEhaVjuOI+lD8=;
 b=VrQ70tFEB1EPxbl9tUEYn9Dybw6vjaIs9O2e98tLwVEeow/MOHbKIcnbj0BUofsgu6Ft
 xJMCgTQ2r28Px46Xp2wEBlUTqIgyngneuYV/gVcF/fj7v72aRmFILq7lqTLTqiw8YBdE
 1e8y8JRdRfW5NksW9o5omGuu/asKqQYHSy9TiYfPeHWVbs8KAhhoOvnZqaK5AhErUHbP
 N2tePEC6HBfdGSnvdLQZQnw+Y7TzthPohCTmiMjxgznA6nlFrYDcxH64VnN5+DNXmFzA
 0NynNBwjKzG4fnTO7W/RNwtOkANlKD0aSlmAt7v90K0nZIJDFwJsMSFXbf5MyNTnoC0p MQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upgfd3c8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 01:31:01 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B11V0JD024463
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 01:31:00 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:31:00 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 30 Nov 2023 17:30:34 -0800
Subject: [PATCH 2/2] drm/msm/dpu: Set input_sel bit for INTF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231130-encoder-fixup-v1-2-585c54cd046e@quicinc.com>
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-53db1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701394259; l=3663;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=f4MgpUR7qdkeHqkjRkQnRto4i/L5a9mnRaHCbV37d7s=;
 b=YaRowAfYu9UtWmL0tdfOtCJLCUYSpZfgImYT6w+enn5a+q8W013WGwVAs8OLuaN1d6ykP84Gn
 Rn0uCPBwnL8AjxV6SfA9Kw1+xPKpSKcYTJvqW8BYXu4najOkg+BzhS4
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SclDWkzTrjjqxZt7KBFQUeHklgcM3nok
X-Proofpoint-GUID: SclDWkzTrjjqxZt7KBFQUeHklgcM3nok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312010008
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the input_sel bit for encoders as it was missed in the initial
implementation.

Reported-by: Rob Clark <robdclark@gmail.com>
Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 7 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 4 +++-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 3442cf65b86f..d0884997ecb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -320,7 +320,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 
 static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
 {
-	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL);
+	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, true);
 }
 
 static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index f38473e68f79..77b14107c84a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
 {
-	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL);
+	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, false);
 }
 
 static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index a8a0a4e76b94..f441df47fdde 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -481,7 +481,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
 }
 
-void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
+		bool set_input_sel)
 {
 	u32 config = 0;
 
@@ -491,6 +492,10 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
 	wmb();
 
 	config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
+
+	if (set_input_sel)
+		config |= MISR_CTRL_INPUT_SEL;
+
 	DPU_REG_WRITE(c, misr_ctrl_offset, config);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index bb496ebe283b..793670d62414 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -17,6 +17,7 @@
 #define MISR_CTRL_ENABLE                BIT(8)
 #define MISR_CTRL_STATUS                BIT(9)
 #define MISR_CTRL_STATUS_CLEAR          BIT(10)
+#define MISR_CTRL_INPUT_SEL             BIT(24)
 #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
 
 /*
@@ -357,7 +358,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 			   bool qos_8lvl,
 			   const struct dpu_hw_qos_cfg *cfg);
 
-void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset);
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
+		       bool set_input_sel);
 
 int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,

-- 
2.43.0

