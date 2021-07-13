Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7603C6EDF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 12:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3536E07D;
	Tue, 13 Jul 2021 10:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBCE89CF4;
 Tue, 13 Jul 2021 10:47:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197325325"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="197325325"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="503054388"
Received: from ewaterla-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 03:47:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: pull in some more kernel-doc
Date: Tue, 13 Jul 2021 11:45:53 +0100
Message-Id: <20210713104554.2381406-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210713104554.2381406-1-matthew.auld@intel.com>
References: <20210713104554.2381406-1-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pull in the kernel-doc for drm_i915_gem_object.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/i915.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 204ebdaadb45..77558084e989 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -387,6 +387,13 @@ GEM BO Management Implementation Details
 .. kernel-doc:: drivers/gpu/drm/i915/i915_vma_types.h
    :doc: Virtual Memory Address
 
+GEM Buffer Object
+-----------------
+This section documents our core GEM object, and related bits.
+
+.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+   :internal:
+
 Buffer Object Eviction
 ----------------------
 
-- 
2.26.3

