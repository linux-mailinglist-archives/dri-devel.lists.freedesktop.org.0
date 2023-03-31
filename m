Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AAD6D1C18
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4D110F14C;
	Fri, 31 Mar 2023 09:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357FE10F14C;
 Fri, 31 Mar 2023 09:26:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70BB162657;
 Fri, 31 Mar 2023 09:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DFFC4339C;
 Fri, 31 Mar 2023 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254781;
 bh=Xj4WyozKPmZtTN1kClJTBi/X5tfzwvcxXXrKvf/WUhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dAZXFCbKCx3fKL0doDoVVk5L6sJXUiM+NHgn9vejM8I7z7I0QiyJMRnBXSMO/GJJp
 tAJn9X7SwrcuHi0CWHJGVdad+YwKNqZS6jRDaiIdAGOiJ8r2NJDZRU51HoTZvGx2l5
 nd/DvOqnztIsmLzrKXVA2FxmEUE7FA6UkmYPQy6230mBRIikOOJ5FnWpGpZdREATr8
 pOhWgFxK13pM9pdTb40qb72FZY4Efp53sy9K2nt/VbfsGRcAMyjyWlQN1RzSpcWHzp
 gM7o0R32UFbBwBS6Q3NRgj9FKi8sVLgpUa0LU2lZlnJIjrFVHQ7OEop/9+1el27VDz
 epdoO575oQg4g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 03/19] drm/radeon/radeon_ttm: Remove unused variable 'rbo'
 from radeon_bo_move()
Date: Fri, 31 Mar 2023 10:25:51 +0100
Message-Id: <20230331092607.700644-4-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_ttm.c: In function ‘radeon_bo_move’:
 drivers/gpu/drm/radeon/radeon_ttm.c:201:27: warning: variable ‘rbo’ set but not used [-Wunused-but-set-variable]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 2220cdf6a3f68..0ea430ee52569 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -198,7 +198,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 {
 	struct ttm_resource *old_mem = bo->resource;
 	struct radeon_device *rdev;
-	struct radeon_bo *rbo;
 	int r;
 
 	if (new_mem->mem_type == TTM_PL_TT) {
@@ -211,7 +210,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (r)
 		return r;
 
-	rbo = container_of(bo, struct radeon_bo, tbo);
 	rdev = radeon_get_rdev(bo->bdev);
 	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
 			 bo->ttm == NULL)) {
-- 
2.40.0.348.gf938b09366-goog

