Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074811EEAF
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68656EE18;
	Fri, 13 Dec 2019 23:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2E96EE18
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:46:09 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k25so241733pgt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hBWP2/QJL0y05bggOLUlEYkrP/w5ugSFmgOaMEwZL50=;
 b=Fz4y2Ke44kCSsjzp+a34ad3A68+TnKJKWD4UJoHpxQ3EPHdetc8nwEGtkef+RvhiQT
 /0RpPlwnBBSL4CMm358u9SBm7lHGQl+OPgpswKiTIrkQQO3ejRMFLLZCGR76bDdIHMq+
 tXv1nyQTQ+fkJCAZYl2Ety2Fv61bHqb15i3aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBWP2/QJL0y05bggOLUlEYkrP/w5ugSFmgOaMEwZL50=;
 b=Yx9LEN0yIvQPseGU8UJ7RfpjWWO7zKsSyf38gmfGv3NhRRYrYLOahLVTxM0HLMnTZt
 6IUb/snKYIFgYM6GP3sWERkGhBAdB7dn/pi0HhRWvo2gSwqQDIttMje4hzRKSjTiTGTc
 HwvP7MkHUiemdO1E7QgDVrMbmP/rFV1jzMHU3bFbtiKdkzIqiGjAPursgCr4vBR50h+s
 utP6u78v/iFmReSQhhJN0UuZKbFtR4mBpd0YYnzq2BF/eDsZVbAJIGgOZdybH2cWpwTc
 CZ+6BkmX+fM4XKossbdj4CXnGZ/IFiuEwYS8c74TQJYr5prX+vjmqlECuslyfV+q2P9e
 7Y0w==
X-Gm-Message-State: APjAAAX3xPqmrxqGqH8Ceiyfy+iaCchuUjiujYcX2Ujr/dfW0o68KOC5
 EmqmvoQAXnKuGCXsDoX9s/Slog==
X-Google-Smtp-Source: APXvYqw1TNBWKyOrLHCw7vDkyzfBgewAvNgShojcv9sMhHxdOwVu4YowVmdOkduBPxrqAMLThPoXNQ==
X-Received: by 2002:a63:9d85:: with SMTP id i127mr2328536pgd.186.1576280768713; 
 Fri, 13 Dec 2019 15:46:08 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id z19sm12282905pfn.49.2019.12.13.15.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:46:08 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/9] drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo'
 Betta
Date: Fri, 13 Dec 2019 15:45:25 -0800
Message-Id: <20191213154448.4.If3e2d0493e7b6e8b510ea90d8724ff760379b3ba@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
References: <20191213234530.145963-1-dianders@chromium.org>
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 seanpaul@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
---

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
