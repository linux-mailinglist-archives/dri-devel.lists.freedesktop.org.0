Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A0DAE8D98
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373D110E7E6;
	Wed, 25 Jun 2025 18:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0kPB7le";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C7B10E7DF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAb8ha021793
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xpH5LnDLqPp
 lqQDe5uMXBSo64o86rKmUu4KIOqTfDTg=; b=E0kPB7ler9H1XBVaItMKmLw/Uiw
 GZPTqVMbhrNYg5mBLE8RcJs1k2duI4GjZrT0T9UxFKB2MkOYVtMXH+UTWjyHuhbK
 eS+60esDczZG8Luu8n1apcCt72moc80lqTvhoQHVxTB2S8t3j7aJX/DkE6y3t94U
 ypIok3jQYHQwZ62nYPKvIe7nNFxbJdwA3eVFNii40nAL4W0me/3JSYPuWRNTQKkv
 pCnXgXEHiwsvc0jwYv7af39KnbAqllxu5WvsuYDJfvz/jvanN/6P40Sg1u0L7xfK
 LHQqK7Ur5sBADG5nflWzM97/OFdyCY8ywTXMhrYhfaHlTgho5kTvM7/m8qQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234fedd3e51so1850615ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877965; x=1751482765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpH5LnDLqPplqQDe5uMXBSo64o86rKmUu4KIOqTfDTg=;
 b=X9LAinVzuP5PO1sIFlLUk5yFypLBLEif+0HXOXaHsWnIqkC5pQdof7nmQ9/p2gzIiA
 bLFRn5iIrtwg81u+bnPDSwucAr8Q3WhN9pdhRChU4J0qYgVW+bdZz066RmVnRilBwTSs
 oCCmsZEDzR06SSfv6BpHDKjNgCcv6WB/k+1vnJe/upMjRYe+dtLYkOOx9ZAZbKNilhMX
 swI3G9z2eTtJHa0HG/BvcyUeM8uybiB9kM0RDe15r6WBS3LS+KzNmOvY0gQNfeSMO0EE
 W4ZpBdmQWJVJTAUbSZN2n1qN1OmeJZca78CiZAhfUwZXoAw9WLqSj4619Pzom6HeWP+o
 Nhgw==
X-Gm-Message-State: AOJu0YzrY35Jrd/qmKALn72+xul5AGePX+GqsAQLOe/Hn5y60SiaOZmM
 3jbnUQVSKVoAW2gMonzhzApCw+hINGhqZJmXfpGPKNJ1tIpDYrSEnWVZCOfSIs5Ma7XlwniDHqA
 P9uXuGB1oj+SJNfTq4i++XDt0jQOoHj8gGT9ffsJcl0SRrWC6Z973Z5m0kP/a389PyI/QVZm6Dy
 BH6tc=
X-Gm-Gg: ASbGnct9xFetvXqi56Ku4N7omv2MBWrK18F5frvdC6krbYInR6+NZjLySkPkZoNXbE7
 09ZZLiBZitvvoiOrH6ZOrvWmUGZc0FyxR+3mimwGnthYZc0QouqFlqBdTIQfSG85Wk3OG4fk1bC
 qbi7/oENc53gpznvAhPrlKk0o/lowTvxxeqiPnGafBV43eOTJqggoNQmbDAiJMQ7KGFm/GVxBro
 epz+2CLigWhdH2dvsZi782O1V+QSxy+hZpfkBXOG/XBd0T6ThkhzAUl+2cWCDVp/mEPv/ONxehL
 dIOOfkszwL87JpeR79WV3cO3Fx5IjQdG
X-Received: by 2002:a17:902:e88a:b0:236:9726:7261 with SMTP id
 d9443c01a7336-2382404d970mr68388495ad.39.1750877965189; 
 Wed, 25 Jun 2025 11:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtVUuEZYb41RLKeTVjavf65tKB8NX8TxZxdhFwSQPFNvRi5z1jUVtVE9kmMQW87zfFtvY+yg==
X-Received: by 2002:a17:902:e88a:b0:236:9726:7261 with SMTP id
 d9443c01a7336-2382404d970mr68388205ad.39.1750877964797; 
 Wed, 25 Jun 2025 11:59:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8680b07sm143765655ad.182.2025.06.25.11.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 42/42] drm/msm: Add VM_BIND throttling
Date: Wed, 25 Jun 2025 11:47:35 -0700
Message-ID: <20250625184918.124608-43-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c470e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9ew1I-5mWBoiHqGEK3IA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxiOkaBDU7dt4
 vp/8wbHdrckpMwn3ZflxLGKD9qnvA/FdnutWyvYewzAnqQgbkgCGF6QFsO+AtSqD6pMKj60RYyi
 eF9tIa5hwXPJRp2XsHtZ5bGkv9WLUdhDzfttXqKzMC2r1PcBcwTJEWet/t45vJAg1CkA8Kdb3eS
 w1WNLEARy9B6+FICJWnGo5h9IC+1QxotYKuw2UC9Y+lCJWjaQEWsAJzsdV2Pr4iA0MdcwSoETAf
 t5EMzeq5n0Zey5nWcpMmDcYOZ57cfOm0r5xmGyoUEaTIuEXojfK9BaktUVkUWRqbBa9b5orCKJP
 pt8Es1l/qZx1M45mSNPsZWBdnppB50eNuA29nWMpjUkD54FCmDI4y2QiXfeQMTDuFcKCp090V3c
 hIpCxNpFMT3mxZOl0d/i9+Wi7b3XDs2VsKA+AhIFs6vyd9TtWLdlG5qq9dEvFUtmZ540CDxc
X-Proofpoint-ORIG-GUID: 9iy4E_8nixNdIDFSopMDrgds0JpvLZkf
X-Proofpoint-GUID: 9iy4E_8nixNdIDFSopMDrgds0JpvLZkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 23 +++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h     |  3 +++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 907ebf5073e6..bb3a6e8320c9 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &job->queue->in_flight_prealloc);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -1089,10 +1091,11 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
  * them as a single mapping.  Otherwise the prealloc_count() will not realize
  * they can share pagetable pages and vastly overcount.
  */
-static void
+static int
 vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 {
 	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	int ret;
 
 	for (int i = 0; i < job->nr_ops; i++) {
 		struct msm_vm_bind_op *op = &job->ops[i];
@@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
 	/* Flush the remaining range: */
 	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			to_msm_vm(job->vm)->sched.job_scheduled,
+			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
+
+	return 0;
 }
 
 /*
@@ -1411,7 +1428,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 31b83e9e3673..5508885d865f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -555,6 +555,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @idr_lock:  for serializing access to fence_idr
  * @lock:      submitqueue lock for serializing submits on a queue
+ * @in_flight_prealloc: for VM_BIND queue, # of preallocated pgtable pages for
+ *             queued VM_BIND jobs
  * @ref:       reference count
  * @entity:    the submit job-queue
  */
@@ -569,6 +571,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct spinlock idr_lock;
 	struct mutex lock;
+	atomic_t in_flight_prealloc;
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
-- 
2.49.0

