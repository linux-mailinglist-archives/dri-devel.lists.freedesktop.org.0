Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7769B3D4604
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 09:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA88A6ECA0;
	Sat, 24 Jul 2021 07:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A1B6E0A2;
 Sat, 24 Jul 2021 07:38:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="208886171"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="208886171"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 00:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="663641002"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2021 00:38:42 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m7CF7-00035f-M1; Sat, 24 Jul 2021 07:38:41 +0000
Date: Sat, 24 Jul 2021 15:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH] drm/i915: slab_blocks can be static
Message-ID: <20210724073823.GA36834@4ba55c1fc0c2>
References: <20210723192934.1004427-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723192934.1004427-3-daniel.vetter@ffwll.ch>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/i915_buddy.c:13:19: warning: symbol 'slab_blocks' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 i915_buddy.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
index 045d00c43b4ca..7b274c51cac05 100644
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ b/drivers/gpu/drm/i915/i915_buddy.c
@@ -10,7 +10,7 @@
 #include "i915_gem.h"
 #include "i915_utils.h"
 
-struct kmem_cache *slab_blocks;
+static struct kmem_cache *slab_blocks;
 
 static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 						 struct i915_buddy_block *parent,
