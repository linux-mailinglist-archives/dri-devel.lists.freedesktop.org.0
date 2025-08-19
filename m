Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F04B2CFF2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 01:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E82210E2DE;
	Tue, 19 Aug 2025 23:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrRQ4pbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433D310E234
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0mhT026151
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eorQnuKwFmy
 2NP3qxzCVt5IHD0p6HNwhfpue4EH5fbo=; b=PrRQ4pbQgGU3zIbwI6WUS/i+lbb
 QwgBCdLHKiuGmdVJhDU70Kzzp1XfZraBmqmhhuYi6zCCV8p1KjAyWLGclhjWB/NR
 49KOhpakQ1bvvAAUukhZBfOjZNt9pI+k9qjqiWuVu3GnPxCp7+5/Vioha3slOf0h
 GlyrLJyPTiSlG8ekygsd1yierTJ5YcC5KVA3X9lGADoFh++EbH9lAQHNea+GI6us
 HW/TtS8ePp56MxRIUYSF5obBvHOoW6DzXUhH3jZqnRgxTr+q9ByMpj7HR5ms32h/
 7MsxoC5x6smZzogi+ola7robDSTkdSki1Tsg6TvaF1LLqBinpE8iKJ8wuCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tf88sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2449b4f316fso13846705ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 16:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755646154; x=1756250954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eorQnuKwFmy2NP3qxzCVt5IHD0p6HNwhfpue4EH5fbo=;
 b=CfjM8jpQmc1Pf5eidPL+FTsL1QmOxQs2awEuoc3dOL82ytOeTw22c3sLWk+Z1iyESo
 +g/vwqBPztOPNIYF/VdlRCn2aAazcyRalVZ+2Sq/itZk+sCCCaK0HRndako4TnKoWWON
 8IZG8RdcH34YO5xJCzhbaXXIR8Fedx76he0wsL/xYbicC/7kgtv31fLb3r2twDPDkqwZ
 uYumUHOejuZ/jLiFZLYVoj8nW+BWoniEyn/PKRHMXHlUzgzpijGF9VIQuuT23uKGskNf
 jEVYW1x8H7F33L+rF15Pq9JgIT+uXnoourdHvw29OSlCTs41w8meKcCIheU3tdKyyUi0
 hYqA==
X-Gm-Message-State: AOJu0YwjA8da4dIf+TUM+Wbv/fejzy35+SCoZDOEf+t6BCwSfUOQJBbm
 9lDs7Zz9QDMmemxnMYapQq4wPf8DhLGEuYJ6nx98ci1cxHaRvW2hpWsFdPozvPqEb37xi2oSG6Q
 vbaGsJgUKctfPw93RRZXi5cADvwkrnfNGNxtjjPRzLewZRtugxOGu56rHS5qJEFLAq0sDv7ceha
 u/af8=
X-Gm-Gg: ASbGncuE7BEDLj91N3PTDgVY7Vfr/esu1khS1t1p4xFK1I3QvP2jxLRCbETM1TznqWN
 s/1hi056DkGKSDkqrnGmSt9tMwndLjlhby/n4GHBXacPVGCw2bnN7WMxnPWSdxcM6hCa/gk5RjK
 H6gVtwJ0VpIMTvGS0gttm59hFQMK6hNDm5btC+JkUEZcFeUbza9dZxsvoFg92L6Yy4LADygZ0gM
 h6oJ7BhE5wFmWSibjz6eNIzupIrf7F6ZEPGstEfoxNc2ODV6IfQvcvmK+zIe02ZF+qigJOEg2oZ
 eQ9AqybhB11KghQFs4+vmLrO6LSieAmezJcsnkyCFsv6FpTbIrY=
X-Received: by 2002:a17:903:234e:b0:243:963:2a70 with SMTP id
 d9443c01a7336-245ef156358mr8027695ad.25.1755646154014; 
 Tue, 19 Aug 2025 16:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlmpOombDfq8VbEjWHWMgGH5Q1/mKcc7dH8Jm6GIHXrGX0qRiaR2T3uKoERFwvEKAF5ww/Bg==
X-Received: by 2002:a17:903:234e:b0:243:963:2a70 with SMTP id
 d9443c01a7336-245ef156358mr8027425ad.25.1755646153561; 
 Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ebc4esm8040925ad.115.2025.08.19.16.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm: Fix 32b size truncation
Date: Tue, 19 Aug 2025 16:29:03 -0700
Message-ID: <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ws3_FUh6kA-GDHidwmwKEXFFS-wxsW9v
X-Proofpoint-GUID: Ws3_FUh6kA-GDHidwmwKEXFFS-wxsW9v
X-Authority-Analysis: v=2.4 cv=H5mCA+Yi c=1 sm=1 tr=0 ts=68a508cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=Zku5-IFyaxskcEPfeVAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXws7HyybEBi5M
 2T7lj+UvljNkFfVFV+TmXGCBptn1lvMpDUuIbD+Eo0Ataz/rGCGZ/P81zOetsnaLlBu4gAk4Z08
 whZLi/XpJWG7UYdgAysBkLJAYZ+E+PWhkxsgaoRfznVJmGGzaymE48xx7MD3XsprTWJsnTpRaMk
 Ts8rw1RTpibxaHRTpi6bsU639RL5FZ1hhr9RVwBjXEtI1LSNyDE4cqCUBiLcaE0mC5Lx9GSWqTE
 nqL1Ypo1ANUh0sCvkMR1QTPnDiOaErLeyL3A+WiAAJK/sSR1+evEirf7v2yb3WfpHIULSX2hXaE
 Zgt37LxTGlfYmMLRR5I3QaL+QGBu3vWW60kYR6ErvbOwB1XD6qmo6IzJdVYqKFLg8yOHiJgWmDj
 e1+rIp5fq9SRfXbPfYtVEkQWI1hysA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++---------
 drivers/gpu/drm/msm/msm_gem.h |  6 +++---
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 958bac4e2768..9a935650e5e3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
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
+	size_t size;
 	int ret, npages;
 
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
-- 
2.50.1

