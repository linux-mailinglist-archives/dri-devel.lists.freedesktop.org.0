Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BCE123BC7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8696E0FD;
	Wed, 18 Dec 2019 00:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FFA6E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:48:31 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id b9so239115pgk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdCS8WPWMq5NhE2qOG5oGSoq/xhaDa7hE5ig0oDHXKQ=;
 b=IWzkIwFn/N2qemF7XknGGB63xEuypwoPe7OQCDpzbY720oDjcNo/L8sFGnfm4pYy8u
 NjrgByC4PZqz++rdn/3Fht2IF8XDWlRD4rGxKzS0ImYbL8KvCLteAPepLnbCXT21nBGX
 BW/ic5IYdr01m83xtjR9858CmwD63j4BBjQ3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdCS8WPWMq5NhE2qOG5oGSoq/xhaDa7hE5ig0oDHXKQ=;
 b=XaG8j/A0Jm2sGbUEFbmj1yU2hb9jidm/d8DzLPP0X2sdYh9ZnfV3trDI6t2dh/UTJp
 CLRcVUPao9uQVsdTSgj64vA7XCzI+xrbj9vFhUwp3Wcwbel19kxC2m+pk7flTmfn+suu
 XR3fsxHpUvxyAgqnKr/EmULlVpibK42R2xcMMTp8h+5SX/Bej1evnE+Icboen0QMwSQq
 1U/eiNfwH3UJ/oAXIsGcKCsGL40KYYTmXw2fdRCTnYoJLTD6FPknhLAlg3MOtoLZgs48
 fbW/pgKty6DpozhNf/bvCa85t3Xs/NyzAOmxL5mn5t0vnvJnnrbJqvxoWPKjkejHRAH0
 eseg==
X-Gm-Message-State: APjAAAU0d/fJ7Wff82hTumBGlKXKFWdXO04V6oUU6+sxHJZ3eYx7jWaP
 yNq83ifL3H3qGxGXCqamFAQ1Fg==
X-Google-Smtp-Source: APXvYqz/L5SG9C+m5GHf3yf2c+EACxBFqLOJj6lb0gDRKFwT2goEQNvhE4pWBxQP0mNa0BW7WB2I8A==
X-Received: by 2002:a65:50c6:: with SMTP id s6mr252796pgp.365.1576630110806;
 Tue, 17 Dec 2019 16:48:30 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:48:30 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/9] drm/bridge: ti-sn65dsi86: Config number of DP lanes
 Mo' Betta
Date: Tue, 17 Dec 2019 16:47:36 -0800
Message-Id: <20191217164702.v2.4.If3e2d0493e7b6e8b510ea90d8724ff760379b3ba@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218004741.102067-1-dianders@chromium.org>
References: <20191218004741.102067-1-dianders@chromium.org>
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
