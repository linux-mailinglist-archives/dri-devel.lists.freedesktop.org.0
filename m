Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B27292B7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E33910E672;
	Fri,  9 Jun 2023 08:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAB910E66F;
 Fri,  9 Jun 2023 08:18:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE2756548B;
 Fri,  9 Jun 2023 08:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04492C433A0;
 Fri,  9 Jun 2023 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686298699;
 bh=6akk4JUAUaBhXz3lKYWX4AGbnKk9n7L5+hUo0G3vHog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SRGfPbdTg5P0P5hck+ds3NNdWQ5elY0yQqf+yItP1gqPH7/vS4EDPzjjaVSjt6sJS
 LHkQPsYmqYQGsNr/lb9C6Mex5Hx/s1Cfc75Bvq/GMl+25LG/3EOmE4RN1kc1nWEMDW
 W3iJAx/3/kxPGy7c3d8pBe80zNGfIfSapNe+9dKHL+cQeIwsK3yWdvLws+lSJQTc4D
 aUYlUhZBA8r+ZRPC0buaaBDHnEZi84ccerIrEzvUE35TKk838QrxAnQrzUVaG40fkX
 g0rrHzETaqbB2OwICmWHZ5D+QA+o7v90XJYVl9m7iKNRRBPQASP0GEqx7CraAy9xbE
 0LPtipn6UiWTQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [RESEND 14/15] drm/radeon/radeon_ttm: Remove unused variable 'rbo'
 from radeon_bo_move()
Date: Fri,  9 Jun 2023 09:17:17 +0100
Message-ID: <20230609081732.3842341-15-lee@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230609081732.3842341-1-lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
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
index 4eb83ccc4906a..de4e6d78f1e12 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -197,7 +197,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 {
 	struct ttm_resource *old_mem = bo->resource;
 	struct radeon_device *rdev;
-	struct radeon_bo *rbo;
 	int r;
 
 	if (new_mem->mem_type == TTM_PL_TT) {
@@ -210,7 +209,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (r)
 		return r;
 
-	rbo = container_of(bo, struct radeon_bo, tbo);
 	rdev = radeon_get_rdev(bo->bdev);
 	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
 			 bo->ttm == NULL)) {
-- 
2.41.0.162.gfafddb0af9-goog

