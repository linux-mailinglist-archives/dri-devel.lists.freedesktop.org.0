Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6570570B6C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E1A18A6FC;
	Mon, 11 Jul 2022 20:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2ACC18A591;
 Mon, 11 Jul 2022 20:25:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2FC706163C;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41361C36AE3;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=D0bEjONKO0OQMVFCtOYHA/FPk+KIm9oq17OfYHcIwdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iAQZIC6/tx0PdX1S4dItst07G5SzprXk10MbTdVninLlEgXFztK88oOXF17hRb+Qy
 79AHrZQumux78yo8Bql9RPDBmI0lV5ni/FVY86sLnxj4QRIbS8bNkwpMlB7tGX+hcQ
 CO0RFyWH4qL6cHkBDB9bcpecNNXZUGCXQBz/STfDHscTfc3jz8nr4vUO0BCt7aJJCx
 urNm4bwOWrpb8rvPrjrza5Z06Kwu1SwuEzUuVvIn7JvOU4W/iq5FOLxD35eM9Y747O
 rcG0qu4nw6Exv0Iz7cULcidDGvQtCUEu75b9BMui7asn2/4ODu110lSNjk2jPjqyGD
 6bO3LYI/04EOA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8o-Pr;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 23/32] drm/i915: i915_gem.c fix a kernel-doc issue
Date: Mon, 11 Jul 2022 21:25:08 +0100
Message-Id: <037b710c2a65c4b3da5b0b9bb947f740bf08c12e.1657565224.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prevent this Sphinx warning:

	Documentation/foo/i915:728: ./drivers/gpu/drm/i915/i915_gem.c:447: WARNING: Inline emphasis start-string without end-string.

By using @data to identify the data field, as expected by kernel-doc.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index f01f0896ff5c..0bc895c6a1fc 100644
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

