Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E1803252
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD9610E19D;
	Mon,  4 Dec 2023 12:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F325310E1A4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:17:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3C10CE0E00;
 Mon,  4 Dec 2023 12:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58228C433C7;
 Mon,  4 Dec 2023 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701692233;
 bh=BVHisMEe0/ICZvGqzbKHHBha0j84yNL1cE4vVQoz15Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E04uDROm5J+gY56nqg39X9XJIy4DmNMmZ7b6BdOOX3kjcV4sqybRDpsSy6Nh0qa02
 n3n7zz3RilLZYyc9z1WhdayahIj2X1J5elyFyN0uGVu8q3N7WODdEmO05O7a7Kw0Z0
 3io3YSwc0id0x9nS3yZqjsdDGXMLwbh9bGlNpTLrqnVSCvek76mlBgehqgLp7C0gi4
 tsrd++RurEg3rgfkfBkWo/TOgJpEmzSo1fuaFuwwZAgO0cGB896Skgoaqq5BMSTr1e
 cwZP3Jf5YMjVJAlTUmJyVbLetesGwUAjbgAiIXIESzJgDqcM677yjO48rvilmE5cxx
 iQL8xVnv1bswA==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/5] drm/atomic: Remove inexistent reference
Date: Mon,  4 Dec 2023 13:17:04 +0100
Message-ID: <20231204121707.3647961-2-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204121707.3647961-1-mripard@kernel.org>
References: <20231204121707.3647961-1-mripard@kernel.org>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The num_connectors field documentation mentions a connector_states field
that has never been part of this structure.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 2a08030fcd75..13cecdc1257d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -413,7 +413,7 @@ struct drm_atomic_state {
 	struct __drm_crtcs_state *crtcs;
 
 	/**
-	 * @num_connector: size of the @connectors and @connector_states arrays
+	 * @num_connector: size of the @connectors array
 	 */
 	int num_connector;
 
-- 
2.43.0

