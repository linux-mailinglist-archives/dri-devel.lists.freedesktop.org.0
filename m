Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C544AE8D6F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DD810E7E2;
	Wed, 25 Jun 2025 18:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5Xb9PZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124D210E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAtaKp015721
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NGLp+jqx0Ko
 YMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=; b=Y5Xb9PZA5V9SfHTSNZrW2S229Ep
 tf/237o+5A7MKzfVbAdzgxyVjbOHkY1SgpLzhUoHQ9SDemhASlhCZWJ45CX8MtXJ
 qxqF2J0nNrZFlQYFYXVelNk7T4IwmIF1k0RexZk/viAIU4Fsc/Rg48UHw7Ark/AO
 oNywZl1jaIXwov679cvJWjQnJ2WhOD6SvrEYl13wbj+e49gMxSfLU6HS3T7xBx9b
 z23pPwTxjylsKz0DqezgrusMW9OlI0TzHz6LTUowPhNoQbWjI8LQhauB9pNBd/N1
 LRPc+PBaHJByLxz2bvfWRHLl8sdC6EhR/mCTbtvmo1zAY0lyh4JxriZZDiw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5t1qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74928291bc3so177967b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877940; x=1751482740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGLp+jqx0KoYMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=;
 b=X9f3WUp+x1EkQnapPFoirvPnmOFUeDjPq9NjC/8VEVGr3xSf9EUJiV/zRJ8ivc8Xw9
 +XNHxy2s/a2rwZ/+ApbrssE6NRAI5ympcSisbsCetvZw3N2TrA8tCnD6Zjn0UkEjZEzH
 W5q2h7S1D6l1SSBwltWrFurtatmwuIEJZoGJ3WvheogLJU+OK3H6LiV90Srsgc94REP2
 waCM4TVYrUj1purkVU3KGS4QgqpmPMw2lXqt9vH/Bj1WABaOlGC+oURZ4xRrG+oN0+/q
 D0VxdCvZ8rRa5bJ0HypbOGdZ6JMgCM3kNe0mmMBHq4hhU1TOsRh81oLC5P5vtoi+RCK9
 Kfiw==
X-Gm-Message-State: AOJu0YxoPPkeDT3JO3+lqIJjurxfHwJNDVC6UI3KmMA6FDQrEyxWj73h
 3PPZPorSLyVnnuXwhMUAvvxQeW9JdkMJZYhmCJpSHoWFuqcFmcH6qPxcGhN7+SBpZfHRZzlUGoM
 QwzogmAWI1nerNFop9VFNh4Us6uxJCTihQ6z0trVord/IiQYhO3W73SKtUKggnfdeAl/JaoDLIm
 IvCC8=
X-Gm-Gg: ASbGnct4zmsSyQ0e2DiJLNzi+hRtCQBbyEP4waZk2kVEXClY3OTM2yhmdpfYzK+dQqZ
 LFaEIdqDfHHehSs4u/WzCPi244VAxubgmO62+8Frgauy6rh8nRVRB02v6Tx+gSCDQaLzFW2rV1s
 N0/FHiNhEF5ax+ODpOvcCwux1Ht72YxkN+WnFbfsmrSjQxgd6qD/h/MprM5G7poxB8FjGMc8UD1
 wUMSXW1RHEME3jcssGRajaxklCdigIhOby2CaJq7/PAlcvoeAB0mDBUF+jficRAKNNeFbsXdBsJ
 a+lUvq3brhzy5+AAoJGbg5kSysoAUOcc
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id
 adf61e73a8af0-2208c5b6de0mr1386077637.20.1750877940364; 
 Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjs/J0QvS0VnPAD9ghs0ZXCa9bknqb6IuT0ol4Vr7UUmIFGa/LYVfwR/mtK9s9csP9ptJgQ==
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id
 adf61e73a8af0-2208c5b6de0mr1386057637.20.1750877939992; 
 Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118ea18sm13411229a12.2.2025.06.25.11.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 25 Jun 2025 11:47:18 -0700
Message-ID: <20250625184918.124608-26-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -IMQhfSAzFMhmIvO2-Z4DmcoGnSFNcHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXyE1YHVJdm+VY
 ro4tKUotv+kS1zWDGeFU2xnPF+JtfehlK9ew6aZEAwL7yrOMly9mH+Q0a+LJ/1oxVm+9bfov78y
 6/FhfYUfmGz4oLGCK2OlD4wVqA79aR+GT0bWJCjyQfp7Vz+2i/CXepOK3oDXMTW++1AJb+dg6Lh
 U044OouGVhYed4oHsusfY9OiQGpCsOr3tXXW9xShxImQvMwhNEjVWU3oI8MJZfcAPjK8pTTAcu7
 UxeegC03HkNi67mf/PEMIv6hfSq4/zKzGlkQEWsxQAxRcQppAkuRMvbEGlUY9+IWqvriLyQ8GKy
 W63vbpVBLOb5gMgnN1+tiCaOFkKsj8c8z0woXhia6sP7oLWF5EPHO4bXlv/6AQJJ1Dky7CXpgyU
 NI98JprT7MMMlbATUsd6m+UYrOJfipo1Q2irUXUoGskeJkGgNifYDVcP739NC+L/l3MEdBJb
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c46f5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: -IMQhfSAzFMhmIvO2-Z4DmcoGnSFNcHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=897 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
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
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
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
2.49.0

