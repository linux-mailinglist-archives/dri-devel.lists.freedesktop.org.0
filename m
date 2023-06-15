Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD37320DB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E435610E53F;
	Thu, 15 Jun 2023 20:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D088710E53F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:21:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f849a0e371so682989e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686860506; x=1689452506;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kKBaB/9E61orl2m+5DjkcFtTpmNkTOXhn6/2KzxDt8E=;
 b=ooRn7P/3nfvzdMKi01LrsE9k9ILxzSQBhQFr5AUVnFXqvhXiQGOtXZnyTeH3yPqOlG
 ME3qSxWOTsVIor8/HBW4rznQBIyB6wKPBaRAaZTw3vHGkBZ/A26f7x/LZGhPfVo60s/V
 Mk+svDS0wfQNBNGXA2Tgx0iMiIlph0XLSVv8lkn/ihlQ0LW9SWyZFsYrnJp06DpDNHO/
 LqQLqpftykWL54nwlWYqrtVOeEMC+EaNsnKvf/KfifPXTtNZ/zf9u511maK1NNRv1IaS
 MqFCQ42lvHld/nar7kFhmpUh8sOicw4NYlt/IKtGF0kGQiAYvTR9ZuQCUuV8VHQzLVqO
 5rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686860506; x=1689452506;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKBaB/9E61orl2m+5DjkcFtTpmNkTOXhn6/2KzxDt8E=;
 b=k3fVOyEfC9i93BU3TjiLgl4hRSk4FwG9EO5AW8AZ83Ht9mKeCJi3+doWuuMfMn6rVE
 pa7j0X8IRpMmefa6edGFnGohFoif453GuwgYi2Acyr4caa2IiSVymsPuHivGUHleP6+b
 +OwV1yJdB55+dVgD5R4MIzC9SuhH5pcPMZD61NAEnKAi7I5cd7cEXUOSKvARXnqm4YzU
 yuDzkUwzBvTaK2F4QAbOZ4LZ8j9FsNdstekcBqwOfDaGpv6MHeeSVPYWtpu1An5+spwH
 tOmnjcm8Ppdi8DTBctbImk/ApBVhHHVrg/cn2MbacQvt8BsGJkryI1pqJ6ZtzcCdZghx
 /6dA==
X-Gm-Message-State: AC+VfDwTOLJN52nP/76L8DfCjSK/ZQJbdsuXG1D6OWb0eIY6XTIGlotH
 kd6FBSEvgcab3lU26NTsHhsmMQ==
X-Google-Smtp-Source: ACHHUZ4jCI6ENoZXpgGJ7CtbJ9sh9OfpRjutmpGobIkqDyDHRSTCIkpwNLdYH2zs1Tf2v3zimOKfoQ==
X-Received: by 2002:ac2:4985:0:b0:4f3:a485:919a with SMTP id
 f5-20020ac24985000000b004f3a485919amr10251508lfl.57.1686860505791; 
 Thu, 15 Jun 2023 13:21:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 r14-20020ac252ae000000b004f3946030fasm2736470lfm.68.2023.06.15.13.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 13:21:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Jun 2023 22:21:38 +0200
Subject: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Drop surplus prepare tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230615-fix-boe-tv101wum-nl6-v1-2-8ac378405fb7@linaro.org>
References: <20230615-fix-boe-tv101wum-nl6-v1-0-8ac378405fb7@linaro.org>
In-Reply-To: <20230615-fix-boe-tv101wum-nl6-v1-0-8ac378405fb7@linaro.org>
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>, 
 Stephen Boyd <swboyd@chromium.org>, 
 yangcong <yangcong5@huaqin.corp-partner.google.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM panel core already keeps track of if the panel is already
prepared so do not reimplement this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index d19d30e134dd..412d4d99aec6 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -50,8 +50,6 @@ struct boe_panel {
 	struct regulator *avee;
 	struct regulator *avdd;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
 };
 
 static int boe_tv110c9m_init(struct mipi_dsi_device *dsi)
@@ -1286,9 +1284,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 
-	if (!boe->prepared)
-		return 0;
-
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -1307,8 +1302,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->pp3300);
 	}
 
-	boe->prepared = false;
-
 	return 0;
 }
 
@@ -1317,9 +1310,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (boe->prepared)
-		return 0;
-
 	gpiod_set_value(boe->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
@@ -1357,8 +1347,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 		}
 	}
 
-	boe->prepared = true;
-
 	return 0;
 
 poweroff:

-- 
2.34.1

