Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F498AD97E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16939112E67;
	Mon, 22 Apr 2024 23:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ol9kyWTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01328112E66;
 Mon, 22 Apr 2024 23:55:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4EBDF61119;
 Mon, 22 Apr 2024 23:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F49C3277B;
 Mon, 22 Apr 2024 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830101;
 bh=MwuY0hLb+N6b9YB79jB7wWRz6DDBHF+sgVjco9EEbO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ol9kyWTFAm94kQuApkaCUnnP4G+JAueJpcCHG5V7ZIJ2hIyAOB8UbskPyLmg5M63N
 rMibFgMsrykG9Ls4PPAuclkEOj2W5kZ0ZI9G6/hcUiB3Nvblr+jnblPdLnFgrteG9F
 CI0nXqORkmoOGnmxUcdA5+0dwZW28bMSTuEeCBIC2diZ+us+ih699vConGmc4Gxiaj
 uJOTPOu0VDCo2CmW2gGD2+XtJfnlyaw4DlUzIrycu1z494Y4g5xkg9l0j83nIi2Vj6
 YOtw1sWlM5DwCaLq1vB+fpZ2Uvs6n4WpFu6u1dCEKu2scpduHv9L00z0Yyw5hpAvpS
 KZ6pCw9KcChaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Li Ma <li.ma@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, hamza.mahfooz@amd.com,
 wayne.lin@amd.com, srinivasan.shanmugam@amd.com, joshua@froggi.es,
 haoping.liu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 27/43] drm/amd/display: add DCN 351 version for
 microcode load
Date: Mon, 22 Apr 2024 19:14:13 -0400
Message-ID: <20240422231521.1592991-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231521.1592991-1-sashal@kernel.org>
References: <20240422231521.1592991-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.7
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Li Ma <li.ma@amd.com>

[ Upstream commit d4396924c3d44f34d0643f650e70892e07f3677f ]

There is a new DCN veriosn 3.5.1 need to load

Signed-off-by: Li Ma <li.ma@amd.com>
Reviewed-by: Yifan Zhang <yifan1.zhang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 718e533ab46dd..0d3e553647993 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -147,6 +147,9 @@ MODULE_FIRMWARE(FIRMWARE_NAVI12_DMCU);
 #define FIRMWARE_DCN_35_DMUB "amdgpu/dcn_3_5_dmcub.bin"
 MODULE_FIRMWARE(FIRMWARE_DCN_35_DMUB);
 
+#define FIRMWARE_DCN_351_DMUB "amdgpu/dcn_3_5_1_dmcub.bin"
+MODULE_FIRMWARE(FIRMWARE_DCN_351_DMUB);
+
 /* Number of bytes in PSP header for firmware. */
 #define PSP_HEADER_BYTES 0x100
 
@@ -4776,6 +4779,9 @@ static int dm_init_microcode(struct amdgpu_device *adev)
 	case IP_VERSION(3, 5, 0):
 		fw_name_dmub = FIRMWARE_DCN_35_DMUB;
 		break;
+	case IP_VERSION(3, 5, 1):
+		fw_name_dmub = FIRMWARE_DCN_351_DMUB;
+		break;
 	default:
 		/* ASIC doesn't support DMUB. */
 		return 0;
-- 
2.43.0

