Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628D3690B0A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93D810EAF9;
	Thu,  9 Feb 2023 13:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6510EAE4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:55:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BBC45D033;
 Thu,  9 Feb 2023 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675950915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTaTXQl7Ph7tUuGylQ6ryNfXYsJmmkGD7j+C1k3qtoM=;
 b=DtpLAvd9BKfp41MBStPAMWug8yr4+0J7aMLfMMm5Gx0JzM9FeD4hW1FZqYtxuJy+98D/Ct
 vHW8tWp0O/LEE3S4hmuqevKRtwsnQK6peEV/L7inTePr7oImF9FJcAmFEqAJku12OH08jF
 G5ZuveCfUT/zYWu2nBgxR4zPb/+OhEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675950915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTaTXQl7Ph7tUuGylQ6ryNfXYsJmmkGD7j+C1k3qtoM=;
 b=Ko8a9NVaWGMHJqNrZNa6jjJJwkeMfyM6Yo5qJ0RWSG04fiXXKbTHJ627Eood7v2/xhEglM
 v7Rjq2K47w3PrIAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43DCD138E4;
 Thu,  9 Feb 2023 13:55:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iOqRD0P75GNTfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, geoff@infradead.org,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 10/11] drm: Include <video/cmdline.h> for mode parsing
Date: Thu,  9 Feb 2023 14:55:08 +0100
Message-Id: <20230209135509.7786-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209135509.7786-1-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include <video/cmdline.h> in drm_connector.c to get video_get_options()
and avoid the dependency on <linux/fb.h>. The replaced function
fb_get_options() is just a tiny wrapper around video_get_opions(). No
functional changes.

Include <linux/property.h> to get fwnode_handle_put(), which had been
provided via <linux/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_connector.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9d0250c28e9b..ca5fb54b7aab 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -33,9 +33,11 @@
 #include <drm/drm_sysfs.h>
 #include <drm/drm_utils.h>
 
-#include <linux/fb.h>
+#include <linux/property.h>
 #include <linux/uaccess.h>
 
+#include <video/cmdline.h>
+
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
@@ -154,9 +156,10 @@ EXPORT_SYMBOL(drm_get_connector_type_name);
 static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
 {
 	struct drm_cmdline_mode *mode = &connector->cmdline_mode;
-	char *option = NULL;
+	const char *option;
 
-	if (fb_get_options(connector->name, &option))
+	option = video_get_options(connector->name);
+	if (!option)
 		return;
 
 	if (!drm_mode_parse_command_line_for_connector(option,
-- 
2.39.1

