Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54165733B52
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 23:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB63210E688;
	Fri, 16 Jun 2023 21:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513E510E68B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 21:07:18 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so1601093e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686949635; x=1689541635;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yAo6M7XHJBrfklypM5Ydm/bWCFc3N7r9+ZjeSM9TSy0=;
 b=k/Sg37jL0bq8yOMnp79UbvHBjt/7KKPymeGh/fBXXj6dJmWMl/4+revRUDn6ChXzp4
 KPCcp+B7oZcB4dt+SysRVrwaufHRtvFXdDeGYMeV78WAi2zeZ6DO3IJQxT5WmiuypECP
 Du0Jx/+JIJNE1elgIgub+YQ2PDbkG8QQ0Znwlejk2PAGUl8ddsKGDqwPaza3INmqaBoY
 iyHUtvLriP7D67QJR1UXjk3vQqxNQM3ttN810zdOfhujLYxyHysbhnp0CbekEoB43zUj
 Fc+0O8kxGO1svHijaIzFPHF3zZl9h31qR46Nm/8EkIIXd0KFqet99MRdyXUvmJHwYAi4
 UJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686949635; x=1689541635;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAo6M7XHJBrfklypM5Ydm/bWCFc3N7r9+ZjeSM9TSy0=;
 b=kHdoDHljI55sHA+/8aGVfZQwyuRl+L5VhJxgRxr1R63d/Wg6vAtjFwUQCJ9UtLR2hQ
 9R75bus+gpwZ3j+OnbVuN6qe2bPnKnItgHb49toLA2oTwESDkk5PYbehV6bRUTenZWSr
 cfDQ5Vw5vmXdwsaqx+9J0wXEOwY+hxw8QC7nzEcr6L3PGFECMUxdhf6l2qa9CQwXUr8j
 AFjyP3GPWJStnxYm3M54GVbWMxOm1cqIxJegQT7ygb1HFAuqEybpy626xv5J6Q43/b+3
 /xUvr2GokTp72sGZ1D5j1o8pszfMzIx7BlI6j/Y4cw4ES5nlctTmX7j6fGHG9mhkVTL1
 p3qw==
X-Gm-Message-State: AC+VfDwFzM01ddqy+vyiirb55nsVucRTL1nria0U6RZm/HchiH17fG8D
 YhteSh75Dj3cGTWTQp/mQKzOEA==
X-Google-Smtp-Source: ACHHUZ4+SQbd2m6icfnTivo60KcD45f/CeVUsqg3Gi8AdecA6lgIgSMsMavQrT9Q+Cwj1EnhqMMprA==
X-Received: by 2002:a05:6512:3129:b0:4f7:5d1b:4c24 with SMTP id
 p9-20020a056512312900b004f75d1b4c24mr2385493lfd.17.1686949635108; 
 Fri, 16 Jun 2023 14:07:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 r12-20020ac24d0c000000b004f4ce9c9338sm3180909lfi.283.2023.06.16.14.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 14:07:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 23:07:12 +0200
Subject: [PATCH v2 2/2] drm/panel: boe-tv101wum-nl6: Drop surplus prepare
 tracking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230615-fix-boe-tv101wum-nl6-v2-2-457d7ece4590@linaro.org>
References: <20230615-fix-boe-tv101wum-nl6-v2-0-457d7ece4590@linaro.org>
In-Reply-To: <20230615-fix-boe-tv101wum-nl6-v2-0-457d7ece4590@linaro.org>
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

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index bc806d420ca7..24fbc1629e40 100644
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

