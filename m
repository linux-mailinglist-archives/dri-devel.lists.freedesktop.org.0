Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D506D1C23
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFE810F184;
	Fri, 31 Mar 2023 09:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FC910F15A;
 Fri, 31 Mar 2023 09:26:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B933B82DAC;
 Fri, 31 Mar 2023 09:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6210C4339B;
 Fri, 31 Mar 2023 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254787;
 bh=iistdlhu4w0I2/CmfXzNavb5iLcbcIHzclr1yyY04LY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JBMBGg+5x+5/0/DDfOyE9fcIfl8eW49WC8vHHiuIxCpHZ8AlQcsYvLvnF0oBX1rSP
 su3kCXz60f/Vl9BYBRbifih+ckCQEXeEOytJt+NAZB45DvfPhf2wvzQcb6p82MJakt
 XFSe9scn3arsz1P3U1VOdx9TNL/oHBAPuGRwP2lIgeWWW9Gkl+fKR75gweWnq17sGM
 vIc5IlWso2dNzS2GsVcc/CAaYpZaJQpImT9619XZza+FXFuGWmHcfIBPPOuWpDzrzm
 niA0QPM1aLNsab9MPvUVlPWkEnmfDElmFkpBX53QtMY7IVRsww96aGevm7097/wu/7
 rhXyeGgzrLWsA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 05/19] drm/i915/gt/intel_engine_cs: Fix a couple of
 incorrectly named functions
Date: Fri, 31 Mar 2023 10:25:53 +0100
Message-Id: <20230331092607.700644-6-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gt/intel_engine_cs.c:1324: warning: expecting prototype for intel_engines_init_common(). Prototype was for engine_init_common() instead
 drivers/gpu/drm/i915/gt/intel_engine_cs.c:1406: warning: expecting prototype for intel_engines_cleanup_common(). Prototype was for intel_engine_cleanup_common() instead

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2966aed422239..03c5e3df0a7e0 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1429,7 +1429,7 @@ create_kernel_context(struct intel_engine_cs *engine)
 }
 
 /**
- * intel_engines_init_common - initialize cengine state which might require hw access
+ * engine_init_common - initialize cengine state which might require hw access
  * @engine: Engine to initialize.
  *
  * Initializes @engine@ structure members shared between legacy and execlists
@@ -1515,8 +1515,8 @@ int intel_engines_init(struct intel_gt *gt)
 }
 
 /**
- * intel_engines_cleanup_common - cleans up the engine state created by
- *                                the common initiailizers.
+ * intel_engine_cleanup_common - cleans up the engine state created by
+ *                               the common initiailizers.
  * @engine: Engine to cleanup.
  *
  * This cleans up everything created by the common helpers.
-- 
2.40.0.348.gf938b09366-goog

