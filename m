Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD01570BAC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279E690FE0;
	Mon, 11 Jul 2022 20:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BBF11BE36;
 Mon, 11 Jul 2022 20:25:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C83AC6165C;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA016C341C8;
 Mon, 11 Jul 2022 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571124;
 bh=o2iriqr9yGWd6meVOtOwBCMeiBhrD3lI1NVS6cm0Kmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YLT6S5V3wpeb0ALSjTIoMWeqhQ6ejsrrlvZ8WVJT5r4tJ5Rl9d+N9pV1TnMFigJ4B
 vt9x8lHKg4dzcpkz4jc/moK8YEp4XfBi6eN0VtE31STGN92PCC6j2rlCBnhnmVuk83
 hrpRdNe8fuKgDpfBL5YmNOW1+IXpACRU6BZju0rYBAvQXrp8u3+JSyjMfSE0sX7MtU
 dvru0K5hMWY1dHb6LaZrjg1YYYSbIsdW1kn7lFIUvxky1XWgQDZOa8aHCqn0zmW3JQ
 gfnXqGPII7fIyACS/9x5VFyVFU1YZ+kin5r4tiJ/tbkL1Mpnk4m6NK99C7AHo6NVzE
 8f+CMKKIiANWQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8F-Kg;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 16/32] drm/i915: i915_gem_region.h: fix
 i915_gem_apply_to_region_ops doc
Date: Mon, 11 Jul 2022 21:25:01 +0100
Message-Id: <d422b77a1d40e815e6e84dcb0f7be9097efffe36.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Nirmoy Das <nirmoy.das@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel-doc markup for i915_gem_apply_to_region_ops() has some
issues:

1. The field should be marked as @process_obj;
2. The callback parameters aren't document properly, as sphinx
   will consider them to be placed at the wrong place.

Fix (1) and change the way the parameters are described, using
a list, in order for it to be properly parsed during documentation
build time.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_region.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index 2dfcc41c0170..b0134bf4b1b7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -22,9 +22,11 @@ struct i915_gem_apply_to_region;
  */
 struct i915_gem_apply_to_region_ops {
 	/**
-	 * process_obj - Process the current object
-	 * @apply: Embed this for private data.
-	 * @obj: The current object.
+	 * @process_obj: Callback function to process the current object
+	 * it requires two arguments:
+	 *
+	 * - @apply: Embed this for private data.
+	 * - @obj: The current object.
 	 *
 	 * Note that if this function is part of a ww transaction, and
 	 * if returns -EDEADLK for one of the objects, it may be
-- 
2.36.1

