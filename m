Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F91AECD44
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C4410E340;
	Sun, 29 Jun 2025 14:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+ygvKBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C11210E2A3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T6Y48v027019
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
 wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=Z+ygvKBni9pEGYCiM9rf0Iu/F7C
 zRLq730rCjKrBWdpuwX27f6nyqZdi3lT7Jq7LK1I2pia9HYJqFYwB/hm9SKdKo0S
 AwC2wEiIUrnaWEqw22IAIJZY5I4eoLHWhkhN7fof12jicGGKcLNBzr7h4T3+ym72
 1RVxlpE+Ozyn/4sOU6J45MGsUtockHqzazJMEPTC6vqyEtYIwZqJCiFg+I8QGbb0
 KSap0cruUndl6TnXrRX38wibe/qP3r9aWoObkNVYxHdq6QQSiKiOzFOFowGQcIK0
 c4dzxkmRrZp5t0FK47c9K9rxoExEkggy84pXyNf+ZpOevRson4X6hxweAWg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a604-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74ad608d60aso1108083b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206081; x=1751810881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
 b=vwXf4eOzGYeY2m3ApE40vUM9+05Z/Uq3ZUIqEs0JbUXfdLjGESol4deb8w+dzubv21
 PT1XyLpOjT6tWuTnrBjs0w/EtcWDml+u+onhqsY1Ke95V31TQGNjl7wb81bR31BhXVhv
 4YsrFMFgZFvhpopaFcKV6tffVLJHmZyqKiTYUe1qofkj4f+BjBhZRbjHj4yT2C9z7JB3
 YCc9TNmE4UTNa5vxg+QPGK94yVAXD0bH3/ZVlSEsdAib9zVBmcHGZ5Uy0NRKaONzdHuc
 JLc4KpIvjwcYdxVHxliH+W4UTOTMJxQo4iVpBFGR7IpwLP8zMQSy5mUcbOtqnZ7mcbNW
 922w==
X-Gm-Message-State: AOJu0YzSZCJbfLRPxL9p04Bowb/F8tg/N6AnizPuhkHzDGrE4/vuGn7s
 AaAPak+/FKN1H+evCH4O3MJEzZ1Ol70i7jfJ4bKsDtXRds69qJ977xdCPUbdzhIYL+2A4icID+V
 E2GaCefyXabYs/YwMdzXgVZ+rwzb7Vg9ldYSyQBogdR7GaKdbpCm5f7uucqhJWeqwien5shmjDs
 i8hiY=
X-Gm-Gg: ASbGncvP2urYBPRuTKiP79aNTgoXP1XD7sUY1rTFA+oKds5x9jN2pqwXlINkpOU1mKP
 6Beod+TI8Rwoi0WAE9XP/n29Sj32B5Wcrgpa3IuRceb09ORU/vJMV5sufYalXAzbrJoYW7iuj/6
 EE3oiBn4jQqFkvD2jsPE4Qofx/BgwjISeITmjdNQ/dEnEEvpx9yLnEmf/Mic5+h8OCwqy2OT9sk
 QvVpiMClKM2bxX0qPasCcVp0BJj9mpY8pgGfyK3ITLLZ3dW2GbB24nYy33UGzCDgWI893nGpY5o
 e7qIjkmItCLtr7dcZklCABpDyQMd5kpv
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id
 d2e1a72fcca58-74af6e61b06mr15386844b3a.8.1751206081309; 
 Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmEjFT9YhO9qCARxAsGvGVKPjEex9KKnkOxbT8IIcaWHUwA/BA945pWU2NB5DkhvJU1gw/lA==
X-Received: by 2002:a05:6a00:4b0c:b0:742:8d52:62f1 with SMTP id
 d2e1a72fcca58-74af6e61b06mr15386802b3a.8.1751206080907; 
 Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af557591asm6977022b3a.99.2025.06.29.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 07:03:31 -0700
Message-ID: <20250629140537.30850-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: HGwU1u9vuUWMrWwCBF-ScaHm03d-K05K
X-Proofpoint-GUID: HGwU1u9vuUWMrWwCBF-ScaHm03d-K05K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfX85HjdUr4/QnC
 txaGocTAVf/tBMtByKOoI2rk2EJBrA3CFIyLNdKI14+xNjFqYz3ccJousItnjoFRMiRPSYZab5o
 0eaz2utcnjKps38z4VKDGv/syFSnC/DjmVOBMmlYrefL1e3Um8TJ57Q8ufoudc0ko7tOwR0VEY0
 StP5S3lHXkq7rrWepwjPodAERWlr9jVbE/T5fM+ve7jDJI4HQj5IwvjNhJPWSN4McUZ9bpMYEmp
 Ud0tnga6D4IayuexrICmE+gAbLzEIF5sJ0HvBBNnmfT9uWv2NKF/ZA7psgm2KojXlrvyYfX8WJ4
 MIZ0qFU/f5YxG9I2HUw5zT/GBQsLbKhiiSxCg0RS39kESEYdyajxa4w3uRURozDgidoH99rFq1w
 Q3HxnnRJzYfDkiyl02yjVxGNKYmZ/C2i19DtKfg59ToK58BWfg2PE4sWy3hK3zjTJhrHgm3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118
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

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.50.0

