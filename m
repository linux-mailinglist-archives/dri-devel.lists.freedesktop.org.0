Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B7BFE662
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD99E10E85F;
	Wed, 22 Oct 2025 22:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJWQ2Lh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F0910E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MK12dB026940
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=i0mvZxV1MDsJnYmRbT9+6JtzjrypiHsWcbX
 y/fmUaPY=; b=oJWQ2Lh5VafWunD4Unv+UfZakS3vkrcf0DavngbD/HJYJlHDM66
 WLO7Who+AlUzOjhwImK5ZWis7KpLlukheN2BrBsbXVGHuhJcF0lpIsO9qZVirh4S
 9Ql6n8rCZ37mDKMZyx8pDTElM56Nb6+amyzZ67A65RFiZcmH+3d3+kA6Yqt22MxI
 En7hoHryEMqWqK+sL2POcJD5BNth1EBxDua0p5qPVwD+trQWJIODV5PgF6c0+8gf
 9w8bhm51xQUImYfMMGk1GFofOwmL0sHnrtZIZmQxzLEpJXGjmQNzv9eADhDtPiZ3
 JkQkdh6zcc9KbQaGYt55cYQXa8wsCb3+suw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8g9hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-78104c8c8ddso102637b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761171657; x=1761776457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0mvZxV1MDsJnYmRbT9+6JtzjrypiHsWcbXy/fmUaPY=;
 b=lbRUDMviJ4OncVFMtryOXVxG2Pglkp0Waj0Z2Z0EI5OP6dW86xj6cJxoFOpDscqgNl
 UavhMf0luoaNg/g8O/zFWQMHALfvw/uNoUVvdiXO5yehD+RLYXl/Bhb59bhDXHHQ1l81
 kjVkKPIKhq9mH/+IIrspVvYkMFHoun/NfgVGiPc53gOcgjvcqIE/KmrxCLb35gmca69v
 JBHznOUEnyjU51LqRb9C+m58bThdiD57TyBHS9pH1+nTIook+RcYbvc+vCityFS70K8A
 Fe09SyShHrL1HroUpdFdJZasABVjQH+s22E2O+EfkivwKLHen0I4jF36VitEHhQOthPj
 7Hyw==
X-Gm-Message-State: AOJu0YxtZyyJKdXCemOYGLp1wNwamGkflL5ujfEdI9388wiYjmJ8bvhl
 s+THm2KuREmhm7j07xDYUbeu5VwFh+eKgEzDouQuiHb3v8R1sZO8rp6G1zCSagGYQwzz1DOo3dA
 X2ZFthMH0u4gGK9PtpzwJ3/f5T78wF8/G2Yy/CaXOcKJ392Zs1R2SaRdBeY0Rb7nw/gQPjhlqtM
 gCEsg=
X-Gm-Gg: ASbGncuir7fF7KBSoYS/qIXNTwssnZ1wvz0IRhyUtg3tkHGFD57IF89mUQG01eZzQPu
 at7r2OR0OqPrGYmDUd/o5aOlIMl4Rwij1x4w7hy5mqltqiOuRQAVvXyhSWpavrqg1qlLjd5CUsS
 frY5Rrl2aRdFhS7a8MBPdP4ate8A6vP8cIelTsdSfONvAlrNSqC6sVWp3jfu4SUZAwnI1UKliUJ
 RRVFN+EbkKPgqjd/pBd64sOgaHyooqk9c8nTaHTasuHNCnZaXqOu53m6HOsqg5v3u/GeHlrvu2S
 /AuUGwHUII5xJ/Jm8bZ/G+T1kQjfgxZEQEnu4PnpvMFzj93sBe/I7HSvlLENwTjeBx5SmGrT6bq
 qgKapJ5wC1g==
X-Received: by 2002:a05:6a20:3945:b0:252:2bfe:b65a with SMTP id
 adf61e73a8af0-334a8523c3dmr29215691637.7.1761171656722; 
 Wed, 22 Oct 2025 15:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHcTg7biN0R67q7mojPROACusX0lr4TEu2AEKXPQxVnJV9gXrUyzRzXnKDQhdID1RaUTlQhg==
X-Received: by 2002:a05:6a20:3945:b0:252:2bfe:b65a with SMTP id
 adf61e73a8af0-334a8523c3dmr29215654637.7.1761171656232; 
 Wed, 22 Oct 2025 15:20:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6cf4e0a43asm115793a12.27.2025.10.22.15.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 15:20:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Valentine Burley <valentine.burley@collabora.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Reject MAP_NULL op if no PRR
Date: Wed, 22 Oct 2025 15:20:51 -0700
Message-ID: <20251022222051.10030-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BKfJ4J2wBrFJqBQHf7IaYrwFwnMp0V-U
X-Proofpoint-GUID: BKfJ4J2wBrFJqBQHf7IaYrwFwnMp0V-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX1SaqPYMDsyjE
 dbTRtiTOw3ter90uLPQbSoLdntHnvC5U+H8aQwLYlZSb5tmCkr6s1/hlBB4uPwJe0g37MYuZ7UW
 2Rms9WDdeKydikLDIbMgIFU4xkq1H9lqzeo1Ep1jnaSsZqKxjEeGHvfthXiWtvmxE1+CGfNojxs
 PbCnl484zBFknuFhzNUMY/sbhHUC9x6f9oqb38Ug97zgYO+mgZTjeu+HCk20ynLjPdGvklGAbbZ
 7MfVdwqjOL7eKZ6+1izG2KwK5RcCLLncelvqal8M+8iurQPcsO5GBJxufF3kuuz3IGABPGqM82b
 lHA1MgfxTOAjwiraqT6G4tAn4M9og+5nMXqh4AjYlELeQIGacGO+HjPzXlmDvEkWTTJrHeaza1+
 uN8rj57AcpeZH718+z6qzGiI+/RXiQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f958ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=AzObSZ8MGmcM1bWaoswA:9 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
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

We need PRR support in order to implement MAP_NULL.  Userspace shouldn't
be trying to use this if it is unsupported.

Reported-by: Valentine Burley <valentine.burley@collabora.com>
Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37935#note_3153730
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  7 -------
 drivers/gpu/drm/msm/msm_gem_vma.c       |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 11 +++++++++++
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 19181b6fddfd..f93eee67240d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -365,13 +365,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-static bool
-adreno_smmu_has_prr(struct msm_gpu *gpu)
-{
-	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
-	return adreno_smmu && adreno_smmu->set_prr_addr;
-}
-
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 90712586faac..96925a0f3965 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -964,6 +964,7 @@ static int
 lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 {
 	struct drm_device *dev = job->vm->drm;
+	struct msm_drm_private *priv = dev->dev_private;
 	int i = job->nr_ops++;
 	int ret = 0;
 
@@ -1010,6 +1011,11 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 		break;
 	}
 
+	if ((op->op == MSM_VM_BIND_OP_MAP_NULL) &&
+	    !adreno_smmu_has_prr(priv->gpu)) {
+		ret = UERR(EINVAL, dev, "PRR not supported\n");
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a597f2bee30b..2894fc118485 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -299,6 +299,17 @@ static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 }
 
+static inline bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+
+	if (!adreno_smmu)
+		return false;
+
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 /* It turns out that all targets use the same ringbuffer size */
 #define MSM_GPU_RINGBUFFER_SZ SZ_32K
 #define MSM_GPU_RINGBUFFER_BLKSIZE 32
-- 
2.51.0

