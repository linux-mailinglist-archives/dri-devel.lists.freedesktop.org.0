Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7D1EDDBA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBD46E27F;
	Thu,  4 Jun 2020 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A0389DD8;
 Wed,  3 Jun 2020 09:36:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so1175481edq.4;
 Wed, 03 Jun 2020 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zrW1qYdmza3cHObnDqSlHRuXHBl31r4L27W8F49Rsyw=;
 b=aay3sGkcCanSbFKMzBqlFfYxc2ltsWMym46rD1n4s894TbJ3aydMtjCIV+7ijvY6IH
 o0IKcQgFPzH6bNM7vjHmZAh5I9nWGo+3kz36v1zy68H23jcOkk0OmpX21BjZb1Mnpysv
 NcFXADQNB4wpP+F6a9naqUBz9ZNwVZzkz4KY9JlPgvB7IduAcIYIgGFDoxgT/LuZOYRr
 SV/FyPTX58NPAIAEUWKA+FkIFV94ID2OzZitrnVG0tJe4G9/GXzj68HiE6dmxvAgCJfP
 dcKzITFLrTp7QBbFu97RPqDvy8mr9NE9L6aB6VbPJpMagXOXX/52qzts3LagFx9Yepn/
 Qkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zrW1qYdmza3cHObnDqSlHRuXHBl31r4L27W8F49Rsyw=;
 b=iZQP7XDJfBYnqhkpo6i1D2iHyrTuxoJoMCi55j0UDkrF1EFFkUQbOPZ8aQHddxXsgj
 KdgN1q8XPaGPA7Ahvkb3uogUDqSZfWgWOb0QgRpBNC4ufDkOp9UdAzVmdikQdV2lCMi1
 VcMScWpVmagHez9Cbawd1TKpV+uG6zIaQFf1q8qtrFdaJCZPLhmG3NLGQbc/PDJkrpcV
 OU+WHtEp7b28feqNzj8Wj6QXz/HUKmsHmy5Rzg5zHuskAGXVha/3vgusbweFaIvEc9UA
 0t0RF4MmjW0E0WGl60fUwRz7Qe9wFBFAmcqzTwlwJKYd5u+nucyPUG9mBnpB77Kwbj+j
 a1cA==
X-Gm-Message-State: AOAM533/2D0I0Xc37TUfmNwcXaqIvU58gx74564axHElTPo8Le7m846h
 HKVvpnyOQRx0L+LbI77Ror+87CYGHc8=
X-Google-Smtp-Source: ABdhPJw1dwA8SGM56ZJUlIbYapodUg+tvysEC1kRbd+ZXtivTm8lt21U2ac5MNXxjpGtp7ZdSoppDw==
X-Received: by 2002:a50:eb0a:: with SMTP id y10mr30549840edp.312.1591176970557; 
 Wed, 03 Jun 2020 02:36:10 -0700 (PDT)
Received: from localhost.localdomain (p5de523f2.dip0.t-ipconnect.de.
 [93.229.35.242])
 by smtp.gmail.com with ESMTPSA id p11sm879259edy.71.2020.06.03.02.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 02:36:09 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/mm: add ig_frag selftest
Date: Wed,  3 Jun 2020 12:32:23 +0200
Message-Id: <20200603103223.10443-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 christian.koenig@amd.com, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch introduces fragmentation in the address range
and measures time taken by 10k and 20k insertions. ig_frag()
will fail if the time taken by 20k insertions takes more than
4 times of 10k insertions as we know that insertions should at
most scale quadratically.

v2:
introduce fragmentation by freeing every other node.
only test bottom-up and top-down for now.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/selftests/drm_mm_selftests.h |   1 +
 drivers/gpu/drm/selftests/test-drm_mm.c      | 124 +++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_mm_selftests.h b/drivers/gpu/drm/selftests/drm_mm_selftests.h
index 6b943ea1c57d..8c87c964176b 100644
--- a/drivers/gpu/drm/selftests/drm_mm_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_mm_selftests.h
@@ -14,6 +14,7 @@ selftest(insert, igt_insert)
 selftest(replace, igt_replace)
 selftest(insert_range, igt_insert_range)
 selftest(align, igt_align)
+selftest(frag, igt_frag)
 selftest(align32, igt_align32)
 selftest(align64, igt_align64)
 selftest(evict, igt_evict)
diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index 9aabe82dcd3a..34231baacd87 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/random.h>
 #include <linux/vmalloc.h>
+#include <linux/ktime.h>
 
 #include <drm/drm_mm.h>
 
@@ -1033,6 +1034,129 @@ static int igt_insert_range(void *ignored)
 	return 0;
 }
 
+static int prepare_igt_frag(struct drm_mm *mm,
+			    struct drm_mm_node *nodes,
+			    unsigned int num_insert,
+			    const struct insert_mode *mode)
+{
+	unsigned int size = 4096;
+	unsigned int i;
+	u64 ret = -EINVAL;
+
+	for (i = 0; i < num_insert; i++) {
+		if (!expect_insert(mm, &nodes[i], size, 0, i,
+				   mode) != 0) {
+			pr_err("%s insert failed\n", mode->name);
+			goto out;
+		}
+	}
+
+	/* introduce fragmentation by freeing every other node */
+	for (i = 0; i < num_insert; i++) {
+		if (i % 2 == 0)
+			drm_mm_remove_node(&nodes[i]);
+	}
+
+out:
+	return ret;
+
+}
+
+static u64 get_insert_time(struct drm_mm *mm,
+			   unsigned int num_insert,
+			   struct drm_mm_node *nodes,
+			   const struct insert_mode *mode)
+{
+	unsigned int size = 8192;
+	ktime_t start;
+	unsigned int i;
+	u64 ret = -EINVAL;
+
+	start = ktime_get();
+	for (i = 0; i < num_insert; i++) {
+		if (!expect_insert(mm, &nodes[i], size, 0, i, mode) != 0) {
+			pr_err("%s insert failed\n", mode->name);
+			goto out;
+		}
+	}
+
+	ret = ktime_to_ns(ktime_sub(ktime_get(), start));
+
+out:
+	return ret;
+
+}
+
+static int igt_frag(void *ignored)
+{
+	struct drm_mm mm;
+	const struct insert_mode *mode;
+	struct drm_mm_node *nodes, *node, *next;
+	unsigned int insert_size = 10000;
+	unsigned int scale_factor = 4;
+	int ret = -EINVAL;
+
+	/* We need 4 * insert_size nodes to hold intermediate allocated
+	 * drm_mm nodes.
+	 * 1 times for prepare_igt_frag()
+	 * 1 times for get_insert_time()
+	 * 2 times for  get_insert_time()
+	 */
+	nodes = vzalloc(array_size(insert_size * 4, sizeof(*nodes)));
+	if (!nodes)
+		return -ENOMEM;
+
+	/* For BOTTOMUP and TOPDOWN, we first fragment the
+	 * address space using prepare_igt_frag() and then try to verify
+	 * that that insertions scale quadratically from 10k to 20k insertions
+	 */
+	drm_mm_init(&mm, 1, U64_MAX - 2);
+	for (mode = insert_modes; mode->name; mode++) {
+		u64 insert_time1, insert_time2;
+
+		if (mode->mode != DRM_MM_INSERT_LOW ||
+		    mode->mode != DRM_MM_INSERT_HIGH)
+			continue;
+
+		ret = prepare_igt_frag(&mm, nodes, insert_size, mode);
+		if (!ret)
+			goto err;
+
+		insert_time1 = get_insert_time(&mm, insert_size,
+					       nodes + insert_size, mode);
+		if (insert_time1 < 0)
+			goto err;
+
+		insert_time2 = get_insert_time(&mm, (insert_size * 2),
+					       nodes + insert_size * 2, mode);
+		if (insert_time2 < 0)
+			goto err;
+
+		pr_info("%s fragmented insert of %u and %u insertions took %llu and %llu nsecs\n",
+			mode->name, insert_size, insert_size * 2,
+			insert_time1, insert_time2);
+
+		if (insert_time2 > (scale_factor * insert_time1)) {
+			pr_err("%s fragmented insert took %llu nsecs more\n",
+			       mode->name,
+			       insert_time2 - (scale_factor * insert_time1));
+			goto err;
+		}
+
+		drm_mm_for_each_node_safe(node, next, &mm)
+			drm_mm_remove_node(node);
+	}
+
+	ret = 0;
+err:
+	drm_mm_for_each_node_safe(node, next, &mm)
+		drm_mm_remove_node(node);
+	drm_mm_takedown(&mm);
+	vfree(nodes);
+
+	return ret;
+}
+
 static int igt_align(void *ignored)
 {
 	const struct insert_mode *mode;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
