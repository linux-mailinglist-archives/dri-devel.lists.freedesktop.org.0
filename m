Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342FC6532F5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D8610E462;
	Wed, 21 Dec 2022 15:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4E010E45E;
 Wed, 21 Dec 2022 15:10:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLE0lxc028034; Wed, 21 Dec 2022 15:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=fVnX5b5aJ7SnNmdlJAhHOuUH1mBH9lDjJvrZFN7ZAIg=;
 b=KVs9X1e21qacKIsdl8UjDm2U2i/rn/2MajLudhrC4QIESiYhP9nyqx76L7FEG4mKQnjR
 d5xiXq/NgDmI+THcT1w30Ozt5vwpWBB46orrlc8fWYJkuWlsDvkQCUq8aT4V53/lF45y
 Lre/1oDbGcXNqT3lSNXT4VShGlVQmZyzee7D/fqzv0bdctd2kF5AYD44V5jtLN7dKQYH
 dQychZalB8NCNt9xWTYY7p2SCewcqVRiiZITVSvigBV2Ah590XP7ZgXpzpiODQeLk2Y5
 7sZLl+3nfGMi3BNwzSfpshts9n9z2bGVj4caQ7fJVUp3vLADzZi/kFYvNf7b1KRsPYQQ Nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm3cjr5w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLFAR8a014467
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:27 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 07:10:23 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 4/4] drm/msm/a6xx: Update ROQ size in coredump
Date: Wed, 21 Dec 2022 20:39:59 +0530
Message-ID: <20221221203925.v2.4.I07f22966395eb045f6b312710f53890d5d7e69d4@changeid>
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
X-Proofpoint-GUID: 47La4lSc63Tptsc_23PNt4bC996neI6k
X-Proofpoint-ORIG-GUID: 47La4lSc63Tptsc_23PNt4bC996neI6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=863
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210126
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

Since RoQ size differs between generations, calculate dynamically the
RoQ size while capturing coredump.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 11 ++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 17 ++++++++++-------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index da190b6ddba0..80e60e34ce7d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -939,15 +939,24 @@ static void a6xx_get_registers(struct msm_gpu *gpu,
 			dumper);
 }
 
+static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu)
+{
+	/* The value at [16:31] is in 4dword units. Convert it to dwords */
+	return gpu_read(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2) >> 14;
+}
+
 /* Read a block of data from an indexed register pair */
 static void a6xx_get_indexed_regs(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
-		const struct a6xx_indexed_registers *indexed,
+		struct a6xx_indexed_registers *indexed,
 		struct a6xx_gpu_state_obj *obj)
 {
 	int i;
 
 	obj->handle = (const void *) indexed;
+	if (indexed->count_fn)
+		indexed->count = indexed->count_fn(gpu);
+
 	obj->data = state_kcalloc(a6xx_state, indexed->count, sizeof(u32));
 	if (!obj->data)
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 808121c88662..790f55e24533 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -383,25 +383,28 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
 	REGS(a6xx_gmu_gx_registers, 0, 0),
 };
 
-static const struct a6xx_indexed_registers {
+static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
+
+static struct a6xx_indexed_registers {
 	const char *name;
 	u32 addr;
 	u32 data;
 	u32 count;
+	u32 (*count_fn)(struct msm_gpu *gpu);
 } a6xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
-		REG_A6XX_CP_SQE_STAT_DATA, 0x33 },
+		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
-		REG_A6XX_CP_DRAW_STATE_DATA, 0x100 },
+		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
 	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
-		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x6000 },
+		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
 	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
-		REG_A6XX_CP_ROQ_DBG_DATA, 0x400 },
+		REG_A6XX_CP_ROQ_DBG_DATA, 0, a6xx_get_cp_roq_size},
 };
 
-static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
+static struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
 	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
-		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060,
+		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060, NULL,
 };
 
 #define DEBUGBUS(_id, _count) { .id = _id, .name = #_id, .count = _count }
-- 
2.7.4

