Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA005AE8D9A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AA610E7F4;
	Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1I0mv/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5254E10E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAEJk0001282
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=QOMNbElsFZP
 lX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=; b=N1I0mv/mQZH9Ks7Xc+fzl1wwXv9
 OSzf5PDmPgVa5lhXD1CrTcDbi1mb2IqBpsVHKeKLEPZEJW2Gp3K23zjWh9HeJD7w
 d1hpTdKpjSssePA6CZoXIj5OK+LtD8hp1WMpQ4JNO4aWeON1D4Kf5FjBJktuZhhn
 fJ2VVerzw+VTMZtk37xxvyKVInipKcUzw3Y2yj7/c1VQ6Kcc2GK5n2wytLTCsVb4
 9/NX2X9br0q2+y7Wz6K6WV2/pA2GXeJoKH1Q0hF8uM5Fpja3R04Ktp2w7YdpmmoS
 pCkd0pNsDDRd41wFJ0U5S/PRPLqGK/3GF/vdmkLqHnASPcXO7Uhe4qn1Uiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdasss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-748cf01de06so386732b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877942; x=1751482742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QOMNbElsFZPlX1Zq+j4xLdTNJSwjVmJdOq5xQhhnr9E=;
 b=KJFtbOiDtBTUmBiFpT1CshTvPzvU+4tLTPbuabdlLfeN3l6ELskrJmNbmpSlKCEYhh
 0lFdg6CcOTKcJsLV8Uucrpsh0gP0iwFV9xT+FSXD1XUG9xyA2pFue7oayy7+oFGEA+u0
 E3kXQf4JMkS5sxmFPjPHQBG9oLWsw7bxXjhVl9Z77ePnBvfSwGBVji8d2VqcCapWD8Fs
 j020Cm4oEWK3aYKgu7715WTxIFEpeg64gHd3oqM0xQf8MULWz9LRsBEn0zgHpbf7MyZd
 momLUZ+/GHBXYHt5bgzRV8npUiz1PMRZQDlq2dCXFE6BbEv1IbksXIFitMywWJfnjlPP
 hWIA==
X-Gm-Message-State: AOJu0YxlkZaSBkbAt2m0i6GWYd/27TxHHhFKpTrGN8c3281Oy+e7ld+v
 O6U9JBlLTlhN9NIZK5nf8XjHK6Ir5vbsVURnF3pr52YSE9DQ46PAR5P2vkPT8QUuEgRx8/hXZCz
 tKba6iSBSIvQm4IA59t/DE9tN4ypmoLlZG1SrxQ6ZiG+CRiE/NAQ8S6WIe7pOUkd0SjecbYLEmM
 4akXE=
X-Gm-Gg: ASbGnct8iebEPsi1DbMMIp74iWlehyO0bidAXTfm4i8mKZ9JRBsl53RHG6ztZqy6R79
 3YEkib18j/DEWbh54CEtCyMVM8Z2b1osKZTumxzu8CGhDJpRl9x4Tpms7iDcXnXv1Z+3DMIbD2D
 DXPKryYrKyhYLH+4nwyVvOkiQV3CRALDbpH5wpOinNn4FacYZKzPYLS6l5tjBer+bU0jZOvH8mo
 JHilNc8b4TEsq5mXry2EC1wm+n+XYV7peRvnGNijHFYoHIbIbBnkiPIJYWOmXivARomW5VgLU1a
 0LADQAk0Q52Sii8UP+ivpUSLe2/PVkev
X-Received: by 2002:a05:6a00:1a91:b0:749:472:d3a7 with SMTP id
 d2e1a72fcca58-74ad45bcfa8mr6497878b3a.18.1750877941655; 
 Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNIpJthfggdVhg6h4YytmxITyHayu+CLw/csQVSnZlQgLg/GHx0v96sgTadkVnx72wDQ0ltQ==
X-Received: by 2002:a05:6a00:1a91:b0:749:472:d3a7 with SMTP id
 d2e1a72fcca58-74ad45bcfa8mr6497858b3a.18.1750877941248; 
 Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8854943sm5355763b3a.138.2025.06.25.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Wed, 25 Jun 2025 11:47:19 -0700
Message-ID: <20250625184918.124608-27-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46f6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXydCwyGwO6niN
 9KYpmsKsCqZjKxqLdqsDijLZBmhGD1KblfwWN00qwYHPsHgesv7lNjGTI3Utun/4SfmnQ81/MD0
 hvd3pC9vaLtPklixVxue/hj2brQYodlMKxtOHZk7Nhdd+YyksDgPicjtvCC85bGJqzVNoAnDHeT
 LMbXZonheioNiJ4OKq+SOId6u1aKtxw09CL7/5Hkf1D8lXmj1NXVNQ8jhpzrg2Nv/7UeUPDhjce
 ZNtEzI6wjVLRPXgYASgQ6mf5/gpOryBOu0nSc+C7Nb/KBuiyaxGcA1HEoRJhUHN73gOVZrtOg+1
 2G6qeZCc7T7tCpT9N9XA7ljdChoBM36It7HzWL0vofTr0WZ5vzjosbbphpCtW1ev6s75ptDHjT/
 +aH55YmVbEcVIPSimZ3A49x8elgjguikST/l/2q3NlAf7ba9cMcQear+T+rd/LbvBzR9wqMB
X-Proofpoint-GUID: pYwtNL2qdffKgJVXSFG-Pzi9R8RHM92s
X-Proofpoint-ORIG-GUID: pYwtNL2qdffKgJVXSFG-Pzi9R8RHM92s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5e8c419ed834..b44a4f7313c9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -403,14 +403,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.49.0

