Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0251A7662
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 10:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFB06E49B;
	Tue, 14 Apr 2020 08:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8DF6E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:47:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m8so11594816lji.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOjYataNHY5ZYj5vOOTOSBhOU/gx3D9rncPvVoVTWE8=;
 b=srmCcoG3tPm7brFtL6cpjKo0QN9XumRLY+yU/Aqlg+SnDO7J6lGGqRlgjlBU9/W+I4
 h65Er3bxdzkYhjuy8jXfVd4mRZiuHFkdC+npaExC85Hu0aBd0778GP+/4G274bMQR8/P
 X6TawxVGYereDXzvnIG8c6eFs7QcuUHw6xd/4W6J6f6tA6yJyvdscHHsSfMzKo/ja2mD
 Wks2ynUCeOck0gyYnDn+0k3hb4vuerp/bTq6uoXVIe6+pnk6Ewt66XbUZlhuenPDjAoH
 xeWVvsb61M1Xuo9vb6a+4XPN3Vt46IJP2sCG9aQrTLh95u/ePFqTe1IbBCGU6n2ITXj3
 RE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sOjYataNHY5ZYj5vOOTOSBhOU/gx3D9rncPvVoVTWE8=;
 b=dtyHL0Q4T/SI9K0H5JY2LAwdXgOodobO/llRU7eJmVC3RFmfBMBxHCCL0LJwwLAFm6
 H0qtWCHXawiOMEWn5UhiWZTuXJLbIdQ3n3UjWu3WHNJG9J3L1OIsApm7tfQ3rJCdyt7p
 6xcy11CPBgfPiii6T8LztCWscDEf+yw2wpKIL137NVs0+On8b9rLSLhiuFRaKQJjBkEW
 DCsgK4HMtfKPW8NqWFMmWbjW4Djf3d00Hc4yJyjhmOj+wu/Rk34n+EHj8ZLL5lgcpStn
 27vwjbsjzwsRQGeQXNCKzEzp2vpbVW4eZNlxpAvWsQs8rxfEQo5ScjOljF2dIFIJtMfw
 2iWQ==
X-Gm-Message-State: AGi0PubJlDwFc32jMOqDPYANqqNEfOpdSLouiC/Ojm9bHd0f5ydM44MJ
 rq0peG8JPQysltjBkrzlLpmM7fPZIgc=
X-Google-Smtp-Source: APiQypLN8aThk4nsISuB2wFDMko8OTgVGbO+czTxHtqLMtWBGxbVwcqvl4Ftx90Z07rzlGCrEq/DmA==
X-Received: by 2002:a2e:9907:: with SMTP id v7mr12225585lji.199.1586854057756; 
 Tue, 14 Apr 2020 01:47:37 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q10sm9834979lfa.29.2020.04.14.01.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 01:47:37 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v1 2/4] drm/bridge: tc358764: drop drm_connector_(un)register
Date: Tue, 14 Apr 2020 10:47:25 +0200
Message-Id: <20200414084727.8326-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414084727.8326-1-sam@ravnborg.org>
References: <20200414084727.8326-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop drm_connector handling that is not needed:

- drm_dev_register() in the display controlelr driver takes
  care of registering connectors.
  So the call to drm_connector_register() call is not needed in the bridge
  driver.

- Use of drm_connector_unregister() is only required for drivers that
  explicit have called drm_dev_register.

- The reference counting using drm_connector_put() is likewise not needed.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 5ac1430fab04..a277739fab58 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -375,7 +375,6 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
 	drm_panel_attach(ctx->panel, &ctx->connector);
 	ctx->connector.funcs->reset(&ctx->connector);
-	drm_connector_register(&ctx->connector);
 
 	return 0;
 }
@@ -384,10 +383,8 @@ static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 
-	drm_connector_unregister(&ctx->connector);
 	drm_panel_detach(ctx->panel);
 	ctx->panel = NULL;
-	drm_connector_put(&ctx->connector);
 }
 
 static const struct drm_bridge_funcs tc358764_bridge_funcs = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
