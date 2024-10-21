Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A79A6B9D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2A510E52B;
	Mon, 21 Oct 2024 14:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TBlze24y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B1610E524
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:18 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A05C17D6;
 Mon, 21 Oct 2024 16:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729519592;
 bh=350svTouqCIMYauO1zF9sxUQfeZoXKejVvPzh3lweDI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TBlze24yHdB+GbFvSJ/ta+JIv/NeZs9S/J2cq5gbrelXj7vStwUGyUcNDzRGM5wyK
 FS2PWFh/SvR5rmCziL3Ou/RELIkWKSt3DnStTyoickQOkY/QDV68wdPdVQS1XeKrMe
 rx6LlWp/XAhW/dDr84THGT10qJP2qCNs+Tv/YD4Y=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 21 Oct 2024 17:07:46 +0300
Subject: [PATCH 2/7] drm/tidss: Remove unused OCP error flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-tidss-irq-fix-v1-2-82ddaec94e4a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=350svTouqCIMYauO1zF9sxUQfeZoXKejVvPzh3lweDI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnFmBNsgrP8qGufXs4zHnZF5Q2pRBIcxHuB7Kjj
 clhLaP/ggqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxZgTQAKCRD6PaqMvJYe
 9Qy0D/49SO1ruUUf7vq4nt97FHX1gbimghNP9szatVeaOuAM+DDbfCYpvPAs+xAtSxoyb0qZc2G
 ykekOU7vSafkJUlhQH4mgM8GerqMT+6Fi/Aj6fMJ3Yb3BTP1W0eDgoLMIv1fFGhFClVHYtCQ/Xm
 otkqwUYJouZBZ2t3v5IMi+BbxDOtJmSjw/O8pkQkfK6wWXhwa3aSOMhsxQqT+ftgSbXecgVUrAk
 4csNf+mbzWNK/vAh3ZN+cYoyGAlNNgRNpj6TBAhS6I7FCNcsnw/kfgPzSIW+5XE8ESQMslKgDKw
 vczJT/Z3OpiW4hKcY6qUkuRQpbdIMeg41621AKGeu3kukuM1RiRC6MsSXutD3T4DfKyb2wBr7uq
 mozdH9rkN4jZAy9Dj7d6ul302lFBQahVChW6dUuPGQqQ4VnrvWULARG+X/NhOSOsh01nqCS6Xjf
 uUCEMUhihTgtq8NCLTDQ9ZvwxiteTyxVBgPJ58jEdCRbwRWxxW6k1YZLWQ/xVAr8t/ZYfBQwAog
 1ll7wGDvzCMjv5KKpvyyIWY64+Q+EWFDAF1eO+F3zcVBY3cNneWfEl+lL4MO5FiomWgvoTYCxpo
 kvaWAPLv/9fSpFIfoZfNWRdITa+qPY6JmKZfTLaQx7D65YcCcpBzM5m4hEJH4oKXvMM9a3AzBIv
 Fvsq4sv6dyBiTAg==
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

We never use the DSS_IRQ_DEVICE_OCP_ERR flag, and the HW doesn't even
have such a bit... So remove it.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_irq.c | 5 +----
 drivers/gpu/drm/tidss/tidss_irq.h | 4 +---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 604334ef526a..91498ff664a2 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -78,9 +78,6 @@ static irqreturn_t tidss_irq_handler(int irq, void *arg)
 			tidss_crtc_error_irq(crtc, irqstatus);
 	}
 
-	if (irqstatus & DSS_IRQ_DEVICE_OCP_ERR)
-		dev_err_ratelimited(tidss->dev, "OCP error\n");
-
 	return IRQ_HANDLED;
 }
 
@@ -105,7 +102,7 @@ int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
 	if (ret)
 		return ret;
 
-	tidss->irq_mask = DSS_IRQ_DEVICE_OCP_ERR;
+	tidss->irq_mask = 0;
 
 	for (unsigned int i = 0; i < tidss->num_crtcs; ++i) {
 		struct tidss_crtc *tcrtc = to_tidss_crtc(tidss->crtcs[i]);
diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
index b512614d5863..dd61f645f662 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.h
+++ b/drivers/gpu/drm/tidss/tidss_irq.h
@@ -19,15 +19,13 @@
  * bit use   |D  |fou|FEOL|FEOL|FEOL|FEOL|  UUUU  |          |
  * bit number|0  |1-3|4-7 |8-11|  12-19  | 20-23  |  24-31   |
  *
- * device bits:	D = OCP error
+ * device bits:	D = Unused
  * WB bits:	f = frame done wb, o = wb buffer overflow,
  *		u = wb buffer uncomplete
  * vp bits:	F = frame done, E = vsync even, O = vsync odd, L = sync lost
  * plane bits:	U = fifo underflow
  */
 
-#define DSS_IRQ_DEVICE_OCP_ERR			BIT(0)
-
 #define DSS_IRQ_DEVICE_FRAMEDONEWB		BIT(1)
 #define DSS_IRQ_DEVICE_WBBUFFEROVERFLOW		BIT(2)
 #define DSS_IRQ_DEVICE_WBUNCOMPLETEERROR	BIT(3)

-- 
2.43.0

