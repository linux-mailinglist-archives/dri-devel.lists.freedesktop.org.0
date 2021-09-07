Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C4E4024CD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254DC89D4B;
	Tue,  7 Sep 2021 08:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8D0899D6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b6so13083181wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qq+7eTP9FERxOA+p15g+bjshN4g277ovShUFcpEQdus=;
 b=dyV08N+P0ZKhDGbvjEuwTVTqdK9r6Tu0GBgBs4sKBfv/k8ve4+xgtF0t5IJhu2FD3Z
 SsRHE9qHAQU1dCZXJp9gc+hYOqwWv1AifDU0OnoxnrV9nVouM2NQrGmHrDcImsunTBLW
 3WE8YHtSHTThOqhp23wIfeWRPvgOEiLSTB1IuzswU2g7h5F8WOd07qn8nxo4rM4uFmxZ
 UzhJkQMjPPm6iNhjBl9mlfIMfx+THbNml+4wdsYkjojXhEEjKUBkme84FOvHlYXpWsRk
 lhQhPoSmuvJKi63Qi85x3WUXqnRdDwP2gANnwGlM6mQ88Mdfs5UC9IiAHVeePsT+Ut4c
 3r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qq+7eTP9FERxOA+p15g+bjshN4g277ovShUFcpEQdus=;
 b=AoX5kNpuCyoAL/IYEjd7sTwQscR/Xa9OfunPMN01ort8YxlERajxzcyGwHp2W57pga
 D1Tnizs6CBXqFsphzElB6SZw4O0ERfn+MVIBlG0wLsy4yWDfm9GIz8nYWd9CnvCYQNHm
 N0LainBcFBVxLjfNdbrcqGgTNrZ48/D9llfaKODJYuBMgDoCcSY1jJDDW3IT0azyy9Oj
 M5gCGD/umD7a1RIidN5UXXhfMm1H8AN8sWxpmph+15hOdNU1CPf2+jZQBiisntX8Q36o
 TZCUwzIf2sN0noNj+DGRMSaPiOeWeaCCGIT/Oi5asOQa/SYuwQi3i2HKo8rbf4k800nr
 Fe6Q==
X-Gm-Message-State: AOAM5310TVeDNXN532npcdApDtHXt31YEmy8gVYLWw3UY/9eBbHflfGF
 TEhxTVKtfJAULORdpMUGrEBbDUbAaYi7hvNn
X-Google-Smtp-Source: ABdhPJwHrIQNu+YfGYpUVvrIXuj3B5sj+dSjZltVEaUfUSXYECEak7V2lF2s5b/+6Xj4qXwsxzInow==
X-Received: by 2002:adf:f884:: with SMTP id u4mr16582347wrp.411.1631001700477; 
 Tue, 07 Sep 2021 01:01:40 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 5/8] drm/ttm: enable TTM resource object kerneldoc v2
Date: Tue,  7 Sep 2021 10:01:32 +0200
Message-Id: <20210907080135.101452-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907080135.101452-1-christian.koenig@amd.com>
References: <20210907080135.101452-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Fix the last two remaining warnings and finally enable this.

v2: add caching enum link

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 Documentation/gpu/drm-mm.rst   | 9 +++++++++
 include/drm/ttm/ttm_resource.h | 6 ++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 3da81b7b4e71..66d24b745c62 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -43,6 +43,15 @@ TTM device object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
    :export:
 
+TTM resource object reference
+-----------------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_resource.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_resource.c
+   :export:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 32c5edd9e8b5..5952051091cd 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -103,10 +103,7 @@ struct ttm_resource_manager_func {
  * struct ttm_resource_manager
  *
  * @use_type: The memory type is enabled.
- * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
- * managed by this memory type.
- * @gpu_offset: If used, the GPU offset of the first managed page of
- * fixed memory or the first managed location in an aperture.
+ * @use_tt: If a TT object should be used for the backing store.
  * @size: Size of the managed region.
  * @func: structure pointer implementing the range manager. See above
  * @move_lock: lock for move fence
@@ -144,6 +141,7 @@ struct ttm_resource_manager {
  * @addr:		mapped virtual address
  * @offset:		physical addr
  * @is_iomem:		is this io memory ?
+ * @caching:		See enum ttm_caching
  *
  * Structure indicating the bus placement of an object.
  */
-- 
2.25.1

