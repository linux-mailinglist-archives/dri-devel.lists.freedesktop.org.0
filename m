Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51109ADB4B0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE97A10E3D1;
	Mon, 16 Jun 2025 15:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq1w1Y6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3310E3D1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8qWMm000772
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=oC5JJQBiULx
 rFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=; b=Kq1w1Y6jV+ZLj34FxNYF7nLVk1m
 +FmKeSKqop67aenrJbLSs6hwSg3afjeXg0tt6hvRFefVbsZaL/QvHUHcV4e+wEiq
 QlaPX5kOwgw7Ijz3KMfKau3HkRM2GCH4n5tGhod5+0G1cyMVlQgkvOzUSLYsm7vv
 b/pKzK7fwuiqUS6sUR7YHaLv72bcTHLO85xp7KVTE+qy0ty9L+AFX10nweQcz64I
 M1bzJx4yKT7ngh4nAqZC3M3+luHxD6sCBWx0cEcihHX2rQohPjoLWLKQ4BHlM6S7
 DZpvK5RFGmrOx1wxsId8LZd0E5H6VCyN+OUlfTwnb5w3mE4fM9pkNI9b+rQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsvw75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-236725af87fso24303285ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 08:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750086006; x=1750690806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oC5JJQBiULxrFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=;
 b=lZrPpvhe8urc87At0kBJvufGkZijtZ5hjD1LuZfVjuFraeHqqbcQiHjsdYldFPGDrL
 rXed68R0EmUUJgMHeIq7EPH0vTZaPEbFeYKs5gmLhUwEWFLKIS/78qoqDwCi0UgWJVK+
 /oqgHBQTvV0VcB+Rp8VUL83zoxyYv7iSigbCkE19Cpt51GGk+M8DLYMtEUdqGoDfv6BK
 xSjgM1rP7eJa8179fA1MbQLurBnbRgjyF8FOzvoc5WFMgg8KaYh0rXbyRoIormdTDca8
 00CnvfiJQVXHXATWv/TzrXw3yNVhS1DjBI5UQTubTBzp+MQafQP6gPDtVxwRuo6CPVNl
 xrqg==
X-Gm-Message-State: AOJu0Yyn2DS42CDSwUMjoEhe7W7u/2BMuzTnlpas+Va92b/whwdUdull
 AeltcSZ2m3SbmKYrIIjP8q3cw1zxz7HkGpWvyAiGC4MN2LitzMEvBAsjiolLmSWzxcaA0RaUVnM
 DNbE81+cjgdz/cm8ezXsPPcYXoG0CrEmIR/RBgA/tKD1CF3j0zsmeJqg7F4gq0l5HEiKlFUP3lr
 aZHuk=
X-Gm-Gg: ASbGnctUGww2F/MiDnLwQvQwiPNLmYXzhRQX1j2pIcijAGLqdA7+jFXn3tRb6Cs6Hh0
 3vX+fie9sYBqEtGbK9spSfghAVU0UgzTvgQ6SL1Eeru9Y1vZfh+lkXt4loa7qQ5oLAvSKnQF6NA
 CTHY5R1+UVfiO0b2SWx/6TiuGUPmBOKw9u9EAkvQcDBcuTwb3B0Y+NDdxdg2JZMhLOFYWASL0Pm
 i7HIPOGmxmSIVsf1ntO+OTayvdaXAmKhml+M2diijmtWqVuwjz1KDAtGVzpkNxiKYcZu6T8bXVo
 gmMi3LktI7j+FpJkCX4+rsokRqUzPXwM
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id
 d9443c01a7336-2366b3de71emr137982665ad.29.1750086005977; 
 Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnfSQJYXmMmDrm6U+uoX2a4jwex23BTSF9bmaN4Y4FWllhK7O5JeT0I0bKsdQT1hF7bDaSpA==
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id
 d9443c01a7336-2366b3de71emr137981935ad.29.1750086005443; 
 Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365e0d44c4sm61807305ad.252.2025.06.16.08.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/gpuvm: Add locking helpers
Date: Mon, 16 Jun 2025 07:59:57 -0700
Message-ID: <20250616145958.167351-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
References: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NSBTYWx0ZWRfXzFh7BHXzz8ly
 tsfQkHWnsDjKEwtXNfS31BY33REQemu6D5LMJV/zan+bKgWtxQhx9djeA78rirTu58iXN77oAtQ
 XJz9hzwKLZw4Mq+KeSAlzxbIQbC6MfyduY3DT1qVD5WuJpcEr4WvbebplquWIaLLJgBYbO0/JXd
 m16ZqYC/Ggo0mKU/U91h5nbiWg5oOCqt7JbKCkgTkCx0FJucCPgwTD1AH+VDpYz3ELYZT2hJS2V
 YEhYpYE4CAFR7Ul7faFahWbHQrgwUbw8OJ1u6FI1WYyTQGEdQk5yJbxayc8knoQA3t4Y8//3vaW
 EVE8DaFlVZfaUqMyLlaP5Bqo0z4MMqprK2aRERJYSE8DAR/hInHUCp4ZTwCTq4MdufbZAJmjzEX
 89XVqMQWl9VUvuFL505Wx8XQkOgY2IgJKV4SpZ4SEV16HA37uufIU9uUknHJhBjhiXAiYCn1
X-Proofpoint-ORIG-GUID: 9nkGKdit7Sxl4eE7j6sZfbOTUneJTWKn
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=68503177 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=J2tNMqIfyHcHeXEe9QMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9nkGKdit7Sxl4eE7j6sZfbOTUneJTWKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160095
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

For UNMAP/REMAP steps we could be needing to lock objects that are not
explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
VAs.  These helpers handle locking/preparing the needed objects.

Note that these functions do not strictly require the VM changes to be
applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
call result in a differing sequence of steps when the VM changes are
actually applied, it will be the same set of GEM objects involved, so
the locking is still correct.

v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..b8b0c7f028e2 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+static int
+drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_exec *exec = priv;
+
+	switch (op->op) {
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.unmap->va->gem.obj)
+			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
+		return 0;
+	case DRM_GPUVA_OP_UNMAP:
+		if (op->unmap.va->gem.obj)
+			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct drm_gpuvm_ops lock_ops = {
+	.sm_step_map = drm_gpuva_sm_step_lock,
+	.sm_step_remap = drm_gpuva_sm_step_lock,
+	.sm_step_unmap = drm_gpuva_sm_step_lock,
+};
+
+/**
+ * drm_gpuvm_sm_map_exec_lock() - locks the objects touched by a drm_gpuvm_sm_map()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @num_fences: for newly mapped objects, the # of fences to reserve
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * will be newly mapped.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			   struct drm_exec *exec, unsigned int num_fences,
+			   u64 req_addr, u64 req_range,
+			   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	if (req_obj) {
+		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_exec_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped by drm_gpuvm_sm_unmap().
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			     u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_exec_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..274532facfd6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
+int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+				 u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0

