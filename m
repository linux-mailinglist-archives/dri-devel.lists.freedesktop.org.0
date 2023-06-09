Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C97292B2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFD110E66D;
	Fri,  9 Jun 2023 08:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC7210E667;
 Fri,  9 Jun 2023 08:18:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5A08654A8;
 Fri,  9 Jun 2023 08:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57533C433D2;
 Fri,  9 Jun 2023 08:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686298691;
 bh=JQMSPk6Esn3HF09tEI5gTO9Bp3csrLebEN1TA8aw3hA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FuaGGFFhE+FKDHibH1exVF9bWGYx2VplRPwgxg8cwjZSA3a8VRO5E97HRRmLRALMf
 hTUhXUoUN4glvY4T064Kr3kCVfPPqyymyrPHLj51P2KfHeWh3tekVsKDH5zQ2hhfab
 tj+Bs9nUCyFMYTJrmpLsgl8l6SLvBcCB9mYlGDPXbw4NHjkpkLNkXgwyqAqWnjRfIG
 NuRnsfrACW4bsgBlP2DKYTEuVn4htX8UnIW6Sguz3yO112dTFVOiy31sOOUPaxp44F
 lRrLZgQs2zVmIcfGeunkJITTMOzczDMBiYqDjUHefdh2gT+93Hj0dKVU0Nh29ulMGl
 lI392FVaDus3g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [RESEND 11/15] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
 SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef
Date: Fri,  9 Jun 2023 09:17:14 +0100
Message-ID: <20230609081732.3842341-12-lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:48:22: warning: ‘SYNAPTICS_DEVICE_ID’ defined but not used [-Wunused-const-variable=]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 09e056a647087..cd20cfc049969 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -44,9 +44,6 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 
-/* MST Dock */
-static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
-
 /* dm_helpers_parse_edid_caps
  *
  * Parse edid caps
@@ -702,6 +699,9 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
 	DC_LOG_DC("Done apply_synaptics_fifo_reset_wa\n");
 }
 
+/* MST Dock */
+static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
+
 static uint8_t write_dsc_enable_synaptics_non_virtual_dpcd_mst(
 		struct drm_dp_aux *aux,
 		const struct dc_stream_state *stream,
-- 
2.41.0.162.gfafddb0af9-goog

