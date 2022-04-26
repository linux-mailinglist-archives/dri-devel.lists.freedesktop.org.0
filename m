Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70050EDFD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 03:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2410EFE6;
	Tue, 26 Apr 2022 01:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0156510EFEB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 01:14:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bq30so29284083lfb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 18:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vslt+e3FM6y7UD7iL6V1VJxae5oldMj9gWXowaZoGOs=;
 b=aseSk6tgfpPh8ae7Io17XoK6pewvdeQ+XXRiYeHJ+6X+L9QzPh7wWaMnL7V5+Cqpqp
 yfIHMjzBFARM4zsoisxXMxo0UufLjXIO2SLbEw7QEP5RmSxc2FF9xdHjpaxJ/Wh3/iLB
 7OKnaK2If1RYB+pkDQnGp7oplPFNcg2rTPC6Uyu27/u29nFyYN4jCAYvAh1HGQLCIr3s
 ypiKMabCNGJ3xOrV6GSyQ/x7UTgLBqsI2SS9u4uzPAAK0GshoDFYuwDtpwyN33bSHYDC
 rk+IwcF45nCfexUMIKRxfkxxUJcS8PstE5BvYoLnwnq7XT0NP5CpjiccYk8YkS1G1V2B
 qpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vslt+e3FM6y7UD7iL6V1VJxae5oldMj9gWXowaZoGOs=;
 b=hyPUguKgBLNwGSrxeYQGpBpBcNie+64IWd0mL95W5rip9OTP3P7tzEhkAFIsyzTTKu
 hcoY30NzxriUdO3jcg6ZfwsszJlT6Y8I/ZESbFPt38f2dbNDxgsxR/wGA+lQ6gqxu6tv
 uakR7HtYQsKCxLZBI3CrqYkUB079AYv7cQWiBCROwE+18ob5KvftxvwgyFoDSuvfyYmx
 ab0OurN/EUji4XiBF9usIZY2GNSlfxGTqCAfdN9h0LiO+V3jf/zfIYI3NMRbPiXDd4+w
 PJaty6cTpN14Xj3d54RlJQEW/sPDTriZQ+96ZCZYSfPoaNbQStnOHNh7sz25x7XBdo1A
 rMpg==
X-Gm-Message-State: AOAM533ckODu4IqcufanJpMab8ZNPFXDXeQVyhKMYLOydfhg15cLNeSL
 utPsJ59FiNHmmS6ZWmxJn3XIFg==
X-Google-Smtp-Source: ABdhPJzJePVFYnJYz9upjHS2c3apxQRyyoPx88DShe9JXhalXrtYZO1Crty0E4FogCunmm6xx/HxKg==
X-Received: by 2002:a05:6512:3e08:b0:472:e80:2a47 with SMTP id
 i8-20020a0565123e0800b004720e802a47mr3381952lfv.489.1650935641050; 
 Mon, 25 Apr 2022 18:14:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c21-20020a2ea795000000b0024ee0f8ef92sm1337884ljf.36.2022.04.25.18.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 18:14:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/bridge: tc358762: drop connector field
Date: Tue, 26 Apr 2022 04:13:59 +0300
Message-Id: <20220426011359.2861224-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc358762.connector field is unused. Remove it to save space.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 7104828024fd..5416e8bbf827 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -61,7 +61,6 @@
 struct tc358762 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_connector connector;
 	struct regulator *regulator;
 	struct drm_bridge *panel_bridge;
 	bool pre_enabled;
-- 
2.35.1

