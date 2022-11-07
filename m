Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561ED61F3C2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C510E302;
	Mon,  7 Nov 2022 12:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA7710E301
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:53:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 760871F8AE;
 Mon,  7 Nov 2022 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667825614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvpeQeKRqt5kWr5q93jDVXQIKhKyr9gvMsh64HXmIaA=;
 b=f7pSmjx2jylKne3cwz8GR9XSQTX5O3hIQtVJr+vJ00X2zZv7YZ5mW4jzeQwASLSKoa0wLs
 xCzSLZKQX8yRafOqUhmcoS5R/KUiSTuBVl4v3Uh5+2o3Rat9NQJgjmYcgsVu8B9qna9nsy
 HWyQu/dG60TMsS7zT06BHn/WXnf7PAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667825614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvpeQeKRqt5kWr5q93jDVXQIKhKyr9gvMsh64HXmIaA=;
 b=uQhP7AQiNq5uWbUPTs7JDV/m3VBWHsfWmm9cuT3Ptjzzk4Prd3dZeLb2Tz/cy6vZ/jReh0
 BAH+iga1SocIFGDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3725313AC7;
 Mon,  7 Nov 2022 12:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6EaSDM7/aGMDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 12:53:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com
Subject: [PATCH 2/3] drm/hisilicon/hibmc: Include <linux/io.h> for readl() and
 writel()
Date: Mon,  7 Nov 2022 13:53:28 +0100
Message-Id: <20221107125329.12842-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221107125329.12842-1-tzimmermann@suse.de>
References: <20221107125329.12842-1-tzimmermann@suse.de>
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

Include <linux/io.h> to get readl() and writel() on S390. The error
message is shown below and a bug report is at [1].

  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c:75:15: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
     75 |         reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
        |               ^~~~~
  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c:80:9: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
     80 |         writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
	|         ^~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 45b64fd9f7ae ("drm/fb-helper: Remove unnecessary include statements")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/dri-devel/202211060608.qrTg8b2E-lkp@intel.com/T/#u # [1]
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index c228091fb0e6a..8c6d2ea2a4729 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -11,6 +11,8 @@
  *	Jianhua Li <lijianhua@huawei.com>
  */
 
+#include <linux/io.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_print.h>
-- 
2.38.0

