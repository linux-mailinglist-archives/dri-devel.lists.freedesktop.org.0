Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2467F8FC7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 23:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0BD10E061;
	Sat, 25 Nov 2023 22:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1110E061
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 22:25:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 569BD8708D;
 Sat, 25 Nov 2023 23:25:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1700951117;
 bh=DiT57hUoYSN3U8Tkk7Pbx8uMvcqoZ5wc1mpLdcuXvno=;
 h=From:To:Cc:Subject:Date:From;
 b=fNCJ3VdQ+FueNzx3Gd9LvDXL7YdNzRgnzMp765UXUrFh74w/HGZZxqpAQwcWyEkFj
 uB1HDtaSW3xwKGn0MNpKR75ZbnO3w77A0XxLSjNC0cJJvUy/3+qKHFUHOdwMozAvq+
 /nU4ZARMqcdtDWmOrgfUtyi+e/se2UyVgymj50LRQjPir6VSpC48Nz4xkdyyYKdS+o
 McL5hyy6VWz+3KsZvh70SUWkp3lOFBMJnWetvw9amZaxixLMEAryqLdjg3wRCzBuH7
 tVHUx1u7OHnyFF6kLtD1VK9fCtQ8JQGoq0lN0aqWAWiJq6pE6cGvQs4zux3zHqzGw6
 sm5DnTncQDwTA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mxsfb: Drop extra space in request_irq args
Date: Sat, 25 Nov 2023 23:24:41 +0100
Message-ID: <20231125222504.97744-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop extra space, no functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 625c1bfc41733..3bfa369b2507e 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -197,7 +197,7 @@ static int mxsfb_irq_install(struct drm_device *dev, int irq)
 
 	mxsfb_irq_disable(dev);
 
-	return request_irq(irq, mxsfb_irq_handler, 0,  dev->driver->name, dev);
+	return request_irq(irq, mxsfb_irq_handler, 0, dev->driver->name, dev);
 }
 
 static void mxsfb_irq_uninstall(struct drm_device *dev)
-- 
2.42.0

