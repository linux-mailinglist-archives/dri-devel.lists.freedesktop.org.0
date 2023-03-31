Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40416D1C13
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7DD10F13F;
	Fri, 31 Mar 2023 09:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC0B10F13F;
 Fri, 31 Mar 2023 09:26:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 367C262288;
 Fri, 31 Mar 2023 09:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3E0C4339C;
 Fri, 31 Mar 2023 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254776;
 bh=JZf0svDcEcGog0NsSz5cUzUNXsqZCcAN5I+gmpPDgzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XgdsOUyLaKZBHIvB9GPVLk4X9CeQ4pHXp0fBiu28DVZBvm43qBKIVCFL/sdqsJECq
 M6EbfJ6qLZvvrwd0m97u25a66HakrZhKSyhJwVb48M5K3Bhqo9uS/rCyoc9CfZ2pBQ
 NP2Ei7jihGLSnvmdd49aH6AjEpDiArG+97ca2E2XQ8UHA1xXBDTxMyDg0kr7ockqzZ
 OKV8BB64V/G2tKuBK3YQELLfvtgjvf+ON2XVZnRjZs6f64TVvNJYc3/zgMgSz85GiB
 GhFWGxCl3fq4/F6H6fKnQNwKm0Q14hOIh3eVxjyWNGqP9LWgeHDeiZBG0VSU9HTzu1
 pnljvPt9fz31A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 01/19] drm/i915/i915_scatterlist: Fix kerneldoc formatting
 issue - missing '@'
Date: Fri, 31 Mar 2023 10:25:49 +0100
Message-Id: <20230331092607.700644-2-lee@kernel.org>
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

 drivers/gpu/drm/i915/i915_scatterlist.c:62: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'

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
 drivers/gpu/drm/i915/i915_scatterlist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 7c7a86921b1c7..e93d2538f2988 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -56,7 +56,7 @@ static const struct i915_refct_sgt_ops rsgt_ops = {
 /**
  * i915_refct_sgt_init - Initialize a struct i915_refct_sgt with default ops
  * @rsgt: The struct i915_refct_sgt to initialize.
- * size: The size of the underlying memory buffer.
+ * @size: The size of the underlying memory buffer.
  */
 void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size)
 {
-- 
2.40.0.348.gf938b09366-goog

