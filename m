Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B015FB400
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880DA10E404;
	Tue, 11 Oct 2022 13:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE4710E3FD;
 Tue, 11 Oct 2022 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496794; x=1697032794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/R/52n8KF6klmAgZ8PRz/XSpiJMymG9SJAwa+Su5SzM=;
 b=gAkJp3K9aNtY96Zcn22sejxKarTaU4CzKPl9MYp2hasKMj8PSmeONkgK
 P9tatKCybh9d42TLp1aWCCCgBq0ppoKTCeTHxI5wE/5srT86lsVT3+c6l
 RbG+QJfPjxSdw/1e+oClvm1FIj4efj8ucJFzfv8wcQLn5Xv+Cj/nEjITo
 E1YGFLvVWLVn5A3INZomVFBUc2E3rwYcyxzJB9JwljrybXnjkt2xGmj2b
 eD8zP1FvTmZG4ldJBt4jor+kUzqB4mz/OCVq3hTZWI1gjDNdt0YmnfRey
 xQdKmJ8V92ZYnRmV13c+HK0hmxFTVNOEo44/E2/F3OzIsjj+Ww7ddpiKa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="330990177"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="330990177"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:59:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="628702535"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="628702535"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.106])
 by fmsmga007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 06:59:52 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/trace: Removed unused frequency trace
Date: Tue, 11 Oct 2022 15:59:40 +0200
Message-Id: <20221011135940.367048-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.37.2
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
 Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3e7abf814193 ("drm/i915: Extract GT render power state management")
removes the "trace_intel_gpu_freq_change()" trace points but
their definition was left without users. Remove it.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/i915_trace.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 37b5c9e9d260..c70a02517e02 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -671,21 +671,6 @@ TRACE_EVENT_CONDITION(i915_reg_rw,
 		(u32)(__entry->val >> 32))
 );
 
-TRACE_EVENT(intel_gpu_freq_change,
-	    TP_PROTO(u32 freq),
-	    TP_ARGS(freq),
-
-	    TP_STRUCT__entry(
-			     __field(u32, freq)
-			     ),
-
-	    TP_fast_assign(
-			   __entry->freq = freq;
-			   ),
-
-	    TP_printk("new_freq=%u", __entry->freq)
-);
-
 /**
  * DOC: i915_ppgtt_create and i915_ppgtt_release tracepoints
  *
-- 
2.37.2

