Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C8D5730A0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A287B96242;
	Wed, 13 Jul 2022 08:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E5095199;
 Wed, 13 Jul 2022 08:12:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F4D8B81D76;
 Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44598C341E3;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=zdFtR3cWoytYwm56KlG1FWdOeba0MwjJiuWd3av2Pxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R0ynHXK2YNdIX/lm4nws8+/JRYpub29hzCtdYGCPxeCBNWSEVBmDkpKjjY/u6rNgM
 5n82RDrrVp3Sp9qWnoHjQmVXxBWilcOhDVybbjPAsf0llJeZmh92Z+1cb4GnnbDzbr
 yk89Hrjkmq7zRJN9Ysih1075mszU3dWkzhGlTj+NYYkgH/tuUgX++e+HceUT85C7yc
 qO+ftM7roVoLpEp0MZqfKhCxRdMCVV7qSBkGf33PAwHc7He8/k6XXkOPFqaXHN3yQA
 o6ApRYabquIDvmv7OtRdpfYnMGNw+5V0NXL/qOS4F9iYiZQ40NJAKdB7IhlVHkNm68
 Hw/5w4HZLE6lA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zu3-Rg;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 26/39] drm/i915: i915_gem.c fix a kernel-doc issue
Date: Wed, 13 Jul 2022 09:12:14 +0100
Message-Id: <3f512107b7c7c1bdbe3131b3a35d9cc34e29656d.1657699522.git.mchehab@kernel.org>
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

Prevent this Sphinx warning:

	Documentation/foo/i915:728: ./drivers/gpu/drm/i915/i915_gem.c:447: WARNING: Inline emphasis start-string without end-string.

By using @data to identify the data field, as expected by kernel-doc.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 41e83d078a70..0ca4bb08ea78 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -444,7 +444,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
  * @data: ioctl data blob
  * @file: drm file pointer
  *
- * On error, the contents of *data are undefined.
+ * On error, the contents of @data is undefined.
  */
 int
 i915_gem_pread_ioctl(struct drm_device *dev, void *data,
-- 
2.36.1

