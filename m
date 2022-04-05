Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57224F3C74
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 17:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B41310EA11;
	Tue,  5 Apr 2022 15:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE3210EA0F;
 Tue,  5 Apr 2022 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649174042; x=1680710042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ZUaTXZElLDwGCJizS0hIDLZb6TD1IDHOoGLET0dNj0=;
 b=Ioi52CNCcQuoX+DVbjNREiE/NwmIiOxKFSnR9Gg1w+bwcwMEgf9cXLgZ
 7eXGRDQTISvwrR97tyNPTDl9PNOINwxk8xATf9NMxgc6W6zr4fJ1qxKDx
 DrdUvAl2QsISRzHEbMUjFcTc2A4Lar5CSI9YKhn+bQ9U8nnXNyQ3jy7Xt
 F9Waf6Df+Rk1qXBxiQ09OcHgnHR+qCQV1oxJqQjlyOjQFI7GwsqT/ZCOr
 qLIQGCwf8OZm389gPByukDlyQMaFh/pfzhGKxqJFrb5IfOd0RFwwvBoCI
 +tQ4O/1Rvl2UX4qh6sE7bzZKR+byJ2tbxEr7iBnsDFmxCRjNYg2optQ6G g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="259616510"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="259616510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 08:54:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="524047974"
Received: from pmulcahy-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.235.32])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 08:53:59 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fixup kerneldoc in struct i915_gem_context
Date: Tue,  5 Apr 2022 16:53:45 +0100
Message-Id: <20220405155345.3292769-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Mixup in rebasing and patchwork re-runs made me push the wrong version of
the patch. Or I even forgot to send out the fixed version. Fix it up.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 748716041dfa ("drm/i915: Track all user contexts per client")
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 5946dcb11cf5..cb78214a7dcd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -296,7 +296,7 @@ struct i915_gem_context {
 	/** @client: struct i915_drm_client */
 	struct i915_drm_client *client;
 
-	/** link: &drm_client.context_list */
+	/** @client_link: for linking onto &i915_drm_client.ctx_list */
 	struct list_head client_link;
 
 	/**
-- 
2.32.0

