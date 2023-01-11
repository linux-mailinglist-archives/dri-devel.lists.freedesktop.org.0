Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA30665C0A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C4310E73C;
	Wed, 11 Jan 2023 13:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC84310E092;
 Wed, 11 Jan 2023 13:02:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F7E07725B;
 Wed, 11 Jan 2023 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673442132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWBPEe6YpFe509uZsCP6V7S/y2k21Y9i4CjZJQwrAUo=;
 b=yUZqAebhnwPYIAVzUmaFOX9qDQsie0o/ruNbdAZCK+YLQAA+rNNlRYg+oWD1OiJCFKVuwy
 0CBHgnLvr+pPsKUp2AW7h6U5V8bKwAXpKCFZ3VL2x2hN0iiJYpLwm5zxqOE4DgJiu2TWe0
 SIDstMPxFoLhxtdtp5+yoP0fgcqkNvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673442132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWBPEe6YpFe509uZsCP6V7S/y2k21Y9i4CjZJQwrAUo=;
 b=KPOgluwCiZ7Wd5HZJKgCR4pM8VdPV5T81HgTenxhjL+JunApd/QyQ7f/fbZ0pp00OlHmg/
 8SAxjLU2O/fuAbCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00C5813594;
 Wed, 11 Jan 2023 13:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UKAGO1OzvmMaXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:02:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
Subject: [PATCH v2 07/10] drm/amdgpu: Do not include <drm/drm_fb_helper.h>
Date: Wed, 11 Jan 2023 14:02:03 +0100
Message-Id: <20230111130206.29974-8-tzimmermann@suse.de>
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
statements. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 1 -
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c | 1 -
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 1 -
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 248f1a4e915f..a2452fc304c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index cd9c19060d89..6ac680c4c6e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 76323deecc58..354ae09cc9a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -23,7 +23,6 @@
 
 #include <linux/pci.h>
 
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 01cf3ab111cb..33977b0ba19d 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -21,7 +21,6 @@
  *
  */
 
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
-- 
2.39.0

