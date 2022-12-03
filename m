Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665B641994
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 23:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB1D10E204;
	Sat,  3 Dec 2022 22:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AE310E201;
 Sat,  3 Dec 2022 22:42:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B3MgEfL015253; Sat, 3 Dec 2022 22:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=CRiOFceBSHcccdzlP0WNsBunBsJJJm6wdP4oqKzJiyI=;
 b=eJb8tQsebkwxN3R4fD2f58vsZ193cP+n1Q3XhVCX4Fk1VsDYZr/vGD8cz3GIS2Umnj/4
 qz7JhFi0ozX9hlAp5coi7GVCFaK6b56DBnzC56SV1W8q3Bhq95aM90jFV2PdNrIEBmpe
 mYtLmu0Am4s4Mbo3G/HfahT73JcAp56W6SUZrCPCTVEu7sB0rmOfKqgBrrHOsZXTUfSP
 0ykjAinK7asVaQo8oqrSjP80yko2JX0zvrF4OAFAb3SGjvutMA1vjeDRbmAyHV5tY9q7
 JS+DCcE+nXAs1gjHiWMBL81nfObCS7oVDTA7xoqgZ7ywExA3APqXWLhrKIF/9cvJdK3s FA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7xp8h819-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Dec 2022 22:42:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B3MgDVh014607
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 3 Dec 2022 22:42:13 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sat, 3 Dec 2022 14:42:10 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH 4/4] drm/msm/a6xx: Update ROQ size in coredump
Date: Sun, 4 Dec 2022 04:11:44 +0530
Message-ID: <20221204040946.4.I07f22966395eb045f6b312710f53890d5d7e69d4@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
References: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: a-cVsWgVR8zG49UQN33PCsqFr5u87vQp
X-Proofpoint-GUID: a-cVsWgVR8zG49UQN33PCsqFr5u87vQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-03_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=846 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212030202
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

