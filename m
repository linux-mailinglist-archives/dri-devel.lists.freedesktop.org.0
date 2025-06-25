Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C61AE8D75
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E96810E7DE;
	Wed, 25 Jun 2025 18:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE+joRQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E99D10E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:53 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAVXWX005493
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZmGKliz2HfS
 kLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=; b=YE+joRQVeW83E173DEBd8DlfS6Q
 1GD/RlzoDgt9mkUKHzTtPhxxyyvWzbs0oRDmViGR3z86K8X6EbQdJVmvoMjS9LGH
 aCoGwGs4f7CoFbPCW8RKFxu0nImD+Acz1RB/QNxPSxhncmr+OH+n6tEm3Zf4RAM5
 107j05enx5cdOVRgumfK2cBxdTRVHF0WCnetEb0iBpys4sb4tPk063w2MOJRe5iS
 q3z3qbp3CUixevCYAQLdD73syXENgaIPdIrmX9ejOgWsMuMySJhm3otxc+CKtitr
 /Y4dhCGCp/6SA7JDF6HWb+Ju9gEAOe4c4bZOZOzV9h8m4VnbMe0QAUQILMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdasrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235f77f86f6so1565175ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877931; x=1751482731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmGKliz2HfSkLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=;
 b=hd36Sp75hxhN7iqSFypUeYYtwIKmptRlEkCYs7MLuHGdFcaoK2hZ1bIhG8Q4yhRPjn
 K5l779MLUVjT6UeWRiXufErcRLhS55UTD/GgLLqnKqHZQ4zuRABL6X6aMPEl7M+sFmrp
 fSoJ4A2M7dVtyFQwUl03nU+LNRBGBjdaHOGCgSWO1KmSeTTsMlhGRB4oUhbF64ISVJw6
 ID3sZkxBNhUMEhZTaX0S+0Ahq9/zJRSlZ1paeaq7tVWQW1V8FZvnHtqcEZ/t/eXU3aoQ
 mEmTZCzDoRQ/aj6rS5TLxw1dSMC9amjW9jql2Lb1nRH/0XBejSoYcLWKETPI+dqZkgwC
 fjxw==
X-Gm-Message-State: AOJu0YzSB6zkG/mgc1itMzLiDJ7aF6BAr0G76zJXPc9Ilvj5Jx3GUAC7
 xKap/pLurLD25pq9zHWbiMmQzdAHb9oGbbqgfOgmVrm+OXc/P6aMNY3GEld4y4WUU+tfWRsLKfZ
 h4WeuWUb3RBJ33Kd5Mxs90KN5yQs2Izav3pEC2EoLaGwO6M8jqqXEebng+x8W01Pccgch1YyqZy
 aXAl8=
X-Gm-Gg: ASbGncuQtWpqNWPTtS+BrJaptlkpUnJbownBlJiupKdjJJ9pfnw59O0U2PdR8XvJCrk
 rUaFaXQvxYK1SP24O/37f1l50TvTkh/ybBipO9Ds50prCxDr9T1J3+Cun7tPXPM8xdUVmcdsGLN
 5p1xKcY64T0Vg++OJAoXcUjqISifcTHs6N08AavOhIcVqJWBTYuuyS1ZlWR0qkY1M3oxXvZFeMp
 Clp4H7UoVbpWNA8bSKHqywzqLFHKgjnck5tvXzbyoJL/xkIebtlav9GwZIYMXbBKoWdcKYn1d8d
 LMlCBiYLzN2L6cpAhObFmG+gXcAHgL6M
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id
 d9443c01a7336-23823f95145mr55316235ad.6.1750877931645; 
 Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd+biFg7tZ2NwXXiWCrI5tlm21WBzd0htJGfF806nU5iy7FUrbp/Yw9gOaS7aR3Qp5foqhCw==
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id
 d9443c01a7336-23823f95145mr55316015ad.6.1750877931211; 
 Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d867f8d0sm143513745ad.175.2025.06.25.11.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:50 -0700 (PDT)
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
Subject: [PATCH v7 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 25 Jun 2025 11:47:12 -0700
Message-ID: <20250625184918.124608-20-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX6m85GorMwtdu
 +MtLrQdTui3J7P1RhTSUz1vWrBIJANO0uXmLqiD6CDwzq1nhg8V/dtUUTEXKTrZr/aMasrLCGAD
 S6ps4N4F5zhir3La/L/WD1hiPOzfk4paM7pKJLIvexd7ZdM3AKdb82b4HjpOvBeL4gt3jLShMH4
 6ejaGR/bcNMdnMJaNMO6B15WrRCJe5+yBVDy/dwnYB+ocpRPbcrb55GCEO6/59CwDUINnSrYxQo
 lTS2S/ElHvSM7Pbb0PLG3J3ADp3hlj5iMnQdvdijcGp8ihigIQchLoyeglbuA/acDrI/gGbgNt+
 bE8wmMNUw+XKj+wQyb0h+KzI+Falj+V3VVQiA8s3ncg/FqiJtNXNv8TQu8VqcEh/5EhmBMNuDq9
 z7NjZr9+JMu6CyXa2uo1IFUmG6aws/Y9Q7hjaOaquUvOZjH0YKr4YweAR2WQODfPSxFai47D
X-Proofpoint-GUID: dpdh4WkwPOXRgczTA20LDzeYr7QIVZgG
X-Proofpoint-ORIG-GUID: dpdh4WkwPOXRgczTA20LDzeYr7QIVZgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=971 lowpriorityscore=0 malwarescore=0
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 194a15802a5f..89fead77c0d8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -61,7 +61,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -437,7 +437,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -615,7 +615,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2dd9a7f585f4..ec1a7a837e52 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -111,7 +111,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ef0efd87e4a6..e16a8cafd8be 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -21,7 +21,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-- 
2.49.0

