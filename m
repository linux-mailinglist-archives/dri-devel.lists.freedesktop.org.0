Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181811C1FA2
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 23:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B056ED57;
	Fri,  1 May 2020 21:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BF76ED56
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 21:30:30 +0000 (UTC)
IronPort-SDR: 5zpvw5w9ghsOZ7nu7tLFIjRXvEG9yBxFNkBQyS6NdsBXg2I5Uf+6uqEDxQ0/R/qda9M5ivWMVK
 OJZAWnXK77Zw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 14:30:30 -0700
IronPort-SDR: JXknIldrBl12fbQQOQ8WTX7d6+u03F2h1noeFRCXx8/+VuZwLQ2wmFw6GgzdvnHcYjOlGExi8F
 P9IsUaGqEdCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,341,1583222400"; d="scan'208";a="283297373"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 01 May 2020 14:30:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jUdEp-0004KQ-NA; Sat, 02 May 2020 05:30:27 +0800
Date: Sat, 2 May 2020 05:29:39 +0800
From: kbuild test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, christian.koenig@amd.com, chris@chris-wilson.co.uk
Subject: [RFC PATCH] drm/mm: insert_hole_addr() can be static
Message-ID: <20200501212939.GA90115@3f1446aad593>
References: <20200430095839.6474-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430095839.6474-1-nirmoy.das@amd.com>
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
Cc: nirmoy.das@amd.com, kbuild-all@lists.01.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 drm_mm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index effc6e5cac459..89df90a6052d1 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -245,7 +245,7 @@ RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
 			 struct drm_mm_node, rb_hole_addr,
 			 u64, subtree_max_hole, HOLE_SIZE)
 
-void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
+static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
 {
 	struct rb_node **link = &root->rb_node, *rb_parent = NULL;
 	u64 start = HOLE_ADDR(node), subtree_max_hole = node->subtree_max_hole;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
