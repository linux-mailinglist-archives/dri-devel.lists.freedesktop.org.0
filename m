Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103771256E1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCD26EA92;
	Wed, 18 Dec 2019 22:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B063D6EA92
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:36:02 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a6so883337plm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mydBqKv+d6SpAVkQY6i0eU5oOuSS/A7UC42Xzyq9TQ4=;
 b=gcUlYSvEZPV/3S4bjdwO/pxZ9DP28l2E5G5DdHMt+gWwBXLsXkw/yCyicrKYtJ6gvV
 5J/hHixTsbTiA+0pi8suV/4T0p6SWo8qVb7yBYg3v/1jcnyjJ8qS3jKmHLUHqEv+9kNR
 EBgcnVSnvaSfZClAr3cmHU4zoaw2Q2c5aR6Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mydBqKv+d6SpAVkQY6i0eU5oOuSS/A7UC42Xzyq9TQ4=;
 b=XrxvFnxQb0XUsJtqHbiUzOKatBQ4AQw44jc2M8Df2lw2eWytV2IJ+90B31z7Dy3QjG
 T+OoI+Kue6cFBvrqQCK9V5ZllY2VpfnA0Dd0S+WEbBgfQUP7NBuaUGKx5n1IiEM242gM
 vDa8pKAWlBAuKnfwFiU48vIgZfbjrFMHKy3qzkoClq/RLCmxFcWZmWvZ1WWiaFjLWNWr
 Bm8QZOOUTfr9B0piKCZJGnRc/+PgOlX6YAutfqnBeOLmy4I34Dr9FqQIZ4mrrv8R1J1T
 6nfzrrmz7SjvNAiHjxaXqu1OX/Uiaivob21oYu7CO2W2izLKS3Vdntd+4TjyI+Km/ScN
 M/CQ==
X-Gm-Message-State: APjAAAVG9O23Pik6eb8pJ2APfKSPXSc9OV+1WBbqW7pJui4ZKtRYLF/R
 Ad5j6BDd9y8GKh1H67A8/GigYw==
X-Google-Smtp-Source: APXvYqytYmEANX8XvabXMuuaru+HmPQyXLQG10CIvV/yFjJRgYu/bO+Hw0bEQJUY8SgUc+JnXpm0FQ==
X-Received: by 2002:a17:90a:1f8e:: with SMTP id
 x14mr5818571pja.29.1576708562330; 
 Wed, 18 Dec 2019 14:36:02 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:36:01 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 4/9] drm/bridge: ti-sn65dsi86: Config number of DP lanes
 Mo' Betta
Date: Wed, 18 Dec 2019 14:35:25 -0800
Message-Id: <20191218143416.v3.4.If3e2d0493e7b6e8b510ea90d8724ff760379b3ba@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
References: <20191218223530.253106-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver used to say that the value to program into bridge register
0x93 was dp_lanes - 1.  Looking at the datasheet for the bridge, this
is wrong.  The data sheet says:
* 1 = 1 lane
* 2 = 2 lanes
* 3 = 4 lanes

A more proper way to express this encoding is min(dp_lanes, 3).

At the moment this change has zero effect because we've hardcoded the
number of DP lanes to 4.  ...and (4 - 1) == min(4, 3).  How fortunate!
...but soon we'll stop hardcoding the number of lanes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ab644baaf90c..d55d19759796 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -523,7 +523,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   CHA_DSI_LANES_MASK, val);
 
 	/* DP lane config */
-	val = DP_NUM_LANES(pdata->dp_lanes - 1);
+	val = DP_NUM_LANES(min(pdata->dp_lanes, 3));
 	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK,
 			   val);
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
