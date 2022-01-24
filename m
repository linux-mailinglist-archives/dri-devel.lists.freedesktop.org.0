Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAF0497710
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 02:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3279210E5D2;
	Mon, 24 Jan 2022 01:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A4510E27C;
 Mon, 24 Jan 2022 01:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642989255; x=1674525255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6XGSnQ9TBlvVO/HCj7hdTuMI8xk5GqvKzVoFd47JxeM=;
 b=HpxAay3e1Sb6cpqa5PLUHH0itRrLmsJ6oZ/dZU39VtjkrSdqZle2JJQh
 gn2nU2VT2hUKGOKCFR/j4OpDi0jIYTWckRWJdUY2A1DD75Sddp5N4fsZh
 +a7w6XZcFfsuhhoUPYOh2YWs4lzxcMwRypkvZyKApQiVnPzQwCpmInxA8
 QcHLJKofSq30zEDTi9KbPyInJxb2yFvDjXodMFhSwaGHjjX1CZkJ4YKyO
 BxLXZ8ewDuODMVV0Zvm9FfGFwkky9ywwIQguAUgps1EUFXwa2UCMwD1rb
 mfi1MqdXFgo1YpxCbVS3vXliLNPnKJzrXEtHUkHrxB0SFRZ4bagc11+4h g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226616223"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="226616223"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="627320404"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:14 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH V2 5/7] drm/msm: Alter comment to use kmap_local_page()
Date: Sun, 23 Jan 2022 17:54:07 -0800
Message-Id: <20220124015409.807587-6-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124015409.807587-1-ira.weiny@intel.com>
References: <20220124015409.807587-1-ira.weiny@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

kmap() is being deprecated.  So this comment could be misleading in the
future.

Change this comment to point to using kmap_local_page().  While here
remove 'we' from the comment.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6cfa984dee6a..cc18d5d1fe5a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -438,8 +438,8 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 		return -EINVAL;
 	}
 
-	/* For now, just map the entire thing.  Eventually we probably
-	 * to do it page-by-page, w/ kmap() if not vmap()d..
+	/* For now, just map the entire thing.  Eventually it should probably
+	 * be done page-by-page, w/ kmap_local_page() if not vmap()d..
 	 */
 	ptr = msm_gem_get_vaddr_locked(&obj->base);
 
-- 
2.31.1

