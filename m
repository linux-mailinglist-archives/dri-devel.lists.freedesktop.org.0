Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993FA5B2FFD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B8C10EC0A;
	Fri,  9 Sep 2022 07:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7756310EBF0;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2842B61F06;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D02C41679;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708895;
 bh=PG03QmcHka2AyFlyVCR5a0ZblvOmwa8yxSxOZhSEnCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a4mOUai+jhpefnN8loB6clqbGqam6cvIIc237RhgdGttp6OhMhcgAcrr+EZ6iql61
 1f2iBl5JSpdguBhfA5JYONUh/Ai0crRnye9iZ6NFt8D9m9WfVyfM/ty3mIm7cQ2O7/
 MT7YimErhqspxWhfR+lecNxw9a6H/AYpQoLQk6uKezkLqjeWTsV+xXV9fzNsbiLtS4
 OfECplz0OIZ2v68p2f0wGiFYVMMNaM2ps2DzqBdxezqX48GeuddljTOvFzcOzIBTnB
 uZLEhFGIaFJc3if+SZPWAZl22xW1Y+W3KNQXMGCGfF4rmE4EKaNqyrJ6bl6xuOj/9D
 glc2UdZpgnzzg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXG-007FH9-VA;
 Fri, 09 Sep 2022 09:34:46 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 24/37] drm/i915: i915_scatterlist.h: fix some kernel-doc
 markups
Date: Fri,  9 Sep 2022 09:34:31 +0200
Message-Id: <1628f837d9ae5caae015f19648d19459fba6743d.1662708705.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Building docs currently produces this warning:

	Documentation/foo/i915:159: ./drivers/gpu/drm/i915/i915_scatterlist.h:73: WARNING: Inline strong start-string without end-string.

That's because @foo evaluates into **foo**, and placing anything
after it without spaces cause Sphinx to warn and do the wrong
thing.. So, replace them by a different Sphinx-compatible tag.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_scatterlist.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 79b70ae2e766..ac77f2668544 100644
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
2.37.3

