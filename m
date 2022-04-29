Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B425144E6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5300710F9BA;
	Fri, 29 Apr 2022 08:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7004F10F664
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:56:03 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so5161791pjh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSzFS9wSHMBoWm9vUIMAMrxz8gIMVdkk11n8JcOOYnE=;
 b=DNur8v5VU1o29SE4iBQ1n0C9CTAn+vtPL4yR31Fu0xure8UcVVlP891qB6+59GNTJC
 nwWgpwLVy++XDOgnibruxM+N7LwqzY+0njKB/Yd4bCw7BAqSeyVIaaC85nxG77BfUpYx
 fBDYZuWBdTWDkJmieR8aZ/uwwTGHdyFVQjwP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSzFS9wSHMBoWm9vUIMAMrxz8gIMVdkk11n8JcOOYnE=;
 b=rqhgVF906NN6RNhIT2kDoatJ+b2bgjwVdGoD6yeXn3UAPDc9X6XwCY8nGkgyShAX8Z
 lddbQDYhoxRvsn9N6OSyLPZxNYomuH565/OFJw+klO1Qt9l4CqtaSbU0qYSgFe5XW05j
 azbojA5PiT8wTuLQTGSTv6oBQ9UssyCVOe9HXB29x+YlDWC/p7kCPBSNYBlCnBcBlhhx
 hmDtQDw7VShlE8/cGknwGm3v8VQDwg2xmIWFMBF1P4YceEGRrjFEcMwrfxngp5+GoWkC
 jEO5Ibf2wFcFshIWNRvBBpAy5n0DzLgGfTaPZArPWE1X+huOmZ8oTza0t20QvaqE4aWc
 wITQ==
X-Gm-Message-State: AOAM531qdLrOoXztBrWsbKjzyVjSRNG5Vwlpit/qEGib1jxDBjWtbwiQ
 PkvPQ22EpGiz/Itj+rjB7JcLSg==
X-Google-Smtp-Source: ABdhPJz9e8o2qAAHZkiJqQWOUuzsWQJG01AkB6Prl0GddUUJvWCDjiZixDW8MPNaH8hxrqRw+jyJ8w==
X-Received: by 2002:a17:90b:3904:b0:1da:2957:b5ee with SMTP id
 ob4-20020a17090b390400b001da2957b5eemr2688085pjb.59.1651222562983; 
 Fri, 29 Apr 2022 01:56:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:b5c3:f85c:afa7:cae9])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a17090a4e8200b001d26f134e43sm9247781pjh.51.2022.04.29.01.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:56:02 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] Revert "drm: bridge: mcde_dsi: Drop explicit bridge
 remove"
Date: Fri, 29 Apr 2022 14:23:57 +0530
Message-Id: <20220429085358.1699141-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit <3730bc6147b0> ("drm: bridge: mcde_dsi: Drop explicit bridge
remove") has removed downstream bridge as it's prior commit <3d7039e1e649>
("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge") added
devm_drm_of_get_bridge for looking up if child node has panel or bridge.

However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
has panel or bridge") has reverted panel or bridge child node lookup
from devm_drm_of_get_bridge as it breaks the non-trivial cases the
first child node might not be a panel or bridge.

So, revert this commit to switch the previous behavior of looking up
child panel or bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 960b49ea2ee5..083a4728654d 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1122,6 +1122,7 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
+	drm_bridge_remove(d->bridge_out);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }
-- 
2.25.1

