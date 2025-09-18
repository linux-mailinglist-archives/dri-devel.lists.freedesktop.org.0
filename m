Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB8B82CF6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 05:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1144F10E636;
	Thu, 18 Sep 2025 03:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+NSEzaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA2B10E635
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGCLsL019539
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KjDatx3pgsFlaMVHvhcmbGG7Lr4uVfJAQPjgyzQxqhk=; b=W+NSEzaqQm8lMEbA
 W+MumcTEawMMevVjP1G4G8VstIBbDthjRKKNHeVcbKo8LxrP8eKflQ9XlaathEg7
 ygpOWdvNWIB2qyApt1Vm9XnGCVIiw5tkjwkpDVUn0uBNJNtnHAiSPAgbxBYyszZt
 9PuwwK3Vrh+oXkiNYsf45LBUJxbH+63XB0UpfxDe8y//nSeUiloOauM86JEjDoBS
 VhM09dRfn6MhOuF67a41xHx7gjt4r8kDTaptQThTiknCJMimYNvEHbjlz602RMrj
 vQ15fo9iB60IFsIRotAp1z95F1+Tvw2IQ8Z3WEvZ6UhC3FJUwdaJPB8dyzd0t36Y
 yhaFGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1vwcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b793b04fe0so10197031cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167485; x=1758772285;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjDatx3pgsFlaMVHvhcmbGG7Lr4uVfJAQPjgyzQxqhk=;
 b=PJ44o1pU/t6UfCKvq0hGNwxb351nr7N5pBjh2HXEK7T9G0DjgwypBTrmdIvZb/JQ32
 YRSGRROJoiPYeufS28+cpzX4yqyPBuREI6DpC7fYDeyddwL1WAlnw+7SgMxhqusTNTLq
 wtJO8Anft5OkZIgt6iTmupfv8LNGV05MUTXHOmyQJ/C345vbYBjcw9g0byLDjUucb8h4
 6ezQQZimi5ZQpuUHYG7/bDyWCmiVC7lTReX1Q761Qc2OStSFWIUDmeNNWJNzP06WM35t
 lALrx8M1P56TEJHbK1+zlzxXeUEr4Mw1d+FfzFTekErvDNFYG00PNGgc51B/L4mdBt+U
 L4ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ibv+yDoNU2MXFFPoOm0its5rgplNdzK/aNSLAWy+ASQTRoASBA2OvES2g+gYR9G3xbnZjnEQJ50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk96IAutlfF1M2Lk9rwKviVDdQV/nmEIIpdSHugqIN1w685hZW
 lETmw0AwpDj9o7ddNV2vxRrK7DNG5AhA9T9hjflR43S0PfQb9Gelo367sBxO4ADqvcZatSomRfd
 r3dvWVc98mb7ppcosGOrdOqqLgG8uwhOrgRcTG8vx4Ub0JUM7ZYYL0t5/wCWB7ZTGrYMKblwPMd
 /IHw4=
X-Gm-Gg: ASbGnct2Nvt38V/N58U4ZG7svIo7RPaPtSpnuCDgPY916nguAa1MvN2EeNsGGenq26R
 L9O0/KTu3qug0CqkzC9NE/8AaE+LvlwozHvTv02GtmDJdeVH22gtIW9z0l8LA0zBfNBcTLb3Clm
 Q/O10pS83TxPsb/q6LVtlqro+qe9LrPT+L8ZamTTUzGZYg6C0/YixOK2w7xx+xHz8FwGJY5W0ub
 l1daRcdd8DtYJzoEICfxyZRFNySAwDG8yFbeeMOKHOmwrTa9W4S1RrGpHvubTLPtnNroi6x0LoZ
 Qbr/pS1YlCcz+R7gKrrGmoFBhTM8Ve0NslyORnLioS8OxctGOA847e1ja12tZxJQcSIXXGagRCM
 jmUheYfNDuzvEhb8sX+BYQR1361IEHsZi/Pnsk6pDg+7k3wGgtDXu
X-Received: by 2002:a05:622a:5905:b0:4b2:dee2:6498 with SMTP id
 d75a77b69052e-4ba687170d5mr48007631cf.28.1758167484535; 
 Wed, 17 Sep 2025 20:51:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJkTi8JBmYXbqf8LSUj3LGysoGnPKWFUHLDlvKqUyZ5Vm2UBcSDocxn6eFr71DibkblZ+CZQ==
X-Received: by 2002:a05:622a:5905:b0:4b2:dee2:6498 with SMTP id
 d75a77b69052e-4ba687170d5mr48007431cf.28.1758167483987; 
 Wed, 17 Sep 2025 20:51:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:24 +0300
Subject: [PATCH v5 3/5] drm/msm: split away IOCTLs implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-3-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=28439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C3v8bPEKnu4N1pNpZUfC3RGMYAdkcdrJw1D6hEMyow4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GtRQ2xMV7P8tuFj4PzTI5ufPnX1JsYId/Xp
 sARZdAgr6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1ZKFB/0clVWRly6rBGuraOpwnVpDLu3y37mmbtxKOrv57BfyRscItQCXixkWi+rZ2GA/YRChYkO
 kcZ+GD5E9X9dDVQq0bnKWTl7ywbUVLdSrF0JnAQGveNCZgetzCNNOBPhq6jEK2F+p5ufl7OpAhC
 UyMzl8ZmsbZVSXSPjXA9dOYvrO7pcRYvopFzpsWy94EIl1KPD/Xc5W8NndKAoqkcyC9SBo3LPEB
 ol1bGt8UVaeD7J4H8ljOuoaLbFp4FMy4pzl/xYssl7iBQUW/HdF7x4TyNk2eYzgSieIveVvzvVk
 MNZ+7H24BDtjALuTGbYoUH2lPCx/kL2GYDMcTVvY8YdV+Kjc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9cOCEivdfbOUNmcTJNbTB4497u35A7pw
X-Proofpoint-ORIG-GUID: 9cOCEivdfbOUNmcTJNbTB4497u35A7pw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7s89vpRjn9SF
 NGQAomoLT7taCAQkdA6YrH/+qEh8kYd/OLXRzzcHwx94V5WAh8JlUHRMGEhUHdIv63w3K9/tpA8
 QB2LRJZHdEqTz/1ZE4vVMiXcxQc91hlWH3wNcOXw2fSGHOZa0A6+MiEhcrzpH7UD+MSO3F1wlMJ
 O4fHj9zKAD27/Tr86nySduMOzCjh301PPAFAGh05pHKKlAMmvsJ6ZuumIM0hlcZ2jDfqNrC/8Ve
 v6Zmnt/aElrV3U3EpNF2eCQjY3Cyx5TOMSmjzQm3MPE2KMVRwukTjEkvJmfowRSMoxd44AfELj/
 Man3KxTHa8tBxs59zbkju/wY986wD9WgQitBYHK8ZmTQiEEPLEmZvGDh0U9Q30Di91LSl+cJtxN
 rk8BGiY6
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb81bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=APMymX6OwX3YqAwivccA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

The IOCTL interface is only used for interfacing the GPU parts of the
driver. In preparation to disabling GPU functionality split MSM IOCTLs
to a separate source file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile    |   1 +
 drivers/gpu/drm/msm/msm_drv.c   | 489 +---------------------------------------
 drivers/gpu/drm/msm/msm_ioctl.c | 484 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_ioctl.h |  37 +++
 4 files changed, 523 insertions(+), 488 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index d7876c154b0aa2cb0164c4b1fb7900b1a42db46b..0ac977a6ed01d91111d706995f341ced29f5ca8d 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -119,6 +119,7 @@ msm-y += \
 	msm_gpu.o \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
+	msm_ioctl.o \
 	msm_iommu.o \
 	msm_perf.o \
 	msm_rd.o \
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 06ab78e1a2c583352c08a62e6cf250bacde9b75b..ba984cc71d1d3aa341e0f4532b7093adcd25d3b0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -8,8 +8,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/debugfs.h>
-#include <linux/of_address.h>
-#include <linux/uaccess.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -18,8 +16,8 @@
 
 #include "msm_drv.h"
 #include "msm_debugfs.h"
-#include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_ioctl.h"
 #include "msm_kms.h"
 
 /*
@@ -296,491 +294,6 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	context_close(ctx);
 }
 
-/*
- * DRM ioctls:
- */
-
-static int msm_ioctl_get_param(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_param *args = data;
-	struct msm_gpu *gpu;
-
-	/* for now, we just have 3d pipe.. eventually this would need to
-	 * be more clever to dispatch to appropriate gpu module:
-	 */
-	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
-		return -EINVAL;
-
-	gpu = priv->gpu;
-
-	if (!gpu)
-		return -ENXIO;
-
-	return gpu->funcs->get_param(gpu, file->driver_priv,
-				     args->param, &args->value, &args->len);
-}
-
-static int msm_ioctl_set_param(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_param *args = data;
-	struct msm_gpu *gpu;
-
-	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
-		return -EINVAL;
-
-	gpu = priv->gpu;
-
-	if (!gpu)
-		return -ENXIO;
-
-	return gpu->funcs->set_param(gpu, file->driver_priv,
-				     args->param, args->value, args->len);
-}
-
-static int msm_ioctl_gem_new(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_new *args = data;
-	uint32_t flags = args->flags;
-
-	if (args->flags & ~MSM_BO_FLAGS) {
-		DRM_ERROR("invalid flags: %08x\n", args->flags);
-		return -EINVAL;
-	}
-
-	/*
-	 * Uncached CPU mappings are deprecated, as of:
-	 *
-	 * 9ef364432db4 ("drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)")
-	 *
-	 * So promote them to WC.
-	 */
-	if (flags & MSM_BO_UNCACHED) {
-		flags &= ~MSM_BO_CACHED;
-		flags |= MSM_BO_WC;
-	}
-
-	if (should_fail(&fail_gem_alloc, args->size))
-		return -ENOMEM;
-
-	return msm_gem_new_handle(dev, file, args->size,
-			args->flags, &args->handle, NULL);
-}
-
-static inline ktime_t to_ktime(struct drm_msm_timespec timeout)
-{
-	return ktime_set(timeout.tv_sec, timeout.tv_nsec);
-}
-
-static int msm_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_cpu_prep *args = data;
-	struct drm_gem_object *obj;
-	ktime_t timeout = to_ktime(args->timeout);
-	int ret;
-
-	if (args->op & ~MSM_PREP_FLAGS) {
-		DRM_ERROR("invalid op: %08x\n", args->op);
-		return -EINVAL;
-	}
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj)
-		return -ENOENT;
-
-	ret = msm_gem_cpu_prep(obj, args->op, &timeout);
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_cpu_fini *args = data;
-	struct drm_gem_object *obj;
-	int ret;
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj)
-		return -ENOENT;
-
-	ret = msm_gem_cpu_fini(obj);
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_info_iova(struct drm_device *dev,
-		struct drm_file *file, struct drm_gem_object *obj,
-		uint64_t *iova)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_context *ctx = file->driver_priv;
-
-	if (!priv->gpu)
-		return -EINVAL;
-
-	if (msm_context_is_vmbind(ctx))
-		return UERR(EINVAL, dev, "VM_BIND is enabled");
-
-	if (should_fail(&fail_gem_iova, obj->size))
-		return -ENOMEM;
-
-	/*
-	 * Don't pin the memory here - just get an address so that userspace can
-	 * be productive
-	 */
-	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
-}
-
-static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
-		struct drm_file *file, struct drm_gem_object *obj,
-		uint64_t iova)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_context *ctx = file->driver_priv;
-	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
-
-	if (!priv->gpu)
-		return -EINVAL;
-
-	if (msm_context_is_vmbind(ctx))
-		return UERR(EINVAL, dev, "VM_BIND is enabled");
-
-	/* Only supported if per-process address space is supported: */
-	if (priv->gpu->vm == vm)
-		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
-
-	if (should_fail(&fail_gem_iova, obj->size))
-		return -ENOMEM;
-
-	return msm_gem_set_iova(obj, vm, iova);
-}
-
-static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
-					   __user void *metadata,
-					   u32 metadata_size)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	void *new_metadata;
-	void *buf;
-	int ret;
-
-	/* Impose a moderate upper bound on metadata size: */
-	if (metadata_size > 128) {
-		return -EOVERFLOW;
-	}
-
-	/* Use a temporary buf to keep copy_from_user() outside of gem obj lock: */
-	buf = memdup_user(metadata, metadata_size);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		goto out;
-
-	new_metadata =
-		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
-	if (!new_metadata) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	msm_obj->metadata = new_metadata;
-	msm_obj->metadata_size = metadata_size;
-	memcpy(msm_obj->metadata, buf, metadata_size);
-
-	msm_gem_unlock(obj);
-
-out:
-	kfree(buf);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
-					   __user void *metadata,
-					   u32 *metadata_size)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	void *buf;
-	int ret, len;
-
-	if (!metadata) {
-		/*
-		 * Querying the size is inherently racey, but
-		 * EXT_external_objects expects the app to confirm
-		 * via device and driver UUIDs that the exporter and
-		 * importer versions match.  All we can do from the
-		 * kernel side is check the length under obj lock
-		 * when userspace tries to retrieve the metadata
-		 */
-		*metadata_size = msm_obj->metadata_size;
-		return 0;
-	}
-
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		return ret;
-
-	/* Avoid copy_to_user() under gem obj lock: */
-	len = msm_obj->metadata_size;
-	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
-
-	msm_gem_unlock(obj);
-
-	if (*metadata_size < len) {
-		ret = -ETOOSMALL;
-	} else if (copy_to_user(metadata, buf, len)) {
-		ret = -EFAULT;
-	} else {
-		*metadata_size = len;
-	}
-
-	kfree(buf);
-
-	return 0;
-}
-
-static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_info *args = data;
-	struct drm_gem_object *obj;
-	struct msm_gem_object *msm_obj;
-	int i, ret = 0;
-
-	if (args->pad)
-		return -EINVAL;
-
-	switch (args->info) {
-	case MSM_INFO_GET_OFFSET:
-	case MSM_INFO_GET_IOVA:
-	case MSM_INFO_SET_IOVA:
-	case MSM_INFO_GET_FLAGS:
-		/* value returned as immediate, not pointer, so len==0: */
-		if (args->len)
-			return -EINVAL;
-		break;
-	case MSM_INFO_SET_NAME:
-	case MSM_INFO_GET_NAME:
-	case MSM_INFO_SET_METADATA:
-	case MSM_INFO_GET_METADATA:
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj)
-		return -ENOENT;
-
-	msm_obj = to_msm_bo(obj);
-
-	switch (args->info) {
-	case MSM_INFO_GET_OFFSET:
-		args->value = msm_gem_mmap_offset(obj);
-		break;
-	case MSM_INFO_GET_IOVA:
-		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
-		break;
-	case MSM_INFO_SET_IOVA:
-		ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
-		break;
-	case MSM_INFO_GET_FLAGS:
-		if (drm_gem_is_imported(obj)) {
-			ret = -EINVAL;
-			break;
-		}
-		/* Hide internal kernel-only flags: */
-		args->value = to_msm_bo(obj)->flags & MSM_BO_FLAGS;
-		ret = 0;
-		break;
-	case MSM_INFO_SET_NAME:
-		/* length check should leave room for terminating null: */
-		if (args->len >= sizeof(msm_obj->name)) {
-			ret = -EINVAL;
-			break;
-		}
-		if (copy_from_user(msm_obj->name, u64_to_user_ptr(args->value),
-				   args->len)) {
-			msm_obj->name[0] = '\0';
-			ret = -EFAULT;
-			break;
-		}
-		msm_obj->name[args->len] = '\0';
-		for (i = 0; i < args->len; i++) {
-			if (!isprint(msm_obj->name[i])) {
-				msm_obj->name[i] = '\0';
-				break;
-			}
-		}
-		break;
-	case MSM_INFO_GET_NAME:
-		if (args->value && (args->len < strlen(msm_obj->name))) {
-			ret = -ETOOSMALL;
-			break;
-		}
-		args->len = strlen(msm_obj->name);
-		if (args->value) {
-			if (copy_to_user(u64_to_user_ptr(args->value),
-					 msm_obj->name, args->len))
-				ret = -EFAULT;
-		}
-		break;
-	case MSM_INFO_SET_METADATA:
-		ret = msm_ioctl_gem_info_set_metadata(
-			obj, u64_to_user_ptr(args->value), args->len);
-		break;
-	case MSM_INFO_GET_METADATA:
-		ret = msm_ioctl_gem_info_get_metadata(
-			obj, u64_to_user_ptr(args->value), &args->len);
-		break;
-	}
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
-		      ktime_t timeout, uint32_t flags)
-{
-	struct dma_fence *fence;
-	int ret;
-
-	if (fence_after(fence_id, queue->last_fence)) {
-		DRM_ERROR_RATELIMITED("waiting on invalid fence: %u (of %u)\n",
-				      fence_id, queue->last_fence);
-		return -EINVAL;
-	}
-
-	/*
-	 * Map submitqueue scoped "seqno" (which is actually an idr key)
-	 * back to underlying dma-fence
-	 *
-	 * The fence is removed from the fence_idr when the submit is
-	 * retired, so if the fence is not found it means there is nothing
-	 * to wait for
-	 */
-	spin_lock(&queue->idr_lock);
-	fence = idr_find(&queue->fence_idr, fence_id);
-	if (fence)
-		fence = dma_fence_get_rcu(fence);
-	spin_unlock(&queue->idr_lock);
-
-	if (!fence)
-		return 0;
-
-	if (flags & MSM_WAIT_FENCE_BOOST)
-		dma_fence_set_deadline(fence, ktime_get());
-
-	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
-	if (ret == 0) {
-		ret = -ETIMEDOUT;
-	} else if (ret != -ERESTARTSYS) {
-		ret = 0;
-	}
-
-	dma_fence_put(fence);
-
-	return ret;
-}
-
-static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_wait_fence *args = data;
-	struct msm_gpu_submitqueue *queue;
-	int ret;
-
-	if (args->flags & ~MSM_WAIT_FENCE_FLAGS) {
-		DRM_ERROR("invalid flags: %08x\n", args->flags);
-		return -EINVAL;
-	}
-
-	if (!priv->gpu)
-		return 0;
-
-	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
-	if (!queue)
-		return -ENOENT;
-
-	ret = wait_fence(queue, args->fence, to_ktime(args->timeout), args->flags);
-
-	msm_submitqueue_put(queue);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_madvise *args = data;
-	struct drm_gem_object *obj;
-	int ret;
-
-	switch (args->madv) {
-	case MSM_MADV_DONTNEED:
-	case MSM_MADV_WILLNEED:
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj) {
-		return -ENOENT;
-	}
-
-	ret = msm_gem_madvise(obj, args->madv);
-	if (ret >= 0) {
-		args->retained = ret;
-		ret = 0;
-	}
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-
-static int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_submitqueue *args = data;
-
-	if (args->flags & ~MSM_SUBMITQUEUE_FLAGS)
-		return -EINVAL;
-
-	return msm_submitqueue_create(dev, file->driver_priv, args->prio,
-		args->flags, &args->id);
-}
-
-static int msm_ioctl_submitqueue_query(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	return msm_submitqueue_query(dev, file->driver_priv, data);
-}
-
-static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	u32 id = *(u32 *) data;
-
-	return msm_submitqueue_remove(file->driver_priv, id);
-}
-
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SET_PARAM,    msm_ioctl_set_param,    DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/msm/msm_ioctl.c b/drivers/gpu/drm/msm/msm_ioctl.c
new file mode 100644
index 0000000000000000000000000000000000000000..837be6849684fa72887cb7d709489d54e01c1a5c
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_ioctl.c
@@ -0,0 +1,484 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/fault-inject.h>
+#include <linux/ktime.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_ioctl.h>
+
+#include "msm_drv.h"
+#include "msm_gpu.h"
+#include "msm_ioctl.h"
+
+/*
+ * DRM ioctls:
+ */
+
+static inline ktime_t to_ktime(struct drm_msm_timespec timeout)
+{
+	return ktime_set(timeout.tv_sec, timeout.tv_nsec);
+}
+
+int msm_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_param *args = data;
+	struct msm_gpu *gpu;
+
+	/* for now, we just have 3d pipe.. eventually this would need to
+	 * be more clever to dispatch to appropriate gpu module:
+	 */
+	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
+		return -EINVAL;
+
+	gpu = priv->gpu;
+
+	if (!gpu)
+		return -ENXIO;
+
+	return gpu->funcs->get_param(gpu, file->driver_priv,
+				     args->param, &args->value, &args->len);
+}
+
+int msm_ioctl_set_param(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_param *args = data;
+	struct msm_gpu *gpu;
+
+	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
+		return -EINVAL;
+
+	gpu = priv->gpu;
+
+	if (!gpu)
+		return -ENXIO;
+
+	return gpu->funcs->set_param(gpu, file->driver_priv,
+				     args->param, args->value, args->len);
+}
+
+int msm_ioctl_gem_new(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_new *args = data;
+	uint32_t flags = args->flags;
+
+	if (args->flags & ~MSM_BO_FLAGS) {
+		DRM_ERROR("invalid flags: %08x\n", args->flags);
+		return -EINVAL;
+	}
+
+	/*
+	 * Uncached CPU mappings are deprecated, as of:
+	 *
+	 * 9ef364432db4 ("drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)")
+	 *
+	 * So promote them to WC.
+	 */
+	if (flags & MSM_BO_UNCACHED) {
+		flags &= ~MSM_BO_CACHED;
+		flags |= MSM_BO_WC;
+	}
+
+	if (should_fail(&fail_gem_alloc, args->size))
+		return -ENOMEM;
+
+	return msm_gem_new_handle(dev, file, args->size,
+			args->flags, &args->handle, NULL);
+}
+
+int msm_ioctl_gem_cpu_prep(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_cpu_prep *args = data;
+	struct drm_gem_object *obj;
+	ktime_t timeout = to_ktime(args->timeout);
+	int ret;
+
+	if (args->op & ~MSM_PREP_FLAGS) {
+		DRM_ERROR("invalid op: %08x\n", args->op);
+		return -EINVAL;
+	}
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	ret = msm_gem_cpu_prep(obj, args->op, &timeout);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_cpu_fini *args = data;
+	struct drm_gem_object *obj;
+	int ret;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	ret = msm_gem_cpu_fini(obj);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+int msm_ioctl_gem_info_iova(struct drm_device *dev, struct drm_file *file,
+			    struct drm_gem_object *obj, uint64_t *iova)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_context *ctx = file->driver_priv;
+
+	if (!priv->gpu)
+		return -EINVAL;
+
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
+	if (should_fail(&fail_gem_iova, obj->size))
+		return -ENOMEM;
+
+	/*
+	 * Don't pin the memory here - just get an address so that userspace can
+	 * be productive
+	 */
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
+}
+
+int msm_ioctl_gem_info_set_iova(struct drm_device *dev, struct drm_file *file,
+				struct drm_gem_object *obj, uint64_t iova)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+
+	if (!priv->gpu)
+		return -EINVAL;
+
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
+	/* Only supported if per-process address space is supported: */
+	if (priv->gpu->vm == vm)
+		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
+
+	if (should_fail(&fail_gem_iova, obj->size))
+		return -ENOMEM;
+
+	return msm_gem_set_iova(obj, vm, iova);
+}
+
+int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 metadata_size)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *new_metadata;
+	void *buf;
+	int ret;
+
+	/* Impose a moderate upper bound on metadata size: */
+	if (metadata_size > 128)
+		return -EOVERFLOW;
+
+	/* Use a temporary buf to keep copy_from_user() outside of gem obj lock: */
+	buf = memdup_user(metadata, metadata_size);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = msm_gem_lock_interruptible(obj);
+	if (ret)
+		goto out;
+
+	new_metadata =
+		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
+	if (!new_metadata) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	msm_obj->metadata = new_metadata;
+	msm_obj->metadata_size = metadata_size;
+	memcpy(msm_obj->metadata, buf, metadata_size);
+
+	msm_gem_unlock(obj);
+
+out:
+	kfree(buf);
+
+	return ret;
+}
+
+int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 *metadata_size)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *buf;
+	int ret, len;
+
+	if (!metadata) {
+		/*
+		 * Querying the size is inherently racey, but
+		 * EXT_external_objects expects the app to confirm
+		 * via device and driver UUIDs that the exporter and
+		 * importer versions match.  All we can do from the
+		 * kernel side is check the length under obj lock
+		 * when userspace tries to retrieve the metadata
+		 */
+		*metadata_size = msm_obj->metadata_size;
+		return 0;
+	}
+
+	ret = msm_gem_lock_interruptible(obj);
+	if (ret)
+		return ret;
+
+	/* Avoid copy_to_user() under gem obj lock: */
+	len = msm_obj->metadata_size;
+	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
+
+	msm_gem_unlock(obj);
+
+	if (*metadata_size < len)
+		ret = -ETOOSMALL;
+	else if (copy_to_user(metadata, buf, len))
+		ret = -EFAULT;
+	else
+		*metadata_size = len;
+
+	kfree(buf);
+
+	return 0;
+}
+
+int msm_ioctl_gem_info(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_info *args = data;
+	struct drm_gem_object *obj;
+	struct msm_gem_object *msm_obj;
+	int i, ret = 0;
+
+	if (args->pad)
+		return -EINVAL;
+
+	switch (args->info) {
+	case MSM_INFO_GET_OFFSET:
+	case MSM_INFO_GET_IOVA:
+	case MSM_INFO_SET_IOVA:
+	case MSM_INFO_GET_FLAGS:
+		/* value returned as immediate, not pointer, so len==0: */
+		if (args->len)
+			return -EINVAL;
+		break;
+	case MSM_INFO_SET_NAME:
+	case MSM_INFO_GET_NAME:
+	case MSM_INFO_SET_METADATA:
+	case MSM_INFO_GET_METADATA:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	msm_obj = to_msm_bo(obj);
+
+	switch (args->info) {
+	case MSM_INFO_GET_OFFSET:
+		args->value = msm_gem_mmap_offset(obj);
+		break;
+	case MSM_INFO_GET_IOVA:
+		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
+		break;
+	case MSM_INFO_SET_IOVA:
+		ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
+		break;
+	case MSM_INFO_GET_FLAGS:
+		if (drm_gem_is_imported(obj)) {
+			ret = -EINVAL;
+			break;
+		}
+		/* Hide internal kernel-only flags: */
+		args->value = to_msm_bo(obj)->flags & MSM_BO_FLAGS;
+		ret = 0;
+		break;
+	case MSM_INFO_SET_NAME:
+		/* length check should leave room for terminating null: */
+		if (args->len >= sizeof(msm_obj->name)) {
+			ret = -EINVAL;
+			break;
+		}
+		if (copy_from_user(msm_obj->name, u64_to_user_ptr(args->value),
+				   args->len)) {
+			msm_obj->name[0] = '\0';
+			ret = -EFAULT;
+			break;
+		}
+		msm_obj->name[args->len] = '\0';
+		for (i = 0; i < args->len; i++) {
+			if (!isprint(msm_obj->name[i])) {
+				msm_obj->name[i] = '\0';
+				break;
+			}
+		}
+		break;
+	case MSM_INFO_GET_NAME:
+		if (args->value && (args->len < strlen(msm_obj->name))) {
+			ret = -ETOOSMALL;
+			break;
+		}
+		args->len = strlen(msm_obj->name);
+		if (args->value) {
+			if (copy_to_user(u64_to_user_ptr(args->value),
+					 msm_obj->name, args->len))
+				ret = -EFAULT;
+		}
+		break;
+	case MSM_INFO_SET_METADATA:
+		ret = msm_ioctl_gem_info_set_metadata(
+			obj, u64_to_user_ptr(args->value), args->len);
+		break;
+	case MSM_INFO_GET_METADATA:
+		ret = msm_ioctl_gem_info_get_metadata(
+			obj, u64_to_user_ptr(args->value), &args->len);
+		break;
+	}
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
+		      ktime_t timeout, uint32_t flags)
+{
+	struct dma_fence *fence;
+	int ret;
+
+	if (fence_after(fence_id, queue->last_fence)) {
+		DRM_ERROR_RATELIMITED("waiting on invalid fence: %u (of %u)\n",
+				      fence_id, queue->last_fence);
+		return -EINVAL;
+	}
+
+	/*
+	 * Map submitqueue scoped "seqno" (which is actually an idr key)
+	 * back to underlying dma-fence
+	 *
+	 * The fence is removed from the fence_idr when the submit is
+	 * retired, so if the fence is not found it means there is nothing
+	 * to wait for
+	 */
+	spin_lock(&queue->idr_lock);
+	fence = idr_find(&queue->fence_idr, fence_id);
+	if (fence)
+		fence = dma_fence_get_rcu(fence);
+	spin_unlock(&queue->idr_lock);
+
+	if (!fence)
+		return 0;
+
+	if (flags & MSM_WAIT_FENCE_BOOST)
+		dma_fence_set_deadline(fence, ktime_get());
+
+	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
+	if (ret == 0)
+		ret = -ETIMEDOUT;
+	else if (ret != -ERESTARTSYS)
+		ret = 0;
+
+	dma_fence_put(fence);
+
+	return ret;
+}
+
+int msm_ioctl_wait_fence(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_wait_fence *args = data;
+	struct msm_gpu_submitqueue *queue;
+	int ret;
+
+	if (args->flags & ~MSM_WAIT_FENCE_FLAGS) {
+		DRM_ERROR("invalid flags: %08x\n", args->flags);
+		return -EINVAL;
+	}
+
+	if (!priv->gpu)
+		return 0;
+
+	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
+	if (!queue)
+		return -ENOENT;
+
+	ret = wait_fence(queue, args->fence, to_ktime(args->timeout), args->flags);
+
+	msm_submitqueue_put(queue);
+
+	return ret;
+}
+
+int msm_ioctl_gem_madvise(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_madvise *args = data;
+	struct drm_gem_object *obj;
+	int ret;
+
+	switch (args->madv) {
+	case MSM_MADV_DONTNEED:
+	case MSM_MADV_WILLNEED:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	ret = msm_gem_madvise(obj, args->madv);
+	if (ret >= 0) {
+		args->retained = ret;
+		ret = 0;
+	}
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_submitqueue *args = data;
+
+	if (args->flags & ~MSM_SUBMITQUEUE_FLAGS)
+		return -EINVAL;
+
+	return msm_submitqueue_create(dev, file->driver_priv, args->prio,
+		args->flags, &args->id);
+}
+
+int msm_ioctl_submitqueue_query(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	return msm_submitqueue_query(dev, file->driver_priv, data);
+}
+
+int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	u32 id = *(u32 *) data;
+
+	return msm_submitqueue_remove(file->driver_priv, id);
+}
diff --git a/drivers/gpu/drm/msm/msm_ioctl.h b/drivers/gpu/drm/msm/msm_ioctl.h
new file mode 100644
index 0000000000000000000000000000000000000000..5711476a00df4773b12020a37bfb3ceb964c19ee
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_ioctl.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifndef __MSM_IOCTLS_H__
+#define __MSM_IOCTLS_H__
+
+#include <linux/types.h>
+
+struct drm_device;
+struct drm_file;
+struct drm_gem_object;
+
+int msm_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_set_param(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_new(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_cpu_prep(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_info_iova(struct drm_device *dev, struct drm_file *file,
+			    struct drm_gem_object *obj, uint64_t *iova);
+int msm_ioctl_gem_info_set_iova(struct drm_device *dev, struct drm_file *file,
+				struct drm_gem_object *obj, uint64_t iova);
+int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 metadata_size);
+int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 *metadata_size);
+int msm_ioctl_gem_info(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_wait_fence(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_madvise(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_submitqueue_query(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data, struct drm_file *file);
+
+#endif

-- 
2.47.3

