Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E06955C2B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2130410E041;
	Sun, 18 Aug 2024 10:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="JbJOCE6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3C110E01F;
 Sun, 18 Aug 2024 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977821;
 bh=m6tZ+bkNum+lT9LuP45n39o3Kd/bRgn7J6zpoZystEI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JbJOCE6Jlx5RCqqXzNzh049IuNIn7N0JMls5JihdAFZXtJRJD5t1He053nvvFm2Qt
 uPZJ9pyYeMEncFSXEnNpjshmStP+FdR6HlUSEBIWa0oOQpSk+pjeuHsvN3YAQ+Catk
 fBJH/AQpXUhenjhKIO1495YZTIgkIYwzC5oauy1Q=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:26 +0200
Subject: [PATCH 02/12] drm/amd/display: Remove EDID members of ddc_service
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-2-aea66c1f7cf4@weissschuh.net>
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
In-Reply-To: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, 
 Aric Cyr <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, 
 Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=806;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=m6tZ+bkNum+lT9LuP45n39o3Kd/bRgn7J6zpoZystEI=;
 b=ozRNgTI5VgAdH6JDcIzjC2DrBbm2VMGUqtREn5p8IP4s3WC9TgD+uDngpZxIXuBVqA29YXg90
 kDNFbGJaNhUAud/a/fNH1lKngn+Y35Vl25dJjIR+ZsqjA9CIKq2mJAS
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All usages of these fields have been removed.

Fixes: 7c7f5b15be65 ("drm/amd/display: Refactor edid read.")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
index 428e3a9ab65a..7dd1cfb9ab76 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
@@ -189,10 +189,6 @@ struct ddc_service {
 	enum display_dongle_type dongle_type;
 	struct dc_context *ctx;
 	struct dc_link *link;
-
-	uint32_t address;
-	uint32_t edid_buf_len;
-	uint8_t edid_buf[DC_MAX_EDID_BUFFER_SIZE];
 };
 
 #endif /* DC_DDC_TYPES_H_ */

-- 
2.46.0

