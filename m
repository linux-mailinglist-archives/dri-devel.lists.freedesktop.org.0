Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B2AECD39
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED23D10E33E;
	Sun, 29 Jun 2025 14:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJcrPvyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C2010E2A3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCPYur004100
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Aea4FNs+8GG
 CBuby38XbOoX3esCsoQzCfRoTW94GwEs=; b=jJcrPvyl7D1DSgJKQPuG2ZaNEJq
 TmxzF5N9gnvIjsoh4qX8XjmqJreN6TPHLp3w4XVWyIzdfC2siG4gibqJaH13qU09
 2uBU8gzgtrGERKfPnFx6Bcg4YyYX7Zk9LchhAfe1O2t+w/HmVy8D6GH+FinaHmqs
 +mOgTgj+jwa9m8u3lO8aeIbwVtXdP78OqLtfTQi9IaKHUk3gk9E0umTRvpD5WjS+
 Hs2exDFHz3iF9jGIJAPoApKed8WuCFF7dmw7xmBPbQ2VhN3gTv8qKKSDk7RCBO4a
 HBzPFEu/Sxn3X9lIoSrRVmYI+zO9Gxr9XWSMvgTJd+tzGuchbhJlsYFG+GQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvj9rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b31e1ef8890so912792a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206069; x=1751810869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aea4FNs+8GGCBuby38XbOoX3esCsoQzCfRoTW94GwEs=;
 b=uCgpBh5U4nFiWozLS+YUnmCqmLo67im9uXL8jBClmc+OJKikKjHQ+7iXZTfn2GntRa
 3W5URuaUqYKL1DBz+nA3WsfP//fMwprc9gC2fMovgquyayBaTqRn4+VZcSXxWreHQCNy
 +EtoUv5brnN0/XfTWOISCoLUc4yWw92ImlMuB+Zbz0SeGeLNAg23VlPZtExqa/ZbdiWZ
 sbrU13fpdy868t7EqdEQHgwm97cqlsWr+7aiT4MpB8/Y+o2SP5qZg5RRty9tHi53wDt3
 eH3Twq2ow68S0hyiLSoBeE92se+vg8IqJVDt7e/jrfB3H4sDB/Urs+JSCD26o/oeJpbk
 lmAA==
X-Gm-Message-State: AOJu0YzUNoH556vUDZKYM+rUvPYZztBBY5ktQAuVmdrMuFAz0fHbc05s
 Cgf8/Q4VcjK23M4PubBl3B0AXjcZygPz7eJ9RvldUsBIbf3sQBQof6395OfmDwgfPupfn3ibun7
 wu+//aUX8kWdP+82gVGEWhGXZ5RO1CJ5f88PcBcQZY4VW3y1+NrouetF3PNKyvW+v+pfnxI1O6G
 skBF0=
X-Gm-Gg: ASbGncuSQyfPfxyiclZWFXUnDBtKxYceKZplXqri2GZlkTjU7vpYA4aCIZAxODzQ3Sz
 8yP0TntWvNDLo1SR+v1zpJIWp9+pyDoP+W+K0yHSr7P2dmbTKawQYFxFn2D4xDCiFxRQBDoY1jN
 H17wvEzFlox4jB+eEZUW9vCUIjtAqaRQGmf4IKcQ0EIYNH3fjJqzZAX8hFz5qQOGSYHmd7mp1W1
 pMy4TDXcO47aPykf7teuF2vhMMABV1AiqjcPLYOpc9TNH3ip0W2/1A2tAWG39sAioGRVBc+uOfZ
 6b6Lrd8OCRoocJJ7C2tbZ6p6kjD14dfE
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id
 adf61e73a8af0-220a1696400mr15129151637.22.1751206069234; 
 Sun, 29 Jun 2025 07:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4h3RVVYdGoqKUxRhDHt+2Zko+cPdjWJ8H6//OEKtNu88w3yP8af8LGtq0ohnKwkPkhBc2gA==
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id
 adf61e73a8af0-220a1696400mr15129113637.22.1751206068805; 
 Sun, 29 Jun 2025 07:07:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541ca0asm6760251b3a.57.2025.06.29.07.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sun, 29 Jun 2025 07:03:22 -0700
Message-ID: <20250629140537.30850-20-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -c8kDCnYITw_06dRTyrT6J_haGi1QqqS
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686148b6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: -c8kDCnYITw_06dRTyrT6J_haGi1QqqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX26rMBiJAeAb6
 RbIToA7l8gbg7grBiKwksO8eYPGS4GzRXLGOw9Cu7ElN6YLUnY6WdaZytwapqT5P41YCO6xaweC
 ci23sds492k76mBYTV0xxdRjciIarHwfAWL/cJniwKPuJjbhSY9yBDeTQbkVteOgjfStfNGG2ft
 Gyl7KO7QBat5yYF5YJ9fgeFruwhCqrJd5cMJAZeaWMJMqEfmA71eFoVxJkVvSvDNBEQG5f6eLzq
 X/x0dTRKCQHWnUj38M2fY7BiRZm3vtxKOM11TZSATRvzYD7Qutu1IVb1Ho5fS1O9ABhH1tpJaHb
 wi8CpSjpmBM+Qs6KC8/Yv5/mxxwcM9ajADPkSmJMAKGoS4aOeHI6XaMybgj1g/fnxDoVE3sZFZ7
 Qriaxlr6i6YEpi6b89kBnBG+7nZnd9zaz3kgcZ2J0hITZ5Q16QJc0JA1SQSKD1SpoZgdfTpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=972 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5c71a4be0dfa..186d160b74de 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -57,7 +57,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -433,7 +433,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -607,7 +607,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0e7b17b2093b..b5bf21f62f9d 100644
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
2.50.0

