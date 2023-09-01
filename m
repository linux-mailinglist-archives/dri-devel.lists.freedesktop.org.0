Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270877901E6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 20:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1838510E831;
	Fri,  1 Sep 2023 18:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CACB10E831
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 18:06:11 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RcmDg0F4RzDrj8;
 Fri,  1 Sep 2023 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693591571; bh=DWXax1VVYxJLxtnHHUvwQtEKCPi0tNnnlOsivDnI+jw=;
 h=From:Date:Subject:To:Cc:From;
 b=jMgVAI62yyAGOyMSsAhzqyeyJU2rhJ9a/GN3BcXLjsROxSZvVCsSbcmhWlojc9Q7F
 SDJEknGIQiKnUeKmljuhpUvHBgFAymsShP2JBeWhsfYwqmv0I8XsFoH4RSPcld/72u
 K1CmuGXuL4DZ22nUi/NmWlq23PR3ApQjPvrUXvws=
X-Riseup-User-ID: 4823884539E9B3C13ADCFB1C515D7D4A3A8AA806180CE3A2D768A06060843233
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RcmDN3TPVzFs1Q;
 Fri,  1 Sep 2023 18:05:56 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 01 Sep 2023 15:05:50 -0300
Subject: [PATCH] drm/debugfs: Add inline to drm_debugfs_dev_init() to
 suppres -Wunused-function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230901-debugfs-fix-unused-function-warning-v1-1-161dd0902975@riseup.net>
X-B4-Tracking: v=1; b=H4sIAP0n8mQC/x2NSwoCQQwFrzJkbaBnRGG8irjoz+s2mygdW4Vh7
 m5wWfDq1UaGLjC6TBt1vMXkoQ7zYaJ8j9rAUpxpCcsxrGHmgjRaNa7y5aHDULgOzS/3+BO7ijZ
 ekRJyKud4iuRPzw6f/yvX277/AEgifIh1AAAA
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Cc: tales.aparecida@gmail.com, Maxime Ripard <mripard@kernel.org>,
 mairacanal@riseup.net, Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_DEBUG_FS is not set -Wunused-function warnings appear,
make the static function inline to suppress that.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309012114.T8Vlfaf8-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202309012131.FeakBzEj-lkp@intel.com/
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 include/drm/drm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 9850fe73b739..e2640dc64e08 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -584,7 +584,7 @@ static inline bool drm_firmware_drivers_only(void)
 #if defined(CONFIG_DEBUG_FS)
 void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
 #else
-static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
+static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
 {
 }
 #endif

---
base-commit: 8e455145d8f163aefa6b9cc29478e0a9f82276e6
change-id: 20230901-debugfs-fix-unused-function-warning-9ebbecbd6a5a

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

