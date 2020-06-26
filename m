Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F720BC21
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 00:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BF36E4EA;
	Fri, 26 Jun 2020 22:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98226E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 22:06:12 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n23so11886718ljh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 15:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1LB1VXGH8kQzqGN0P7HNesA1HZwNg1/02KI9Dxaxp0=;
 b=IQpufVHOqHMJLb1pnuQscCfYWtF0HH2z5admduSl4yqVKDbs01hcZnuR6cN5y2oxQB
 pwdc/CK9eGtxDIH/SvBnPvDUNKVdTKaPFkDt/kJimI0bNX4NzqJ4n8mlQJ3puWo+NUUu
 hbkveEflJzk6WtK56Ys0wh17KNrU2nHXQiuvVL+6gLaNUX5d4s89pEBrtSNxyawjHisA
 MyNom/JhG3TfJrFU0t4i7Hs9I2mKgxK9M2cvfYhHfm33ewOYEolV/RbY37U7RaAeaRX/
 wsniUVF2oRafEmyQyD4Qm/nNS3R2j7uuHjv5RuPvieLdCGlUyILvqPVemSUOlC50Wz0W
 jQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1LB1VXGH8kQzqGN0P7HNesA1HZwNg1/02KI9Dxaxp0=;
 b=c6Ej/eYzq4GAhG1L1VuP79JMWmNrZUuqJOnS2D+WCTWB1w4G8FY9kXXZhKKYbde1yI
 i6x1tXai4IeVqg1PFHnkK0ZQqrNewh+8/gL+wrgO0BY36KzVzossu9z6TDYCrykHlnfd
 TmbT7EQH3rU4dgCOkOMoIhS22JgYvTiAJRx4foXilqly2UirFDOwh4ttSK6f07AE5dlT
 dDlf2hioKDEMi9vZEKwMFFet+VIpNd49Tna3slN7Y1TJzQ5aTiOX2YMCoxq0OCTVmQux
 hZKTTwB0RwWm94RL39OZop8QxC/YdEfCSPmFXyn4sMzOA19qmhEMBDxpCu1ISb0CUjWR
 b5vg==
X-Gm-Message-State: AOAM533WmBCYFDGM6URlQAa984PWptO/1ib9xbhUAlKX5TDTXjZMg/vJ
 DyB4EYGciglrxPA4v1xP1t70kxBPR4M=
X-Google-Smtp-Source: ABdhPJy9nHcjpUrY/j32M5pedAXBGDeBnKip/oL7TAKTd9p8sPec7qbptR6+sNeakChWKHcTh2MI6w==
X-Received: by 2002:a2e:6f14:: with SMTP id k20mr1436210ljc.224.1593209171072; 
 Fri, 26 Jun 2020 15:06:11 -0700 (PDT)
Received: from genomnajs.lan
 (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
 by smtp.gmail.com with ESMTPSA id 4sm5688943ljq.34.2020.06.26.15.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 15:06:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: omapdrm: Delete surplus GPIO includes
Date: Sat, 27 Jun 2020 00:06:06 +0200
Message-Id: <20200626220606.340937-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
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
Cc: Tony Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OMAP DRM driver includes <linux/gpio.h> into the two
hdmi4.c and hdmi5.c files but does not use any symbols from
these files. Drop the includes.

Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 1 -
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 2578c95570f6..a14fbf06cb30 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -20,7 +20,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 4d4c1fabd0a1..b738d9750686 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -24,7 +24,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <linux/of.h>
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
