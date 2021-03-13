Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843F33A1D5
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 00:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158576E0BF;
	Sat, 13 Mar 2021 23:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887A86E0BF
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 23:09:20 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r20so11874415ljk.4
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 15:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNbXtC1Km9ztk0OS2CV1eooRCXpw8+S2MoZyiALx9GU=;
 b=Q85OzwTs/6WLgf8OhBPb+1TuhA5d4lYEFqG6wrcUDx6mYmCUpPD+zGQnFLgq6i6+6s
 Xam8IcTZf0If+89cXAjXI4A5d6cT8gvorhUj3MjkP4/lmU5NeCA6bGRCTNneyjp6Wtz/
 MP/UeJLpPUZQB/S5FK6/ZzvmEbJu/TiPh65DAuS5aqvayk+S7vLL3+y7MZNcintNwtj8
 YDYdVZoDmsDIQQ9jiE3NKYBIL1N522oc/cD/AK22O4qcgacbU9SGZDHm+DfAk4PuWkf3
 1bZyAnjAZsle03KnqE1vW1C8W/d9vwgb5UDU5gy4p9XHf/mw+RWafM52V6OIiHQ/8+lg
 LzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNbXtC1Km9ztk0OS2CV1eooRCXpw8+S2MoZyiALx9GU=;
 b=f5ctWDMmMw0xJWlgj/dUcR2A0p3V9UIlkjoTe3ayLowutuQkn1rGTIFTzQvfEW40Gv
 aQVmE4lGhY6DWwtXtd0WNi6pbA7WU89eafCHNjnFotvMDmNMeRm4zpe/0rhQsh8R6ly1
 BPBjQ/LN5QvuaBQ5ReCOAIb3mV4+mRMB1W8xtUq3lNWG73QJ+Ej5lxXB+dxxHiknubK5
 kapjXwREqliSmGqPXQ8QhO2Aeqo7AMf+M49alcGWiSgRRqDcptde+a+46UW69ov1ypka
 O9xHFhkuiw7xiizbhGKGYEzVWLfBz/yGyq6Y1QvmxO1SG3GvrMHKhfJ5U7Io1znixC71
 UJ6A==
X-Gm-Message-State: AOAM5310KO3qscoJdWHZcx1/CXO9QwQL9qpU4/0l17zuFBhVr2MwidMp
 p34ZMFb1hAdBz4YPwmxFgL8M3Q==
X-Google-Smtp-Source: ABdhPJwrHYoIS9+Zr8bBEjUHmCdjaOrpMLYCPvRSOzzfKQGaec17/H7dQtRgiwhvDO4Xyc4TwA46pA==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr6560855ljk.289.1615676958950; 
 Sat, 13 Mar 2021 15:09:18 -0800 (PST)
Received: from localhost.localdomain
 (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
 by smtp.gmail.com with ESMTPSA id b9sm2135930lfo.237.2021.03.13.15.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 15:09:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: s6e63m0: Depromote debug prints
Date: Sun, 14 Mar 2021 00:09:13 +0100
Message-Id: <20210313230913.4108256-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev_info():s in the DSI driver are very talkative,
depromote these to dev_dbg().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
index eec74c10ddda..bf0f4b4f1d20 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
@@ -27,7 +27,7 @@ static int s6e63m0_dsi_dcs_read(struct device *dev, const u8 cmd, u8 *data)
 		return ret;
 	}
 
-	dev_info(dev, "DSI read CMD %02x = %02x\n", cmd, *data);
+	dev_dbg(dev, "DSI read CMD %02x = %02x\n", cmd, *data);
 
 	return 0;
 }
@@ -42,7 +42,7 @@ static int s6e63m0_dsi_dcs_write(struct device *dev, const u8 *data, size_t len)
 	int chunk;
 	int ret;
 
-	dev_info(dev, "DSI writing dcs seq: %*ph\n", (int)len, data);
+	dev_dbg(dev, "DSI writing dcs seq: %*ph\n", (int)len, data);
 
 	/* Pick out and skip past the DCS command */
 	cmd = *seqp;
@@ -80,7 +80,7 @@ static int s6e63m0_dsi_dcs_write(struct device *dev, const u8 *data, size_t len)
 		cmdwritten += chunk;
 		seqp += chunk;
 	}
-	dev_info(dev, "sent command %02x %02x bytes\n", cmd, cmdwritten);
+	dev_dbg(dev, "sent command %02x %02x bytes\n", cmd, cmdwritten);
 
 	usleep_range(8000, 9000);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
