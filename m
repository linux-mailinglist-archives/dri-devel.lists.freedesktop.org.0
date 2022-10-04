Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3A5F40C4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 12:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE36010E518;
	Tue,  4 Oct 2022 10:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CE010E16C;
 Tue,  4 Oct 2022 10:28:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39F7161343;
 Tue,  4 Oct 2022 10:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA44C433C1;
 Tue,  4 Oct 2022 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664879324;
 bh=0hFOM6u+05iDcIJ2EiTOCM5aQUKK0aOuk+5B7xJSD84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wyv18Oo51n8vyRhE/sV10BeNXKq6RWOOzrV3SgZ91GGXAcXRnXmRHwf/H3l1CYjxd
 GOjlkT+PVCawAZZ6CuPdJD0qUL/9MwGS/78+R9RjtDhMIQCiXpFZZHyMJNwQIptKAx
 4EJ2zrvILiYLdkzaujjFxzZ7eaz8rIlTHLfpl6zomYzF6KMC6TDxgKyGZt/T4dJfwh
 /yHjYurMU0jtl7jIQBQrKpJAioQVNNCai9y8JoOhJ4UvqltsYDXBVNw4J/UwUJpXu3
 Xt8iZC7IKY8Ni21iBYQ56PeI7II7MFM14rZI+/rrPHYAQPutU5Os8jpQ7V0YU+43jU
 ost2YRULyWeSA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: jani.nikula@linux.intel.com
Subject: [PATCH 2/2] drm/i915: remove circ_buf.h includes
Date: Tue,  4 Oct 2022 12:28:37 +0200
Message-Id: <20221004102837.12181-2-jirislaby@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004102837.12181-1-jirislaby@kernel.org>
References: <20221004102837.12181-1-jirislaby@kernel.org>
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
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The last user of macros from that include was removed in 2018 by the
commit below.

Fixes: 6cc42152b02b ("drm/i915: Remove support for legacy debugfs crc interface")
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_pipe_crc.c | 1 -
 drivers/gpu/drm/i915/i915_irq.c               | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 8ac263f471be..9070935b0443 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -24,7 +24,6 @@
  *
  */
 
-#include <linux/circ_buf.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 86a42d9e8041..09d728b34a47 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -28,7 +28,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/circ_buf.h>
 #include <linux/slab.h>
 #include <linux/sysrq.h>
 
-- 
2.37.3

