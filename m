Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B5F49692B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 02:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE11D10E7AA;
	Sat, 22 Jan 2022 01:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BE910E7AA;
 Sat, 22 Jan 2022 01:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=F5pt9JgLdr4Wt09YxIeWvRa1yduJ52oBErRZQRDvD3I=; b=YBrpMg8T57kIzcczs9zrSPN4dM
 5TvhMuYyeUEQ2YO55Q8ONS3DCYFj7kK5s8KxRvQ197CS1OqKrdNMgsnpHU0oHgYPAjvWAAiMoxtI9
 CveuBA750aASMYsODhDK5lqNjfO7eYxLU4zwIzuk2+6LKXanPyL7IuzGnBfWvFc3A0AxoOWylcXRa
 VRswZoqEz3t4AbTKtcKdXV+KYpmww/O7UKvkJxE/hOr7gWDuj0+NwJxt38JaBcNsFE73niSm0nwHf
 X6L/hDzxcQ6COIiDHqBhKf5HtMM7zTURjsGKNm32MMRhq4TeEpPE+Bce2l8YoWIRvGhtcYawfXOIG
 hi7B91sA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB584-00GNGI-9h; Sat, 22 Jan 2022 01:23:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/amd/display: don't use /** for non-kernel-doc
 comments
Date: Fri, 21 Jan 2022 17:23:43 -0800
Message-Id: <20220122012343.32540-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Cc: kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change a static function's comment from "/**" (indicating kernel-doc
notation) to "/*" (indicating a regular C language comment).
This prevents multiple kernel-doc warnings:

  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: Function parameter or member 'max_supported_frl_bw_in_kbps' not described in 'intersect_frl_link_bw_support'
  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: Function parameter or member 'hdmi_encoded_link_bw' not described in 'intersect_frl_link_bw_support'
  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4343: warning: expecting prototype for Return PCON's post FRL link training supported BW if its non(). Prototype was for intersect_frl_link_bw_support() instead

Fixes: c022375ae095 ("drm/amd/display: Add DP-HDMI FRL PCON Support in DC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20220121.orig/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ linux-next-20220121/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -4970,7 +4970,7 @@ uint32_t dc_link_bw_kbps_from_raw_frl_li
 	return 0;
 }
 
-/**
+/*
  * Return PCON's post FRL link training supported BW if its non-zero, otherwise return max_supported_frl_bw.
  */
 static uint32_t intersect_frl_link_bw_support(
