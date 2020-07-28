Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E61231513
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 23:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E37589A98;
	Tue, 28 Jul 2020 21:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F296E89A98
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 21:43:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c3so4666080lfb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qtrD1m0VGdTp9PTK8GspKpjBRQxcqfdlirbPrN7AYX8=;
 b=jmAS+QfpV97wT/ivSKE6pAusLF6nGcvYM90ZcpcDoRQOQZIjZEHcc9629T8DKAW1cE
 FR4LU0QjDjQRXtlqmM+KAaTfMRyxCvk/LkP2UNLqbN79G4PaIpMJImH7A1clMLXLm091
 NLF4/qtOmzA2zFKpIkpFo15sSKywF9AHJx2qnvuV+FkdVZoL877q2JAAPYFyGHKLqRAB
 fCpCTogus4BPmG4FiTyXovuCC8JW+EovL5MgxzerbX6dESQMioSTJU1QOdK+2LN55YKc
 01gAT9TPD8NBm9M1yLQNyU5K/9+ArOxhkZI7X+Z6uXD0D1j+6OQ2uzG7XTzZFBWBlMPi
 EMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qtrD1m0VGdTp9PTK8GspKpjBRQxcqfdlirbPrN7AYX8=;
 b=HS7Z0AcMNN0Na1QlqNpXxeBSAqurncPaf+iLE/K6KAFccuWDHTGtKFmm/x8WXLt+Br
 RfWNYqwh4FHY6X56BJuO9Y4K/CSD8M+JTSvL6It4NgeW88P4VL7V0l1BipGPVMF+tXPz
 aglgzpFy35Qm2sTKBEYzcloWUzxPRQks314mqnl8cRCnSIIst2ui+rYpfu2PaJ4rMxUd
 yzkGeqbkimq/adxNd7cmjV5GoDpAubBhjvw0dsBGXZgQw0bprqfl/WzajUuhCYWNMRqx
 t3nGvLGoZfLVxJ49nMGfSYCn1Wc4/oUs6Yb8mnsT4tqPC6H+VN5J4umbzjNSEY+bAISh
 hOIw==
X-Gm-Message-State: AOAM533FD19Sq5GD7c20PeUusixIWqkbdg8jbRXeuWmad+/hm9a+AkXt
 ESfqWpDIWJPZJ6ckocVoF8/E/2UnMwys+g==
X-Google-Smtp-Source: ABdhPJxlZtDPEy8DOaF/A4wb4+Ps27vObSrQg8d/zk26XjIhBQ5KlMa1j1RQY3B3Ek/v+Z9gcANMnA==
X-Received: by 2002:a19:e11:: with SMTP id 17mr15439267lfo.34.1595972608083;
 Tue, 28 Jul 2020 14:43:28 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y1sm4664921lfb.45.2020.07.28.14.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 14:43:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/2] drm/mcde: Rename flow function
Date: Tue, 28 Jul 2020 23:43:18 +0200
Message-Id: <20200728214319.143213-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function mcde_display_send_one_frame() has a historical
name that stems from being implemented when the driver
only supported single frame updates.

Rename it mcde_start_flow() so that it reflects the current
usage.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 1d8ea8830a17..a99cc3fd5ef4 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -994,7 +994,7 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 	dev_info(drm->dev, "MCDE display is disabled\n");
 }
 
-static void mcde_display_send_one_frame(struct mcde *mcde)
+static void mcde_start_flow(struct mcde *mcde)
 {
 	/* Request a TE ACK */
 	if (mcde->te_sync)
@@ -1092,7 +1092,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 			 * is not active yet.
 			 */
 			if (mcde->flow_active == 0)
-				mcde_display_send_one_frame(mcde);
+				mcde_start_flow(mcde);
 		}
 		dev_info_once(mcde->dev, "sent first display update\n");
 	} else {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
