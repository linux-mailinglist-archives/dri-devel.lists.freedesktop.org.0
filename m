Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138C8825C4F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 23:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2564010E639;
	Fri,  5 Jan 2024 22:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDD210E639;
 Fri,  5 Jan 2024 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7QzEcpFOcIHeJ/9ZGSKbIILtlDXd0uYEMAFsfbMYnMs=; b=NJz46Cdp8QzDI1caAICAc2Jep+
 95Uu1MSgT+sMtsS3Gmg8ixiuU8GaQESoPETgxqqUVUAqmXoeeWWIM64z3e9/9TdfjmFz4jUoTQuYK
 +lR76uDJnXs+ueHe1FxAQmKTQyKyoRUkmle179SW5EX28v8hPZ+j5MbH5TIh+lE3gil3j+3YtDKUv
 Hk8iQ2YPyVBYpGmIsDEuzO001U9LCT1yqKLCGh/NzMGHvzyxkwuTVeW28mkVnziNsR6vG6pysKJzS
 JY8hxRf7dzfnOEUDToI9ATTbpL0x/K9G/LISNhTO/eQl9W53sLNeoFO3Gy1VoIbJjVf4M76AIEIAG
 Y6HXQjdg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rLsHD-003M0U-I8; Fri, 05 Jan 2024 23:02:51 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: cleanup inconsistent indenting in
 amdgpu_dm_color
Date: Fri,  5 Jan 2024 21:02:09 -0100
Message-ID: <20240105220248.282941-1-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch warnings:
amdgpu_dm_update_plane_color_mgmt() warn: inconsistent indenting

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401051643.PPdbmG1U-lkp@intel.com/
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 9b527bffe11a..c87b64e464ed 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1239,7 +1239,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	if (has_crtc_cm_degamma && ret != -EINVAL) {
 		drm_dbg_kms(crtc->base.crtc->dev,
 			    "doesn't support plane and CRTC degamma at the same time\n");
-			return -EINVAL;
+		return -EINVAL;
 	}
 
 	/* If we are here, it means we don't have plane degamma settings, check
-- 
2.43.0

