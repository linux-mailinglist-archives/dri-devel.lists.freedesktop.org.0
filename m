Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18BF618BEE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF010E6A0;
	Thu,  3 Nov 2022 22:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CE310E68B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:43 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so3135478pjd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cr+G/nLorVX5Vqazl4B1H/q9zJhWXCGt3rPc5wil7FI=;
 b=cuiHE4k5vbsIZ/O7THWlv1XnPdq7smFhNeL5Ki3VCD/5mXTK8hr6cAexhoy0SVSAH1
 r/t8delHF9PweR6zd3U+m7hjLAuJ+hb10eiGDLoMqjuZ7G6dn6x9eCJyB1ZyqDDBaV4k
 oFFwQZSEA6NZCQUzqy54xsamRHBRkEPzdeCb4TLBV1XXYxqEMbR/+Jv8C0kG6H6mriei
 +CN2TimmLNPY9f1Lx2MYJ7NdAVM3rLAm0b8Em1sa7jsPAMOOT3SbahYIU8T9MnHPraPC
 Q4f02EcsYuRAi1sxarhCHgJTf4oOuaLc58LB1cdPc0dp5b3KL1jttHJLWyNQgdQV0yMk
 8HhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cr+G/nLorVX5Vqazl4B1H/q9zJhWXCGt3rPc5wil7FI=;
 b=cYxo5YiaVkXBhYbTwhD7/7WFE9zsjFoqEHd6jlntli2Y44mi6iNal5rhSGzL+aW9Pu
 ATgJifmO0wa6iS9g7KvH9ho8/2kTAVhuCW55fp5yoChH3v7ybfBa1qMqiHbmeUtLOl+N
 I57t59Shn3uTdJsP71Fivs3L+C0oxecCwIlhfdmuaAxoxhR+7cyO2dF+C0Ak7wDYwbhs
 o+++PI8273xzyPx6Qk6OIpBlVtTxNqAszYL72PWZ5mu4hzNkdCq7qvGNNQyyNb7o36I+
 1G0kg8ZWatV5YEPtGGyfGF8+dGym46o69u7/zhSninAIU1FyB7pNKupcNlCYbjWMhIIf
 S4Mw==
X-Gm-Message-State: ACrzQf04BrfaOWydkgv+jINNov2ZHCAluGfmcNEkCsH3UYzSF4tSufJ/
 PfB+BNetp581naO0X7vBCEA=
X-Google-Smtp-Source: AMsMyM6kOhgxzSyaqgoC4vbAnGm9KpBZ9npgzgXOAYjrITlIeApLUjEIXCgyUfy+qJEfNsyPwQlsLA==
X-Received: by 2002:a17:902:b281:b0:186:9596:742f with SMTP id
 u1-20020a170902b28100b001869596742fmr32051893plr.49.1667515662609; 
 Thu, 03 Nov 2022 15:47:42 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 12/13] omapfb: panel-tpo-td028ttec1: stop including gpio.h
Date: Thu,  3 Nov 2022 15:46:55 -0700
Message-Id: <20221103-omapfb-gpiod-v1-12-c3d53ca7988f@gmail.com>
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

The driver does not use gpios, so there is no need to include gpio.h.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c
index 3c0f887d3092..c18d290693c1 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/spi/spi.h>
-#include <linux/gpio.h>
 #include <video/omapfb_dss.h>
 
 struct panel_drv_data {

-- 
b4 0.11.0-dev-5166b
