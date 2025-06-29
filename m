Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C5AED07F
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF9810E373;
	Sun, 29 Jun 2025 20:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfFz9SbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AD110E368
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDTXqk019282
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Aea4FNs+8GG
 CBuby38XbOoX3esCsoQzCfRoTW94GwEs=; b=JfFz9SbT1oIaF0VZxe17kxpx1zQ
 y42O5dIOd7+otgw4y2tjiZa0ga+TJDQE578F1Lj/wr0MERp9ePDYYLEy5JP1MzTn
 jnu+KO38ASHn+07D+1JLTOifyxgSwAwc53gbSLc+Ga47lve5WwLrHJxqSOGQ8Ome
 nA8OrHRYanXlgpUKyj9IGU2JoC0BXzo9D15hDjIeTqmomR12ORLoAUyfD2mCBsrb
 xb8Qk03W8a6XfhCqZL9EcP6rmUiv4YLSEv9whb8KViPBsvgfmrNBxOxkubP4BgS6
 uTLTigHSMhzWrDZT76x0dK1K87z3zQDfsDNz8D96yaYm/OpLexdfwa+GZZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-237f8d64263so29998485ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228205; x=1751833005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aea4FNs+8GGCBuby38XbOoX3esCsoQzCfRoTW94GwEs=;
 b=AI5K6ZOV2C/N/QWlY7BWaQQWGl9akpUIeVbILEUjRwEWQOpfWz7RfGAvMTsfcSo2vx
 Jb48X6ENCOtZgHYah11frrMzYj8TXFqJLhx0a3lIGUxdg1KqjOqbZahKeo1B25bkmfiK
 owaGlYW73gROGzNvneEpFODhtlF6BlVFhIfS8z/aPI0T4ETVrH0nKRAYIvP5W6YNuO12
 oIOrR5dHrWABpsOqxGgJJwjwssfEfRmFMYEJeQqIyD5lcgLfjiFZ0wojtb6O2LdHsNZw
 7qsQwJ4GVCrB3zk2EpeDd+tXgi9WgpcjM3Lwb3MsUrfOTy6BfjftL4aDWKpPruPj4RJ/
 qksA==
X-Gm-Message-State: AOJu0Yy2v4T9cBWJnbVNdET9mwBWP/k+Y5sSv7NLrwdWOqPCWEhQgWQ3
 7w+52IylDF3mN8GEFmSrVug0fR5xdzp+f53J1xTEVLFaZT+aMWOCsVzSlSllpLCad+2qO0yQLmw
 D5T+Malh1kkIMY38j+NPvwowJjDsfboa8bqh3KCrhyf+Sp7Rm2q5WaheWh/htp4uHO/Gukyj3R4
 ZHrCw=
X-Gm-Gg: ASbGnctVeDZAEuh/PegNxvCWysoxxqYQMEC5jbQJuMh0B3wQCeKvp1JRQyvhdmmeeV/
 pIQciPe6OGvyg+HwulcrSe4HBZ//9SYw7JOhEVoRpBNlYD3elje3U8Cfcub5419AP+ht0rfKD9l
 9hnBWWxJ7RGB3vR6uBfVX5r/9YqhL5bBMlreNEIh/PHKJcGvBqzcXYr5uqt7aEsBJ1Y28Kc+THm
 zNbEjPH7TLXUEGl6Xif7lF2LWZ7mSZr1SkutMwGBncJJPCw9/0htSwuwL4H/gjdMfTXTWWB7Gr5
 ciYKuw/C7KkjyLPpKifeYtun9RLrRh7j1A==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id
 d9443c01a7336-23ac460838amr190149695ad.36.1751228204907; 
 Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi+FCZAiieRq2GK0HZyXrffH2uO26d9xwGr6VDhBhxu0D5CBsaqa1z27xVMPNiaaB4jVB9mw==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id
 d9443c01a7336-23ac460838amr190149445ad.36.1751228204550; 
 Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b0052sm64461035ad.158.2025.06.29.13.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sun, 29 Jun 2025 13:13:02 -0700
Message-ID: <20250629201530.25775-20-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3hdSVNBy-4y1y3UGnOvEUmTbL2gUj-SR
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f2d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 3hdSVNBy-4y1y3UGnOvEUmTbL2gUj-SR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX0HUx8fzXyXxm
 JcStYtPENqP8L6Y8Vf+8RSJBiwAISKTjhzWZJkRBBHkuJaNw1xbSAKIx+0NerTtJCYQcJZv0V+1
 ImFvB/LPI2smWskgFiMTepRAXwYuxh9gd+VsEMovCDBpEle1vi1G4R3lK18QbzuEnqzK73K50JD
 n6EpJPlRzpQvhOnNELaIBkT/2DE0biTCkSkBXC3DxFO+Kc9FMZJwhUBIxQ0DnWOEO+CzECIjMSY
 QpPijGyXvqPHIVscDWjP6Ie43d4D01bcl7nfU/Bmfk/5hKdVbhGjuEhuCRCJU4B23VNeT6SF7Tj
 IVqfbIF1KyAAdKYiKPg5Pqv6o9D5/gmICYlxHuqU8/RWnf2uN9DZsewZcCIsB+KV8FB5JQBWc2E
 5b0pW/tVfD7Zt4wUEDTI7ShkCi/cdLXsPdwPYDug7oRbjoIDFVzJoDU1oDmq6c8AV7fppxs5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=972 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

