Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179EC4929D1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 16:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2097D10E20D;
	Tue, 18 Jan 2022 15:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A8410E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 15:44:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 374831F3B5;
 Tue, 18 Jan 2022 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642520693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E9NWeceMISoAsmaWT6przXgsMdYKTrtZndeM5UqEUMo=;
 b=thyEkB58CuPgfBbXIM2rQ7c/MncOTC0jYdIjWJAT+YobeDsbAAlJ2+y82oh8tvY2UPNWxg
 LXE3KakqjfFsXuY50ilHwordje5ub6sO5Ur8yNefY8jQsJzcDxADIXcP7YjRhqB7VWvpVN
 S6LRaBb6/noSx90J4ZSKqMvC0rtnMN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642520693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E9NWeceMISoAsmaWT6przXgsMdYKTrtZndeM5UqEUMo=;
 b=o6tnZUwEPBz0PyD4C6WL4bn/iY2PCq5mAt/F0Oa0GVg49Zf7XAc5b6st/0zp63FKfKvAYe
 v7/lRGZtsmHVoKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C3E913AB7;
 Tue, 18 Jan 2022 15:44:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5WjIAXXg5mGBawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Jan 2022 15:44:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lyude@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH] drm/msm: Fix include statements for DisplayPort
Date: Tue, 18 Jan 2022 16:44:50 +0100
Message-Id: <20220118154450.25947-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the include statements for DisplayPort helpers. The header
files are in the dp/ subdirectory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 5b529e8d9c38 ("drm/dp: Move public DisplayPort headers into dp/")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/msm/edp/edp.h      | 2 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/edp/edp.h b/drivers/gpu/drm/msm/edp/edp.h
index 8590f2ce274d..1a82d7a4af9f 100644
--- a/drivers/gpu/drm/msm/edp/edp.h
+++ b/drivers/gpu/drm/msm/edp/edp.h
@@ -10,9 +10,9 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
 
 #include "msm_drv.h"
 
diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index a68a4a1867c1..9f537b1fd849 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -6,8 +6,8 @@
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
+#include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 
 #include "edp.h"
-- 
2.34.1

