Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BBA78688B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A260510E498;
	Thu, 24 Aug 2023 07:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33A210E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:37:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FBB963563;
 Thu, 24 Aug 2023 07:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB535C433C8;
 Thu, 24 Aug 2023 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862670;
 bh=CHcMfyq7Y4yTbOAJVaDkP63E5aZjNy43V54/xurTZfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KrGTyrol/RafYXTu3j6Wlw9OigD+fdeU+u36c3+tMTLRBfnvOm79YgyOCpu2va6BO
 oytQvt0gOIgqUBnZeRL3rSQqRPx+gui/o+htJ9D/jKX394v/aWlvOqIA9U79zRStVz
 zDCpmJodY+NrBrGESzwrQUdC/EtBH6o2WtUbSPJQwZxVVPqeajXxksjah3zCqVERRh
 Equhty7b5tENDNFmZM05mRcHVaz/iPLQX7gLLnAYc5lt1Ly/VXo7ca+wy57WSzXcRW
 afzBjILS09g84iDKn00DKGWEiWsknaFhQN6huisM7ter6Xa9wxtCY2YrCUEmQoYup/
 nlpSgWcFwRmkw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 09/20] drm/tests/drm_kunit_helpers: Place correct function
 name in the comment header
Date: Thu, 24 Aug 2023 08:36:54 +0100
Message-ID: <20230824073710.2677348-10-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/tests/drm_kunit_helpers.c:172: warning: expecting prototype for drm_kunit_helper_context_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Maíra Canal" <mairacanal@riseup.net>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 3d624ff2f6517..f102c23eee1dd 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -156,7 +156,7 @@ static void action_drm_release_context(void *ptr)
 }
 
 /**
- * drm_kunit_helper_context_alloc - Allocates an acquire context
+ * ddrm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
  * @test: The test context object
  *
  * Allocates and initializes a modeset acquire context.
-- 
2.42.0.rc1.204.g551eb34607-goog

