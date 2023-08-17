Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C334E77F506
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 13:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A88810E451;
	Thu, 17 Aug 2023 11:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741A610E451
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 11:24:30 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bdb3ecd20dso10200745ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 04:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692271470; x=1692876270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Edkj9TBH9r1yTrwiI2mq64ByzXZznvLaEK+Zi+OSIAs=;
 b=QPrroukD/0sUYTrperpoi4k0+O1FkEFMssCKpRI8fMzWjYWPc1C5njqyG2p1lDvG8X
 HsOoOZkoy8V0FkWtMQFLoIbhtQ4Y/buM4M3hV+jvWn0vx5yIwLW3bIoUFjLtbjg4liVi
 8iUPW54HVtYwd8swxQ4P7EcjEabvnc3On0Wf3MpqJfeIlBtjexBIW8RZv9T7kLftiBfe
 TiABJzV4xgR+Cqa18qjOcrHDQj2Y7Y8AuUREUchQrolVO18tA1srYXpq0JiFzQ18tMjx
 YQ7ehb4AsmQaiW2z/cJ9uEI7MgIJa3wNkH2UbGSKGqRZyiN3qecKnYz7Eo+IRyCh0r9S
 VYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692271470; x=1692876270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Edkj9TBH9r1yTrwiI2mq64ByzXZznvLaEK+Zi+OSIAs=;
 b=CtRNz70K6Jj53Etbbw9nTdnAw92xlDqpeiXlFehjbHdIAC8k6MpL3XHBLOTvKom102
 QJiOtOLnb4MhA1Mfhu3DZUIPwYA4FKw9188iBjVujMvQnprlKNoKOqs19QRkcGVV1Oeh
 n79koSdociCAG+IalR7Wcw/K14/sKf9f03HnkbHtoPZIB36FYrY8PeuNC+mr8+Nwokqe
 pbCv2fEP4HWG5vhvjTrcjBWWlFs56pacDnBL+0VJyCAaiohEv0Fb/bl50/wrqaeYJH7p
 HNKrJjb5Y7IHMGiU+lvamUcqwkAH5JnqlCWpGo26CjbGwNgTx7/tLbWll8sKO/Ze4MEi
 BHFQ==
X-Gm-Message-State: AOJu0Yz3lVo6/pQM5kQjwvaDCO3snSGKCPyLUlEIgGuiPVvhbrMG8XRu
 dwUr2ymANH90t4PDEG6EOjfoGA==
X-Google-Smtp-Source: AGHT+IEJtYhqVgPFBx2Uc3KOT9HxMzyHVti3q5fR4hRNX0J6IpAnsXg7OHEkf7BAe2qVXVwECCkiew==
X-Received: by 2002:a17:902:da91:b0:1bb:b832:4be9 with SMTP id
 j17-20020a170902da9100b001bbb8324be9mr5398982plx.1.1692271470090; 
 Thu, 17 Aug 2023 04:24:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 jd22-20020a170903261600b001bde877a7casm7229309plb.264.2023.08.17.04.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 04:24:29 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com
Subject: [PATCH v2 1/5] mm: move some shrinker-related function declarations
 to mm/internal.h
Date: Thu, 17 Aug 2023 19:23:58 +0800
Message-Id: <20230817112402.77010-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230817112402.77010-1-zhengqi.arch@bytedance.com>
References: <20230817112402.77010-1-zhengqi.arch@bytedance.com>
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
Cc: linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following functions are only used inside the mm subsystem, so it's
better to move their declarations to the mm/internal.h file.

1. shrinker_debugfs_add()
2. shrinker_debugfs_detach()
3. shrinker_debugfs_remove()

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/shrinker.h | 19 -------------------
 mm/internal.h            | 26 ++++++++++++++++++++++++++
 mm/shrinker_debug.c      |  2 ++
 3 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 224293b2dd06..8dc15aa37410 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -106,28 +106,9 @@ extern void free_prealloced_shrinker(struct shrinker *shrinker);
 extern void synchronize_shrinkers(void);
 
 #ifdef CONFIG_SHRINKER_DEBUG
-extern int shrinker_debugfs_add(struct shrinker *shrinker);
-extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-					      int *debugfs_id);
-extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-				    int debugfs_id);
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
 						  const char *fmt, ...);
 #else /* CONFIG_SHRINKER_DEBUG */
-static inline int shrinker_debugfs_add(struct shrinker *shrinker)
-{
-	return 0;
-}
-static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-						     int *debugfs_id)
-{
-	*debugfs_id = -1;
-	return NULL;
-}
-static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-					   int debugfs_id)
-{
-}
 static inline __printf(2, 3)
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
diff --git a/mm/internal.h b/mm/internal.h
index 0b0029e4db87..dc9c81ff1b27 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1153,4 +1153,30 @@ struct vma_prepare {
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
 };
+
+/* shrinker related functions */
+
+#ifdef CONFIG_SHRINKER_DEBUG
+extern int shrinker_debugfs_add(struct shrinker *shrinker);
+extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+					      int *debugfs_id);
+extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+				    int debugfs_id);
+#else /* CONFIG_SHRINKER_DEBUG */
+static inline int shrinker_debugfs_add(struct shrinker *shrinker)
+{
+	return 0;
+}
+static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+						     int *debugfs_id)
+{
+	*debugfs_id = -1;
+	return NULL;
+}
+static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+					   int debugfs_id)
+{
+}
+#endif /* CONFIG_SHRINKER_DEBUG */
+
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index 3ab53fad8876..ee0cddb4530f 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -6,6 +6,8 @@
 #include <linux/shrinker.h>
 #include <linux/memcontrol.h>
 
+#include "internal.h"
+
 /* defined in vmscan.c */
 extern struct rw_semaphore shrinker_rwsem;
 extern struct list_head shrinker_list;
-- 
2.30.2

