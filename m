Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1BAED061
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 22:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456B10E11E;
	Sun, 29 Jun 2025 20:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHTvEF1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CFF10E364
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TKDWjx027276
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sVxQxqcInWG
 kGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=; b=oHTvEF1KOTyRjmBitWtjfyQi9d7
 RWH6rjdkIlBV0XTeCgeLLsdytj+I2h8iRsq5ZXt3woWHsIBIAlYwnWC5pIGWbw0o
 ZiXFiW785yJdqMj5CFcyo/iNaBlSLA5xenwkDLVPjOZ9KokrCtJo3Rvveqps172R
 wFIIvgRBbZcSfkVKWjZFHyi73rxUvvzSoDTNYfO6PJbfq8aarZjNUl3MWGQsskv6
 Z1MuJU505tXlFRNXb6983TlIBz2QBCJm7nAKcmnlLeagch0T4gfIXJHT1b4sc0jG
 9dUBcqbIPwsTc0w38wHUWmvWqP4i5XCYTtubdQls+Ctsm2eoU+FhAPHriJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjjcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234a102faa3so26320535ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228181; x=1751832981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVxQxqcInWGkGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=;
 b=Gv55w+0pYo3BuwQhnJK+mv8fIl8pizT9iC9gpu8Rq16htU30tH2ZXczJkHXmvU3r5F
 6AY6HlmktFmHI7ARfxR3NkFH/MGxigocp3mZBAB97Sho5SGSW+wXmVdpeEE9yiM+7vDn
 7ZMblD9E7ZxsU49mj/A3OTG1SwZFOZi2WyYuqzrq8csNp2zPMDMET0AtGnW7nRcjtgax
 01etRBR871y1KUjXdFxSMwEdZfKEM0sLr6GCZ0Fr3n3Wn+oRFeiy/aebKbxH56YrqTdu
 SZ9En/Yx9U9V1yyrITryfj/R30FrZ8oi/pqXnvWav/Z3yG11LKkPhtXAiiVqlAyUtJE8
 BvSQ==
X-Gm-Message-State: AOJu0Yw49O9ve+gqS5qQglN8zkqMJuAgITt/KD+YrhPGF9Spwt+NWzh1
 clkfL5nSAFwvM2Hf5jITzz5JmPn1MwfnJfNTEIoMxSttHozdRGKEW2og3o+1ZO1SBycS6i0+VNC
 ROjnCNsDv6mmEsMH72eYvq8X/jnMmL6EjixjTDEeW+OIEuJltQA+0TvBBpCcLgnoA+7D0cIByvm
 4QW+s=
X-Gm-Gg: ASbGncuvC6GXBny+hmlQXk3N4ZKK32vxu/CnVU4/ieOeFkOF41KzTo/92gucs9x69d2
 7nhe+sg68C2BbhYRHsJB+ZrLdgFCYwLzBSgOhd56Rkn0+9US/jDTUwERtJ9D4qW5wLztLhBkQh1
 ds8rsrrVrpKusKYI8rxuEQNHUzBUoLRFHbQJuGcxGJ9AhzC85zcC73k+JeHAblnKD65Vtlo6HrO
 zhZRC1PYt4ifAK5CCz1GWFvUyZThFL3gVwaY577lO7L1cRCexdf/yRN7e7+QrsqpQ8FgQGgToQj
 fqeJ0r35a766LKYC0myGdwL0KqKnRAneTw==
X-Received: by 2002:a17:902:ebc7:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23ac40e028bmr169454065ad.12.1751228180640; 
 Sun, 29 Jun 2025 13:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbJUtGP9MrWR24HPcC4/u3xJtP1wRXJgvFGUHLgeKLArllLw9NNHdWnW/5xcDbywPkb6T0g==
X-Received: by 2002:a17:902:ebc7:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23ac40e028bmr169451305ad.12.1751228175405; 
 Sun, 29 Jun 2025 13:16:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c6953sm67738195ad.226.2025.06.29.13.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:14 -0700 (PDT)
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
Subject: [PATCH v9 08/42] drm/msm: Collapse vma allocation and initialization
Date: Sun, 29 Jun 2025 13:12:51 -0700
Message-ID: <20250629201530.25775-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pCmfRaUm2TcRZw6v7jZ0IHgJLz06_gD3
X-Proofpoint-ORIG-GUID: pCmfRaUm2TcRZw6v7jZ0IHgJLz06_gD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX8FX/7aGQuVxc
 lKH7qhi1VQ1SXkMnCVlbGRIHcYXUcVx1Yn/aMjjdHwqQj2EUy0uHr9bHR893kk3LolqbfVsFKkt
 VFaOcKK9rqgRV9XnHFK2MN2/0DllAMTJv3u7odzIcAag0nQ0mbui1tu6/gLqqmNi5OgPaJdBcPb
 ld+pEDwWXow0URrs32sEPGbcX/NOIpfY3wuX+usGoWCtan4pkX3XSR0SU2BcaBvfPFfizcan0eF
 wrDbtwaffWslontDbXuArAbHeWpAGobn570RqU67A5AlHJQgJXRB2RkDNod58mugtk6fsIx7OYH
 DwQ7Itb5QAkae9rD8+rGUh7GsoVArW5JJCHuNbANYZhzkR+5nm1WV4H6qeuUuo9Qu2kR9sMRqCs
 RJ36X11+uh1Wa5cnIUWJzZHqmQu1YXQAOHA7hDqbgr+c6NfxBsoZHbagBef8QCYlTRx2Zrtn
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68619f15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=amM6-9Z1s-9IjK5NNPIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b83790cc08df..9fa830209b1e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -333,23 +333,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -416,6 +399,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -423,18 +407,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index e47e187ecd00..cf1e86252219 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.50.0

