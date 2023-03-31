Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0446D1C36
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016BF10F18A;
	Fri, 31 Mar 2023 09:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966CB10F1A9;
 Fri, 31 Mar 2023 09:27:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1CF2662649;
 Fri, 31 Mar 2023 09:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9099DC433A0;
 Fri, 31 Mar 2023 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254829;
 bh=q94izLl3IZgGvkKrUY20PN7lYkSiE2LwGs8Cj3mJZ74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WWWE2lUsVb8TTMqOUSSf9JvM1P043iDZAbpWP4lDy9c2SbmizGgxIatWILrD2r+Jw
 VRlIVW9z3L3Jf9R//bIt92G80do478ZWtZ4Z2wdqmQq0+EAemK7uAoGpNJuk4C9CwK
 q51jc8bJ/aKQYT507TmrORLBmMTKKIA85L8VK2Gs8rD+E0VC55h11lEzGIO26XlwBT
 UOA2ybn4v6hx6dZ1QgP9KGQAJPQ9WbGHx0TCrO8p3KM1aX7XY+G4jn8VZPFhA4sRhV
 8dDEBXpDaGVDQnk+yaOaRc2NxClQWpYz85+UeOLcI/c2vxnWK8uq/JISgeRbP6DKIt
 1TDOlovDJ9CmA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 19/19] drm/i915/display/intel_wm: Fix a little doc-rot in
 intel_update_watermarks()
Date: Fri, 31 Mar 2023 10:26:07 +0100
Message-Id: <20230331092607.700644-20-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

 drivers/gpu/drm/i915/display/intel_wm.c:46: warning: Function parameter or member 'i915' not described in 'intel_update_watermarks'
 drivers/gpu/drm/i915/display/intel_wm.c:46: warning: Excess function parameter 'dev_priv' description in 'intel_update_watermarks'

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_wm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_wm.c b/drivers/gpu/drm/i915/display/intel_wm.c
index bb99179cd5fd1..b615449e70b47 100644
--- a/drivers/gpu/drm/i915/display/intel_wm.c
+++ b/drivers/gpu/drm/i915/display/intel_wm.c
@@ -11,7 +11,7 @@
 
 /**
  * intel_update_watermarks - update FIFO watermark values based on current modes
- * @dev_priv: i915 device
+ * @i915: i915 device
  *
  * Calculate watermark values for the various WM regs based on current mode
  * and plane configuration.
-- 
2.40.0.348.gf938b09366-goog

