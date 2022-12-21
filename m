Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372536532FC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44F910E459;
	Wed, 21 Dec 2022 15:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2967010E455;
 Wed, 21 Dec 2022 15:10:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLCmQd4013512; Wed, 21 Dec 2022 15:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=YV9LkEJipobEiXAwZA15LpcPLVnVAjR8uv57w6rWZXU=;
 b=cM5pLf7JyxbJ5bU5ezS9y1WCRjQ1BpCFakxWC7+Hj0GFPHwfGaskM1LqClzi69Ecry25
 /e8eli1/ibl2jCQ4k0yx5nsxEOZYY2PC3s02Kqt5jXpcOV6oz8FesZ5ebiYOKczNeuKt
 ZO2/SdYnKioymKcTjHgb1NsMyiv3zaZqYd9DOJVducsoFHYuwrwF8bMjisA7+CO7AJOc
 cZnjxGsYzuAznpOWd6hcrdHJ5VZCIwJOOrNzuQzVYXI5WtzkoSp63u6YZFi4sQJd6vOL
 5iXDIjEYB1XuCUqG/XAD6ccdlkhRHVuDjtUFOiE7Wv4KAIGOtkE48D5A0RX1F80JzufF QA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkcxvb3t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLFANFH020658
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:23 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 07:10:19 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 3/4] drm/msm/a6xx: Update a6xx gpu coredump
Date: Wed, 21 Dec 2022 20:39:58 +0530
Message-ID: <20221221203925.v2.3.Ifbfce6d693b202dac92006345bb825e7c5aee9c6@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20221221203925.v2.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
References: <20221221203925.v2.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4RTz4YnO-Powc1Ze1B02mVuZgnmrcSM4
X-Proofpoint-ORIG-GUID: 4RTz4YnO-Powc1Ze1B02mVuZgnmrcSM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210126
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update gpu coredump for a660/a650 family of gpus with the extra
information available.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx.xml.h       | 18 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 50 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 49 +++++++++++++++++++++++-----
 3 files changed, 108 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index beea4a7fc1df..a92788019376 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -241,6 +241,9 @@ enum a6xx_shader_id {
 	A6XX_HLSQ_FRONTEND_META = 97,
 	A6XX_HLSQ_INDIRECT_META = 98,
 	A6XX_HLSQ_BACKEND_META = 99,
+	A6XX_SP_LB_6_DATA = 112,
+	A6XX_SP_LB_7_DATA = 113,
+	A6XX_HLSQ_INST_RAM_1 = 115,
 };
 
 enum a6xx_debugbus_id {
@@ -274,19 +277,32 @@ enum a6xx_debugbus_id {
 	A6XX_DBGBUS_HLSQ_SPTP = 31,
 	A6XX_DBGBUS_RB_0 = 32,
 	A6XX_DBGBUS_RB_1 = 33,
+	A6XX_DBGBUS_RB_2 = 34,
 	A6XX_DBGBUS_UCHE_WRAPPER = 36,
 	A6XX_DBGBUS_CCU_0 = 40,
 	A6XX_DBGBUS_CCU_1 = 41,
+	A6XX_DBGBUS_CCU_2 = 42,
 	A6XX_DBGBUS_VFD_0 = 56,
 	A6XX_DBGBUS_VFD_1 = 57,
 	A6XX_DBGBUS_VFD_2 = 58,
 	A6XX_DBGBUS_VFD_3 = 59,
+	A6XX_DBGBUS_VFD_4 = 60,
+	A6XX_DBGBUS_VFD_5 = 61,
 	A6XX_DBGBUS_SP_0 = 64,
 	A6XX_DBGBUS_SP_1 = 65,
+	A6XX_DBGBUS_SP_2 = 66,
 	A6XX_DBGBUS_TPL1_0 = 72,
 	A6XX_DBGBUS_TPL1_1 = 73,
 	A6XX_DBGBUS_TPL1_2 = 74,
 	A6XX_DBGBUS_TPL1_3 = 75,
+	A6XX_DBGBUS_TPL1_4 = 76,
+	A6XX_DBGBUS_TPL1_5 = 77,
+	A6XX_DBGBUS_SPTP_0 = 88,
+	A6XX_DBGBUS_SPTP_1 = 89,
+	A6XX_DBGBUS_SPTP_2 = 90,
+	A6XX_DBGBUS_SPTP_3 = 91,
+	A6XX_DBGBUS_SPTP_4 = 92,
+	A6XX_DBGBUS_SPTP_5 = 93,
 };
 
 enum a6xx_cp_perfcounter_select {
@@ -1071,6 +1087,8 @@ enum a6xx_tex_type {
 
 #define REG_A6XX_CP_MISC_CNTL					0x00000840
 
+#define REG_A6XX_CP_CHICKEN_DBG					0x00000841
+
 #define REG_A6XX_CP_APRIV_CNTL					0x00000844
 
 #define REG_A6XX_CP_ROQ_THRESHOLDS_1				0x000008c1
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index c61b233aff09..da190b6ddba0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -385,6 +385,9 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 	nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
 		(a6xx_has_gbif(to_adreno_gpu(gpu)) ? 1 : 0);
 
+	if (adreno_is_a650_family(to_adreno_gpu(gpu)))
+		nr_debugbus_blocks += ARRAY_SIZE(a650_debugbus_blocks);
+
 	a6xx_state->debugbus = state_kcalloc(a6xx_state, nr_debugbus_blocks,
 			sizeof(*a6xx_state->debugbus));
 
@@ -411,6 +414,15 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 
 			a6xx_state->nr_debugbus += 1;
 		}
+
+
+		if (adreno_is_a650_family(to_adreno_gpu(gpu))) {
+			for (i = 0; i < ARRAY_SIZE(a650_debugbus_blocks); i++)
+				a6xx_get_debugbus_block(gpu,
+					a6xx_state,
+					&a650_debugbus_blocks[i],
+					&a6xx_state->debugbus[i]);
+		}
 	}
 
 	/*  Dump the VBIF debugbus on applicable targets */
@@ -524,10 +536,21 @@ static void a6xx_get_cluster(struct msm_gpu *gpu,
 		struct a6xx_gpu_state_obj *obj,
 		struct a6xx_crashdumper *dumper)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	u64 *in = dumper->ptr;
 	u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
 	size_t datasize;
 	int i, regcount = 0;
+	u32 id = cluster->id;
+
+	/* Skip registers that are not present on older generation */
+	if (!adreno_is_a660_family(adreno_gpu) &&
+			cluster->registers == a660_fe_cluster)
+		return;
+
+	if (adreno_is_a650_family(adreno_gpu) &&
+			cluster->registers == a6xx_ps_cluster)
+		id = CLUSTER_VPC_PS;
 
 	/* Some clusters need a selector register to be programmed too */
 	if (cluster->sel_reg)
@@ -537,7 +560,7 @@ static void a6xx_get_cluster(struct msm_gpu *gpu,
 		int j;
 
 		in += CRASHDUMP_WRITE(in, REG_A6XX_CP_APERTURE_CNTL_CD,
-			(cluster->id << 8) | (i << 4) | i);
+			(id << 8) | (i << 4) | i);
 
 		for (j = 0; j < cluster->count; j += 2) {
 			int count = RANGE(cluster->registers, j);
@@ -687,6 +710,11 @@ static void a6xx_get_crashdumper_registers(struct msm_gpu *gpu,
 	u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
 	int i, regcount = 0;
 
+	/* Skip unsupported registers on older generations */
+	if (!adreno_is_a660_family(to_adreno_gpu(gpu)) &&
+			(regs->registers == a660_registers))
+		return;
+
 	/* Some blocks might need to program a selector register first */
 	if (regs->val0)
 		in += CRASHDUMP_WRITE(in, regs->val0, regs->val1);
@@ -721,6 +749,11 @@ static void a6xx_get_ahb_gpu_registers(struct msm_gpu *gpu,
 {
 	int i, regcount = 0, index = 0;
 
+	/* Skip unsupported registers on older generations */
+	if (!adreno_is_a660_family(to_adreno_gpu(gpu)) &&
+			(regs->registers == a660_registers))
+		return;
+
 	for (i = 0; i < regs->count; i += 2)
 		regcount += RANGE(regs->registers, i);
 
@@ -943,6 +976,21 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 		a6xx_get_indexed_regs(gpu, a6xx_state, &a6xx_indexed_reglist[i],
 			&a6xx_state->indexed_regs[i]);
 
+	if (adreno_is_a650_family(to_adreno_gpu(gpu))) {
+		u32 val;
+
+		val = gpu_read(gpu, REG_A6XX_CP_CHICKEN_DBG);
+		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, val | 4);
+
+		/* Get the contents of the CP mempool */
+		a6xx_get_indexed_regs(gpu, a6xx_state, &a6xx_cp_mempool_indexed,
+			&a6xx_state->indexed_regs[i]);
+
+		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, val);
+		a6xx_state->nr_indexed_regs = count;
+		return;
+	}
+
 	/* Set the CP mempool size to 0 to stabilize it while dumping */
 	mempool_size = gpu_read(gpu, REG_A6XX_CP_MEM_POOL_SIZE);
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 0);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 2fb58b7098e4..808121c88662 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -36,16 +36,21 @@ static const u32 a6xx_fe_cluster[] = {
 	0xa00e, 0xa0ef, 0xa0f8, 0xa0f8,
 };
 
+static const u32 a660_fe_cluster[] = {
+	0x9807, 0x9807,
+};
+
 static const u32 a6xx_pc_vs_cluster[] = {
 	0x9100, 0x9108, 0x9300, 0x9306, 0x9980, 0x9981, 0x9b00, 0x9b07,
 };
 
-#define CLUSTER_FE    0
-#define CLUSTER_SP_VS 1
-#define CLUSTER_PC_VS 2
-#define CLUSTER_GRAS  3
-#define CLUSTER_SP_PS 4
-#define CLUSTER_PS    5
+#define CLUSTER_FE	0
+#define CLUSTER_SP_VS	1
+#define CLUSTER_PC_VS	2
+#define CLUSTER_GRAS	3
+#define CLUSTER_SP_PS	4
+#define CLUSTER_PS	5
+#define CLUSTER_VPC_PS	6
 
 #define CLUSTER(_id, _reg, _sel_reg, _sel_val) \
 	{ .id = _id, .name = #_id,\
@@ -67,6 +72,7 @@ static const struct a6xx_cluster {
 	CLUSTER(CLUSTER_PS, a6xx_ps_cluster, 0, 0),
 	CLUSTER(CLUSTER_FE, a6xx_fe_cluster, 0, 0),
 	CLUSTER(CLUSTER_PC_VS, a6xx_pc_vs_cluster, 0, 0),
+	CLUSTER(CLUSTER_FE, a660_fe_cluster, 0, 0),
 };
 
 static const u32 a6xx_sp_vs_hlsq_cluster[] = {
@@ -105,7 +111,7 @@ static const u32 a6xx_sp_ps_hlsq_2d_cluster[] = {
 
 static const u32 a6xx_sp_ps_sp_cluster[] = {
 	0xa980, 0xa9a8, 0xa9b0, 0xa9bc, 0xa9d0, 0xa9d3, 0xa9e0, 0xa9f3,
-	0xaa00, 0xaa00, 0xaa30, 0xaa31,
+	0xaa00, 0xaa00, 0xaa30, 0xaa31, 0xaaf2, 0xaaf2,
 };
 
 static const u32 a6xx_sp_ps_sp_2d_cluster[] = {
@@ -229,6 +235,9 @@ static const struct a6xx_shader_block {
 	SHADER(A6XX_HLSQ_DATAPATH_META, 0x40),
 	SHADER(A6XX_HLSQ_FRONTEND_META, 0x40),
 	SHADER(A6XX_HLSQ_INDIRECT_META, 0x40),
+	SHADER(A6XX_SP_LB_6_DATA, 0x200),
+	SHADER(A6XX_SP_LB_7_DATA, 0x200),
+	SHADER(A6XX_HLSQ_INST_RAM_1, 0x200),
 };
 
 static const u32 a6xx_rb_rac_registers[] = {
@@ -251,7 +260,7 @@ static const u32 a6xx_registers[] = {
 	0x0540, 0x0555,
 	/* CP */
 	0x0800, 0x0808, 0x0810, 0x0813, 0x0820, 0x0821, 0x0823, 0x0824,
-	0x0826, 0x0827, 0x0830, 0x0833, 0x0840, 0x0843, 0x084f, 0x086f,
+	0x0826, 0x0827, 0x0830, 0x0833, 0x0840, 0x0845, 0x084f, 0x086f,
 	0x0880, 0x088a, 0x08a0, 0x08ab, 0x08c0, 0x08c4, 0x08d0, 0x08dd,
 	0x08f0, 0x08f3, 0x0900, 0x0903, 0x0908, 0x0911, 0x0928, 0x093e,
 	0x0942, 0x094d, 0x0980, 0x0984, 0x098d, 0x0996, 0x0998, 0x099e,
@@ -274,6 +283,13 @@ static const u32 a6xx_registers[] = {
 	/* VFD */
 	0xa600, 0xa601, 0xa603, 0xa603, 0xa60a, 0xa60a, 0xa610, 0xa617,
 	0xa630, 0xa630,
+	/* HLSQ */
+	0xd002, 0xd003,
+};
+
+static const u32 a660_registers[] = {
+	/* UCHE */
+	0x0e3c, 0x0e3c,
 };
 
 #define REGS(_array, _sel_reg, _sel_val) \
@@ -282,6 +298,7 @@ static const u32 a6xx_registers[] = {
 
 static const struct a6xx_registers a6xx_reglist[] = {
 	REGS(a6xx_registers, 0, 0),
+	REGS(a660_registers, 0, 0),
 	REGS(a6xx_rb_rac_registers, REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD, 0),
 	REGS(a6xx_rb_rbp_registers, REG_A6XX_RB_RB_SUB_BLOCK_SEL_CNTL_CD, 9),
 };
@@ -443,4 +460,20 @@ static const struct a6xx_debugbus_block a6xx_cx_debugbus_blocks[] = {
 	DEBUGBUS(A6XX_DBGBUS_CX, 0x100),
 };
 
+static const struct a6xx_debugbus_block a650_debugbus_blocks[] = {
+	DEBUGBUS(A6XX_DBGBUS_RB_2, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_CCU_2, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_VFD_4, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_VFD_5, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_SP_2, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_TPL1_4, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_TPL1_5, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_SPTP_0, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_SPTP_1, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_SPTP_2, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_SPTP_3, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_SPTP_4, 0x100),
+	DEBUGBUS(A6XX_DBGBUS_SPTP_5, 0x100),
+};
+
 #endif
-- 
2.7.4

