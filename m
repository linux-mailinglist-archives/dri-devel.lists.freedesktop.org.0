Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE8B2E92E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 02:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883BF10E829;
	Thu, 21 Aug 2025 00:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnNH4hbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C360C10E834
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KKL8JK006919
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Qp/A80ntMQW
 zKIpfCuvJC05mBAON98quijLhbVW9wZM=; b=dnNH4hbQwF1dp70I1AK4GDd7LPD
 QA6H48WypGfAO9OmxYlws9xAzKsvDrZsDs8jJkSat/QdWkh/nLRYnarZ8SgaJohJ
 eIrOwL5ntNZphB8gylta/McpcLVfYzkF/gvlgEnbB3R2r6pjLkWRAN+WmvmyTP5F
 0yUGEqhSxD6QuzpVmDwJEn7hAqRYnYmURnKKVDpibhlJ2kqwjvvpPy1Pj0WWJ2+E
 UPWMXKfyE090ZF09g9H3VAvUOUjN7TrpFAVQYvh03l6H2x+bUpwHoQiApghNZtxJ
 A+oXiSWFzPJ8NoJau9GorVIqtxtgN+9KFqBzUA6g/LeBN4GHrFgMcbRkbBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293bue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457efb475so4627735ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734677; x=1756339477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qp/A80ntMQWzKIpfCuvJC05mBAON98quijLhbVW9wZM=;
 b=HknsjRSj2gtYeOk09WGWGoXcCbUxMZmb5+P2tfmmXCMIh5wktW+zzoIECZ1dFWNCC5
 71QEsIoNOgJr/TQkeDrYndUMw5obuw3RrzZzOyCqXbWnmBWSKvOwz878t+MZ3SbeQNMk
 s4/WzI3Ff/f278boGpeCtCFUTkGqVdf4Fx+Goxw+/MsKR76pCszErdhEXXN98LaPZc5q
 /hxx8cADgrJCfW1n4fgL0YBa2RYjGfjGoIeWh6UIVAoONATEluIXWy1f5Xr5pOGVl4Pr
 nMt2Gg9LrX2k7UCBK5Hh56vPNhaDE2HWcDK5jCLWJPOU7lq5dqkR4cuQbJn1Z1drJCIN
 ZD9Q==
X-Gm-Message-State: AOJu0YyUY/FDyQTmeuNAFA3Urv7fhmDZ9jl3da2DOliCXfFtr0+WBqsS
 kzJFdhJHmqUDBNUirfnTgXzaJLEW9my3U0gsboJaTzoG/TakOSIgZ6DzOi0kxZenau43y5xwUG0
 YGILE3caeAHJKijLKHe5CGWkkcXA5/1kCzd+pa8xdaZXSwvAAKdnazHBi1Bd+qW5AF7j6ia/gN6
 NxkFU=
X-Gm-Gg: ASbGncvzQp/+vdJVYZhnSTwY6MSS2os/FFnu15FVvRVyV62vcpLWGK576oR11cuF8Dh
 9vQRxZfMTiSb+BsWAGChhFIMILRAxDh8TupRa/F5Yo+AE+hme2Zi+6qnAz7gQZI6BzREoQRGIAF
 1okg8T3iZwH/w2Jn0f5suarzqopNH3cp7gfTmVoDxH3mBKAnbPxu+fSgvu2wWUhToeMUa5LKhGp
 WbI1cd/mpI7uIpAXOUf/mY/1/uK954dh0vs4z7HfbNk3fRUx6ZqDqI+lRoHmtnpiCSTGctV2Xz+
 SM0Ochpo4tHxmfGei8St1RI9mWBVuLExZFCyX+WtA5CRJNmvTk4=
X-Received: by 2002:a17:902:ce11:b0:240:9f9:46a0 with SMTP id
 d9443c01a7336-245fedb7bcfmr7679365ad.38.1755734677508; 
 Wed, 20 Aug 2025 17:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5tsfZ6UJAKOwZ9VJcJCpxgsE7IAQWoLU/G9aFnHsuF58zIqAfzhOOeqY/ioG4KuVujNrLA==
X-Received: by 2002:a17:902:ce11:b0:240:9f9:46a0 with SMTP id
 d9443c01a7336-245fedb7bcfmr7678895ad.38.1755734677061; 
 Wed, 20 Aug 2025 17:04:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2460273cba9sm2170355ad.63.2025.08.20.17.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 17:04:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm: Fix 32b size truncation
Date: Wed, 20 Aug 2025 17:04:27 -0700
Message-ID: <20250821000429.303628-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a66297 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ZgH9EFzBAD-oDO0bpbcA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5ADn1pHDeHtZN3aA7K0d_aekoB45r8Gs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwAFRDFD1RYeC
 9zMWsyP6i5CoPXeSctZ8ILrRMr21KT+wp4wpemlGUc61qg3W4ypbFPFHJRUcYJjgIYItExh7TUx
 pyR/ckMtfq4l87pQ0ZvtZf5ThzHgmiKX0C/TiUl0Hvs6ldiQG2j/KVF7693k61Tg0PgG+lt3xIR
 atBoEWMzgMcT0gI5DO28SiMxn7653IlZkeem5MVZa0ko+CuNrDk0lFrNYu/P299QMBpjenZmBgs
 5wsynqjCPdDSuIvZfGoJ5Ocq+YRkeLNfv0N90a15H81MNLgtXdQznLQDFNCmrmp4BPblGhdiMFY
 sMTXwoTQud7agoSGnHlJOjqy7H8tk/TGfTzATPKwZIcgDmAeT9oKUmIG5xg0be2eMpbJCKLFoib
 aOR8wbktZ5d2Ax6noBji4Z6j9/IrxA==
X-Proofpoint-GUID: 5ADn1pHDeHtZN3aA7K0d_aekoB45r8Gs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

Somehow we never noticed this when arm64 became a thing, many years ago.

v2: also fix npages

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c       | 21 ++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       |  6 +++---
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 958bac4e2768..aefc82184eec 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -189,7 +189,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
-		int npages = obj->size >> PAGE_SHIFT;
+		size_t npages = obj->size >> PAGE_SHIFT;
 
 		p = drm_gem_get_pages(obj);
 
@@ -1142,7 +1142,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle,
+		size_t size, uint32_t flags, uint32_t *handle,
 		char *name)
 {
 	struct drm_gem_object *obj;
@@ -1208,9 +1208,8 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.vm_ops = &vm_ops,
 };
 
-static int msm_gem_new_impl(struct drm_device *dev,
-		uint32_t size, uint32_t flags,
-		struct drm_gem_object **obj)
+static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
+			    struct drm_gem_object **obj)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1244,7 +1243,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	return 0;
 }
 
-struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32_t flags)
+struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1259,7 +1258,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
-	ret = msm_gem_new_impl(dev, size, flags, &obj);
+	ret = msm_gem_new_impl(dev, flags, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1299,12 +1298,12 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
-	uint32_t size;
-	int ret, npages;
+	size_t size, npages;
+	int ret;
 
 	size = PAGE_ALIGN(dmabuf->size);
 
-	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
+	ret = msm_gem_new_impl(dev, MSM_BO_WC, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1347,7 +1346,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 751c3b4965bc..a4cf31853c50 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -297,10 +297,10 @@ bool msm_gem_active(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
+		size_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+		size_t size, uint32_t flags);
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index c0a33ac839cb..036d34c674d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -15,7 +15,7 @@
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	int npages = obj->size >> PAGE_SHIFT;
+	size_t npages = obj->size >> PAGE_SHIFT;
 
 	if (msm_obj->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EINVAL);
-- 
2.50.1

