Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE7AE8D92
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A5A10E7FC;
	Wed, 25 Jun 2025 18:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2yRjw6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABBD10E7F2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDhCgf014586
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eqq9rbaAioE
 9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=; b=F2yRjw6+OVLjPctkQ7sN/SPa2Dw
 9I0eoXTefhTcUVJuB44zerx7wk9plj3WgmZuB+U1NDuOkBpjgYQcanCPgttNDshZ
 LHjG+vrltCf1AEry4+JKwdu9sSWZ02G5naJKvSMsQg5Z8JKeiy9R3/Yd6nzG4BYn
 s8X+WgmXDKd7rTxqiFSUOnKHK5a2BpPVFoW1NEKlhTjBeO3npBS/cIOjhn+9e6j5
 UTxIXgzyXpKuyL6PNx2SNAZk0QDls7E69jcx4ej049FUCgLJt9PS27MxaP60f9dp
 cKxpjB0Ix3eQIf/kl8UIy66kqb7yahG/p7KEzezj23KejTA6AUHVwsM1tWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-237e6963f70so2257465ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877961; x=1751482761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eqq9rbaAioE9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=;
 b=EZJigKF+MvWKECHigeEnzFDWcCDB1NWoyr1vXXDOMd3Y4WtXb+yP7kSwCkYQJhg9wn
 WaEbG4zygMJN+jXz+xHiQ8pqYf+fAI9VUp7Q2y5BO1A8bc3rpF0c8vl8kFtzoBOFGgcr
 z/E7Zf302zqiEoI1B8PjhMJrHevJfUFdSixPgVrnwCGRb9QGjOgmjVW79AMdpaa19d9B
 IS1WmxdbVs77QIV9L7Du0HR6feQ3sp63AOqgX1RUoZeR4YZ5YuvWk0SAmxYDqt8Zdpdf
 9VJAdI7WSIoP+ikR2dSbqwA0XfEHMuMXGd4DV6mN/FVmsSrd3+dQHOtBQk4rsD/pGuMu
 VBRA==
X-Gm-Message-State: AOJu0YxHZTbPA1g5gzlpnekwasTlMI9+BOdd0LJq1i3mVLf8tZgHtGfZ
 bXKkqhqsmdru3veBjoBuQCM8My+EdKoZ+j7wgOQdWTL9kVpwmNxwGnGXPrpZJhvT9YM+u8xRHRK
 bJOJ+scz/LMVxsHl6Z2L8uSt22pL6XB6qW+7Vn4WsN8WDzN13DxPisiPQeWLn99DuHyuKHgkzi+
 zUcEA=
X-Gm-Gg: ASbGncsWGWYh53UUfLxE/VFF65E6WN3Bxwz1fuAMSufaabhP8Jpf/L8c4zlKeYL/G3i
 ENBPO3pXI7M0WxQqxWL85Jt9Ejvzv/+dWfweqQU8vxKR9DpUsNrlPJn1hkqrJbcrXq26gVSSiUh
 44XCCR81hd/2PmhlSejLiVLiD/95QwziL43CaQcRBTpr6qO8Iqo7PY94vRqUtTEUVMakC6IlidG
 0s5UF2Psxt1M88XsHvWymFhSi3i4qbmD+yQdqpaVi1kAqIB6q72iuAJf8PG+atzuh4TIBbAaFp8
 HVk+Ii8ltClF1QjLNdqGdTqPclAnqA0t
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id
 d9443c01a7336-23824087b81mr74601515ad.51.1750877961052; 
 Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH/9u8r/LxodxXtXwo7w52l7fdtoIYCsGzY2nyZs0qLi0VBSXghq7mfLQgk/HczC7JkARW8w==
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id
 d9443c01a7336-23824087b81mr74601115ad.51.1750877960671; 
 Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860a8a8sm136322695ad.132.2025.06.25.11.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
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
Subject: [PATCH v7 39/42] drm/msm: use trylock for debugfs
Date: Wed, 25 Jun 2025 11:47:32 -0700
Message-ID: <20250625184918.124608-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c470a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX5DRZZmItSXUF
 6EFv5TzD+A1+XdBdPffsf7zaiW6KpGWR2GJ8W0gt0xBDlVJ5SAh+mqHBFxG0ZtbqrIc5uacuFJa
 dDoOTKYTFdURfDIQWSRDmVmq1M+jcgxJZVTOvtxIlQlCowEVYR+/fLShEguyWbmnkY8qol0VzQP
 x8Zu+JLNADnE0qjw/fdRt4TfrhDWyrdqV16TwRnwoxsKg2gNSatZdsD2l4nOCKxFKFAwok1Oy6W
 NOH4VbdeLwR87znXqGqrb628B3C11z9QrIi/vDdnS7X3TmwAUx/wD+iVI3CSI3a3DfI3jQ+Yu2F
 R7TjxR8MD2/fgVIe0UjtC1DOSo4NQA5nprs5PMyuqmh+Dt7HYUsJnt7dUWhyniXc9t3JHts8E08
 mI4jkx0LUBufE+tr31FfckjfY4v40taRTkBp69x4sJ+wXFDJfIotQNG6HNnusTBJcZmZrxnF
X-Proofpoint-ORIG-GUID: 2TI6MgIV7WL_UcormS3a6wjJYnKg5Kwz
X-Proofpoint-GUID: 2TI6MgIV7WL_UcormS3a6wjJYnKg5Kwz
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

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e415e6e32a59..b882647144bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -946,7 +946,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 57252b5e08d0..9671c4299cf8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0

