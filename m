Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBF7865F3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 05:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EB710E4D3;
	Thu, 24 Aug 2023 03:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329A410E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 03:44:21 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68a32506e90so1062060b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 20:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692848661; x=1693453461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCA0ApwXV5FyQtvOpmWRZ9XMHHHCgvXZoPv/VlrFSS0=;
 b=F7mx7Z2SATT/Tw8oqVu7LGCwIgOY9q6nNnmh5/ganhwLW8GaQrL8dhMzkQme16OyB1
 4ZcrhSW1iVS/oXJkAxqcqvYnRC8V6z5f0tnKQYSO6HG2Ws1pP37Xuc1otxDqi5KUNw9T
 WVRuI/U+MbwSKZhcaJBbRNgA7W3KFvvzyeKOBXeWATvONSpA9TS02B13yxyrYGxzzveW
 u5fhQzEptjlMGS36OjAsEf17/AFamZ+U3xOMpKlF84KqegOgtZie0MuXeEOyLRhKQDjM
 0P+76n+lplLjw7rWWL6ybRhAGOOQQQlRJmwWoHvL9CcCs2DRS/s36iNm5swp9kdFbKCI
 NE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692848661; x=1693453461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCA0ApwXV5FyQtvOpmWRZ9XMHHHCgvXZoPv/VlrFSS0=;
 b=bb3HQ59OWzeYKGy7zqpKNK1+GlmBrBsKIIS8ANxOpTdgng3f8xhOmDpfplF/ZGABiW
 bVSL/MzSWuM7kiCMwFwHHrtyPR+e5jdHXFFI91h0wA4HbmpEVvQDM/4pHqzPtdFCpUr9
 7hXNDK+qH1KEXo5Y2znrardu4t2fP+iEjshK8omkzMBJVvDupzdPNRrX8F90UMeFPkNB
 Y3pgqAM2wqJEjrJ9c0ckYnVVwYUvVc6RdCoX0plg3CuUcOSwTVOmBXthKjx75erWjb2M
 9yRgU9xShxunpvBOSsv7pIolvYt8PdhKREh056lfQN/c5MVQwyW8FIUOVrQmwXU6XGDX
 5mxQ==
X-Gm-Message-State: AOJu0Yzyup9qWt6eAPjmtPCfoqodD7vKrtR5pt/+juxWYuuHppL4ScS7
 k/iicOko9XuGZNXCS3YoYfhGpA==
X-Google-Smtp-Source: AGHT+IGMOB5tWYNyEDyo5eiTNUNcN0ymONSI8d47WEA6VQz24qAk45RADJx4EG80WGrowCiJNhDryQ==
X-Received: by 2002:a05:6a20:3941:b0:137:4fd0:e2e6 with SMTP id
 r1-20020a056a20394100b001374fd0e2e6mr17386821pzg.6.1692848660762; 
 Wed, 23 Aug 2023 20:44:20 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b005579f12a238sm10533157pgo.86.2023.08.23.20.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 20:44:20 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v5 04/45] drm/ttm: dynamically allocate the drm-ttm_pool
 shrinker
Date: Thu, 24 Aug 2023 11:42:23 +0800
Message-Id: <20230824034304.37411-5-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
References: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new APIs to dynamically allocate the drm-ttm_pool shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Christian Koenig <christian.koenig@amd.com>
CC: Huang Rui <ray.huang@amd.com>
CC: David Airlie <airlied@gmail.com>
CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ttm/ttm_pool.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 648ca70403a7..fe610a3cace0 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -73,7 +73,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
 
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
-static struct shrinker mm_shrinker;
+static struct shrinker *mm_shrinker;
 static DECLARE_RWSEM(pool_shrink_rwsem);
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
@@ -749,8 +749,8 @@ static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
 
 	fs_reclaim_acquire(GFP_KERNEL);
-	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(&mm_shrinker, &sc),
-		   ttm_pool_shrinker_scan(&mm_shrinker, &sc));
+	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
+		   ttm_pool_shrinker_scan(mm_shrinker, &sc));
 	fs_reclaim_release(GFP_KERNEL);
 
 	return 0;
@@ -794,10 +794,17 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_shrink_fops);
 #endif
 
-	mm_shrinker.count_objects = ttm_pool_shrinker_count;
-	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
-	mm_shrinker.seeks = 1;
-	return register_shrinker(&mm_shrinker, "drm-ttm_pool");
+	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
+	if (!mm_shrinker)
+		return -ENOMEM;
+
+	mm_shrinker->count_objects = ttm_pool_shrinker_count;
+	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
+	mm_shrinker->seeks = 1;
+
+	shrinker_register(mm_shrinker);
+
+	return 0;
 }
 
 /**
@@ -817,6 +824,6 @@ void ttm_pool_mgr_fini(void)
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
 	}
 
-	unregister_shrinker(&mm_shrinker);
+	shrinker_free(mm_shrinker);
 	WARN_ON(!list_empty(&shrinker_list));
 }
-- 
2.30.2

