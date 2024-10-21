Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DAE9A6BA5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E178810E526;
	Mon, 21 Oct 2024 14:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aykD1+wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1C10E52F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:22 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A12E1A42;
 Mon, 21 Oct 2024 16:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729519595;
 bh=jpnOTkj0fNXVQ3yCGYsDhuDxmQz1B6JkpFLaV5xXSec=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aykD1+wt8oby67aKd/vaulNKzqy7EPtkzQ4YMfPCB/SrjmHdrZbijZDI4humbwkln
 8nWDkqwesIbYovnixKBbgXyG0vSJP7Ax8DRxL1yEgt1kUGoyCNJ5hkuMWvtv9NWgtH
 X+/Vmjmo2Scyu5m0m01HPvm14+DwhIAAsbGm2+3o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 21 Oct 2024 17:07:51 +0300
Subject: [PATCH 7/7] drm/tidss: Rename 'wait_lock' to 'irq_lock'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-tidss-irq-fix-v1-7-82ddaec94e4a@ideasonboard.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4886;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jpnOTkj0fNXVQ3yCGYsDhuDxmQz1B6JkpFLaV5xXSec=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnFmBOko8rk+qt7zvORjAV6I1uMYTrQb18qr0eW
 sWkT9HwM4CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxZgTgAKCRD6PaqMvJYe
 9U68D/0eolU7amxwxfeLI2ElMHOnplqY+Z42Bf4cHt1sCvjG7FTh1apr/vprUD/a1xxIaBXp0Nj
 Otf6Vh6nvmOFj4TJt7y9Oh7wYyYr2x7nilhKZoVvIg7MGdN+M/LX6JR1u/Jf7SJaw9hkcm66Vwt
 XTDgUoAT0bIGURsdSFcrPeirXn4pddVevssWUqwUrTHOF3RcupAOyMmAEGARW8mL76Eb86Oi54S
 cLjqyI9hl2ePoVB9bCEBoO3gjTd7/PO/I9jkXyZdnKIRyM7UVvydwv1i8jfbV7gI1EBvRondZ63
 PO9xD2WGgA2wSJViu+ojDF+F768eqFZhbnQrmEs7hrmhUCOr8KBjXUNmJOhm/Qbzhf9l+kRCJxe
 DGdlo/vo6wEDTq9g0HdtM6pG96qXor/cCgAsdqbNEkHjr7hGqYxedwlJ+s8McqocAWQk77El0fT
 kIqVnkSya1dGOHeTPbBBX1jEO2RX3u4LwzXMVD3acQIv85WzmzEQJt44I4+VBFREoiufX+RJ+2o
 wYe5qRdy+prCX34imZ8OcBU59BYLP5sqja0F8wuYLD3gQm3rODQ1/EaYFw7Dt3POz0Dy852Zed2
 EkywHKtTU48z8Tnm5SmqBHzDzWO6xq8AGZZGgVKSNBxGIQ0kHDwV88mL5mgmVZnz4ckbBbFJx0R
 5n+rzgKFjcrrVrQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'wait_lock' name seems to be a copy-paste from omapdrm, and makes no
sense here. Rename it to 'irq_lock'. Also clarify the related comment to
make it clear what it protects, and drop any comments related to
'wait_list' which doesn't exist in tidss.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c |  4 ++--
 drivers/gpu/drm/tidss/tidss_drv.c   |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.h   |  5 +++--
 drivers/gpu/drm/tidss/tidss_irq.c   | 19 +++++++++----------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 07f5c26cfa26..cacb5f3d8085 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2769,10 +2769,10 @@ static void dispc_softreset_k2g(struct dispc_device *dispc)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&dispc->tidss->wait_lock, flags);
+	spin_lock_irqsave(&dispc->tidss->irq_lock, flags);
 	dispc_set_irqenable(dispc, 0);
 	dispc_read_and_clear_irqstatus(dispc);
-	spin_unlock_irqrestore(&dispc->tidss->wait_lock, flags);
+	spin_unlock_irqrestore(&dispc->tidss->irq_lock, flags);
 
 	for (unsigned int vp_idx = 0; vp_idx < dispc->feat->num_vps; ++vp_idx)
 		VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0, 0, 0);
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index d15f836dca95..c7de8c9fa12e 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -138,7 +138,7 @@ static int tidss_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tidss);
 
-	spin_lock_init(&tidss->wait_lock);
+	spin_lock_init(&tidss->irq_lock);
 
 	ret = dispc_init(tidss);
 	if (ret) {
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index d7f27b0b0315..7f4f4282bc04 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -29,8 +29,9 @@ struct tidss_device {
 
 	unsigned int irq;
 
-	spinlock_t wait_lock;	/* protects the irq masks */
-	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
+	/* protects the irq masks field and irqenable/irqstatus registers */
+	spinlock_t irq_lock;
+	dispc_irq_t irq_mask;	/* enabled irqs */
 };
 
 #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 8af4682ba56b..5abc788781f4 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -15,10 +15,9 @@
 #include "tidss_irq.h"
 #include "tidss_plane.h"
 
-/* call with wait_lock and dispc runtime held */
 static void tidss_irq_update(struct tidss_device *tidss)
 {
-	assert_spin_locked(&tidss->wait_lock);
+	assert_spin_locked(&tidss->irq_lock);
 
 	dispc_set_irqenable(tidss->dispc, tidss->irq_mask);
 }
@@ -31,11 +30,11 @@ void tidss_irq_enable_vblank(struct drm_crtc *crtc)
 	u32 hw_videoport = tcrtc->hw_videoport;
 	unsigned long flags;
 
-	spin_lock_irqsave(&tidss->wait_lock, flags);
+	spin_lock_irqsave(&tidss->irq_lock, flags);
 	tidss->irq_mask |= DSS_IRQ_VP_VSYNC_EVEN(hw_videoport) |
 			   DSS_IRQ_VP_VSYNC_ODD(hw_videoport);
 	tidss_irq_update(tidss);
-	spin_unlock_irqrestore(&tidss->wait_lock, flags);
+	spin_unlock_irqrestore(&tidss->irq_lock, flags);
 }
 
 void tidss_irq_disable_vblank(struct drm_crtc *crtc)
@@ -46,11 +45,11 @@ void tidss_irq_disable_vblank(struct drm_crtc *crtc)
 	u32 hw_videoport = tcrtc->hw_videoport;
 	unsigned long flags;
 
-	spin_lock_irqsave(&tidss->wait_lock, flags);
+	spin_lock_irqsave(&tidss->irq_lock, flags);
 	tidss->irq_mask &= ~(DSS_IRQ_VP_VSYNC_EVEN(hw_videoport) |
 			     DSS_IRQ_VP_VSYNC_ODD(hw_videoport));
 	tidss_irq_update(tidss);
-	spin_unlock_irqrestore(&tidss->wait_lock, flags);
+	spin_unlock_irqrestore(&tidss->irq_lock, flags);
 }
 
 static irqreturn_t tidss_irq_handler(int irq, void *arg)
@@ -60,9 +59,9 @@ static irqreturn_t tidss_irq_handler(int irq, void *arg)
 	unsigned int id;
 	dispc_irq_t irqstatus;
 
-	spin_lock(&tidss->wait_lock);
+	spin_lock(&tidss->irq_lock);
 	irqstatus = dispc_read_and_clear_irqstatus(tidss->dispc);
-	spin_unlock(&tidss->wait_lock);
+	spin_unlock(&tidss->irq_lock);
 
 	for (id = 0; id < tidss->num_crtcs; id++) {
 		struct drm_crtc *crtc = tidss->crtcs[id];
@@ -95,9 +94,9 @@ void tidss_irq_resume(struct tidss_device *tidss)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&tidss->wait_lock, flags);
+	spin_lock_irqsave(&tidss->irq_lock, flags);
 	tidss_irq_update(tidss);
-	spin_unlock_irqrestore(&tidss->wait_lock, flags);
+	spin_unlock_irqrestore(&tidss->irq_lock, flags);
 }
 
 int tidss_irq_install(struct drm_device *ddev, unsigned int irq)

-- 
2.43.0

