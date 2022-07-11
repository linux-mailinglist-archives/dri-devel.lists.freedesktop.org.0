Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E023570B73
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB67990D07;
	Mon, 11 Jul 2022 20:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82C618A782;
 Mon, 11 Jul 2022 20:25:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 330466163F;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41607C36AE5;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=65qOd5DFjDe/qVWtarr6Nxd+MxmQ6nZSdo6RdJ6BocM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0iNmJBViO8cFrlyt+hSSoJiEKaJti4AaEzWE1zfZOf9bBxlEx2BcQJo0pd1Rzoua
 WbiJxUyHnrIqA8UJVXb4njgcy1GuZoXQeUdHUtYw6T5fH37Z+71lH20Uah18puHdIT
 Txg29te4cdt54sxj0n4a6P4X1qe68l++lmEaNniy35s1RHkV95X8z8VfrarF8MBFGL
 T08x9jClqdQz7MeMoZHCD9emJx7rFSl/fm3Uy3V3chhL0E5GSeVDuqxixWvNf2bW5F
 oIAENWDULV6bGtxCqLDvRtnKmG0D28JQyLS654yR0n+/qOQ1RmFG0TkHkpgYX8xBiA
 goyt2XV3dXDMA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8r-QR;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 24/32] drm/i915: i915_scatterlist.h: fix some kernel-doc
 markups
Date: Mon, 11 Jul 2022 21:25:09 +0100
Message-Id: <a48b876cae63a31b562ddaaf1903d1a1715349b7.1657565224.git.mchehab@kernel.org>
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

Building docs currently produces this warning:

	Documentation/foo/i915:159: ./drivers/gpu/drm/i915/i915_scatterlist.h:73: WARNING: Inline strong start-string without end-string.

That's because @foo evaluates into **foo**, and placing anything
after it without spaces cause Sphinx to warn and do the wrong
thing.. So, replace them by a different Sphinx-compatible tag.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_scatterlist.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 2e112362e4f1..0c7ffcfaff5b 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -70,7 +70,7 @@ static inline struct scatterlist *____sg_next(struct scatterlist *sg)
  *
  * Description:
  *   If the entry is the last, return NULL; otherwise, step to the next
- *   element in the array (@sg@+1). If that's a chain pointer, follow it;
+ *   element in the array (``sg@+1``). If that's a chain pointer, follow it;
  *   otherwise just return the pointer to the current element.
  **/
 static inline struct scatterlist *__sg_next(struct scatterlist *sg)
-- 
2.36.1

