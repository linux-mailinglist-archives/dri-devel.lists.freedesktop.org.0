Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F41F0ACB
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 12:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3B56E0F6;
	Sun,  7 Jun 2020 10:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7F76E8B6;
 Fri,  5 Jun 2020 08:17:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j10so8773648wrw.8;
 Fri, 05 Jun 2020 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oWoBXyI0xOBjf+sRY5eTXM2E2pXrkjavsP11CXARebk=;
 b=sIHIh+EHv7kJQY/tz4CVjrt0wRZEbo9uIN+kyUW/fZCg4AKzWrIAKi6MmngRiRaDao
 Sd/K2pcspp2Yd6IHmEfB88hEKnzMUOl1SMJMDW4f2fv4I8o4M/t5CUxwh/eKcoLyfNfG
 f6HcoPzUNupi0iB/+pAWlkFY+NvpTMETGnHTyXKFG16dYmNqrubrLcm/BAmMF30kyZp/
 qoidkx4KYL61pu6DfQGRtAoQxohz1c0jyjvWLXoHyfnq4rzdN8XdU0v9o1S8Wvg3yYGO
 aqOCy+Uhkv6rM2ypCo5A09dY5/vkD0BPCEYOnBBROFPiRxm7BTCG4XtdO7SwB++djUYf
 kPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWoBXyI0xOBjf+sRY5eTXM2E2pXrkjavsP11CXARebk=;
 b=uQw0XsA6f8v9ezJHFVL0EVmwa8Fb1LenUbA2CYJtbKfo0BaCKQO7reL7MhYR7E9hKp
 oMpC223hEdLoOxUPwStmxuV/xs16RE724+3yRJx8U2lJjECwYImYUwmmHOXCMYAxit4x
 x0po3caqeQmruvojW/Q7gn7zvZXxOK3E87Kot/LNCMPJRElDKcU7Xfm0O1UJ72hJKt7Y
 7JtttUF81x5m9YGtf/VbjqdUb8JGZB+pcs4uNsovpSg27dezitewtaIWHM3KgEYcPHv/
 +JIZGgnUMn8Gj1lFrtJP5ToPbyMGxkNRRx7qNQKRCTV2shOh8FVfHzV29hD2lxlOyCnV
 r0ow==
X-Gm-Message-State: AOAM531GRFgZRTdp6JbeIII09VPUpkiXHNd3XDUf0oaFsV/GMoR0cKy0
 jbaSOC7pmwmAxw6cMZcnaix2s7ww+pE=
X-Google-Smtp-Source: ABdhPJw8UNT1h5QteIKcWaU7kFdfigLgvFJS8aiIf7QnZoXrPLzaNYz0VFPGzS7SxcE61k5AgGMLyg==
X-Received: by 2002:adf:9b9e:: with SMTP id d30mr8557449wrc.345.1591345064588; 
 Fri, 05 Jun 2020 01:17:44 -0700 (PDT)
Received: from localhost.localdomain (pd9566764.dip0.t-ipconnect.de.
 [217.86.103.100])
 by smtp.gmail.com with ESMTPSA id t8sm10881252wro.56.2020.06.05.01.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 01:17:43 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/mm: add ig_frag selftest
Date: Fri,  5 Jun 2020 11:14:02 +0200
Message-Id: <20200605091402.4408-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d11d0f7b-6273-e1be-65db-1698e9c31228@amd.com>
References: <d11d0f7b-6273-e1be-65db-1698e9c31228@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 10:21:46 +0000
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

v3:
fix incorrect mode check

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
index 9aabe82dcd3a..ca5f35def905 100644
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
+	 * 2 times for get_insert_time()
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
+		if (mode->mode != DRM_MM_INSERT_LOW &&
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
