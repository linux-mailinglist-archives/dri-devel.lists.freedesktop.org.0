Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DDA5144F7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86FF10FA7E;
	Fri, 29 Apr 2022 08:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44B610FA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:59:55 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id o69so5216954pjo.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cfQQ6kIuyBuouEPLJ2XzvmY09Tm8WP7/zlQvfxQJkSk=;
 b=MAc+Cq2VJGbLP09AxqYmwKWFRHfoR0ur0XXDrroRb6zcMVW1IkSjfPz9fIrR5qWRHa
 t/0ADSVMSLQyQ0U2XL5dRtwu44GMflvkuiKjLPU1dzSR4UK7Cr6bXloKdDXqfUlCeuH6
 wePRZ1Q23v/xF8ETO9siwtVl4RBjBZ7It7taY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cfQQ6kIuyBuouEPLJ2XzvmY09Tm8WP7/zlQvfxQJkSk=;
 b=27XM1jTeAIt4NBpDLWy4dhLqQxKFyQj+XlEOGWV7bhQaB5SeFF6rbx8zoRfs1VElGi
 rx1I5zOXe85W/xAPrGu0E5IPh0SN9TSomJPQF5s3Fv96YKEvnFeDerXiz3gh54QQQ/XF
 ylUxxpqLSFmMqnjv89thoCMtB79MoNKl1bqqoi5QyktvAKOQlmj+gjKqKm90+MNRbAKj
 fC3p+K4GFR0Se0zRrMizOsqVbT6DLN2FStggapCWQrO49VqcD8cZ7CMvYp3XpR2zTb5y
 ZxhF0q+QrmdgX/Wl2OeZJ68nWdnGhI2Z2OOcRz32gutO1SdgWOFNpbtuFupSyq/idHWq
 Uk/w==
X-Gm-Message-State: AOAM531OeTgLa/g8WklZSYZHBMhCN58Jby2l3W4xIhI76qKZfFfsVhru
 RBhbbOSiVm4iJMFiSJZT2S+IQw==
X-Google-Smtp-Source: ABdhPJwnlxxyqK/l5LBTQEMu1uiWtqPSpdX0C9s+O7C9EUeH06MZp08Xt6Xjs3qsMSaAvVMsudZUiA==
X-Received: by 2002:a17:902:f544:b0:15c:fa6f:2630 with SMTP id
 h4-20020a170902f54400b0015cfa6f2630mr28260580plf.110.1651222795391; 
 Fri, 29 Apr 2022 01:59:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:b5c3:f85c:afa7:cae9])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm2453085pfi.42.2022.04.29.01.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:59:54 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RESEND 1/2] Revert "drm: bridge: mcde_dsi: Drop explicit bridge
 remove"
Date: Fri, 29 Apr 2022 14:29:46 +0530
Message-Id: <20220429085947.1699963-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit <3730bc6147b0> ("drm: bridge: mcde_dsi: Drop explicit bridge
remove") has removed downstream bridge as it's prior commit <3d7039e1e649>
("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge") added
devm_drm_of_get_bridge for looking up if child node has panel or bridge.

However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
has panel or bridge") has reverted panel or bridge child node lookup
from devm_drm_of_get_bridge as it breaks the non-trivial cases the
first child node might not be a panel or bridge.

So, revert this commit to switch the previous behavior of looking up
child panel or bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Notes:
 Nothing changed for RESEND.

 drivers/gpu/drm/mcde/mcde_dsi.c | 44 ++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 083a4728654d..5651734ce977 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -19,6 +19,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -38,6 +39,7 @@ struct mcde_dsi {
 	struct device *dev;
 	struct mcde *mcde;
 	struct drm_bridge bridge;
+	struct drm_panel *panel;
 drivers/gpu/drm/mcde/mcde_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 960b49ea2ee5..083a4728654d 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1122,6 +1122,7 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
+	drm_bridge_remove(d->bridge_out);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }
-- 
2.25.1

