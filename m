Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A06D1C1A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24CE10F183;
	Fri, 31 Mar 2023 09:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA6510F14C;
 Fri, 31 Mar 2023 09:26:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A18B262660;
 Fri, 31 Mar 2023 09:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514EEC433EF;
 Fri, 31 Mar 2023 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254784;
 bh=TRYSMYkXks9q3GSP+rY54wBe6rlqoIbNXHmoR55KP+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QfTjoBeSVRz6N27mcOkAv5LA/MVWqsH0d1zmQmcsuuwyb4YU9RGjd31eVeQB/YAfB
 +6FK9GNc2T3I4jj510Nx1R+EFu7iKO+HFBJd/Tcndv3C3ns+K2EhZbj8VEgAfiyDFr
 h7QzGIZHIBP7JDINi7BJlg5Ij4UMemIeOqkgH9SQLMUzYiBO/IHQPG6TxuffMIaywB
 8ziNYiQxweDizvG0jBB47zAgCrI1ROgNsgp7AYDcSMr9pwQ4b+H4wkCj9iS/KLbR4F
 7lEfCR3WYqlYR60BXPSZ7LxYt//kkFFoMyTTC4ZyYq4BPQrsOugK3OPicOHUykXjLN
 NIeywdUEbvJJw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 04/19] drm/i915/display/intel_display_debugfs: Fix incorrect
 param naming for 'intel_connector'
Date: Fri, 31 Mar 2023 10:25:52 +0100
Message-Id: <20230331092607.700644-5-lee@kernel.org>
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

 drivers/gpu/drm/i915/display/intel_display_debugfs.c:1668: warning: Function parameter or member 'intel_connector' not described in 'intel_connector_debugfs_add'
 drivers/gpu/drm/i915/display/intel_display_debugfs.c:1668: warning: Excess function parameter 'connector' description in 'intel_connector_debugfs_add'

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
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index d5715ccc37f0e..195b6cb379ad1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1395,7 +1395,7 @@ DEFINE_SHOW_ATTRIBUTE(intel_crtc_pipe);
 
 /**
  * intel_connector_debugfs_add - add i915 specific connector debugfs files
- * @connector: pointer to a registered drm_connector
+ * @intel_connector: pointer to a registered drm_connector
  *
  * Cleanup will be done by drm_connector_unregister() through a call to
  * drm_debugfs_connector_remove().
-- 
2.40.0.348.gf938b09366-goog

