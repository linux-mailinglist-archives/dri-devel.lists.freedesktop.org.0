Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D29764C9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5FC10EB0F;
	Thu, 12 Sep 2024 08:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V45eKDpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF0D10EB0E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 08:45:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73D065C5645;
 Thu, 12 Sep 2024 08:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C188C4CEC3;
 Thu, 12 Sep 2024 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726130743;
 bh=sPhUXy8dFTT1CuioYoeQzNh/CV7cAAB2+v8AIBu+1ko=;
 h=From:To:Cc:Subject:Date:From;
 b=V45eKDpcYKi1nqbyYM9plF1IoLTin3jiYoG3NjfjzWk0q9F69uxXNKiCJsP6O0/iW
 nh9k/rT3BPDL60T3akSOAC4tJGs5egAAWmsI4o+2121U9SUa84/rQuXuK3ogAnV6aV
 H2H7tmCx0xtwIcz+0jH70tEmrww9HXQt3mE30fa/DWyQvBobpDNaTP9qDhFBCzoqvR
 eBJN3u/dG/LDOxSpIdcwz+sZLh5e8EV7cPAE3uKpvvf3lTsoHuczDzVpSofzC5wsYl
 yAdRr/2yZvQ1i1Kj/ZXecOKxYsPJ0EfZCR4viIOR28Y/r1qlN/4CxQKBMgbVshP3rY
 g1CmlzKublYeA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/doc: Update drm_bridge_connector path
Date: Thu, 12 Sep 2024 10:45:40 +0200
Message-ID: <20240912084540.1213343-1-mripard@kernel.org>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER
module") recently moved the drm_bridge_connector file, but didn't update
the doc resulting in a doc build warning. Update it for the new location.

Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
Closes: https://lore.kernel.org/dri-devel/20240904163018.214efaa7@canb.auug.org.au/
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drm-kms-helpers.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 8435e8621cc0..c3e58856f75b 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -179,11 +179,11 @@ Bridge Operations
    :doc: bridge operations
 
 Bridge Connector Helper
 -----------------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_bridge_connector.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_bridge_connector.c
    :doc: overview
 
 
 Bridge Helper Reference
 -------------------------
@@ -202,11 +202,11 @@ MIPI-DSI bridge operation
 
 
 Bridge Connector Helper Reference
 ---------------------------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_bridge_connector.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_bridge_connector.c
    :export:
 
 Panel-Bridge Helper Reference
 -----------------------------
 
-- 
2.46.0

