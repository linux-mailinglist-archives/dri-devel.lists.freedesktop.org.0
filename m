Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99E0764AB8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF1110E52E;
	Thu, 27 Jul 2023 08:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9526510E52E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:11:30 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so204427b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445490; x=1691050290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ze2BfjPj3zI6XK14aBXxwpj9cG5VKS+QoT9VkWxAsig=;
 b=lwOoY+OdQN9yyaycuuDe1xOBPNuMdpjPWf9iVdWyTJX4Rze1Ujyu7FqyyXfPUD3aU2
 0geNSiBV+SjLplmH7ILvbtRHCHKM3vLFmOVDmsv1BEm9fkWkTRAM1imR53z99mDpf0IW
 ffoAdzAoMkEyhpVqT3oRFQGqTsCjJOMqkqnQ0DFV07QdT6HdoSrpGoFduwBz2OfpOwFt
 CWOX0mmKGcSRamco0Cg7QpPpz6Lx/kpTjodIKj6Sfbh0QvlZA2O3b8FhSM1hAbz32D/P
 0DhVwgLc1Xu9esSsJfTXPYkz1XSyCT4LoDf/9vVVRpeHu2USWPZ+XNt9qGqYRzfEx2BR
 Y6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445490; x=1691050290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ze2BfjPj3zI6XK14aBXxwpj9cG5VKS+QoT9VkWxAsig=;
 b=NwS6GRQ0e+V7xbeZsgD1v5EAHEWmZ9whUdLY183BD7oBntv1XlObw6Gb1QHuYfiMTL
 I0h9K7CFhmBoEBCywdJIrF7evLpEfXUXQv4s4Aoa8u35qf2gjiXs4q7Xh56fuDEXWM7G
 R97YjNiZxwSL6SO2U/DEPpmDAQW9He/e2bUweXNcP3OR7AkkIhMNgzgJAZ+FO50b/jMb
 2wXHLHTmqXisg/sjP3Mi3+vGLzXnG+Z/UFzY3dgOMlmO/U96GfZVr4Kv0IDaF8QudIOJ
 xjGkHpOR5+9aN726+rVq6yFWpVyQzeGH2kMCMOtygy9HZkGRxhnfYiO92Srk8w2TRlU1
 PgAw==
X-Gm-Message-State: ABy/qLYfSajNVKBoL6FZxLh657FkuHNVyUVS67i4AFYVUSerxhuD8T1t
 cv7txTRU0lrtjmxCTSATw2NaEw==
X-Google-Smtp-Source: APBJJlFMZtECqV3NWJubuagzux89byKCTiavknA18umD2w/BadGADzl49oXppHX8YppKwxO9L0rdOg==
X-Received: by 2002:a05:6a00:1586:b0:67f:8ef5:2643 with SMTP id
 u6-20020a056a00158600b0067f8ef52643mr5208150pfk.2.1690445490190; 
 Thu, 27 Jul 2023 01:11:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:11:29 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Date: Thu, 27 Jul 2023 16:04:41 +0800
Message-Id: <20230727080502.77895-29-zhengqi.arch@bytedance.com>
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
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the dm-zoned-meta shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct dmz_metadata.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/md/dm-zoned-metadata.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 9d3cca8e3dc9..0bcb26a43578 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -187,7 +187,7 @@ struct dmz_metadata {
 	struct rb_root		mblk_rbtree;
 	struct list_head	mblk_lru_list;
 	struct list_head	mblk_dirty_list;
-	struct shrinker		mblk_shrinker;
+	struct shrinker		*mblk_shrinker;
 
 	/* Zone allocation management */
 	struct mutex		map_lock;
@@ -615,7 +615,7 @@ static unsigned long dmz_shrink_mblock_cache(struct dmz_metadata *zmd,
 static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
 					       struct shrink_control *sc)
 {
-	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
+	struct dmz_metadata *zmd = shrink->private_data;
 
 	return atomic_read(&zmd->nr_mblks);
 }
@@ -626,7 +626,7 @@ static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
 static unsigned long dmz_mblock_shrinker_scan(struct shrinker *shrink,
 					      struct shrink_control *sc)
 {
-	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
+	struct dmz_metadata *zmd = shrink->private_data;
 	unsigned long count;
 
 	spin_lock(&zmd->mblk_lock);
@@ -2936,19 +2936,23 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	 */
 	zmd->min_nr_mblks = 2 + zmd->nr_map_blocks + zmd->zone_nr_bitmap_blocks * 16;
 	zmd->max_nr_mblks = zmd->min_nr_mblks + 512;
-	zmd->mblk_shrinker.count_objects = dmz_mblock_shrinker_count;
-	zmd->mblk_shrinker.scan_objects = dmz_mblock_shrinker_scan;
-	zmd->mblk_shrinker.seeks = DEFAULT_SEEKS;
 
 	/* Metadata cache shrinker */
-	ret = register_shrinker(&zmd->mblk_shrinker, "dm-zoned-meta:(%u:%u)",
-				MAJOR(dev->bdev->bd_dev),
-				MINOR(dev->bdev->bd_dev));
-	if (ret) {
-		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
+	zmd->mblk_shrinker = shrinker_alloc(0,  "dm-zoned-meta:(%u:%u)",
+					    MAJOR(dev->bdev->bd_dev),
+					    MINOR(dev->bdev->bd_dev));
+	if (!zmd->mblk_shrinker) {
+		dmz_zmd_err(zmd, "Allocate metadata cache shrinker failed");
 		goto err;
 	}
 
+	zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
+	zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
+	zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
+	zmd->mblk_shrinker->private_data = zmd;
+
+	shrinker_register(zmd->mblk_shrinker);
+
 	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
 	for (i = 0; i < zmd->nr_devs; i++)
 		dmz_print_dev(zmd, i);
@@ -2995,7 +2999,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
  */
 void dmz_dtr_metadata(struct dmz_metadata *zmd)
 {
-	unregister_shrinker(&zmd->mblk_shrinker);
+	shrinker_free(zmd->mblk_shrinker);
 	dmz_cleanup_metadata(zmd);
 	kfree(zmd);
 }
-- 
2.30.2

