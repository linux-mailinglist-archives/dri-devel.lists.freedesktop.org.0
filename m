Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6679A0A6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 01:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F8A10E00B;
	Sun, 10 Sep 2023 23:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C41010E00B;
 Sun, 10 Sep 2023 23:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=psFHv5kVZjBZeSjSwTGpttOqkbU4kOzBlHIhUIId7P8=; b=caYFO9eaBmvQfAm7wMM/auiAzw
 0HYDndat46HAViXPi597CkWvxYkycwL8jH55f1Jn9XHJu8YdD854xHCvwC8dTFSoO7hk2I9SxENKm
 qWh9cbfHlrsi+LbGTegt1yumvwHVwuVaMyvs6Vj2wcGV4VUNkw39ZviVBTnNn/zvKdhjqKbtoC3dR
 W9RSiQFEYApN0LiRJYUtr6XQqjjNBrBm+t0lZVHVcEYnmFULtzu1NKcm48eT4Uq5P2uCu9nFFrOcF
 w6tkepsKUReqftkY9T8oBcPC7eInm+zpyLVEunM8Q2K+Cy3nbGQ8h2wzOEA12JgrCXSD28v2bSZ37
 HKnxgUmw==;
Received: from [2601:1c2:980:9ec0::9fed] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qfU6l-00GzAn-0h; Sun, 10 Sep 2023 23:44:51 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: fix replay_mode kernel-doc warning
Date: Sun, 10 Sep 2023 16:44:50 -0700
Message-ID: <20230910234450.15962-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the typo in the kernel-doc for @replay_mode to prevent
kernel-doc warnings:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:623: warning: Incorrect use of kernel-doc format:          * @replay mode: Replay supported
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:626: warning: Function parameter or member 'replay_mode' not described in 'amdgpu_hdmi_vsdb_info'

Fixes: ec8e59cb4e0c ("drm/amd/display: Get replay info from VSDB")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -620,7 +620,7 @@ struct amdgpu_hdmi_vsdb_info {
 	unsigned int max_refresh_rate_hz;
 
 	/**
-	 * @replay mode: Replay supported
+	 * @replay_mode: Replay supported
 	 */
 	bool replay_mode;
 };
