Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E246622A9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706210E3B1;
	Mon,  9 Jan 2023 10:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6602D10E3A7;
 Mon,  9 Jan 2023 10:12:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 950B27630E;
 Mon,  9 Jan 2023 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673259166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEg6KiW/hSxsybeiSe/oAex8XdWQoHDUu+xodpfYi+w=;
 b=0N/qs/C4B8vSBRMPIe2Q6iOTGQbZXvB4Cn6pwGEsBW4TyeldBLqt1XRFewNsHSlg4qiC/w
 LisbqFcnoaIgvBJujlgjvK1Lf8ljxatfyvTReP9D/YPGf/SXpo/twk0cr2VpMr7qYTcg4m
 LhHx/Z0FODAOZtFf03c2LkxSxj7dSmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673259166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEg6KiW/hSxsybeiSe/oAex8XdWQoHDUu+xodpfYi+w=;
 b=TvcJWaXILnW0V4Nc1Vehn5GVk8MWx8+nWZ8TkfYjglSslbj7HXaRTlK404WVx4h3zlYEiE
 DjOxZhBg1wIHoBCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BF3713583;
 Mon,  9 Jan 2023 10:12:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aNykEZ7ou2O3EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Jan 2023 10:12:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com
Subject: [PATCH 5/5] drm: Include <linux/of.h> in drm_modes.c
Date: Mon,  9 Jan 2023 11:12:43 +0100
Message-Id: <20230109101243.26995-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109101243.26995-1-tzimmermann@suse.de>
References: <20230109101243.26995-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include <linux/of.h> in drm_modes.c for of_property_read_u32(). Until
now, the OF header got included via <linux/fb.h>.

Also comment on the reason for still including <linux/fb.h>. The header
file is still required to get KHZ2PICOS(). The macro is part of the UAPI
headers, so it cannot be moved to a less prominent location.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_modes.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index be030f4a5311..40d482a01178 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -31,10 +31,11 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/export.h>
+#include <linux/fb.h> /* for KHZ2PICOS() */
 #include <linux/list.h>
 #include <linux/list_sort.h>
-#include <linux/export.h>
-#include <linux/fb.h>
+#include <linux/of.h>
 
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
-- 
2.39.0

