Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A543914B0
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665A6EB5F;
	Wed, 26 May 2021 10:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 498 seconds by postgrey-1.36 at gabe;
 Wed, 26 May 2021 10:16:49 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E646EA90
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 10:16:49 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out1.suse.de (Postfix) with ESMTP id 56802218C1;
 Wed, 26 May 2021 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622023709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8v5fOXljCLUSYOcfLyPonHFdLdYqs/g6GNa26BWaLZI=;
 b=0tRgjM5uR/kU0drz/3SDY1jJAdNDJf+u2edms7s4ERpXpTKKynS0tWx5sEBO+VnIV66eAi
 1c7RyGIQR6KqSsI1Fs1IDcVf3WUKqUFqH04Hr4a84qjloJ299wbseHdDA4I8WW5hVC1ImU
 Xr2eEYw1EA7IOgVKPS8tAiAY7BOxcKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622023709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8v5fOXljCLUSYOcfLyPonHFdLdYqs/g6GNa26BWaLZI=;
 b=pDX/dmZLeIux4WDwc39HikIiahUvp5F+P93JCWcvXxNwj8PWDzG3sB073OnKQo2kXVAK3v
 zVTBrUs6ZojZzLAQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 227B111A98;
 Wed, 26 May 2021 10:08:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/kconfig: Remove unused select of DRM_KMS_FB_HELPER
Date: Wed, 26 May 2021 12:08:25 +0200
Message-Id: <20210526100825.29450-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The option DRM_KMS_FB_HELPER has been removed. Also remove the last
remaining select statement for it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 91185d55b32e ("drm: Remove DRM_KMS_FB_HELPER Kconfig option")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d3a9ca4b1cec..594ac6c3a1f4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -99,7 +99,6 @@ config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
 	select DRM_KMS_HELPER
-	select DRM_KMS_FB_HELPER
 	select FB
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
-- 
2.31.1

