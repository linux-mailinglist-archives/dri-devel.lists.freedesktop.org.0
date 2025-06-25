Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C019AE8D81
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D1610E7E4;
	Wed, 25 Jun 2025 18:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRxDIN5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC410E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBhN2W020843
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zZ0/1Hg9ehG
 RWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=; b=lRxDIN5CicFLvLQrRAk+zyEqz8A
 6Bio695kpwmaahDHWQb9FMpv74R8pYMWJNBM5diCBFMy8GeNPuE3kqB+ixa8vYrL
 PcYfxYsKNVtsmA7bkbTHcfO3X2M7dlQtvQH60b61uLGpVogpZNB8ldoBYIcvY0Je
 42bSQgYy7HODZLu9I2meWiO4nznBoeM8Z5uBubThjnwyVomUd8UWNVC4kUHJz7/R
 CNAE9OP4oNdBUTkSR/VQzZ73rneRyG5TjNyC3D6mZldqv+yBi/+0UoELQWizMXao
 QVG7S0mBKOksR85YPgImHZCL8ujBfXD032PwwzR/qDqxvPd+TMyCZjZWCwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40s3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748efefedb5so256327b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877944; x=1751482744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ0/1Hg9ehGRWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=;
 b=BopA82PdryuU8pYulYRJuEaH8UEitBZUNmborcMHisFLUA83U1mhjFU/PIu128Noch
 jzY1aHw38I8aQp8O/hNe6XORF3gB1jmcV4vdjrNK1Pqz/5/GBXV9CsT3o7y8UpYups3d
 J2uFzoSO2t3AqYzPxh7W4pnuFb2fE5agnNprrdOJJAVyVw+/2NUfFdMXqeTU+LS+k4CI
 2UVadnx8PPVhAop7+DouZD70DysEpjfKdf3pbTt03GjuSpfSScz6selU7LNGbvPtWzga
 QMwy19zvOLXK00si4Z9I/Lip5qNe0XVnDh73jfsLanX/6ZuD5QF0xyupdM8dV9r33ymO
 wKxw==
X-Gm-Message-State: AOJu0YzLQiw5pSVbCPNyc4SQxFDsRQ2NYrmxU1pZGB9FjJtz3EL5ZsYG
 BkMevCs6UucJpqtM8LnzSShPcxV9IZwJX03EHAjvtv+0ktEg6Rg7sn96nbezfGuwcjym95rcEe2
 RMav9EWhXpWaFqdUpT8nBuARdNEjxwCM5yWKGXLYWUnMLY03j40zOnqmmSgRPSs6mGhEUqEnyUd
 PX32A=
X-Gm-Gg: ASbGnctd/ojfKPsp3DdwcIKjp+3k41spkXRa+axZHJor+s5RQ0BZgpe4qGVP28o2k7j
 YRuD84pGnoNLCc+iEStlBbIFBHJn2byL6jEiKSBFTIBBDh/6ErEqxGL6ou0ocPth2wd9zoZtQ0a
 lZySH45phxY87j4KGlqG7rhjawcTmoXWkmGnu32KWstEAvOvYfUzxu3DIEQw/r/vlI/8ni8u0Yw
 QFX/WkmLW2t6dZWFTVSN3aTth3Is04+kjozfz4oQh8Sqg8MOWHswdNyCEVXg9WTFtR63G6NovH7
 ofTmQSf1qX9rhix7YVztwyEl5C2M/fM3
X-Received: by 2002:a05:6a00:a92:b0:749:93d:b098 with SMTP id
 d2e1a72fcca58-74ad4500c14mr5889494b3a.22.1750877944387; 
 Wed, 25 Jun 2025 11:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv/fci/aWABQPqIxId1qt4Av5ksAJmltuRXsEkge7A5PTFsk2rkR0SaCYSvzUz9d2gs7rt6w==
X-Received: by 2002:a05:6a00:a92:b0:749:93d:b098 with SMTP id
 d2e1a72fcca58-74ad4500c14mr5889456b3a.22.1750877943945; 
 Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8872c7fsm4943244b3a.167.2025.06.25.11.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
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
Subject: [PATCH v7 28/42] drm/msm: rd dumping support for sparse
Date: Wed, 25 Jun 2025 11:47:21 -0700
Message-ID: <20250625184918.124608-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXzyMJRpJZdPjz
 oMJ0tTqpi4GIxAQPtxJnC/QXR215xMt8qra2HYgvjG8Y84gLOaV6c+D4PrNKlj+Umjv3PCG7WeB
 ZMYM6RRucAjm70g6vRMepdEGZzZCi7z23yZjZc+CtAedx1VEAx0sKDyza15hwW3xMkPN6D+fLqV
 Ga4kX5lTLJNf4Bp8eHGPoZ1ZxpEeQzVzrNAd6W9Nd0jEK6QsuEC5Rw7rKic+4qWmVOslYo9ZtVq
 1jj/M4DNgJZ0z4yBPrYp6lj1sI/VXAYKW0RQfGsKt3DGJZZzlpS9MOiVMNySZby5nTw8BeziOnL
 +mzCP1luNKhhjyV6KwvMqzx9UzoIgR3TmxdoT67wq91NJ2AmfjnzBsAZb/Jag+bL/eU9ufsJyXX
 Qo28NrR4FBI45fmNUpCXuoq42rNsIo/I2On3ZGLUFpw6N7MbdBdk81HKIoOLq5VcP39AFwro
X-Proofpoint-ORIG-GUID: RQVlAFApcWV99vZtVUYIs_H8xRHP9TXC
X-Proofpoint-GUID: RQVlAFApcWV99vZtVUYIs_H8xRHP9TXC
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46f9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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
2.49.0

