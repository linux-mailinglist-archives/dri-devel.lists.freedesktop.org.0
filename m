Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4F573077
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BBC95DBE;
	Wed, 13 Jul 2022 08:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117D59536C;
 Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D991061B01;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB5EC36AF6;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=cek8uuJCsBV9acCHN6Py4rPGTwRaYdkk3T9/tHIBSPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V3/I4po2XZFKDYXmAwUF7rpr4fWvqBpcWvvmCcYQJ3UD7WVeBM/Vmtc4THACX0n4a
 T3B/Oase/GG28x4wmKNEttXdZdrAxWd3amGxpOqh+rWET93h9r8aWICwmL0q42PGPj
 lfuSzFhwgzo+UX6m8V/m3vFwRuEFVEL8G+KCzyLtz2Ew1NIVXRhHrdGiL4VC6LBA3P
 FvD0M9GKD7ctbEF7N0DyJ9peyImvcVmrkbhBuqXwdzmx8uySnLGwNZ1vY4BlUl03Wl
 4Ga4S4ja1029U7I2XfhOc8/rLIH5DrjO41zx5cni5fm2B9WkJFsaNBhiMsTFbxRYNN
 c/oVYaLtki7DA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTy-004zud-1u;
 Wed, 13 Jul 2022 09:12:30 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 36/39] drm/i915 i915_gem_object_types.h: document struct
 i915_lut_handle
Date: Wed, 13 Jul 2022 09:12:24 +0100
Message-Id: <6bdbfc5a739deceba57175269cc8e129ca481ed9.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit d1b48c1e7184 ("drm/i915: Replace execbuf vma ht with an idr")
added a rbtree list to allow searching for obj/ctx.

Document it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 5cf36a130061..ceed0d220ce3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -21,9 +21,15 @@ struct drm_i915_gem_object;
 struct intel_fronbuffer;
 struct intel_memory_region;
 
-/*
- * struct i915_lut_handle tracks the fast lookups from handle to vma used
- * for execbuf. Although we use a radixtree for that mapping, in order to
+/**
+ * struct i915_lut_handle - tracks the fast lookups from handle to vma used
+ * for execbuf.
+ *
+ * @obj_link: link to the object associated with the @handle.
+ * @ctx: context associated with the @handle.
+ * @handle: a rbtree handle to lookup context for specific obj/vma.
+ *
+ * Although we use a radixtree for that mapping, in order to
  * remove them as the object or context is closed, we need a secondary list
  * and a translation entry (i915_lut_handle).
  */
-- 
2.36.1

