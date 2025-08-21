Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039AB2E92C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 02:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035BE10E83A;
	Thu, 21 Aug 2025 00:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnO3TDYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F7610E82F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJtkhH002743
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=UUeZ954T0o+
 UR5vuNiqg0BBHjNOT7Hd/arRfZ79Ap5Y=; b=bnO3TDYveWTOLQkrfm5KcRB8buo
 9/wxJEHtJNuR4gVm924oFrvDt4dqX8QBrtQ4wfPF3ZkFOIbppnEeavSg0/NR5KcB
 nJeyjRuQRB7DplRV9XFwpxFA9rNRv0R1ajpcvmihLg2KNTZO6rintJ6vtBJe9m4w
 vxHlDVsFcV55q52w5k+wiY1jHQ4ZUlJQ/kwhPl6yssTnNL/iFqVFfTK+KiiMfreG
 Z70qJTUF0LRPC5Arcq4cUgww6QFylMX1L8yLKH5qppU5Hg0e8eh60SJMnVJK2PeG
 7maKAnXNkVHXES43FarV9w0IYni2Ys9b0wUmkGQJ3naZpHGyx774r56lZJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528uc3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b47253319b8so221734a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734675; x=1756339475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUeZ954T0o+UR5vuNiqg0BBHjNOT7Hd/arRfZ79Ap5Y=;
 b=mF41/oeJ4oTgrqhb9pW+dsDn5Qfkptb8TnfV7iPWrhANcXdDngNcSnR/CCH+kDSQ6u
 uIjz1ROp+Wk5EcfT7Q+++Q2VwNyL0HVo84Yc1Uw11uVtzZIsY5y46dgQ3hG+YoXGN/A+
 eRs2apr/WOCDKlALvfUTlk1RhGVt/C1pAmaWXvhaglTN8JO7GnkpCgG7GmSeJutQiOvP
 bvGFSq6EHTiLWI4u8mI5ZvAq8wkstM430HWtNFlEMcGhm5rAo4CVb+HYFcahRxwnKLOk
 hZ77kq4wxVWYf27YH7SZzm7FwCJY/n3zupkV8PTKP8I67lZ3ykB0NAytxRwu+Pl+uYXd
 ORXA==
X-Gm-Message-State: AOJu0Yzp7eHkI3GOd6z8jTO94Mvjs19LWAO70tAQ0VHrC7lagnqicR17
 GVpLZx0aGrO4hXbJoYHp9hHl6k2L1ZuzM3XNP6Q1sWt9lx9dxbLQyZui8oapW8QjVHezWqcS3Jg
 00sgM77+wr3msAe2iEv9NIQTG5HwFX22jPdftAz9pQ+MO3jzO3hGdFv3S51uz+C/cVADUtoEqwo
 Pmz2c=
X-Gm-Gg: ASbGncujeTnKzX+1mnLglmRheksSI2Ewq/c7dCo3WlHnqP5oK11UXJ1ZNPtkIjU9EV1
 0befdYo8E8iO8Scy83Y4XZ7e7aCi177ElVs5X0vB/x+RGiyknhXfUVIrxR/9foL1Vp1ONkdhKN3
 29w+NtnRv9WYmfYNdc0bkbNCxRsfAgZzWkLZ83o8N6xprv2OEncao4muodAPIE1hzXlm54ksVO6
 XlIU9nBSPprV+sDv79euAknfJiaqYJRgXZa3kZBcgAYS/ebEZeCR7CMaBfkW8lkDQZOsUJT3xnK
 l8x6J6v99Ou5VNIPU2gvfNVmy2a8sbb4G10jGfT6ITKFkjYkv10=
X-Received: by 2002:a05:6a20:2589:b0:240:750:58f with SMTP id
 adf61e73a8af0-24330a38b92mr513547637.30.1755734674626; 
 Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlUnW8lxbe7CPRYj4ZEmunFvuRSStPlf00u91BAFQGx6Z5Mg65P2yj1AhS1x6n8d3UR7v6+g==
X-Received: by 2002:a05:6a20:2589:b0:240:750:58f with SMTP id
 adf61e73a8af0-24330a38b92mr513507637.30.1755734674129; 
 Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e8f20c7dbsm3229516b3a.68.2025.08.20.17.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 17:04:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm: Fix obj leak in VM_BIND error path
Date: Wed, 20 Aug 2025 17:04:25 -0700
Message-ID: <20250821000429.303628-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a66294 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hfQrMx_BsErUUvjcJTYA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: AWCTvktruyLRTNHX5ejnC-IB9jb8lpyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzVT+FwaPpRFS
 8ZXB2DDQKKCf36JAdzu2kRW4UP8dqdiA6K5dtYoFRriot2SF7q/gJl+uvNN/m56Ib9zpJo/x9mf
 eZHHYdVqc9OAAhnorv77TZ2mTJKE4wpR29hcdekuLnS6F2/7mC3H9QiN3P3UoGsBeOBMQPtqC59
 M9XlCZJh8HckjeSlQqrFKKcB2fnOwin/YHMjhoQXWyu7Qf8KJGOYj+Od0ChUyxzR3CWdphyLpgP
 YUTOAKNEpWDx+s5yvHmioZS1h5rXaM+EDdkGPGkRf5VO//xChDXuULFnQCWy4n2czGQ1Tq5JW8K
 LXg3bzkYBTOeImEjzSLjVZ+Lg7VFcqp/Qle4jmhNy7nPqUSUKiB8euykqDeRhP7HISAAac6RT0p
 C3OEbX4d510l0eJ1aXeybBdLjjezjA==
X-Proofpoint-ORIG-GUID: AWCTvktruyLRTNHX5ejnC-IB9jb8lpyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

If we fail a handle-lookup part way thru, we need to drop the already
obtained obj references.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..209154be5efc 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1023,6 +1023,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 	struct drm_device *dev = job->vm->drm;
 	int ret = 0;
 	int cnt = 0;
+	int i = -1;
 
 	if (args->nr_ops == 1) {
 		/* Single op case, the op is inlined: */
@@ -1056,11 +1057,12 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 
 	spin_lock(&file->table_lock);
 
-	for (unsigned i = 0; i < args->nr_ops; i++) {
+	for (i = 0; i < args->nr_ops; i++) {
+		struct msm_vm_bind_op *op = &job->ops[i];
 		struct drm_gem_object *obj;
 
-		if (!job->ops[i].handle) {
-			job->ops[i].obj = NULL;
+		if (!op->handle) {
+			op->obj = NULL;
 			continue;
 		}
 
@@ -1068,15 +1070,15 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		 * normally use drm_gem_object_lookup(), but for bulk lookup
 		 * all under single table_lock just hit object_idr directly:
 		 */
-		obj = idr_find(&file->object_idr, job->ops[i].handle);
+		obj = idr_find(&file->object_idr, op->handle);
 		if (!obj) {
-			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", job->ops[i].handle, i);
+			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
 			goto out_unlock;
 		}
 
 		drm_gem_object_get(obj);
 
-		job->ops[i].obj = obj;
+		op->obj = obj;
 		cnt++;
 	}
 
@@ -1085,6 +1087,17 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 out_unlock:
 	spin_unlock(&file->table_lock);
 
+	if (ret) {
+		for (; i >= 0; i--) {
+			struct msm_vm_bind_op *op = &job->ops[i];
+
+			if (!op->obj)
+				continue;
+
+			drm_gem_object_put(op->obj);
+			op->obj = NULL;
+		}
+	}
 out:
 	return ret;
 }
-- 
2.50.1

