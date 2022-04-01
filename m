Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ADE4EF236
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E5F10E457;
	Fri,  1 Apr 2022 15:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01D10E3ED
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 15:05:48 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id o13so2582757pgc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 08:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dXvf6tEmU42fvFxnNhgaVoSXX6BtyHLrcBb5PtNps2I=;
 b=Jai26U5EVFsE6uYYMZRdylpkSEUsW2dGli4+n24vMoSUzvV8s8PA8iZoAR3Af5auTE
 PL6OgAl1xIi63pp808MRQ0IKrU8Y5FTUDkpAIpVNDjXdLU5I5zu05b/4QAOVbGDV7b1Z
 sUBBcS035b+Hqeyh1uWKI267d6Vtqp7A1cIHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dXvf6tEmU42fvFxnNhgaVoSXX6BtyHLrcBb5PtNps2I=;
 b=ZGBAbbFtss/tMDvo84Jlt0kfqbulJUosILs13v1neceeKN8225gefFOvs8nlNmsjJv
 FwSQUqH9l8/I3UDr2nymmOARj7m0ZYnYFmWknAa4iucdRt1iHVl9rwKtjGIZPgzGwPUm
 KGl6ws9ZVsivl8gtulFeGG71zgmNP0VqOdlNTNFEIsc3o1ZXEumjdyQnL53cfucyAaj4
 C3v6fNibo6Zbf9S5IP5z/tp2GcQGIU47veyY7IUNFeGpKG45WSMafJNtqdqGE+6t7ILI
 A48E/1c+SxQhQNkxcLzF3MH6mdTi7qUry1e+y2ya+3PRgMzLWWk0ojxVIqApiOFV3UFe
 ygYg==
X-Gm-Message-State: AOAM532xsgjo3gqgkLKn15wFErOmK40igeZld60TbVmUMHd62xX6x1w3
 JiqYs4I0uxL1mH6WH9dMfS44bw==
X-Google-Smtp-Source: ABdhPJzv91p4xgiQjkToixjDLotcWEwjxwovAZ7Zv3or7vsuXpTsUm6a8p3hsRqFs0bispoDmu6kkQ==
X-Received: by 2002:a63:7d02:0:b0:398:9594:63f4 with SMTP id
 y2-20020a637d02000000b00398959463f4mr14301353pgc.375.1648825548313; 
 Fri, 01 Apr 2022 08:05:48 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a637404000000b00375948e63d6sm2621098pgc.91.2022.04.01.08.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:05:47 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm: bridge: mcde_dsi: Drop explicit bridge remove
Date: Fri,  1 Apr 2022 20:35:33 +0530
Message-Id: <20220401150533.7777-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver has been changed to use the resource managed
devm_drm_of_get_bridge() to get bridge from ->bind(), it's
unnecessary to call drm_of_panel_bridge_remove() to remove the
bridge from ->unbind() as devm_drm_of_get_bridge()
is automatically remove the bridge when @dev is unbound.

Drop it the drm_bridge_remove().

Cc: Linus Walleij <linus.walleij@linaro.org>
Reported-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 083a4728654d..960b49ea2ee5 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1122,7 +1122,6 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
-	drm_bridge_remove(d->bridge_out);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }
-- 
2.25.1

