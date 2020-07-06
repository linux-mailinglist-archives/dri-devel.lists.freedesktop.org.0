Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E34D2157EF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 15:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6927389FC9;
	Mon,  6 Jul 2020 13:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD35F89FC9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 13:01:37 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n23so45264738ljh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mtt8Mk4JOxi/4FfFeFWNkOZ3Q/5td2rTxqGHn99A+/s=;
 b=lH9MF0c6De28x+H93biRJgfLDvOYfBz7te9eetbgmeXZ7d3SSsKiUcnx8kgR5p0cwt
 pT4cT5kJWnCf6cz9u8jQ9V4XYmAlJEfhA/dfOgPoLFcN90UYx1o+lC75zJPgZdq+SpJD
 bY2UinnjZeINWCp0fUfw9XJqlHR4DEX0+inR67VG3hNLfKZdB3X71yJVu2JAtlxKp+Od
 kZ6tuixr/eJDk3RQk/Vcx2lJD8guwRCWsasUS8fXvs8cLx/pG9q73ad0NHrgS01Hiy9Y
 WLAkhlR6uhPVl5LFh3i9PAI6imOWEAOekiyy9z2e0b8vMI//IMmZJBlZZ6SpS3y8V0en
 /UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mtt8Mk4JOxi/4FfFeFWNkOZ3Q/5td2rTxqGHn99A+/s=;
 b=RxOVzIa71mXREm8jxPSs8/srGzFSoCs8nARO2+0wrhOTTYKk2Uo0f3HX+Akt9ShJ3S
 cnT9RcjoYC4vFWl6P5iDf9/jbG2Hbt5SaPVX6/OQ/x1or1T/i4ggdY+M7e5R1wnaxq+2
 lU9oHhgz+bigudJI77+mZz51QuBd3or6GhTjBgHzLQpeI/frcR8FzWL8rj8l6/NEnQmO
 XpA8X1+wwGXrYdK8q/N19vfD2cF3UmEyt04XbVsLDHKYDw88NpsYtQGskbf0NcDO/Q20
 uBnripToNID1fn523Wn+kV83+z+41dlHDHdVgoyq7AiX9fT5p6QRDOebWquxOHY8gRB5
 iQpA==
X-Gm-Message-State: AOAM533y1JTYJxEGU5tYckNgYZQNGw69B/WKh/lfgL8hRWV4ZGIc4GaF
 La6Tq6SG17avWgxJRpcpM4qjmFoq1/Umpg==
X-Google-Smtp-Source: ABdhPJzRnkdSFyFa8m6GLmRN9S/spfNiUqNdpmSf+HnalZ4lQJeUB4oKjBCSOaWsgai6Mw515wF2uA==
X-Received: by 2002:a2e:9d86:: with SMTP id c6mr22550051ljj.418.1594040495797; 
 Mon, 06 Jul 2020 06:01:35 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id c27sm8875070lfm.56.2020.07.06.06.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 06:01:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] omapfb/dss: Include the right header
Date: Mon,  6 Jul 2020 14:59:31 +0200
Message-Id: <20200706125931.752539-1-linus.walleij@linaro.org>
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
Cc: Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdmi4.c and hdmi5.c files include the legacy GPIO
header <linux/gpio.h> but does not use any of the symbols
from this file.

What it does use is the implicit inclusion of <linux/of.h>
leading to compile errors if we just drop this include.

Include the right header.

Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Tony if you're OK with this patch I will merge it through
the drm-misc tree once you ACKed it.
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 7060ae56c062..f2d65aed7f76 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -19,7 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index ac49531e4732..d14d339f7fdf 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -24,7 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
