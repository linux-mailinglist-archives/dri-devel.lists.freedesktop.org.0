Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98118B4870A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFECB10E45C;
	Mon,  8 Sep 2025 08:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8Fb/8xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CD110E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LiVQ6008905
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gxClqyyaJF/EtUEbA26hGROQNX4dON1kr9SsOLq4aHg=; b=f8Fb/8xgk0//jzT6
 TjNW9LgHy80BrYhmj3JejxH79Fk6TfxB9FhE/ZijrHBfY+iuKpt4OccIOTFjFetB
 Om+8ssx0m8ZK6HxXVZssjMvtVUNgSgFFc3dTK2IxqO4Wx1Js2f4loZ08uiQpajKF
 DaINCZzWXsS/IMfgodvSxEI0rHp+GwJUl3151UPsuI8sp0rBLnPKHpHK0n97pIKb
 MHZx3dFSNgxeHFzJ78xmLy/mPRBDFyf8WXkhDx8XcV9i7jizHFgzAIIJlakzWNjv
 1+SrXXp16Z9qKK3WmzuDxRL/aaSivM+3K62AXOPOYt5f8yuk+meiBN/PRzdd88Bt
 RL1K8A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uw51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b520fe32690so2007830a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320099; x=1757924899;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxClqyyaJF/EtUEbA26hGROQNX4dON1kr9SsOLq4aHg=;
 b=eNOvvRLE4q/7pVPHt3rU/SnjgfQ2tZy/+XV8Z0LJCOZbYl2V+j32ys2Z9BFFOZuQPz
 wFgv9yMWBC53dAGiG2mw104uipVYVFrc1eu2DNjBkM9RAfwfplvvUz9gHjdyJ1k2+cfZ
 YWYtCJAm9yHTkZiuZIWql/ezYOw+buZiL987A0GqWl17uQq1QCqaSsw77c4NQEO2k6fu
 v2vp3/UhFDazZ3Q7PPiTKOeb7iOOhOWL3/H2SL9BkHoOz8ddiaeZ7/bu9LRnACoMO/Kn
 qx1us72iWfn3XQoM45fnqBwnom/chqDtC/WkBG2bWS2hwKjVpuCXNa1LCYHv+r8Qdeak
 zVRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnypy3+/WTudhxW4RoqXG6Xngbug07/R7C1z2SAA8GLDZrFEuNliyxdo9HzhmK5zgxEt7MvR4Ekzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6UKtz0guqWiByNFkmVYqqvOx/ok7LoT1/bowzB1j4eWmkQrlE
 4aLAhiIonRUvmmrcm0M+4z8RwnLeRHwbRlFkinUSOg/2QkGoHSLBKAWjGRPXGKCrLCWYn/PsJie
 xCeMJGHe0u7/lkRIydIdZ47OxyHAIu+NN//lAAZGonydZEM69XUNoh6DLETjn1QA1fUTsxHQ=
X-Gm-Gg: ASbGncvBPc6CfDzgLPEqoHaefxRZZn7FOhaNOu57eTh1AMDaXSH7/2SfUfDcyhbxfPz
 JaiRdsv1tza6cxD+spD0Z+hekWI+WdK3LPzMRqBEh0cSfLxA1ag/s3g4wUYV7swV1v4NB61W94N
 pPNu37WNd6d1+kO3FXeqmwX5E8a2MUrCR6SIcs4du0lLd+YIEiUpvoY2BgQvlkh+KpB5f8EBoY4
 d1Gu4iFGoPhXyiEVTg+IW4RBxSuw+9PiVXfMujMS36R7JFDcuTt1gzDH6sP3MvYg41dCE6v+G0G
 cikdEBcEr+AzVTj/rmdlh866b1iSWcQ239TQSJVR4XzU2CIWFeOHu8peeZLu6LRm
X-Received: by 2002:a05:6a20:2589:b0:248:b2c8:5cbf with SMTP id
 adf61e73a8af0-2534441305dmr11509841637.58.1757320098878; 
 Mon, 08 Sep 2025 01:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRrbNjZXj5yhqba07zusBK9r/yPF0ZgBfx/dKJPFv+jy9JA+1H3t5mexf20PyGh96dcGB5Cw==
X-Received: by 2002:a05:6a20:2589:b0:248:b2c8:5cbf with SMTP id
 adf61e73a8af0-2534441305dmr11509806637.58.1757320098356; 
 Mon, 08 Sep 2025 01:28:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:06 +0530
Subject: [PATCH v2 13/16] drm/msm/adreno: Disable IFPC when sysprof is active
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-13-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=6196;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=WkxUTVh5zlBwN47s2BL/FVtPIkZwPjfpgXXNSluO6rg=;
 b=Ro9ozWJkcvUaGh2prFq+MvN/vcgts72cOx22nsjaRJYk9kQGCn0H6A9DR8uN2cI4dW6PYCqEG
 yLhVBoUXBZZBjmGTdp9P7vOJmujeToY5DYBpbMYCZyU7jSeXVFpe5oC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be93a4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZpAUVitMrpG34TgdG5YA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: niq5_8I6lysYoMjXKtCnT2y2baatNq6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX6a+BS4BAlQlv
 7tO+HRO5H5era2I+1LmDdg7jrwTwvQvyWKWEratNZq7U+elVvz9KC/AOPnnqhZJpnoyyfh1Fo/4
 AG3QSkhjFb8F3oWjd4OTpvSFDGZydBYot/f7+KsmtQJzvcygiA4IoRh6XaRXfdX3JNAGjAINjPw
 UwoQ2SdQwKBLnv6gMs/1YgAi5Sk9nyf4awhivwu41m3aQKz3CMkeAOfu2evA97lmYvGaSW8mHuF
 CvmnvqACx9OqxJLXa6e5xf4mdV1eyW7T4NJVKN5blaULkOoXvo1Qj7gsaKGIKD621Hm2Sy2qeer
 vW2viaTUB7szGfWCpMOtYOv0oN5ha60xke+/9vvXfGzdXw1WxLdUUnrUqWA6vGmDuCrM82uPJ0P
 euIhtNVy
X-Proofpoint-ORIG-GUID: niq5_8I6lysYoMjXKtCnT2y2baatNq6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

Moving to IFPC state clears the 'Perfcounter Select' register setup
by the userspace. So, lets block the IFPC when sysprof is active by
using the perfcounter oob signal to the GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         |  1 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  4 ++++
 6 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index d6297cc7fe664a74224c441e877050612714a3e4..d76b6b766d4a644d342f62435892d54ebd7192e5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1157,6 +1157,11 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the current freq */
 	a6xx_gmu_set_initial_freq(gpu, gmu);
 
+	if (refcount_read(&gpu->sysprof_active) > 1) {
+		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+		if (!ret)
+			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
+	}
 out:
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
@@ -1204,6 +1209,9 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 	}
 
+	if (test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+
 	ret = a6xx_gmu_wait_for_idle(gmu);
 
 	/* If the GMU isn't responding assume it is hung */
@@ -1819,6 +1827,35 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	unsigned int sysprof_active;
+
+	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
+	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
+		return;
+
+	mutex_lock(&gmu->lock);
+
+	sysprof_active = refcount_read(&gpu->sysprof_active);
+
+	/*
+	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
+	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
+	 */
+	if ((sysprof_active > 1) && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+	else if ((sysprof_active == 1) && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+
+	mutex_unlock(&gmu->lock);
+
+	pm_runtime_put(&gpu->pdev->dev);
+}
+
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 40c4c0445b8e4349c9111850df9c0b1d355f0b73..06cfc294016f513a33eb4004c7892996ac9e0435 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -125,6 +125,8 @@ struct a6xx_gmu {
 #define GMU_STATUS_FW_START	0
 /* To track if PDC sleep seq was done */
 #define GMU_STATUS_PDC_SLEEP	1
+/* To track Perfcounter OOB set status */
+#define GMU_STATUS_OOB_PERF_SET 2
 	unsigned long status;
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 61538b6912883a0e7ec7802cf5f5cfc8649ece2b..b54c88fb27d57f81306163e699961803ff765bdb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2533,6 +2533,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
 };
@@ -2593,6 +2594,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e736c59d566b3fcf8c62a212494e3b110c09caa9..124c63c4615930b00c64e488a498163ae35afccd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -254,6 +254,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 866bb090af064666586cea7125254bd375b7a35c..a597f2bee30b6370ecc3639bfe1072c85993e789 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -92,6 +92,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	void (*sysprof_setup)(struct msm_gpu *gpu);
 };
 
 /* Additional state for iommu faults: */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8617a82cd6b38a74d996ae6965a253a29a231fa4..d53dfad16bde7d5ae7b1e48f221696d525a10965 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -40,6 +40,10 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		break;
 	}
 
+	/* Some gpu families require additional setup for sysprof */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu);
+
 	ctx->sysprof = sysprof;
 
 	return 0;

-- 
2.50.1

