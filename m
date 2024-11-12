Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939299C607E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 19:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A999D10E624;
	Tue, 12 Nov 2024 18:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="J4NUoEcA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341F510E619;
 Tue, 12 Nov 2024 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1731436454;
 bh=ggkrDQamEbfGikQ2/25kOxpC8sUxK9EY9OaS4uOE/dU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=J4NUoEcAdZeAt8taC6/Lj1BcPHirHx/vAyF+tQwxuxR2HVhovJCxuSTBf5LGKKeOI
 YkwP+NF7fwQag0eTVkXLFPzVMyOtwd8DTGrvh5/0cd4UrIVELnnlSMdjWS09Wz+DBe
 rplLcGr2bF1JQPA4HsrbOWrFJJ9wrjqU22rBwwqo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 Nov 2024 19:34:11 +0100
Subject: [PATCH v2 2/7] drm/amd/display: Remove EDID members of ddc_service
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241112-amdgpu-drm_edid-v2-2-1399dc0f0469@weissschuh.net>
References: <20241112-amdgpu-drm_edid-v2-0-1399dc0f0469@weissschuh.net>
In-Reply-To: <20241112-amdgpu-drm_edid-v2-0-1399dc0f0469@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 jinzh <jinzh@github.amd.com>, Aric Cyr <Aric.Cyr@amd.com>, 
 Alan Liu <HaoPing.Liu@amd.com>, Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731436454; l=862;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ggkrDQamEbfGikQ2/25kOxpC8sUxK9EY9OaS4uOE/dU=;
 b=/iJkJN3erXCyOgDcpF8uIbF9tLE+ktHmsPCK/iB3Y2eVFH5wLWvMP7/bamfB90mvNxmRMI4a6
 3wdqYs8fAeLBAdEX62rQBxUAeen+hM2wqhEKK+L3mic5taogpoo2+9W
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
index 428e3a9ab65afb2fd146253b7db08e0571a12983..7dd1cfb9ab763c1e37d1cf6e27bbe4790a732f5b 100644
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
2.47.0

