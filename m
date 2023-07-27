Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230B764A25
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEAE10E50E;
	Thu, 27 Jul 2023 08:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B1410E50E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:07:14 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so182485b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445234; x=1691050034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQ2nJ797AaeiRC4tEbuFSwr/qroaEGD64TBkJX9gwcc=;
 b=krf0rRSBuACihGG0HOfvmWM3fExNQmmDQBZSFypO9OF26g2F9IRQXNjarXAj+rDJ2F
 j6wi8ORGszAJ8F4/2B5RfozFOO9c5wQvkPuwF+U0dnMIFYzI2u+dIV518lO0Mey/M0g+
 DAIhAFbNX4boMgnEYCrLvSqMruXRlIM+AwHL8QP9OXWtql9jawORm8JA9K2pNt2CM3by
 1AI1wCMU2elwBWzc8zmddDhb5S57BlUFVrs7Qpu26KSs608fAqSWn4u6Hcxn6Nu/AYp6
 eAYr/PxpZmg2LEli6lhHn6OsT6FdGj3gL7SNMtigAeYxmILx7EQ2Lx+oYLfIsw664x5Q
 hi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445234; x=1691050034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQ2nJ797AaeiRC4tEbuFSwr/qroaEGD64TBkJX9gwcc=;
 b=h6c/uLHlo/L25YTgcO1kCth5RAhjdj4wjKh9cWaWqb+tH72872V9iVGGxHbqBoNJUm
 LGeFLKhbTHllJ+WqHX+NHcNFWk5uT+qSa7DbBTUNq+ZRhaPKXlQK1yyM2N2OkW1B4l4Y
 Kvk3YE0FyocZgMcfKj2lxP+PlHwkmYvlyMSEsX7B/8OLAYXJo5HT4bb70zoUR/GVVQZv
 hcEQmFft7O0hYzfvwlfzOhhLoIu0vVw4JAWno8WuvDQAcWyICvY9SdSdT3rNzOuQT/iq
 1oPGNrDQLK/4jJ9dVX4IqGn7XFiBoj/7n65+wso2KPZsViKl5MsPCG9s4K0BjNSpOuA6
 Oqgg==
X-Gm-Message-State: ABy/qLbzfIq7DPnpFSOPtgExdvaezbXpTa1nAK+Y9ntWSYlwThUhGvjk
 ayLoZ6YdHVYZON5rWpHmMC2oNQ==
X-Google-Smtp-Source: APBJJlExJjCwBoW4B5netumBOqdfs5+SJLDXxiJ/1dno6haNjCE+wUan/A+nwEsop7KuM9iLlMTgjA==
X-Received: by 2002:a05:6a20:918e:b0:11a:dbb3:703b with SMTP id
 v14-20020a056a20918e00b0011adbb3703bmr5540739pzd.6.1690445233998; 
 Thu, 27 Jul 2023 01:07:13 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:07:13 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 07/49] binder: dynamically allocate the android-binder
 shrinker
Date: Thu, 27 Jul 2023 16:04:20 +0800
Message-Id: <20230727080502.77895-8-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new APIs to dynamically allocate the android-binder shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/android/binder_alloc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e3db8297095a..62675cedd38e 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1053,11 +1053,7 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 			    NULL, sc->nr_to_scan);
 }
 
-static struct shrinker binder_shrinker = {
-	.count_objects = binder_shrink_count,
-	.scan_objects = binder_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *binder_shrinker;
 
 /**
  * binder_alloc_init() - called by binder_open() for per-proc initialization
@@ -1077,19 +1073,30 @@ void binder_alloc_init(struct binder_alloc *alloc)
 
 int binder_alloc_shrinker_init(void)
 {
-	int ret = list_lru_init(&binder_alloc_lru);
+	int ret;
 
-	if (ret == 0) {
-		ret = register_shrinker(&binder_shrinker, "android-binder");
-		if (ret)
-			list_lru_destroy(&binder_alloc_lru);
+	ret = list_lru_init(&binder_alloc_lru);
+	if (ret)
+		return ret;
+
+	binder_shrinker = shrinker_alloc(0, "android-binder");
+	if (!binder_shrinker) {
+		list_lru_destroy(&binder_alloc_lru);
+		return -ENOMEM;
 	}
-	return ret;
+
+	binder_shrinker->count_objects = binder_shrink_count;
+	binder_shrinker->scan_objects = binder_shrink_scan;
+	binder_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(binder_shrinker);
+
+	return 0;
 }
 
 void binder_alloc_shrinker_exit(void)
 {
-	unregister_shrinker(&binder_shrinker);
+	shrinker_free(binder_shrinker);
 	list_lru_destroy(&binder_alloc_lru);
 }
 
-- 
2.30.2

