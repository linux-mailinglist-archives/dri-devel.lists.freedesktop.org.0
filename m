Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD44570BA8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B32C90FE9;
	Mon, 11 Jul 2022 20:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2188B4B3;
 Mon, 11 Jul 2022 20:25:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4E286165E;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98D3C34115;
 Mon, 11 Jul 2022 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571124;
 bh=jxbhLwK4nn8GieBSkhhGJWg4z+oHKXPl5FohZIL4fP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ov0HENGx2I+siR9tDn3mbByAbtREOxPRE1wB3n7Hu4BXSPqLkiKrvJhTEWTQfFup9
 1ehXLs6lKTezyKShmMhMv1HlkODJvlMLBXQTDWQePVtVvqByY9vfDpe2ych1sxKvXF
 hpRsOa16f2AhPP3F+XiajDAjxpmofGlFbBNkFh8DbK1uD7ZVMF/dN2KTOS1bYeQEt8
 qPFO52OxeZtMcEfm9ShDqbtVwZ1jaeaz/owp5mNrW5XDuNCKNq5LG6bMPcCwG5QWLr
 3i0V+oYNx8nzD/gzNxgnEj5a7VaO2hi0hqpzlNbAtQCU3mMWvtdPjgeYiiVlcvIiOU
 GEkqj/8rjriWw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8Q-M9;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 18/32] drm/i915: fix i915_gem_ttm_move.c DOC: markup
Date: Mon, 11 Jul 2022 21:25:03 +0100
Message-Id: <ff6aa6a9e0ec16abf09687748ab2a7d83f892f69.1657565224.git.mchehab@kernel.org>
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
 intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jasmine Newsome <jasmine.newsome@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The doc markup should not end with ":", as it would generate a
warning on Sphinx while generating the cross-reference tag.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 56217d324a9b..16dd4991d527 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -20,7 +20,7 @@
 #include "gt/intel_migrate.h"
 
 /**
- * DOC: Selftest failure modes for failsafe migration:
+ * DOC: Selftest failure modes for failsafe migration
  *
  * For fail_gpu_migration, the gpu blit scheduled is always a clear blit
  * rather than a copy blit, and then we force the failure paths as if
-- 
2.36.1

