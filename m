Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C6F47713C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 12:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BD810F6DB;
	Thu, 16 Dec 2021 11:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0F310F6D7;
 Thu, 16 Dec 2021 11:59:25 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 806BF21119;
 Thu, 16 Dec 2021 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639655963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nJzarjRsFddzwj2POsEoacem5ANxTsZ7S2fzYT8eUEo=;
 b=id2nOCfIN3woA+W6cfxxG04CE9jJOi6pd1WUKwGSFmLWkCoBNKC21a1tfjBb3RMKQrhTzx
 RiMhc1SGx7/Uz3RhzZt50PLUAZ6GzbXG6VwYUQoZCo8DvPZucC6MN/3S5/f3QiqozrPwBW
 FQsgjCptBaVsWp/u5aXxJgzb0Ddv6WU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639655963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nJzarjRsFddzwj2POsEoacem5ANxTsZ7S2fzYT8eUEo=;
 b=AWRA95QQqS0lxqTdvV3H+Znip1FnbOHjyzfP5/a7gXNmyhFVl4AdA/WvXZif8XQ4fG6j3B
 qrF7s/DNHLelaxAQ==
Received: from localhost.localdomain (unknown [10.100.201.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 32E6BA3B84;
 Thu, 16 Dec 2021 11:59:23 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: jani.nikula@linux.intel.com
Subject: [PATCH] drm/i915: remove circ_buf.h includes
Date: Thu, 16 Dec 2021 12:59:20 +0100
Message-Id: <20211216115920.15981-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.34.1
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jiri Slaby <jslaby@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The last user of macros from that include was removed in 2018 by the
commit below.

Fixes: 6cc42152b02b ("drm/i915: Remove support for legacy debugfs crc interface")
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
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
index 5b98fb0532b5..e77f644d41e8 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -28,7 +28,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/circ_buf.h>
 #include <linux/slab.h>
 #include <linux/sysrq.h>
 
-- 
2.34.1

