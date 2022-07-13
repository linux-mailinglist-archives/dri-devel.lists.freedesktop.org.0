Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7644573088
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1053F96044;
	Wed, 13 Jul 2022 08:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED79495462;
 Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C703B81D5E;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A73C36AE7;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=Bmte6pkPKEOsNY8boMcDubrEjTNZt2JaXVTTSbZp1vA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WRAFxVOnRlXPyhvhttJc8yyCD+gz9n4bAufpI+FsX0Z/+evuPEghkuADAl0ERbHeU
 MfK5rXkAGFKhJYRZ5GRgY2q+oPPOHgJhsQDppWQyt1f8QtkSzCLYCA0xgA24wHGn/o
 9kEyYUAjv193xtfKwudcZZJE9Wj2RALRKQihqiF0BHHC125YMzgaXkmeEWNzscH2RG
 3QF/djKC3VkrgzMO07yunYgjl/JreVO2Jikg+NnnJW4gy3pabatvtvMloRW6IHKlm9
 UncT1BOaZO/wPE+GIh/qwRLNWEx2P+mx114AODDpYs9eviWwZRA/WtpzpWeY369ZPq
 IO3JEo3qEpIjQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zty-R5;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 25/39] drm/i915: i915_vma_resource.c: fix some kernel-doc
 markups
Date: Wed, 13 Jul 2022 09:12:13 +0100
Message-Id: <a830bd63085178004106069a914e80758e321fcd.1657699522.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Building docs currently produces two warnings:

    Documentation/foo/i915:71: ./drivers/gpu/drm/i915/i915_vma_resource.c:286: WARNING: Inline strong start-string without end-string.
    Documentation/foo/i915:71: ./drivers/gpu/drm/i915/i915_vma_resource.c:370: WARNING: Inline strong start-string without end-string.

That's because @foo evaluates into **foo**, and placing anything
after it without spaces cause Sphinx to warn and do the wrong
thing.. So, replace them by a different Sphinx-compatible tag.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_vma_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
index 27c55027387a..fa5a678018d9 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.c
+++ b/drivers/gpu/drm/i915/i915_vma_resource.c
@@ -283,7 +283,7 @@ i915_vma_resource_color_adjust_range(struct i915_address_space *vm,
  *
  * The function needs to be called with the vm lock held.
  *
- * Return: Zero on success, -ERESTARTSYS if interrupted and @intr==true
+ * Return: Zero on success, -ERESTARTSYS if interrupted and ``intr==true``
  */
 int i915_vma_resource_bind_dep_sync(struct i915_address_space *vm,
 				    u64 offset,
@@ -367,7 +367,7 @@ void i915_vma_resource_bind_dep_sync_all(struct i915_address_space *vm)
  * this means that during heavy memory pressure, we will sync in this
  * function.
  *
- * Return: Zero on success, -ERESTARTSYS if interrupted and @intr==true
+ * Return: Zero on success, -ERESTARTSYS if interrupted and ``intr==true``
  */
 int i915_vma_resource_bind_dep_await(struct i915_address_space *vm,
 				     struct i915_sw_fence *sw_fence,
-- 
2.36.1

