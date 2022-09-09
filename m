Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E11ED5B3030
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60E010EC29;
	Fri,  9 Sep 2022 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545E910EBEC;
 Fri,  9 Sep 2022 07:34:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0E39B82385;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8761EC4315D;
 Fri,  9 Sep 2022 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708894;
 bh=L8rUkjoV9HNsktkbsg/FUm/ooCwwHMTMAkEbe+YIqtY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CTE2idotzx5o2ReedqnWizaF/EcSOKF9W/br1IWlRc9p1ldhGiEpVHqydccQK7xKC
 AoB7ncCqlcf47nw07ZoSWJZZvC6QV5Im+L3Dg7OVgJZh9f34e3FcCNAmzfv3pzCjqc
 HK0JnjMLCKP42YQdrjFbN8H/5wy6A52+R/pJMQ0v7vgIL4VlwZYjx9TnR5RGuOsFyi
 NA4umr6kS/p3HWL1PJA1IGOuKW5zlHKphPn7zPz9qrCg6h9gQvjsd8WJVUPkfabI1b
 8q58nOUvecDfV8dLhDqN7+hXTrqpShcQkybW9kDEPhSwPTuSzuglOoA4rSKHwYuUCR
 UR6MCHC5Gb6dg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXG-007FGl-Ip;
 Fri, 09 Sep 2022 09:34:46 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 18/37] drm/i915: fix i915_gem_ttm_move.c DOC: markup
Date: Fri,  9 Sep 2022 09:34:25 +0200
Message-Id: <b631d31866fc433eeeeb566ad32e71695d6a44f7.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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
 Jasmine Newsome <jasmine.newsome@intel.com>, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The doc markup should not end with ":", as it would generate a
warning on Sphinx while generating the cross-reference tag.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

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
2.37.3

