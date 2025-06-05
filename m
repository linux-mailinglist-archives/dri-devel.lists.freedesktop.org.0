Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FFACF6C4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36D010E9D2;
	Thu,  5 Jun 2025 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiM/bpZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863FF10E96A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55593qcj007709
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZmGKliz2HfS
 kLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=; b=jiM/bpZ7zNpc+vJjH40exJvMVGF
 sZ8pOG32e1uWNY98RpOn2vTEfPgg2z8nRX/v6Hr+jtG7ULbmtdlrrB9JftRTwf9K
 ozMd5b3w3V6jH0IjilHt8mRfgnarcyjCxQKHYf6pVqotbvjYLNkUKnkFa4Z2v/o6
 p4+JqDHJhtEr6mzhhmxuA0YOFELOqo0XX3FBGbjBQZ8wIglcAl551aLY5lPAf8rp
 Ww297rmTeMr85hLtEENlbsY1Q62Gfyf6LtIhIvYj1JBwNMrbJyQvRl2+PJDu2Nlh
 MoVNMRI1663AVLQzl2BDICWj2hdq3QWfjgoxWWsxG7UT704SnPYQ/I1v2IQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b090c7c2c6aso735895a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148373; x=1749753173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmGKliz2HfSkLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=;
 b=XHY+l+iY8zQaFZWOaEjZdZ1DWXT5q+cLdL4NXEg0vk3BfqOowlb+M33iJUBSH07KK7
 xLLMlDze/Qlyo+EtAZ1y9SwbCfdq8immk48QUXKfpoVsZm4K9JTIF5FTUQ1QHKkHKcXg
 qRFmCV6g5whGVzbMMElz31T4J+MDzFiSB5vx2aM2iKto4pnPw4Nd8dnlYYaIH+0hLZGq
 4Urj3oAKS0uKb3lmadtKjEhm4hWFY2WIxqzZw1okWVSoSd40xLQ6NVm80W+pBYcioGD9
 CeVilgA2yivOd0ifGHDWpTjjoIa2lUO/7TWBW2OsNyfm8V5dNGcre+bR7RFlYtronNC1
 44Gg==
X-Gm-Message-State: AOJu0Yy9AmC6kC7KKJb+fxZ9Yb7K5CyyJhpwh6kM0EBaDs7Ao6epZbIX
 7yV1G56Flf4xd2Rsc6K8uK4OKx95uwT/4q8N5F5gKilGELS55w1zaEINP8VM+glitxzstismSqo
 d1uR/9yZ+X4MC1wRMwVbNMmEpGYg16TCXjh4Bn9eAYIW/YBx0mR0s9kGFBmNbzaQXvgD8t1z/fU
 XwWRA=
X-Gm-Gg: ASbGncs0XYOTEMJcNGGYsWKdjEKGz6cloanIhzwcYK0bgSSq0IG+WVtyYclIITEpGuq
 cc7NqYHo0t/Z4wgbhdd4bbrHVpbAMLdrG8qJ4RwLNCUscVhgVotVlCdrWp3xZhad4T333z0ArqE
 UC+iF6iT6Jft/jmkBMWoJWwEHc7Xw53AXeTYXE0MfpJWS8DiGRDOQnlR9wlyzF4/++zrf6h3hf4
 CV+qv77TwaiOt1z9hEoZeRx6r2+NblsYABQmYz4+ult1ES5sINg0coorcjE87RgKXfli/kBgwIC
 AP8HQV8RL8RNSJnQFkhlUA==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id
 98e67ed59e1d1-31346c50561mr888513a91.21.1749148372990; 
 Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyetsmd5uwbFaFtMcmZkbXRpee07zjRboGQZE4XMHIFA39QakUNWJDzUUaxfsPJ5Rk9vOEJw==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id
 98e67ed59e1d1-31346c50561mr888471a91.21.1749148372577; 
 Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fc5460sm61213a91.23.2025.06.05.11.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 17/40] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Thu,  5 Jun 2025 11:29:02 -0700
Message-ID: <20250605183111.163594-18-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2d6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfXynCdm1Z+IEr1
 50znn8W7jJXWJxpUj1p9hECXgGSS1flnWy1gP7jHJTL6WGYzXXK/bSd59+aSj5arcfd6r9yHK0n
 evxHVpxPrJpwYMCCKmxIoGz9z6NQURI0eV/EnTGS5wWwXgJZbQceILT7VlDBw4Gg4M1VdfIfaXE
 mYGFpNmwVcZqcQmmg06QuxGTiXDm3AKQbKf31a6boCE1oUZrQiaypv/vjF+zD87/hZU3mtkVAgb
 gWIPTGXzai6lTMlr2I4unwXX57u6cUSS88GgUF5Lw6tZyuv7qHDA5k4SLCq4rQfelACPYflDcyp
 ZIGxCZA8/jy6rX0W8EwKTqp/wm/nNI8oijB9uHXc1VCJJMqMyTwYKD354S/UTk3kr4JenEe51P/
 iWX8gHcqcBF00zfXPwPjNObcx9Go0Xvz/5waBGZzRYcubRlz2jlaGiwt82Fb6OQigfqzK+Yz
X-Proofpoint-GUID: RdTXLq6HVFPM_OoDqX1AFKTdbyxfOj0q
X-Proofpoint-ORIG-GUID: RdTXLq6HVFPM_OoDqX1AFKTdbyxfOj0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=974 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164
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

