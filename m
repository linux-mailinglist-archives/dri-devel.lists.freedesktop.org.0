Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CE6D1C2A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE5310F179;
	Fri, 31 Mar 2023 09:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4C810F182;
 Fri, 31 Mar 2023 09:26:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D07EB62670;
 Fri, 31 Mar 2023 09:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BC2C433EF;
 Fri, 31 Mar 2023 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254789;
 bh=KiXF3LYVu3KrlWgglMJh8IlNjIF1YPLM2PZ/FiGHP9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oALhkUyVSDBvPDldu6mPEnFEqxUY6av6K0MJOpSnZ7IZtnV2CgenCiwHuLPHu7vPb
 yYma2Q42wt7oakc2RS2bFT3fnkVtvkZ+HaKfhrJBsj2AygNx6uK0mDeTtQbHjrAsS5
 O158zgxJb28qq/ger5SZbZeR+PhJZNBcbKwANJIlm9eYTzlQaB7qjBGkY/rGkngmtX
 +g0thBRH0RufBJG/VJ08tA7h+6E3SkbJkLmGj9RLk9j78EKi5YZjgs18QV0+DhSW78
 03Z/k0JSwl9tAHxh2MyyhgvEBD7m5G2h+wZIGkm9pZ9mBhNmxiS65LjUpMK+sP4QkV
 zTw9KQxHKjFGg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 06/19] drm/i915/gt/intel_rps: Demote a kerneldoc abuse for
 ips_ping_for_i915_load()
Date: Fri, 31 Mar 2023 10:25:54 +0100
Message-Id: <20230331092607.700644-7-lee@kernel.org>
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

 drivers/gpu/drm/i915/gt/intel_rps.c:2646: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

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
 drivers/gpu/drm/i915/gt/intel_rps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index e97c52c90689a..301359b500a3e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2646,7 +2646,7 @@ bool rps_read_mask_mmio(struct intel_rps *rps,
 
 static struct drm_i915_private __rcu *ips_mchdev;
 
-/**
+/*
  * Tells the intel_ips driver that the i915 driver is now loaded, if
  * IPS got loaded first.
  *
-- 
2.40.0.348.gf938b09366-goog

