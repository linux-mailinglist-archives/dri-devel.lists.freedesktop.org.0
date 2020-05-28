Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77AE1E6F74
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1E86E832;
	Thu, 28 May 2020 22:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7526E406
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:05:42 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so25268edq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6iN5Lj8HoVMgtIBkC+DktRX5/Yy2DKeu8kDD8YjoYSg=;
 b=QhtSmdOI/M6HNhbYpwQSuwGjzd/dXHR9IVN4twGF6xaXwdlP6cgyY3IG0AFT3lK72+
 VxFdOez0FwH0IKbDO5z2SqXHGJwzcF1Z+QhIF/R87CI7JeYvBW0FCu93u6w+7QM8n/ff
 oyFoh8AtfSM3WLykanUztN07OPDdCg+IjPlXbyKRPeWJy7Fc6nI3z9Or+WWb6OwwvsCy
 zL6pN9edm6O3muMQQDnHyFDBrxCwYk/2LHd3+H/lbLVqSinaeCK1M7x2zXIFrDW9ecSw
 M/dQLZZwGnk0ozQgdOg5pIUxYnPLosQS/kRxZbhq63dh4LTq8OBpeW3DYB1GNwyVrJQY
 o1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6iN5Lj8HoVMgtIBkC+DktRX5/Yy2DKeu8kDD8YjoYSg=;
 b=IDxgg+GZn2mQhZcYwrI4beSJh+TdWVZdl0byi8Nxc3hGS2Z2kg1s3vlPprZ7qrzuQm
 VoeCfKQcucvRiWux8oArwZADHW7ilAqvoGG7uikwln2SsRoS1AiD5Mf580D0rRBY6Hf8
 45+Cyz5x9A65NG8ijylOI13GWLs6mpjWfO4etpQe8o5++GMczr76Gjx2yEh1D87V+kxR
 1qXyTp5jo/SDAB3fCcFUkn36WYNvg3rcAQLMcC6d5mQWgwyz7LPyhJqrORni2YCFD5li
 a7oGJgXA+8AerRVevsLgwJ3Ephq1UOfPcdDwhEIWp3o5UHaf2p8vDp61VcdQWKMTlTKe
 X/4w==
X-Gm-Message-State: AOAM532WJtpGHc5O+qQKeSIEgpI6qDARr2i+M7SsEajwvjyMsqnVZ2to
 4yJtix//AQqp//Pa9ek2OcWkG7dVh17yKw==
X-Google-Smtp-Source: ABdhPJzEDJjZ3FA1y6HUaD6g2I3wRi+9riHH61V7tRLMUP8QxRO/6VdHpfQ4CIqmoRhKg2Wg9BGDAQ==
X-Received: by 2002:a05:6402:417:: with SMTP id
 q23mr3067977edv.139.1590671140092; 
 Thu, 28 May 2020 06:05:40 -0700 (PDT)
Received: from localhost.localdomain
 (p200300c58f230400765197681c23776d.dip0.t-ipconnect.de.
 [2003:c5:8f23:400:7651:9768:1c23:776d])
 by smtp.gmail.com with ESMTPSA id n25sm5090382edo.56.2020.05.28.06.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 06:05:39 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mm: add ig_frag selftest
Date: Thu, 28 May 2020 15:05:56 +0200
Message-Id: <20200528130556.53275-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, christian.koenig@amd.com,
 chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch introduces fragmentation in the address range
and measures time taken by 10k insertions for each modes.

ig_frag() will fail if one of the mode takes more than 1 sec.

Output:
<snip>
[   37.326723] drm_mm: igt_sanitycheck - ok!
[   37.326727] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
[   37.326728] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
[   37.326728] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
[   37.326729] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
[   37.326730] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
[   37.326730] igt_debug total: 4096, used 2048 free 2048
[   56.040064] drm_mm: best fragmented insert took 504 msecs
[   56.082184] drm_mm: bottom-up fragmented insert took 40 msecs
[   56.102255] drm_mm: top-down fragmented insert took 20 msecs
[   56.107177] drm_mm: evict fragmented insert took 4 msecs
<snip>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/selftests/drm_mm_selftests.h |  1 +
 drivers/gpu/drm/selftests/test-drm_mm.c      | 59 ++++++++++++++++++++
 2 files changed, 60 insertions(+)

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
index 9aabe82dcd3a..4c08ca86bb86 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -1033,6 +1033,65 @@ static int igt_insert_range(void *ignored)
 	return 0;
 }
 
+static int igt_frag(void *ignored)
+{
+	const struct insert_mode *mode;
+	struct drm_mm mm;
+	struct drm_mm_node *nodes, *node, *next;
+	unsigned int size = 4096, align = 8192;
+	unsigned long start, timeout = 1000;
+	const unsigned int max_count = 10000;
+	unsigned int i;
+	int ret = -EINVAL;
+
+	/* For each of the possible insertion modes, we pass an size, alignment
+	 * value that is known to introduce fragmentation and check that it
+	 * doesn't take more than 1 sec.
+	 */
+
+	nodes = vzalloc(array_size(max_count, sizeof(*nodes)));
+	if (!nodes)
+		goto err;
+
+	drm_mm_init(&mm, 1, U64_MAX - 2);
+
+	for (mode = insert_modes; mode->name; mode++) {
+		start = jiffies;
+
+		for (i = 0; i < max_count; i++) {
+			if (jiffies_to_msecs(jiffies - start) >= timeout) {
+				pr_err("%s fragmented insert took more than %lu msecs\n",
+				       mode->name, timeout);
+				goto out;
+			}
+
+			if (!expect_insert(&mm, &nodes[i],
+					   size, align, i, mode)) {
+				pr_err("%s insert failed with alignment=%d",
+				       mode->name, align);
+				goto out;
+			}
+		}
+
+		pr_info("%s fragmented insert took %d msecs\n",
+			mode->name, jiffies_to_msecs(jiffies - start));
+		drm_mm_for_each_node_safe(node, next, &mm)
+			drm_mm_remove_node(node);
+		DRM_MM_BUG_ON(!drm_mm_clean(&mm));
+
+		cond_resched();
+	}
+
+	ret = 0;
+out:
+	drm_mm_for_each_node_safe(node, next, &mm)
+		drm_mm_remove_node(node);
+	drm_mm_takedown(&mm);
+	vfree(nodes);
+err:
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
