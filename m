Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F27786894
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4F610E4A3;
	Thu, 24 Aug 2023 07:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F024610E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:38:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 743ED65D19;
 Thu, 24 Aug 2023 07:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7545C433CC;
 Thu, 24 Aug 2023 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862682;
 bh=8KAGK/pCRryvB+pifyUnHrIVznLi7QuAqCIeWiGv0as=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oUBVB7WSOsWQwTReD7RO4Xdvbtoj3weNATue3V95ZaBQnJBOfR35SOlYfEuG5XK97
 q+2Lzv4gyWcINm3BjY4BNu8YQ8I8HZITQhxk4ASCP63PURcotWXoisT29/nd9RFlS8
 CH34RY+vKW0T2kkJ1rZ+ArdGYRGHuZfzmLcKsLB4UYjY6drZ0oAv8VuZSFQ6FwyT9t
 8VADzfniwV2kJmHARJS7z8aTtoRYeUS1OlHM2lpUlvMO3ODCvjBFOdJUFWdnjZRZ8Y
 DMTG08cyvgItNohmd8sHYQc0KA7U6yaTes3lRDqEcyDWsady4/uxPfTx74Dy6nCD/b
 rjVcFEwIQKQ8w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 13/20] drm/tests/drm_kunit_helpers: Correct possible
 double-entry typo in 'ddrm_kunit_helper_acquire_ctx_alloc'
Date: Thu, 24 Aug 2023 08:36:58 +0100
Message-ID: <20230824073710.2677348-14-lee@kernel.org>
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

 drivers/gpu/drm/tests/drm_kunit_helpers.c:172: warning: expecting prototype for ddrm_kunit_helper_acquire_ctx_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead

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
index f102c23eee1dd..c1dfbfcaa0001 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -156,7 +156,7 @@ static void action_drm_release_context(void *ptr)
 }
 
 /**
- * ddrm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
+ * drm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
  * @test: The test context object
  *
  * Allocates and initializes a modeset acquire context.
-- 
2.42.0.rc1.204.g551eb34607-goog

