Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2184830A5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0975510E153;
	Mon,  3 Jan 2022 11:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2765A10E153
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:41:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u22so55324751lju.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 03:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jTHdhMQo8m7fjezvqLSe06rhw7qY2pds6pDxwCkD9fY=;
 b=b/wYQ7RifZ0R/sGHpjKvuJhQ5Na27nhgMFvGUGNCllToR3R+5IUy0NRFW8oIcLKTLJ
 CI4NXhbdrfFTyx0cbt+DaXZbhWZUNm/ZSPdDXbJ6pjBr58gOVSbeucmuKeRubgw19Ozd
 UZlU4dAjL4Mig2rRjJ80LRGwPQ5zYw+AvLv4K3cGdg7+9OnMTBOqLR7rp0thw0uhenOW
 1hPjGgCGdnXnOO/sWgcTR0CPFX0TY9lem6/Im8N32vf3yKagLMi6LdFgcjzzmWfGCNuW
 PJtrm2MZ1sLtm+Qf8nlFoP9cin2U9Q3IGIXj8nj5iEPHile+ZVV4xONtxWRs4w5VXL42
 eSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jTHdhMQo8m7fjezvqLSe06rhw7qY2pds6pDxwCkD9fY=;
 b=qwKmk96gldLo94v2frY0k9Rjtwj98SEksNRPiChpEYRhe19VgaTSfebi64mYRp5RYr
 XOnqrrnZd1RlpyAvbdETZDqYU8+o486NmkuM31H4rPA8uGOWTk76E9VzMN87kmZYO5Ux
 4wgoyHlKIL8kWZqtbKz6thpNRj+dibLupUDqDGGWOQ7srUSFx1TJSMH3iyWW5USrSMxr
 eO0suiDfEmXhVOXQE9MuWI9jOT+ldZPciTOo2PO7TE1nPzIXhHepedGxFUL0+jelmyCU
 /H6y7MgS399ncwKLM1VIZJzXORDZN8zIG8F6NF6xZEI+tHAXCzE3fPLp0U5OC+qvatn6
 HTSQ==
X-Gm-Message-State: AOAM532JO8JAdBltkCO3iAbv9Rk4MeDcm2WV1ZJXJEMigQ0dkdGfBrZh
 0nLALJkRTFL8zYG+mWsQUxv4bA==
X-Google-Smtp-Source: ABdhPJxxLymfT8c4XjzPfgnc46NYRCyS02+RDobu4IHMa+/9BR+IgYt4S0nqey5S+ZvfBUbvZtQ+Og==
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr36910925ljl.227.1641210059496; 
 Mon, 03 Jan 2022 03:40:59 -0800 (PST)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id a23sm1910941ljk.8.2022.01.03.03.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:40:58 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/panel: nt35560: Support more panel IDs
Date: Mon,  3 Jan 2022 12:38:21 +0100
Message-Id: <20220103113822.654592-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103113822.654592-1-linus.walleij@linaro.org>
References: <20220103113822.654592-1-linus.walleij@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These IDs were found in the wild in a Sony Xperia vendor tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 620876225384..41dc278faf80 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -32,13 +32,14 @@
 /*
  * Sony seems to use vendor ID 0x81
  */
-#define DISPLAY_SONY_ACX424AKP_ID1	0x811b
+#define DISPLAY_SONY_ACX424AKP_ID1	0x8103
 #define DISPLAY_SONY_ACX424AKP_ID2	0x811a
+#define DISPLAY_SONY_ACX424AKP_ID3	0x811b
 /*
  * The third ID looks like a bug, vendor IDs begin at 0x80
  * and panel 00 ... seems like default values.
  */
-#define DISPLAY_SONY_ACX424AKP_ID3	0x8000
+#define DISPLAY_SONY_ACX424AKP_ID4	0x8000
 
 struct nt35560 {
 	struct drm_panel panel;
@@ -225,6 +226,7 @@ static int nt35560_read_id(struct nt35560 *nt)
 	case DISPLAY_SONY_ACX424AKP_ID1:
 	case DISPLAY_SONY_ACX424AKP_ID2:
 	case DISPLAY_SONY_ACX424AKP_ID3:
+	case DISPLAY_SONY_ACX424AKP_ID4:
 		dev_info(nt->dev, "MTP vendor: %02x, version: %02x, panel: %02x\n",
 			 vendor, version, panel);
 		break;
-- 
2.31.1

