Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA9CAE8D6C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF4710E7E3;
	Wed, 25 Jun 2025 18:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRVPUDP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A2310E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB1pJL023006
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Hh5tX4Ew+Aw
 YGkhPc+5ZLD0+EzWfomf8YCd88hJnzq0=; b=BRVPUDP0CPl6GQY+52eTwDR27yQ
 mnFlEAXs2Ei5WbyUVsmU6xWAOq/QWtgbpU3tRD2MXZjmu6sPO2vpGNMrW6S6fICd
 azh0D92DsikdwCOxpUP/REa8JAxeZEWB3D/FWRYnO0qFSDgECWwc8o1ZyJF08EIG
 SlwKxHOQhxpS14YKNasi4vgBJpaju7KZNv3JQrzOak9SCtpEo05rlV0DDR5i5w5x
 ZmHfVp2nmut7KxuLmDNKUgAbHWQLuWUyBS+SLb4XCEPr5NGTb3LbONzcT96iwiD0
 lK4UNpRHwR9206J3+Jp/7UeoLMv4dGsKCb+0djkrZP7vv6dd/Xhppvqf3Jw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fapn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3132c8437ffso195980a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877936; x=1751482736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hh5tX4Ew+AwYGkhPc+5ZLD0+EzWfomf8YCd88hJnzq0=;
 b=G8mRraXD9h4HmhwPz2Paqv179XESICAxU7NE4VCqiLyHrGf57lx3+HuUQhz7rliF7s
 /SK2EEQw6X8TwTPErq8zb2U/cQlyGe+8lbxaLsKatZNNq0SLvndf4/J3uTvhaE5IWH92
 st4F3GtGDl74Z58uPsEupq+vqR73DWLefwQ7dpme97eTEb7w/DKdZf/INbRjl1Igyap4
 hLU6WLden5PmED7WL6tlvZmEEkNyyDBMoDzlKQt4gy8koMr8ppW084j6mib7om4K+b6j
 gvhWf7tlxK4suZgYEW9b+SwopID6QETmBNgIrf3Cy8wvAeM0lBQ5Vx8rgHZ2JDRlwwjX
 3SdA==
X-Gm-Message-State: AOJu0Yxv1CsA1QLcJgsr5eIQVv6W8hL30CdNRydrQ4OfnaTjGP+eHObd
 4JrONqBCUP3btTUwFH4P7nGGulc4Bhh7S3/K32UUa7A5vcAl6QqgC6Ur/fhJ4gD8NHJb9FNvgG7
 aazFkXg/JUn2+BKBpDznTnStZzWv25gdqewt8+DdqofcwkvNrK1RRhA+ps42ooD4dLIB59xqAka
 N1SkM=
X-Gm-Gg: ASbGncvgZ9d8WAz3c6LUrKhSdyLxQ9ArQRuE8lILfKCQAeafwMdYeMlqNLNrm8wrZGf
 McHh3FZEA7lzo70k5rXMAP9Fa8RyYCyOVUeOS8gLBsfKx2Zg25t0QV3toXmZ4+aJ0Y6nycbYNVb
 Z9z6hf6Hb5ZbKizUVCP6pjSQA/q8sUaega82b2tSrjqdSTttvmL0DTarUl8u3KaLYHj6O2Qpt0D
 kJTk1y4UK0t4kO9N9edC33R7mVkmI4u1Lulw+lFrcRr4el9Nqg59c4KAaSQsVpMrKzoiOn3UwHE
 tlhtDEJyDVffwLInQ0TvqIVKwNTO3Mzh
X-Received: by 2002:a17:90b:52c6:b0:311:f99e:7f4b with SMTP id
 98e67ed59e1d1-315f268d1dfmr6120321a91.28.1750877936368; 
 Wed, 25 Jun 2025 11:58:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELg7y0BBSEXdb+RpJNqLCAHvVquCtejZGqhozSz9F3YB5bONEdwukKoEgzoLXImTOBbjcArw==
X-Received: by 2002:a17:90b:52c6:b0:311:f99e:7f4b with SMTP id
 98e67ed59e1d1-315f268d1dfmr6120266a91.28.1750877935809; 
 Wed, 25 Jun 2025 11:58:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f51dc446sm2518313a91.0.2025.06.25.11.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 22/42] drm/msm: Add opt-in for VM_BIND
Date: Wed, 25 Jun 2025 11:47:15 -0700
Message-ID: <20250625184918.124608-23-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfXwo99j1jNT06X
 FXlyQlyIWSaf8NeuPR2WRnSB9XMjxPWmAxw5wcSYEDliqh4DIFL7vjGLDe89jtYtPzynqEtyys7
 wR83G8jgY1WG2cRmluDlIUPid3bytk90rX3mgOgMbmANr6oz8guy6JH6gb7/cZTrHyH5hLGjfdE
 zOaLr70sg8DN3F5qlyQ02XU3kSJYOKBF6/VsFbyZnVoQhFjgqo2XgBUvh+deVfHgrWfrV1FemJL
 Q6AMySJExh0F2Ll+kmbPRuc9f22Ldq7BlUKEHsvZFMQkVru+Vo9wNLJCPG/rEfdWYN5o8MCjUSY
 ei3hIy5C0tt15kxYlv4DM5n5kKB2IcBk+Buuebhh1JCqWkAkHj+EJppHyEOWaddtT5AzcTsdgfk
 8WRoBw+RZegwQx2xm6QwuHtLZGEADaORNdS9P38zgvAVoHQxxLZFR2ZD5OiKKUYFfQipusXw
X-Proofpoint-ORIG-GUID: YpWhyoodFWViCyEK97rFcTjHjjHH4IQN
X-Proofpoint-GUID: YpWhyoodFWViCyEK97rFcTjHjjHH4IQN
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c46f1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=iDRtRSvoPPFvr6RSarUA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142
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

Add a SET_PARAM for userspace to request to manage to the VM itself,
instead of getting a kernel managed VM.

In order to transition to a userspace managed VM, this param must be set
before any mappings are created.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c           | 22 +++++++++++++++++--
 drivers/gpu/drm/msm/msm_gem.c           |  8 +++++++
 drivers/gpu/drm/msm/msm_gpu.c           |  5 +++--
 drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h              | 24 ++++++++++++++++++++
 7 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0d7c2a2eeb8f..f0e37733c65d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2263,7 +2263,7 @@ a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 }
 
 static struct drm_gpuvm *
-a6xx_create_private_vm(struct msm_gpu *gpu)
+a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
@@ -2273,7 +2273,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_vm_create(gpu->dev, mmu, "gpu", ADRENO_VM_START,
-				 adreno_private_vm_size(gpu), true);
+				 adreno_private_vm_size(gpu), kernel_managed);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b70ed4bc0e0d..efe03f3f42ba 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -508,6 +508,21 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
+	case MSM_PARAM_EN_VM_BIND:
+		/* We can only support VM_BIND with per-process pgtables: */
+		if (ctx->vm == gpu->vm)
+			return UERR(EINVAL, drm, "requires per-process pgtables");
+
+		/*
+		 * We can only swtich to VM_BIND mode if the VM has not yet
+		 * been created:
+		 */
+		if (ctx->vm)
+			return UERR(EBUSY, drm, "VM already created");
+
+		ctx->userspace_managed_vm = value;
+
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ac8a5b072afe..89cb7820064f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -228,9 +228,21 @@ static void load_gpu(struct drm_device *dev)
  */
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
 {
+	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
-	if (!ctx->vm)
-		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
+
+	/* Once ctx->vm is created it is valid for the lifetime of the context: */
+	if (ctx->vm)
+		return ctx->vm;
+
+	mutex_lock(&init_lock);
+	if (!ctx->vm) {
+		ctx->vm = msm_gpu_create_private_vm(
+			priv->gpu, current, !ctx->userspace_managed_vm);
+
+	}
+	mutex_unlock(&init_lock);
+
 	return ctx->vm;
 }
 
@@ -420,6 +432,9 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
@@ -441,6 +456,9 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	/* Only supported if per-process address space is supported: */
 	if (priv->gpu->vm == vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 89fead77c0d8..142845378deb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -85,6 +85,14 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	if (!ctx->vm)
 		return;
 
+	/*
+	 * VM_BIND does not depend on implicit teardown of VMAs on handle
+	 * close, but instead on implicit teardown of the VM when the device
+	 * is closed (see msm_gem_vm_close())
+	 */
+	if (msm_context_is_vmbind(ctx))
+		return;
+
 	/*
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 82e33aa1ccd0..0314e15d04c2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -831,7 +831,8 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 
 /* Return a new address space for a msm_drm_private instance */
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed)
 {
 	struct drm_gpuvm *vm = NULL;
 
@@ -843,7 +844,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 	 * the global one
 	 */
 	if (gpu->funcs->create_private_vm) {
-		vm = gpu->funcs->create_private_vm(gpu);
+		vm = gpu->funcs->create_private_vm(gpu, kernel_managed);
 		if (!IS_ERR(vm))
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d1530de96315..448ebf721bd8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -79,7 +79,7 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			     bool suspended);
 	struct drm_gpuvm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
-	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu);
+	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu, bool kernel_managed);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 
 	/**
@@ -370,6 +370,14 @@ struct msm_context {
 	 */
 	bool closed;
 
+	/**
+	 * @userspace_managed_vm:
+	 *
+	 * Has userspace opted-in to userspace managed VM (ie. VM_BIND) via
+	 * MSM_PARAM_EN_VM_BIND?
+	 */
+	bool userspace_managed_vm;
+
 	/**
 	 * @vm:
 	 *
@@ -462,6 +470,22 @@ struct msm_context {
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
 
+/**
+ * msm_context_is_vm_bind() - has userspace opted in to VM_BIND?
+ *
+ * @ctx: the drm_file context
+ *
+ * See MSM_PARAM_EN_VM_BIND.  If userspace is managing the VM, it can
+ * do sparse binding including having multiple, potentially partial,
+ * mappings in the VM.  Therefore certain legacy uabi (ie. GET_IOVA,
+ * SET_IOVA) are rejected because they don't have a sensible meaning.
+ */
+static inline bool
+msm_context_is_vmbind(struct msm_context *ctx)
+{
+	return ctx->userspace_managed_vm;
+}
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
@@ -689,7 +713,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config);
 
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 5bc5e4526ccf..b974f5a24dbc 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -93,6 +93,30 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
 /* PRR (Partially Resident Region) is required for sparse residency: */
 #define MSM_PARAM_HAS_PRR    0x15  /* RO */
+/* MSM_PARAM_EN_VM_BIND is set to 1 to enable VM_BIND ops.
+ *
+ * With VM_BIND enabled, userspace is required to allocate iova and use the
+ * VM_BIND ops for map/unmap ioctls.  MSM_INFO_SET_IOVA and MSM_INFO_GET_IOVA
+ * will be rejected.  (The latter does not have a sensible meaning when a BO
+ * can have multiple and/or partial mappings.)
+ *
+ * With VM_BIND enabled, userspace does not include a submit_bo table in the
+ * SUBMIT ioctl (this will be rejected), the resident set is determined by
+ * the the VM_BIND ops.
+ *
+ * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
+ * And it is not allowed to disable VM_BIND once it has been enabled.
+ *
+ * Enabling VM_BIND should be done (attempted) prior to allocating any BOs or
+ * submitqueues of type MSM_SUBMITQUEUE_VM_BIND.
+ *
+ * Relatedly, when VM_BIND mode is enabled, the kernel will not try to recover
+ * from GPU faults or failed async VM_BIND ops, in particular because it is
+ * difficult to communicate to userspace which op failed so that userspace
+ * could rewind and try again.  When the VM is marked unusable, the SUBMIT
+ * ioctl will throw -EPIPE.
+ */
+#define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.49.0

