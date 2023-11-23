Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBDB7F5B77
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2255910E706;
	Thu, 23 Nov 2023 09:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D1C10E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a02c48a0420so82984366b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732454; x=1701337254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jkXe0QoGE+tlThXBz0xEA+Tvx0TKZmjc+38hqplAd1o=;
 b=TJW5zh8AQXCGGIfQuc7bNJxcwsSUqTwlmhIbhNSxitm6FxM+ciAleGQgOeYvwqKwEC
 6nv2Rl9DCIBfN04hpBXpKhUZbRpPHWuKf13d/N+aVAixAA4yyD9dtH7Q4IsL2ZT79aCD
 1bRnGj7gDeSkhyfwrZiPo7NSPiycwQTBIe4MTxK8aJioSQlwhOUgIIhspN9heRBIL9Zc
 z9C2+X4xWh4UGdBDx/gRJ1ssHdoAg/aaPXa7eBDNEi0rT1SklMFwYWL9oOkdQziUtx0N
 0PBAbq0i7XJo31FcSbURhnX5sYG16dnlzlhHdt73ChGVRThAx5mNDEiKU7hx0/vyh1dG
 iPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732454; x=1701337254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jkXe0QoGE+tlThXBz0xEA+Tvx0TKZmjc+38hqplAd1o=;
 b=H8ityFbdSP1EF/CSK1S526XhVc2+4Mi0EvRR2Wb7nrGwnD2XhhZEFC4hj3EhkE9cN3
 BWRZNjAJmDiU0lxIluu9OYkWaoQO7ZKCeM2BV8fbW8j/mdt22HZWjOS7e75phe5Kg6Cz
 Iqklst41RdbbMCgBZZOu098F1enoYuzqGFCsc9DezULtbO7+RyxlhsJjlGuz67suwPRM
 rSlOiG38OTgbdidEZvJ76uGJkFb9vHqU4v87IAgd2xTBIrF8Y5RlHtWCvnLbfgMJf/Xy
 W3vevX7DKTPmMlZXFR+Uj6YXqU1GBZITzeMxmWA6Vg73ts8TTjkwcWK7Hnr4lFG+04Bp
 9hog==
X-Gm-Message-State: AOJu0Yyr1N2wRFx+JQ6kcE1/6+9tdrUCBsgse8T6EzL2hu8P/AMTB+UZ
 QlqO7TU6KboqB9UGVsPgfpA=
X-Google-Smtp-Source: AGHT+IGBaET/BPE0zfZXGFTIbLxGAcu/efNvrnEKBMMHB3R5g6zx8yTuME8af3epmG7VUmfNUgxQ8A==
X-Received: by 2002:a17:906:a38f:b0:a01:ae5c:f9b1 with SMTP id
 k15-20020a170906a38f00b00a01ae5cf9b1mr3755311ejz.40.1700732454188; 
 Thu, 23 Nov 2023 01:40:54 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:53 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:31 +0100
Message-ID: <20231123094040.592-12-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df..aca5bb086 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;

