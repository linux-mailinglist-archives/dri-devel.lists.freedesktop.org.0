Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D00AED084
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBBC10E37B;
	Sun, 29 Jun 2025 20:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw21Q6K5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7E910E36F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFHZIq017027
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=MXd06Saq6/9
 4jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=; b=Hw21Q6K5584PMaleLKBvAEKOLvU
 PfMLIfQ/q7iD1wwv4xmqE1S3x0eYxUfgPQHPImWOKTjCbZhqjiDSylHDkI09/tlx
 nocgV8FTfzHc2dnoFkYEvYDctSSkpOo5aP5Azuvi1RQ9tQfR68HgytdjsikfdV1c
 a34/esORWPg7VcPojv1lrrvHNT2+KakhF5qjVia2g02VETxa0kG8SGRUp57ybkcs
 qxTKlcfaX2egg+db7DpV4vedX+bWUb6xOeQzqbtEmgzDZXkKsE2a4AXPTY01z2XS
 jiwGaR1R/nxItrLY7ly3C4qTsdZE0OXqRYAa3Airpff5cie99c92A+7DoZg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjps4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74927be2ec0so2588682b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228214; x=1751833014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXd06Saq6/94jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=;
 b=Rra4dbCbcwbBxl4KldDDYVKUNTVx1S6/R1uStLaNRvOMul8XX1CBzCxx1S/55C8k/K
 CWTdEHxXvvu+D8liFE4kXzxWwM+pT63+jIMqAVCpcz/V5pOif1mN3iIzfTDgnsLKxHZX
 6ql+nZ7Fw/12uYYMF/6RhIlooJw0FFzPUCGqiiNoiX/w51N/e/TZIF2KcoB/C+2+lBjL
 C3ieBcC8JofMb4Oc6dtDobkJhmqCByGUFPIyosDMHa7YjSi0jAYrkCX9CxPKyMqHwhpv
 r6qrRQYLE7w3bG4NtMwgoz5JdqOTbb9khMoY3++P79AaHSovco16KiaYoStJ1BRmPrUE
 0gcQ==
X-Gm-Message-State: AOJu0YzT+swWlo0vdz/nCjVFqTPsmsoKyq+Fx3Rk7LAyzjPivsSe7Cr9
 139+XyJb3r0fv2DwCiLPXdcL79wfaKJ1+zXULHURPOIf1E6Ft7yagPtOPadJ54I5BaAL1Nu1Ynm
 gYEbvAQLa65e+Y6DWG5DBz5f/4eh5CQ5H83/onqG3bKptNPXtvBjvpQZn31bcpEgI0bz09ylpZA
 PYXj4=
X-Gm-Gg: ASbGncuSoV+WTCofyN7sdJ6ZLWXwICf/Ig1MuqyuKQk9uBCkyqd8PKcrHt6zfEG6dWy
 p5uNZIrkOODOvq0CnkpECuaqNsTNefw8qgKEksQi++N5wXW4apK93E30JsLHn12wPqmFnjt/RFU
 nY34ayZnhZbjg8xhERlxjgOCM02j4gE9edlDyEH45ddyDErVrtmLmlPIWIWUqro2SDwmmcfq/qU
 FMPJF3A1Q3qHIfHj5aL5JuR8BnDr4SKcdfpKAW4455BLyLurAUNNqyTcecufua1No5naG/8mCIU
 uM+lhamGYopOTIzWla5tIL+x4AP7UuLcIg==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-74af6f4cf7cmr15911479b3a.19.1751228213699; 
 Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwS0jhkR8kO4XI31Ia1S/bTnmlQi728sKrSzukVGa/mmnt9dqDSkWMQ2dsZWOWEB2qBV+YJQ==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-74af6f4cf7cmr15911449b3a.19.1751228213309; 
 Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5579d37sm6914468b3a.81.2025.06.29.13.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:08 -0700
Message-ID: <20250629201530.25775-26-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: J3ZfIkvGWeoA6zMqLiqvbmYqAlAOeE1_
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f36 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: J3ZfIkvGWeoA6zMqLiqvbmYqAlAOeE1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX6mqeNN27werr
 DR8oTByDiKLQhWpo8QHh/VyCZ7k8yoap6duKIpF2m9hhJ8XtabscKETxXpfIKwUvm4e/iBoyn+W
 Gw38x31ePIIOlU+PqKWlHfUNCXAkBdPMafVZeC7Z2L8P3gwUCnzNu/0+6u3RAcF6vhl9D3hJtzM
 9zasithJkaEmnuwSgjNw+LNvM2k8jsJy/qaX41eADEqNk5gTa9Va4UgtrKGWRZ43PSErD2rqnDc
 LN/PJT0sGOH6BrCBoRj8Ofr3c8QDjBPvMlgWAQ1WW8hg+2wHj86tty/0mmAD7hcrgZLl9MaGSVC
 eWpraEdepetPiX2HZYKbgbiUXSMhfHrjfl6lfmOm/dfbhCnXdLnRGEmSfCpuw+nf8+jNMU/E7xK
 +KQfw9L857CeuaJR+PU/HfaBrep0V/KQEfUqhIbtnJEm1GgNemh8YIXvjQsLsmmUh2Naq9ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=898 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0846f6c5169f..0a9d5ecbef7b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -281,6 +282,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->fault_info = *fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -296,9 +298,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.50.0

