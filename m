Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFED5618EC8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4228C10E6E1;
	Fri,  4 Nov 2022 03:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C361F10E6D4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:17:10 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so2195002pjs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6PAgha9awLqLasM2SZBLhBWQgufb9o8aM2Y2mLLZh0=;
 b=Yc66T/C43UfEpUcqxFl5/KtvvWxdKjjseUpHDw3Zky+25MC+fBsWw2ozPEZuES4kvK
 HKE67+vkfo9MYjWn+7/ot3l9RHt6HWq1g7/9WytwbtBrriBjNEViAnnsvPwvnyQgrP/N
 KF9Ob5cfsOPDPIsbZdBcjxjKdFE1q5m1hx1Va8lO9Am8eqiLwFDmIXE6upHp94Bcl9TJ
 gjrtAeuLLuAXpjO/5XengO2wiWYdw4kMLpOTWdEOoNIxUgAy+y8VRp9cioPjm/5A96oS
 Sir2Y38f9lQg6EjePLvvUIGCq6iF/dPvghZWbisu+x0NDR0CZe2gB1mIjjYxowyYTbOe
 DSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g6PAgha9awLqLasM2SZBLhBWQgufb9o8aM2Y2mLLZh0=;
 b=RvPKsqlb6i8KDbC2GBZ4oNrAyyc0pJvh/uv6kLOCo6/uFizdV33at87M74CCLTduEl
 0583bVM1v6gIosCWrRrB+8gbqpyupGjGITh14m/M+unDIAfvHxFT926f3AkooMhea3Hh
 yPGliiuKQ7qtnuzw0Veoam2vuJVZarFunJiN/UFF/JWklgaA0dj4LDnoQvvrOSiOpt2e
 5tQnubpEtCpOW80QkKbTc/gyCyFNRqRUHGFfu0KXUP5vAcx1neko7OsYadjXKXcO/r9F
 OBcZWUZKhMoC5JPuCSMZPAWnuJxKIbsd0FZ8zxugRDQ+/0+djjR+8d+ThHKb63WBSWeJ
 yPrw==
X-Gm-Message-State: ACrzQf2a/34ucB5sbdOdUVeue0y+RAUvzx7EHKeifNsF72t14Zsc0CPn
 dPLR1YeaTrJ3Pcnng+g9QxM=
X-Google-Smtp-Source: AMsMyM64tXvt/mZih/5xOGONanOKPX+R66cULAJlCmjnRjUYkHYQrQu4rLsZLjxE/l1ilhdz95A/NA==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr52794390pjb.164.1667531830375; 
 Thu, 03 Nov 2022 20:17:10 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:17:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 13/13] omapfb: panel-sharp-ls037v7dw01: fix included
 headers
Date: Thu,  3 Nov 2022 20:16:42 -0700
Message-Id: <20221103-omapfb-gpiod-v1-13-cba1fae5a77c@gmail.com>
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
b4 0.11.0-dev-28747
