Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2514024CE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80FB89D5B;
	Tue,  7 Sep 2021 08:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0195B89C63
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i28so1817904wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hYwBMrGyN8v4mRkb3bCYiWgxmbQRs6DCaUelO+FBX9Q=;
 b=W/SYVSXP8ICwFw5lBX8DomddK60B5bpRZ33qORXiDvqW++cDHVqi/YQY6zI1RFdokX
 VAVgQx5jVRGcjZgmPg4tDzOOzdbCeqEl6lNszGRewAqySAlfQnoslZV1gjIUlQSojXsf
 t1WD/Yon6zGUg2v6NxHo9pip1Swn3uV4vQ/YtV+T2kFNtYqVjrBY8YKbmalIOPef4z5J
 AGOo3SWWIeHiN9r2hcevsM7/weTy+HxBXffyEdfcVp7Kge/5lGTiTiTk9Nmwfaw6pWHH
 DjdrveC2DckRUqXt0QOguivrv+QWK/TkeamM5ahYrKMQQaIyL1zeJm2duRkystO30ii8
 YOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hYwBMrGyN8v4mRkb3bCYiWgxmbQRs6DCaUelO+FBX9Q=;
 b=GGMt3Rk1m4FpsRhByQnXh+H0kpNWr/BK0KvbatTSq/pHVE+eBLPw5FxrmrO+iQ6Z+b
 o7KcsK3vVKAXVJHkfQk6MrfTBbNMOkDyeRwkqDNmxp4ybSgjrcSGml6WUHz+q5oUEtT8
 LGIz5lsREKnBo1INdqEKfEMPffOjZ3wbNEhQc5kl5j+3WwF56BL9p15lndw6uZkIaAdu
 c53u0rDGHborHClMfywPPj4WFu9SdcIitjvRs8r65QQdKl99mB9hXsjymc2JuwTKqqH2
 NSOyumASjAl68+MbM9VZ3GDt+kq7WS0vLce2MRUJDuHlD9yLEzML+k8oW9IF40AVOgEj
 3PYA==
X-Gm-Message-State: AOAM533Xpab4W1NE9yY2ksGAJLDuC48M1QWQo3s9AKJ/41N094pOzIlw
 oQJgHvLyNOCo4XF9vldmW03++MEtQbNMZhco
X-Google-Smtp-Source: ABdhPJyZ/jKU3h1zwbcQn1vQVainabXDTRRAxYk00D7XLF6xWIxgkqy3fUVrW44IXjuDSH8CZUfR5A==
X-Received: by 2002:adf:82a9:: with SMTP id 38mr17395206wrc.82.1631001702607; 
 Tue, 07 Sep 2021 01:01:42 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 8/8] drm/ttm: enable TTM page pool kerneldoc
Date: Tue,  7 Sep 2021 10:01:35 +0200
Message-Id: <20210907080135.101452-8-christian.koenig@amd.com>
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

Fix the remaining warnings and finally enable this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst | 9 +++++++++
 include/drm/ttm/ttm_pool.h   | 5 +++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 69c4a20b95d0..e0538083a2c0 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -67,6 +67,15 @@ TTM TT object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_tt.c
    :export:
 
+TTM page pool reference
+-----------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_pool.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/ttm/ttm_pool.c
+   :export:
+
 The Graphics Execution Manager (GEM)
 ====================================
 
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 4321728bdd11..ef09b23d29e3 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -37,7 +37,7 @@ struct ttm_pool;
 struct ttm_operation_ctx;
 
 /**
- * ttm_pool_type - Pool for a certain memory type
+ * struct ttm_pool_type - Pool for a certain memory type
  *
  * @pool: the pool we belong to, might be NULL for the global ones
  * @order: the allocation order our pages have
@@ -58,8 +58,9 @@ struct ttm_pool_type {
 };
 
 /**
- * ttm_pool - Pool for all caching and orders
+ * struct ttm_pool - Pool for all caching and orders
  *
+ * @dev: the device we allocate pages for
  * @use_dma_alloc: if coherent DMA allocations should be used
  * @use_dma32: if GFP_DMA32 should be used
  * @caching: pools for each caching/order
-- 
2.25.1

