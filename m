Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A094618EC7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF9410E6E6;
	Fri,  4 Nov 2022 03:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AB810E6DB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:17:05 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d24so3745795pls.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22K6PkYhm2RTgFl8J7eI0rFuhmRuZ1tgOi7SiCNakIU=;
 b=eCUOSzJCGIv89jR1mrjL7outaakI25Tfv5DG+xELHqaVFDajR9BBxrQLXp9RBSmKXy
 Ixw/o+mGYF+ZInI6aCXyDRge9uu33VVsSqvs8H0RBfFM/jUAq9ih9eX4B5Z+smJI9O78
 k3c/H1slom/nShXbnwzM1FbPx4c7mNrYL6cNobaeNe/ZkeZLThr+oqiiG9FyB9tNKsFF
 GZfQD7OASvy1erHQLfIYNewZMaBuFwYzoSuvOSD1ulpfmvmaQR9FcqPhtzjjNUs2ICWX
 vE+jqIVVe5+dp+lJqwfkruannQ/ulK8THJw6XMtscb7zyi8dRFyw0iSihoqu1F1FBvRy
 Ubxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22K6PkYhm2RTgFl8J7eI0rFuhmRuZ1tgOi7SiCNakIU=;
 b=QCqIAtZo3bH3b1YKq1HCRU/Bc0oHojWPbJj+kXfxHrzO9VJkrLOAONRACjwPX+8hr1
 Jw0FdDKO5+XgQttw0rXZAlzZMsV4wii+ZfYHhCE2ro+uHBDGRf4r6VQoxgVB1O2TP5pr
 t+fxj1QHW7t4uWmnNNqCxkSEKotrCZo1qpEuqx5klmi98cIBy+GvNKjWACKHSRbWBse5
 BxzqKEcTXTLhHQ5RjthlGaenNu5zUOWZarXj1yk/d0mpj1OxitCi9yOSvClwZ+lEk/MI
 WR/crWZr25+a8Zk1NJ4zqEZdv6oajf/Y+8GXsd8Ed66Jq10nkOI/CNzkgjD+NVpE/qjf
 1YCw==
X-Gm-Message-State: ACrzQf2fVOXuIwLDl9FxtORIUvZid0vDWQa7fh4ILxny9k3bYEczApIb
 z0pXr125+LtZ0NfBkGyjkOk=
X-Google-Smtp-Source: AMsMyM4BKDnmdDnVIBnM5t1dlqUEKtvhnqWawAxs0BxXUqP/I9bG/L8n6ywXzspcW7BulLUaxFHoBA==
X-Received: by 2002:a17:902:e9cc:b0:186:8816:88d4 with SMTP id
 12-20020a170902e9cc00b00186881688d4mr33455050plk.59.1667531824632; 
 Thu, 03 Nov 2022 20:17:04 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:17:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 10/13] omapfb: encoder-opa362: fix included headers
Date: Thu,  3 Nov 2022 20:16:39 -0700
Message-Id: <20221103-omapfb-gpiod-v1-10-cba1fae5a77c@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-28747
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

The driver has been switched to gpiod API, so it should include
gpio/consumer.h instead of gpio.h and of_gpio.h.

With of_gpio.h no longer included we need mod_devicetable.h for
of_device_id definition.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
index ba7ed4039f8a..dd29dc5c77ec 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
@@ -11,11 +11,11 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/of_gpio.h>
 
 #include <video/omapfb_dss.h>
 

-- 
b4 0.11.0-dev-28747
