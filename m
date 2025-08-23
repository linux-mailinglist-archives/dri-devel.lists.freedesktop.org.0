Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE43B32591
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 02:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6773710EBE4;
	Sat, 23 Aug 2025 00:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvkAguRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A6210EBD1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:12:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUwIH020901
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=LKH3UmwyCqZl4E/zd7SLx5
 cyJ5JW0DFn9aa/Um4dYq4=; b=XvkAguRVqkCgLToup5Ft4AYtG1pSR2nQsaPp9J
 24p6CUG2X8tVecbxiNnnba3XmgJLI5/nhj39UriZIo6f728hmSywHqcKnFPc+u2+
 rY674Ta6yoewXff4d2UhYXwc2kT1lxeT+1YZ5ttAnzqQ/GnBVAk4ST858c11S/G0
 UURk0q2sNTsL+bDWs+sIVPXQiucINHqEIBRa+tE5DHWfwtEffkyGg/lGItysAy4g
 y+dn7zjuHFUB4kPQFKU0FprwgiBgY7ei1kqzqc0+8fZAtuhLF9/QWrX3kmFdJmCv
 K6yjm8gAazAz/P78AIPYfBiSViUxF3bQosvUs5ZD0swvZ7Ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw13gssb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:12:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b2b3cd4d00so25001261cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 17:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755907925; x=1756512725;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKH3UmwyCqZl4E/zd7SLx5cyJ5JW0DFn9aa/Um4dYq4=;
 b=wDjLJZ1/sr79YcasQen5iH9m896k0u2B+jcETJ9fl5r0vA6GU66zlcx4ryhTljAw6q
 iSqndNABI6CADl6dJl7dEwv7FCPZtViE3VgfCWW6GT+e0KmTjXp2ymMQmP0LKt+aJe/h
 cRMWRJpDZE4oObskcLrQdT6pkwGOeRvjjJve1B6rcY6sreLpcWlWchTfUNMiXlRBeD8n
 jteWuN5gCSl1cUepufneMqpivlcePHxdIS+ocdiE0MTmal8w4X5D6sKLWnFVokgsWiO5
 d9nBeAapihxsFW33Qnsexs7OWXPL1hMRA1HqdDtiblYAv7crtsQwccQISuFgo/U5pYfr
 FbIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7FhKwePjFAORBNQ/tmf4vFh7cJao0Z9kyLfdSWNWp2ho3pPbw6wNguULTYo/CWutKjwqu6rghsd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweDp+CUNwcJf04VdAFmdf/GjGrehJ4uHZJKSidQGMv408Vtvpx
 iA3miQSREVbUhIApR1Se34xjnAN5s4HuUJ2cOeBSOP7LkgKRn1kKwp4LJ723SwVk2klGB855aX3
 70N9DzFFXJkbw/EaHyTs7xSYX8TRqiDGYbn3obvaqPrxtk+isYb7a+6kWYXm7E8UlIpbx5xA=
X-Gm-Gg: ASbGnctG0Gj9EdjQ3XHefCpN3e+V6sL/NIiJumwiAQh7nNKgPqtovm5wvZb2zs3ohsf
 OhM+RdSYqXYSrW4e0DN7PZV0eovBqBhwXTI16Bjptx5+agpPk1yfh/Qac03yX7YhmT5XpupzE3N
 dp3316vyrR9JBB+bXyt8XRAdUyZzRl4Hy18Ksh3y11J0NTdb04WF45ijOp8l7IPmCTY9QlaQiHG
 2p7UEbt7UUn21d0scgbttLs53XshqtM6p5zbXdKtj0ecjmarZTcJCSHsoxOn/riJ6ylo8TutQO8
 +jE6zYpdbyBgTgdeBNPQQ8G+LWbQ66kjcWnkTrrsAXM/G5Fk62vjKuGlqZMepeOwSiZhIjTGD3z
 ECCIauK1r9QqWWExTpUncWtpWfdFXWZPOHJrzjkIpSIndj9I34Hl/
X-Received: by 2002:a05:622a:248c:b0:4b0:eb79:931d with SMTP id
 d75a77b69052e-4b2aaa561b3mr63251951cf.2.1755907924818; 
 Fri, 22 Aug 2025 17:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjRcYFg4ZlcT2OcnbWB43OpYbpLPRq63IBEUW/yX7KrugkfRBNsErbT8C9Dy4q63T/Oz64nQ==
X-Received: by 2002:a05:622a:248c:b0:4b0:eb79:931d with SMTP id
 d75a77b69052e-4b2aaa561b3mr63251531cf.2.1755907924269; 
 Fri, 22 Aug 2025 17:12:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8ba2dsm208929e87.77.2025.08.22.17.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 17:12:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 03:12:00 +0300
Subject: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE8HqWgC/x2MQQqAIBAAvxJ7bsE2Kukr0aFysz1oohVB9Pek4
 8DMPJA4CifoiwciX5Jk9xmqsoBlm7xlFJMZSFGjNNXoksNVbrThvByKlwMbUkZ3PC8rtZDDEDk
 b/3QY3/cDlPxl9GQAAAA=
X-Change-ID: 20250823-msm-fix-gpuvm-init-520d87ebcf26
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danct12 <danct12@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=izTeRDcb3LUu2+xcZ1pXgxZuqtAbJOSjKbwv77VWnSo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoqQdQnWFc2erhkmlZkodf2OTqrgXkxW7pdw437
 37G1d3E8l2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKkHUAAKCRCLPIo+Aiko
 1dAzB/4wwaKA7WZL9E0yYd1cJks/dBt54lwvKms5QB1urUJqn4s3R8HawZOj6/PHvvNfOSGQtWt
 HS6BJvmXj38WrfrHOJOGq/ndCib3iVdLmzHccrKenBuszzTmd9bKBbpLU0OmfXpMODSTFRe+lZV
 BdQoMbzHGZnMhNa+raq2b8L2GZQId0Ls6wIdV4eCzDD9FHhBJzEwubPWtbVcD5tVT1s0mSHgUVP
 k88E6Zm1yzUXdgQYYg+9rVLLREEZCdJae68Ai6a97cWNcGbdRD+c1qclyxYICn8dKcq/WKPwUW1
 To3j3KXRZe1APQYAm9z6u20OdAU/ovFhR9lWbeb422fc9KBp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX4uR/UYB1GYQy
 +PjppX4sgU4TPwtcGdbd4NE4Ho+3MjYBLy4j2dQTlO/iB54udqpz1lssZ0eQWoqo8xCs92RL3D/
 JJfMOfzHXIwq5wpsFx5Uysf9JZ0tTQ1tyzptQZ4z5x+ACJM/W7uKc7BPUk7II0OI4QZrvcr+oz8
 ZPXyyUIftdnSmP9JuAavtjsFinIBSLr6mbDG92hoMS15uodpnWaP1qqKRtZe4zGEcsix/SGodPk
 hY1QIWTr2DI4zEKPt6+mAPUJ5p7vE7xc2DBX/J3HQe7FzGHrvsyhx80SnB/QP/UwMkEl7LM0ah3
 Pk47RJoJVSKeORoozgEd9Cj4QgEyMSPdLxkE+zinzyPcPLX+U5an13EdRPmCuyTjjRbg5hT2v69
 3Uo1YTh+
X-Proofpoint-ORIG-GUID: wybkQSwgiX8lQKBfdLmaswoiCKblimEm
X-Authority-Analysis: v=2.4 cv=F6NXdrhN c=1 sm=1 tr=0 ts=68a90757 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=O0ltPWiidyXzGDMWRkgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: wybkQSwgiX8lQKBfdLmaswoiCKblimEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508220160
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

Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
allocate memptrs: -22" errors. The mentioned commit reworked the
function, but didn't take into account that op_map is initialized at the
top of the function, while ranges might change if GPUVM is managed by
the kernel.

Move op_mode initialization after finalizing all addresses and right
before the drm_gpuva_init_from_op() call.

Reported-by: Danct12 <danct12@disroot.org>
Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3f440bc1f7106f3b0091f037611d0b433e5e2c18..6df6b7c0984da57fe64de41fa54f7dea0a324c74 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -368,12 +368,6 @@ struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end)
 {
-	struct drm_gpuva_op_map op_map = {
-		.va.addr = range_start,
-		.va.range = range_end - range_start,
-		.gem.obj = obj,
-		.gem.offset = offset,
-	};
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
@@ -402,6 +396,13 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (obj)
 		GEM_WARN_ON((range_end - range_start) > obj->size);
 
+	struct drm_gpuva_op_map op_map = {
+		.va.addr = range_start,
+		.va.range = range_end - range_start,
+		.gem.obj = obj,
+		.gem.offset = offset,
+	};
+
 	drm_gpuva_init_from_op(&vma->base, &op_map);
 	vma->mapped = false;
 

---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250823-msm-fix-gpuvm-init-520d87ebcf26

Best regards,
-- 
With best wishes
Dmitry

