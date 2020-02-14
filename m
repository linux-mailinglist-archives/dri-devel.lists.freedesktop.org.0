Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5415E20D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1772A6FB07;
	Fri, 14 Feb 2020 16:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848026FB04;
 Fri, 14 Feb 2020 16:22:03 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DEDB246B7;
 Fri, 14 Feb 2020 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697323;
 bh=Xosha2si2gA+YtJP6cPHMRHvPd5rRJ+tgfnyNFwyd8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XAS52lBHjgXmfgpAemPHvrcZ0wosZEZ1kz15sDCsVgIy7k2/N5qPgpaotrkVFtl7a
 d4WQ+9blWlnj+fycJb7iAzaGHrLHoJz35Eu0+gW8hzc39VZB09EzXtxPeClJiOpCFQ
 wKz/b9cLBaE4gg5USE3svXAp6vhwRuuOjZC2sUnU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 032/141] drm/amdgpu: remove 4 set but not used
 variable in amdgpu_atombios_get_connector_info_from_object_table
Date: Fri, 14 Feb 2020 11:19:32 -0500
Message-Id: <20200214162122.19794-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162122.19794-1-sashal@kernel.org>
References: <20200214162122.19794-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: yu kuai <yukuai3@huawei.com>

[ Upstream commit bae028e3e521e8cb8caf2cc16a455ce4c55f2332 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c: In function
'amdgpu_atombios_get_connector_info_from_object_table':
drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:376:26: warning: variable
'grph_obj_num' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:376:13: warning: variable
'grph_obj_id' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:341:37: warning: variable
'con_obj_type' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:341:24: warning: variable
'con_obj_num' set but not used [-Wunused-but-set-variable]

They are never used, so can be removed.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
Signed-off-by: yu kuai <yukuai3@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 26afdffab5a06..ac8885562919d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -336,17 +336,9 @@ bool amdgpu_atombios_get_connector_info_from_object_table(struct amdgpu_device *
 		path_size += le16_to_cpu(path->usSize);
 
 		if (device_support & le16_to_cpu(path->usDeviceTag)) {
-			uint8_t con_obj_id, con_obj_num, con_obj_type;
-
-			con_obj_id =
+			uint8_t con_obj_id =
 			    (le16_to_cpu(path->usConnObjectId) & OBJECT_ID_MASK)
 			    >> OBJECT_ID_SHIFT;
-			con_obj_num =
-			    (le16_to_cpu(path->usConnObjectId) & ENUM_ID_MASK)
-			    >> ENUM_ID_SHIFT;
-			con_obj_type =
-			    (le16_to_cpu(path->usConnObjectId) &
-			     OBJECT_TYPE_MASK) >> OBJECT_TYPE_SHIFT;
 
 			/* Skip TV/CV support */
 			if ((le16_to_cpu(path->usDeviceTag) ==
@@ -371,14 +363,7 @@ bool amdgpu_atombios_get_connector_info_from_object_table(struct amdgpu_device *
 			router.ddc_valid = false;
 			router.cd_valid = false;
 			for (j = 0; j < ((le16_to_cpu(path->usSize) - 8) / 2); j++) {
-				uint8_t grph_obj_id, grph_obj_num, grph_obj_type;
-
-				grph_obj_id =
-				    (le16_to_cpu(path->usGraphicObjIds[j]) &
-				     OBJECT_ID_MASK) >> OBJECT_ID_SHIFT;
-				grph_obj_num =
-				    (le16_to_cpu(path->usGraphicObjIds[j]) &
-				     ENUM_ID_MASK) >> ENUM_ID_SHIFT;
+				uint8_t grph_obj_type=
 				grph_obj_type =
 				    (le16_to_cpu(path->usGraphicObjIds[j]) &
 				     OBJECT_TYPE_MASK) >> OBJECT_TYPE_SHIFT;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
