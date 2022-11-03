Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B12618BF2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CB210E6AA;
	Thu,  3 Nov 2022 22:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BD110E68D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:47 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id q1so2900890pgl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N8/+/JIqGhRdWPBU5DgQgVG5PddEig7kZCemfbVVSWk=;
 b=KMS2lx6NjqbbtJBHBQlzUb3ZBXATSCTMYfw1Cm4IXyIJmn0q6jTLJGsCSrmg20h9dG
 9RJdp+UokoXct9v4tp4rgJqDwUZF9llphbcpZ4REl9RjG1A8Yo+x4q26QJly44Q0ofmi
 Ky1J/hC/o4SBr6qGI+bmAQr9EQJ0Dl8Q/QAlrCeT9rWFXaAD8mLoYXP84dCS2PFRXBKm
 C8Y19S0GO0xjPlFOJMSraX8/0hcIHSZ9RzFHL3O1DH7/14hnQNC5ssVjpUqS7x+SeJJd
 mDitZDIi4BQ/X1yXv96mKkTEqhbjAtZB2WRFdFqke2Wl/bM1ecOoqUMy1RnV3qqizemU
 /RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N8/+/JIqGhRdWPBU5DgQgVG5PddEig7kZCemfbVVSWk=;
 b=satXdpKNKxrinVTS1N9I4yV0kMw3YReh9vjYhAwoxW0mCJxNZGYjWZ7iZWSOi9rVVS
 Ogb4+2vPeyP3GvZYz9A3cvCWokTY8OzMB1NkiwwxH8AhacxhcZjU9sx5wWZGsdI34XDT
 p2VZy472V3GjCHwSPr2WUC5d1B7+n6w4c3vFdd6oW/BkCB95TEHtWb3JxNX3Tz0LR6Ti
 BxuTGbVgjGX1gb8LyfAIXM26cijFTyC6Aq1SGTyxwzphHWM222bqDwlQHG7bjB1Dy9Ds
 cjREvvXkndKwzvFejf7pUf6PFvDH0XWNjFsLdw01mMahBVpDP5b0+y3xhcazcJbw57Fi
 Qg8A==
X-Gm-Message-State: ACrzQf2MzjX6LS1uKz3ynKoEv9ByR4Ibm5q5WUbBo/qPz4dijcSqLk14
 XGWZUyLzH8hlltlMq/lXBKs=
X-Google-Smtp-Source: AMsMyM7vRsjfLECFVoY28KW7UAqPNWwOlMPiT3cgcVY1cs86uQTDBkyLIsXU9h6wGlKH7Sk4Z3XLMA==
X-Received: by 2002:a63:6909:0:b0:41c:9f4f:a63c with SMTP id
 e9-20020a636909000000b0041c9f4fa63cmr29047251pgc.76.1667515666418; 
 Thu, 03 Nov 2022 15:47:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>, Helge Deller <deller@gmx.de>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 13/13] omapfb: panel-sharp-ls037v7dw01: stop i
Date: Thu,  3 Nov 2022 15:46:57 -0700
Message-Id: <20221103-omapfb-gpiod-v1-13-8f92cc78ecfc@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-8f92cc78ecfc@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-8f92cc78ecfc@gmail.com>
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
