Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B53AE8D3C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A6310E7CF;
	Wed, 25 Jun 2025 18:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcMJgkG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E1C10E7CD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBVPKT020990
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yVCtoAdChq2
 rZfW409bmOE4102RcfW3cFf66u8cbB8o=; b=bcMJgkG9En5rZcJFCrb8iPVQh41
 /0swB345YVigZPV4BactXABoerRRJU2SGVztMC3JCLJpGrHgQyNoUTr5ah6j8j0O
 ykAGpl/437s0TP+Z0pMminUYtHlpVIgHU/OgMp1YTiwbVFcGYsg3ukFmdTlzHCGf
 oskJ+7naTJ4q8krjqBTNcWhhf9mo+Y9Smg6VEzyW0v6zCAkJl2zRYKFT6EYL5X2m
 FkggyOqTVGJhWpUefrhDBsfXDeABrtulqgc9OC6IBaw3VdOM9bI+YT1nv0XQCRdl
 73YAqpjRwHFWvrMpfpN2kUORqtfQvUGrVlzAtPkprBYs7iw3v2MOGVeSLDg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40s04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-237f8d64263so1524745ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877889; x=1751482689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVCtoAdChq2rZfW409bmOE4102RcfW3cFf66u8cbB8o=;
 b=vBIi1BVwzPR+Bn2fDticAdponW2thN1gnkPIj+igf0UCj7xqC/0H5EpPiq72/MhVIM
 8uUQO0pQdZkFyMdPpLu96gpHShji8FocpxICgH6xeS126gB5q2aB2Ft8qvI55QJCEneB
 sF9rnKOOLp3QXOIb67LktnIPVRQoFhUXXp/xVrNQiKww3U2aI69HYxBV5rhs/AxtDfwU
 aBqflnMIeIP4LPzbpUS4OBPfiiql+oewEU1f51qk0v43kA7TRLuQhIcTzggIrfz6a6K1
 sybXNlD1dAgd+88vL5F5ftD1hA/Tcf33IjQFziKLIGwKdpV+4wa059VnKBm6sPWF+Bz4
 O/eA==
X-Gm-Message-State: AOJu0YyHlOXkFhkumM3UGrjrAo4qUTeA8iT65zvKWr45YHLMHe8LcU1N
 eky7W/BgSMWJTz+6ODhk3M4rMeSlmaQglBx6BhdkdOYe4fRcoKhsQdgAz0rUAANwqbVfADx11R1
 mboRJZiQ+G1OzIOUypSumtH+A59qhdfpaW7F/0c+qCRrz15T3l6rK4Frq3+3aiS8pbTwKaMUImc
 KoX8c=
X-Gm-Gg: ASbGncsAlVS5weHXA5HloXix0fy3l1uFTI/+1LACfPEVlXDYQAx1E6ugCPelCZIvLK2
 Vn2x8IBTRpfMujWpLexx5wkpTh6oEBJ7NzKf0Cy0lJd6jDKXRSIl6PhrN0XfTXum0/xO1lRQP6t
 VSNzfcWdbWOQB/yp5R7R5Uq2zsqL/41FT1vDkrx3TtRdIaLKAet3De6qHriZXpXbc1TU0dg1wuN
 BnGjH97Wjucn4JbiLh5otU8ZVIwQ6++XyeEB9uopJwl++GH7RK2Y8zWaiwxfut/+Pdi12NrtR12
 gDjSe1utJtAong0jBSHbWn1uJ7aI9Mm6
X-Received: by 2002:a17:903:1986:b0:235:f49f:479d with SMTP id
 d9443c01a7336-238c86ee14amr9726215ad.3.1750877889260; 
 Wed, 25 Jun 2025 11:58:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5uAsI09BTNO6RS3aClHlddfXbRmkwVujvQC0aRt838iT5JgGIMJAsuRH49l/SvaVYl8uRZA==
X-Received: by 2002:a17:903:1986:b0:235:f49f:479d with SMTP id
 d9443c01a7336-238c86ee14amr9725695ad.3.1750877888746; 
 Wed, 25 Jun 2025 11:58:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83937b1sm143463375ad.52.2025.06.25.11.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 04/42] drm/msm: Rename msm_file_private -> msm_context
Date: Wed, 25 Jun 2025 11:46:57 -0700
Message-ID: <20250625184918.124608-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX77OWYpN9F5FN
 NBVQgbMxkh71Mqv1CLc4F7seYofZYXOdFNmxoSPOot8QTF+NJpPHGUoGWcBdPAt+trQUn/3ZDJh
 UVgjg1szr07sw0eYgw8+fB2f4F5e8TA9O7m6rd0HArsVwkHNV5VRgb5ktAFBJ8UHmhnpnLuYOeo
 GkgCSO8s/J3JM29qxq59Vq2hai2W2s7joTMd0YCoj2V64S2lGIK3yzGaVDOxSfe84Agb4mb90dB
 owlBkuO7/Fa6chE7181cr/fkNJcPgbx0vq847EhhG/2gEvHVOP4qdEctpK/KwD++fqxsDqU7JOW
 UMDKC4Cn/TXnZq1Spnlg/04HOMwBUP2xtDoDuPhEKJqU+w8PsFA1Tm2dPKmQMRW1QVBDUgp0RR/
 jIDZpkCD6z/3lt+mcnvCFRvDMBV5MpmJ0/DKebkc9byuaFUVtV7ipicx+0jR1MsQdrn4jK6I
X-Proofpoint-ORIG-GUID: brdeDrjNGv0TasIkCp6hZHyBmjQTJ-Ks
X-Proofpoint-GUID: brdeDrjNGv0TasIkCp6hZHyBmjQTJ-Ks
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=f_Su2nKqq5cPEY4CjHUA:9
 a=GvdueXVYPmCkWapjIL-Q:22
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
 drivers/gpu/drm/msm/msm_drv.c           | 14 ++++-----
 drivers/gpu/drm/msm/msm_gem.c           |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c           |  4 +--
 drivers/gpu/drm/msm/msm_gpu.h           | 39 ++++++++++++-------------
 drivers/gpu/drm/msm/msm_submitqueue.c   | 27 +++++++++--------
 9 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fd64af6d0440..620a26638535 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -111,7 +111,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
-	struct msm_file_private *ctx = submit->queue->ctx;
+	struct msm_context *ctx = submit->queue->ctx;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d04657b77857..93fe26009511 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -356,7 +356,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -444,7 +444,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	}
 }
 
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len)
 {
 	struct drm_device *drm = gpu->dev;
@@ -490,7 +490,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
-		return msm_file_private_set_sysprof(ctx, gpu, value);
+		return msm_context_set_sysprof(ctx, gpu, value);
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2366a57b280f..fed9516da365 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -603,9 +603,9 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3588dc9e537..29ca24548c67 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -333,7 +333,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx;
+	struct msm_context *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -363,23 +363,23 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 	return context_init(dev, file);
 }
 
-static void context_close(struct msm_file_private *ctx)
+static void context_close(struct msm_context *ctx)
 {
 	msm_submitqueue_close(ctx);
-	msm_file_private_put(ctx);
+	msm_context_put(ctx);
 }
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	/*
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
 	if (priv->gpu)
-		msm_file_private_set_sysprof(ctx, priv->gpu, 0);
+		msm_context_set_sysprof(ctx, priv->gpu, 0);
 
 	context_close(ctx);
 }
@@ -511,7 +511,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 		uint64_t *iova)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	if (!priv->gpu)
 		return -EINVAL;
@@ -531,7 +531,7 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 		uint64_t iova)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	if (!priv->gpu)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d2f38e1df510..fdeb6cf7eeb5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -48,7 +48,7 @@ static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 
 static void update_ctx_mem(struct drm_file *file, ssize_t size)
 {
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
 
 	rcu_read_lock(); /* Locks file->pid! */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d4f71bb54e84..3aabf7f1da6d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -651,7 +651,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c380d9d9f5af..d786fcfad62f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -148,7 +148,7 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p)
 {
 	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
@@ -339,7 +339,7 @@ static void retire_submits(struct msm_gpu *gpu);
 
 static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
 {
-	struct msm_file_private *ctx = submit->queue->ctx;
+	struct msm_context *ctx = submit->queue->ctx;
 	struct task_struct *task;
 
 	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579..957d6fb3469d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -22,7 +22,7 @@
 struct msm_gem_submit;
 struct msm_gpu_perfcntr;
 struct msm_gpu_state;
-struct msm_file_private;
+struct msm_context;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -44,9 +44,9 @@ struct msm_gpu_config {
  *    + z180_gpu
  */
 struct msm_gpu_funcs {
-	int (*get_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+	int (*get_param)(struct msm_gpu *gpu, struct msm_context *ctx,
 			 uint32_t param, uint64_t *value, uint32_t *len);
-	int (*set_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+	int (*set_param)(struct msm_gpu *gpu, struct msm_context *ctx,
 			 uint32_t param, uint64_t value, uint32_t len);
 	int (*hw_init)(struct msm_gpu *gpu);
 
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
 #define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
- * struct msm_file_private - per-drm_file context
+ * struct msm_context - per-drm_file context
  *
  * @queuelock:    synchronizes access to submitqueues list
  * @submitqueues: list of &msm_gpu_submitqueue created by userspace
@@ -357,7 +357,7 @@ struct msm_gpu_perfcntr {
  * @ref:          reference count
  * @seqno:        unique per process seqno
  */
-struct msm_file_private {
+struct msm_context {
 	rwlock_t queuelock;
 	struct list_head submitqueues;
 	int queueid;
@@ -512,7 +512,7 @@ struct msm_gpu_submitqueue {
 	u32 ring_nr;
 	int faults;
 	uint32_t last_fence;
-	struct msm_file_private *ctx;
+	struct msm_context *ctx;
 	struct list_head node;
 	struct idr fence_idr;
 	struct spinlock idr_lock;
@@ -608,33 +608,32 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
 
-void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p);
 
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx);
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id);
 int msm_submitqueue_create(struct drm_device *drm,
-		struct msm_file_private *ctx,
+		struct msm_context *ctx,
 		u32 prio, u32 flags, u32 *id);
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 		struct drm_msm_submitqueue_query *args);
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id);
-void msm_submitqueue_close(struct msm_file_private *ctx);
+int msm_submitqueue_remove(struct msm_context *ctx, u32 id);
+void msm_submitqueue_close(struct msm_context *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
-int msm_file_private_set_sysprof(struct msm_file_private *ctx,
-				 struct msm_gpu *gpu, int sysprof);
-void __msm_file_private_destroy(struct kref *kref);
+int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof);
+void __msm_context_destroy(struct kref *kref);
 
-static inline void msm_file_private_put(struct msm_file_private *ctx)
+static inline void msm_context_put(struct msm_context *ctx)
 {
-	kref_put(&ctx->ref, __msm_file_private_destroy);
+	kref_put(&ctx->ref, __msm_context_destroy);
 }
 
-static inline struct msm_file_private *msm_file_private_get(
-	struct msm_file_private *ctx)
+static inline struct msm_context *msm_context_get(
+	struct msm_context *ctx)
 {
 	kref_get(&ctx->ref);
 	return ctx;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7fed1de63b5d..1acc0fe36353 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -7,8 +7,7 @@
 
 #include "msm_gpu.h"
 
-int msm_file_private_set_sysprof(struct msm_file_private *ctx,
-				 struct msm_gpu *gpu, int sysprof)
+int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
 	/*
 	 * Since pm_runtime and sysprof_active are both refcounts, we
@@ -46,10 +45,10 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 	return 0;
 }
 
-void __msm_file_private_destroy(struct kref *kref)
+void __msm_context_destroy(struct kref *kref)
 {
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
+	struct msm_context *ctx = container_of(kref,
+		struct msm_context, ref);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
@@ -73,12 +72,12 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
-	msm_file_private_put(queue->ctx);
+	msm_context_put(queue->ctx);
 
 	kfree(queue);
 }
 
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id)
 {
 	struct msm_gpu_submitqueue *entry;
@@ -101,7 +100,7 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
 	return NULL;
 }
 
-void msm_submitqueue_close(struct msm_file_private *ctx)
+void msm_submitqueue_close(struct msm_context *ctx)
 {
 	struct msm_gpu_submitqueue *entry, *tmp;
 
@@ -119,7 +118,7 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 }
 
 static struct drm_sched_entity *
-get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
+get_sched_entity(struct msm_context *ctx, struct msm_ringbuffer *ring,
 		 unsigned ring_nr, enum drm_sched_priority sched_prio)
 {
 	static DEFINE_MUTEX(entity_lock);
@@ -155,7 +154,7 @@ get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
 	return ctx->entities[idx];
 }
 
-int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 		u32 prio, u32 flags, u32 *id)
 {
 	struct msm_drm_private *priv = drm->dev_private;
@@ -200,7 +199,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	write_lock(&ctx->queuelock);
 
-	queue->ctx = msm_file_private_get(ctx);
+	queue->ctx = msm_context_get(ctx);
 	queue->id = ctx->queueid++;
 
 	if (id)
@@ -221,7 +220,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
  * Create the default submit-queue (id==0), used for backwards compatibility
  * for userspace that pre-dates the introduction of submitqueues.
  */
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
+int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
@@ -261,7 +260,7 @@ static int msm_submitqueue_query_faults(struct msm_gpu_submitqueue *queue,
 	return ret ? -EFAULT : 0;
 }
 
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 		struct drm_msm_submitqueue_query *args)
 {
 	struct msm_gpu_submitqueue *queue;
@@ -282,7 +281,7 @@ int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
 	return ret;
 }
 
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id)
+int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 {
 	struct msm_gpu_submitqueue *entry;
 
-- 
2.49.0

