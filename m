Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A5586C77
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D305C5017;
	Mon,  1 Aug 2022 13:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2DC1463;
 Mon,  1 Aug 2022 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659361985; x=1690897985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NcTbzlV5Dz72mTPe4hWZ3TsW91wDU7s6ZjMp0vIZFeA=;
 b=PZBixtgqFJ1gHZHGp08MpRhuyH94xwnrBbszhkjdqwd0VjOLWfu9r8xq
 AZ6DwGy6VilezpixjWOgrP4m6El4YaMqyldaupyHd1Twhe33aJyqCRdBA
 crehTcrPywbdcMwgNQ3M56c1/tGUEMkLu9RT+NNtiJTONRB23BK0b5Ztl
 8K2sVpmVoaoa3Xo6YvNJ8Uw1YLq/ncEDIv1t3QbR4NLP7fLxicCxtLtac
 0C4L1zZcY9esC5/8VNhR6SHq4QYXy7NICTeSsF+UgrITJ4ONMNGl+6TWK
 7iFNmoXbtAHwXSmo1nDzMlXUoP7g5/+m8RhQwywZSR5Nhvju3DHDBUkcR Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="289921043"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="289921043"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 06:53:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="661157789"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 06:53:02 -0700
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amd/display: Fix merge conflict resolution in
 amdgpu_dm_plane.c
Date: Mon,  1 Aug 2022 16:52:57 +0300
Message-Id: <20220801135259.3039679-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The API change introduced in

commit 30c637151cfa ("drm/plane-helper: Export individual helpers")

was missed in the conflict resolution of

commit d93a13bd75b9 ("Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip")

fix this up.

Fixes: d93a13bd75b9 ("Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip")
Cc: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8cd25b2ea0dca..5eb5d31e591de 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1562,7 +1562,7 @@ int dm_drm_plane_get_property(struct drm_plane *plane,
 static const struct drm_plane_funcs dm_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
-	.destroy	= drm_primary_helper_destroy,
+	.destroy	= drm_plane_helper_destroy,
 	.reset = dm_drm_plane_reset,
 	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
 	.atomic_destroy_state = dm_drm_plane_destroy_state,
-- 
2.37.1

