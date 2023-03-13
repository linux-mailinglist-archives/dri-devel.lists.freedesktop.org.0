Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ACB6B7BAB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DC610E0A6;
	Mon, 13 Mar 2023 15:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329C10E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:16:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3EE81FE0D;
 Mon, 13 Mar 2023 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678720571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6URQAwVju4bG1CL+ur/CMFA1vZPCKBiNHUcPZQv57EA=;
 b=owJIreWiMSmXmajqJQEygl1NhtSIn2ySNqycgitPDZ3zt6r4EorI3AyuFgMZYhWyKBZGNs
 6gcTplYwElyv68eZTztDyLwWUAp/ZTTMPNnw27fwoiq2Uqe23gFXihOcY7OugqUuCP4d40
 CoN9LtdBn5rbQir3BqVUNjP80N3wfU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678720571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6URQAwVju4bG1CL+ur/CMFA1vZPCKBiNHUcPZQv57EA=;
 b=KUa6mERpydRzJWzA9GRoOHFguO26VwobTTAXZgt67Rblc604+SizN+zd2hVzXoiwuqzv0G
 QOM3lHoslROReTBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8937139F9;
 Mon, 13 Mar 2023 15:16:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cLNVLDs+D2Q5ZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:16:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2 1/7] drm/gma500: Remove unnecessary include statements
Date: Mon, 13 Mar 2023 16:16:04 +0100
Message-Id: <20230313151610.14367-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313151610.14367-1-tzimmermann@suse.de>
References: <20230313151610.14367-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary include statements from framebuffer.c. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/framebuffer.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 50611eb7f134..a07ca61ddc86 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -5,23 +5,10 @@
  *
  **************************************************************************/
 
-#include <linux/console.h>
-#include <linux/delay.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/module.h>
 #include <linux/pfn_t.h>
-#include <linux/slab.h>
-#include <linux/string.h>
-#include <linux/tty.h>
 
-#include <drm/drm.h>
-#include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
@@ -29,8 +16,6 @@
 #include "framebuffer.h"
 #include "gem.h"
 #include "psb_drv.h"
-#include "psb_intel_drv.h"
-#include "psb_intel_reg.h"
 
 static const struct drm_framebuffer_funcs psb_fb_funcs = {
 	.destroy = drm_gem_fb_destroy,
-- 
2.39.2

