Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0C665C08
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB63510E736;
	Wed, 11 Jan 2023 13:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F109410E735;
 Wed, 11 Jan 2023 13:02:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4A6D17931;
 Wed, 11 Jan 2023 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673442132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZsr9jEMXp1L4QZWptzy2vVe17c43optEH8PsgWa1M4=;
 b=KxvXqNYjwzwCL6fFdV7xe6nR2jfZpvJSex0oH5482upN/tZUcGU3mAvU8CcT2gLUnd3dj6
 AAKwLOIW/Ej1wv6K00H+GAPHI1PyVu+fQkFJWO3zL36TJUR/OEEA1zouijwiWln294OTL9
 kVNd0eM1IA0yC5DxQihMDJSvzF6nY3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673442132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZsr9jEMXp1L4QZWptzy2vVe17c43optEH8PsgWa1M4=;
 b=Lo/x26s6S8z7TBMxF04165uSzlRaagPKWTnVE3O+qZM7V39iLQq10/j7vv4CyYXnjpwz9T
 uKYxA65NyPdt5RAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7408113591;
 Wed, 11 Jan 2023 13:02:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SGBGG1SzvmMaXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:02:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
Subject: [PATCH v2 08/10] drm/nouveau: Do not include <drm/drm_fb_helper.h>
Date: Wed, 11 Jan 2023 14:02:04 +0100
Message-Id: <20230111130206.29974-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111130206.29974-1-tzimmermann@suse.de>
References: <20230111130206.29974-1-tzimmermann@suse.de>
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

Including <drm/drm_fb_helper.h> is not required, so remove the include
statement. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 0e0f117bc70b..ca6d07d8c2c6 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -23,7 +23,6 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 80f154b6adab..af07d5e44138 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -33,7 +33,6 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
-- 
2.39.0

