Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8166BF25
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 14:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A5210E42C;
	Mon, 16 Jan 2023 13:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BAE10E40E;
 Mon, 16 Jan 2023 13:12:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D486F3751A;
 Mon, 16 Jan 2023 13:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673874763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OO536y1oIIavqxJbggquU+Ve/xMHXk1PsPJeSriBnEc=;
 b=Udkbksja4U2SmueaT/CBQsB1+CnfK2yVlqG1l9ZE5v78J3trCBUlXz2roVXvwoK8JV+j/5
 RJBpTXJMbF1eF1IVQTt5IsaogDnmOtmBRNYkOH3qPIyZY2v7XlyXWADk1UpBB17xSI4khU
 CZJDLkGyF0XQJr3XVOuEWpBhmMoHRt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673874763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OO536y1oIIavqxJbggquU+Ve/xMHXk1PsPJeSriBnEc=;
 b=9MzN2mh+4Y19EA2xQcARcGH/wwJ5CLbTFhxyzTEtdsZAzOAJxfT4YnHxkMNDoB0Q8nvGy/
 kHh7OuLMzJlFZ8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94FAB138FA;
 Mon, 16 Jan 2023 13:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WB17I0tNxWNrNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 13:12:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 22/22] drm/crtc-helper: Remove most include statements from
 drm_crtc_helper.h
Date: Mon, 16 Jan 2023 14:12:35 +0100
Message-Id: <20230116131235.18917-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116131235.18917-1-tzimmermann@suse.de>
References: <20230116131235.18917-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove most include statements from crm_crtc_helper.h and forward-
declare the contained types in drm_crtc_helper.h. Only keep <linux/types.h>
for the definition of 'bool'.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_crtc_helper.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
index 072bc4f90349..8c886fc46ef2 100644
--- a/include/drm/drm_crtc_helper.h
+++ b/include/drm/drm_crtc_helper.h
@@ -33,13 +33,17 @@
 #ifndef __DRM_CRTC_HELPER_H__
 #define __DRM_CRTC_HELPER_H__
 
-#include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/idr.h>
 
-#include <drm/drm_crtc.h>
-#include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_modeset_helper.h>
+struct drm_atomic_state;
+struct drm_connector;
+struct drm_crtc;
+struct drm_device;
+struct drm_display_mode;
+struct drm_encoder;
+struct drm_framebuffer;
+struct drm_mode_set;
+struct drm_modeset_acquire_ctx;
 
 void drm_helper_disable_unused_functions(struct drm_device *dev);
 int drm_crtc_helper_set_config(struct drm_mode_set *set,
-- 
2.39.0

