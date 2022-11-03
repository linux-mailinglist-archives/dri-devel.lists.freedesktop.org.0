Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E007618BEC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C71B10E696;
	Thu,  3 Nov 2022 22:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F4110E68B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:44 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id v28so2949226pfi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N8/+/JIqGhRdWPBU5DgQgVG5PddEig7kZCemfbVVSWk=;
 b=joKcDIo53uF/X/ri0TVqrbYd46qxLzHt1sPTdQ6F4of7rlMLUz2kVuQGx4lj/zZZN7
 MX1ZLFL1Y74ZoPB2U2fdocD/TOdGb4cbMLDmpjGAXiIOBUbsoAjMFPl5/LIT4H+dq2UB
 ft28wtBmK1+aBeXAwo5OwWwAfu9/8Pi10JBxoVgYMCYKQEpJa3Fx0sr2LA9nAMaIsR1H
 TqDwvyOGyqqm52IGJdXbp40JEGl3LEjOwgg4cFTHhfXDipKjbOu21p0xCEDN2CcxW0Bu
 e+oV//qLZBEUlkRyrTc69/4tj69Bh1Cv6hJyWfEHDH8esasjWyhX0e6Yu0QypHSb2FgC
 65pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N8/+/JIqGhRdWPBU5DgQgVG5PddEig7kZCemfbVVSWk=;
 b=ypK7kbhneBGDMPA6xEdrjpJNUGHT0ZLcTfLKhoXVW/KJSNkfRE5cIrC1lE7wEQtObE
 btrO3xQPIOmzel06gr8nlbyJq4sy5BEdnYKwk1wFMVtt+pBXYeK4vmqYDX9xCl8WWL/w
 1A7rB1KX7Gjh2g/IhZTg/6Gj3FJhKWoc5pGkAHILWL1FG+cspSU8TymiL9sOWSC3j18J
 C5O+gYM7ZDUAUAfT54YvPtj1M8gtp3CP+TpScs6brhoTKxtZHMxt9Kzt2gnBfIym9GIn
 NzvsZSSU5ZI5bkjk5JsHXE9eTsKmVXAHzWiQM7tkp5EeHFxF75JU6GEFy+uz+IKoBkrH
 La9w==
X-Gm-Message-State: ACrzQf2Q9+/yZ6P4GFHTMFdcZl6mZmxwVwiOgWjEcbBorBUJLd5ElAQN
 sco1pnkF8gqZcjRiUYgxmHM=
X-Google-Smtp-Source: AMsMyM5xc8N/TFyejcgTPKHGTjifStmuqApnl4vzp4mPXdiI3ti0O1q8N0M7Fig9UrInNnvQ5tT5vQ==
X-Received: by 2002:a65:6b81:0:b0:461:4049:7df7 with SMTP id
 d1-20020a656b81000000b0046140497df7mr28159542pgw.593.1667515664355; 
 Thu, 03 Nov 2022 15:47:44 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 13/13] omapfb: panel-sharp-ls037v7dw01: fix included headers
Date: Thu,  3 Nov 2022 15:46:56 -0700
Message-Id: <20221103-omapfb-gpiod-v1-13-c3d53ca7988f@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is using gpiod API so it should include gpio/consumer.h and
not gpio.gh or of_gpio.h.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
index f1072c319de8..cc30758300e2 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
@@ -7,10 +7,9 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>

-- 
b4 0.11.0-dev-5166b
