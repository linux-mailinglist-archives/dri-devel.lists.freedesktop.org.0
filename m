Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46586532484
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 09:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E20810EC46;
	Tue, 24 May 2022 07:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6111B10EBC0;
 Tue, 24 May 2022 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653378930; x=1684914930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ri89ScPQ7oq+a4jOmp7mj209IJeqLk6OglWquWkecCQ=;
 b=TI3YYNuzvRi46UBWxnVnoDmOa+hdYfwHXWenB49vpmpM+8DhAh7+8irt
 BVWYx36PHnDTrMlnVAjEdSCcjFD6CHz1wZuDB/aGvEY7bzsXquhiHnMGX
 STUFsCgI3rr8UnRP8lfMeYHOBmoy8BK7MWuDJomJih9QF5SsSNFgIn37n
 K/QA/P5tkXnttgcA7J0wJbn8TTl67RgolqIwursm1fx6fTfdWblIn1H+b
 PiaqiEozJpckwk26iymeIXvHLQTXCpQHV6LeviyzLgVBnTHOsizaVHGku
 LqgA5CxNkGQvG8II0keObPPbt21jA1WBdq+A4kWLhy4XcVKmCkliOCdYl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="261068578"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="261068578"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 00:55:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="548359103"
Received: from cennis-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.213.170])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 00:55:27 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Complete and clarify per client usage stats
 documentation
Date: Tue, 24 May 2022 08:55:19 +0100
Message-Id: <20220524075519.1553540-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Mention the compute engine which was recently added to the driver and also
clarify that userspace should be written in a forward compatible way.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 Documentation/gpu/i915.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 54060cd6c419..3e28b08ba6f6 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -723,5 +723,6 @@ the currently possible format options:
       drm-engine-capacity-video:   2
       drm-engine-video-enhance:   0 ns
 
-Possible `drm-engine-` key names are: `render`, `copy`, `video` and
-`video-enhance`.
+Possible `drm-engine-` key names are: `render`, `copy`, `video`,
+`video-enhance` and `compute`. This list may not be complete and userspace
+parsers should in any case handle new names appearing with new kernel releases.
-- 
2.32.0

