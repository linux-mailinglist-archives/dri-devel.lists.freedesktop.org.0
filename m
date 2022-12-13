Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA964B4A7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 13:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479F210E309;
	Tue, 13 Dec 2022 12:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4041010E306;
 Tue, 13 Dec 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670932818; x=1702468818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NtJxgY1pyjNc4aPyzshxFEbGdU94EJIfGgT/dqQ6A8I=;
 b=R2oXEDvyrzFYyCq8NezWsPe+FhUPibVuPNe0w0hKBcVu1auvJsvb0kQW
 kLukSYkLEvB9buPhscfJZKX4s8v6IM7qsaArWzOrUQmDtlRrcCocf2trz
 qW7b96TInaB8K0sy1UZ8YHc1Q+ufDF7vV8luLpNK3w3lykQ8dvpohyG3X
 EZMwJyMlipBN/29IraQq9KVeKVFXU9f0jW2oGDzKJGSO9oV/M7ThCJAOp
 dcyMh3n4rFwRjSMiEisctv3qM7+TSX18kK7EZRmAmWs8mqpBarsJXYmEj
 7SytwBwmeyF/XhekjH6SfPJO9B/LyqkC4ZGQUbKzSmvEYncnXBMUNWWLS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="319258671"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="319258671"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:00:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="822868353"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="822868353"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:00:15 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Remove hardcoded value with a macro
Date: Tue, 13 Dec 2022 13:00:10 +0100
Message-Id: <20221213120010.5857-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: andrzej.hajda@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use MI_USE_GGTT instead of hardcoded value.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
index c228fe4aba50..3bef1beec7cb 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
@@ -222,7 +222,7 @@ static int gpu_set(struct context *ctx, unsigned long offset, u32 v)
 	}
 
 	if (GRAPHICS_VER(ctx->engine->i915) >= 8) {
-		*cs++ = MI_STORE_DWORD_IMM_GEN4 | 1 << 22;
+		*cs++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;
 		*cs++ = lower_32_bits(i915_ggtt_offset(vma) + offset);
 		*cs++ = upper_32_bits(i915_ggtt_offset(vma) + offset);
 		*cs++ = v;
-- 
2.38.0

