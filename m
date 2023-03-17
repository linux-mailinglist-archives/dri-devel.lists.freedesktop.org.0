Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB026BE314
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EC10EE5E;
	Fri, 17 Mar 2023 08:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F63610EE62;
 Fri, 17 Mar 2023 08:22:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB1386222A;
 Fri, 17 Mar 2023 08:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB338C433A0;
 Fri, 17 Mar 2023 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041369;
 bh=Jo9y+Kwbls9gJDU9oXvrQSYrNd+ndpmB5BvTl8Ffkf8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6T4rJ29Lz8w6VrmuJTZUsf8JzLyx+ZSK+NrA8Vtnfe0fe/SeI1aBGBYKF1EsIbJ8
 uHzA2FXYGGNVk9zCgM7tGGefAB4XxGXcKaUjLXDwvQpQ/Hw9b/OMb/dfF2oUGExv//
 9ESft/4HbclwPtQnoQhMHvX5y/S8OBdP0Foj+7Z/QJyAiKHIuXy754cpZ4mBqdve64
 i4mkZG66ea2FA6XVkbG8jIuXiByfCDInRKwmXiaWrJjpu8CRlre/qV+jkbpyp2IGE+
 EAgZofKARug+Ygw2oC0AXQ0+Txks2u5p6RFtcWQwH1XPO4DqIYrpS00cTgXJMU6WbX
 ftPmtcuhnI+yQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/37] =?UTF-8?q?drm/amd/amdgpu/amdgpu=5Fucode:=20Remove?=
 =?UTF-8?q?=20unused=20function=20=E2=80=98amdgpu=5Fucode=5Fprint=5Fimu=5F?=
 =?UTF-8?q?hdr=E2=80=99?=
Date: Fri, 17 Mar 2023 08:16:54 +0000
Message-Id: <20230317081718.2650744-14-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
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
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:129:6: warning: no previous prototype for ‘amdgpu_ucode_print_imu_hdr’ [-Wmissing-prototypes]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 380b89114341d..a7bffd24ceaf3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -126,19 +126,6 @@ void amdgpu_ucode_print_gfx_hdr(const struct common_firmware_header *hdr)
 	}
 }
 
-void amdgpu_ucode_print_imu_hdr(const struct common_firmware_header *hdr)
-{
-	uint16_t version_major = le16_to_cpu(hdr->header_version_major);
-	uint16_t version_minor = le16_to_cpu(hdr->header_version_minor);
-
-	DRM_DEBUG("IMU\n");
-	amdgpu_ucode_print_common_hdr(hdr);
-
-	if (version_major != 1) {
-		DRM_ERROR("Unknown GFX ucode version: %u.%u\n", version_major, version_minor);
-	}
-}
-
 void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr)
 {
 	uint16_t version_major = le16_to_cpu(hdr->header_version_major);
-- 
2.40.0.rc1.284.g88254d51c5-goog

