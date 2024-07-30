Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4A94126E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4755E10E50F;
	Tue, 30 Jul 2024 12:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jdBcLdP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B1D10E239
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:38 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so26934925e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343837; x=1722948637;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFGOubNsNVn1OpgYJCvY0DMJojSWylMPMeeJsgWseOI=;
 b=jdBcLdP+wLEQSxg3BCJJzjQUAhT9EhOjvL7e3noaeniuQKsPal2+jT7i1Q9CKKIpqC
 N7UfInVrTUE9xOgefD5lk7rO+nC/MHwks5rxMRgWifaxOIr0zI0rWC7zdVTmTkxCxY1P
 jEiid4P88raam5UXQ42sjIayTl6/5/MtDQr5ItmcRYRe0OTH5crN7zkzQ59kGKmJh/Bb
 yCayrfbiq2DqnoC2k7IHUAhX6zw9Oo2yrvUhBMYj8qZhGdX6Hz9HFnV6j34hBHT3L4Zy
 C+G7SJgd0JdqVA7D/Uuxd0dNLnEhVWNUMpUBsgQDJ4SbT09Xtl4TJY91rmgupKfc+7Si
 qUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343837; x=1722948637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFGOubNsNVn1OpgYJCvY0DMJojSWylMPMeeJsgWseOI=;
 b=trHn8G+VRP3YqWI6R4OLH29sRBn+BK1qfrqZojnial/5fJCvzTV9x7IAR6f4kzb+l5
 we92hWrQWsgZY4U+5URyx1OF2r0z0cml2ir7H60tVUDOvLZQFS9MdpSWXPAz16WCvCP6
 TsrG6PRhUg4fnM9mOQTUZy6SS0YA7m75yZVC7IrSToLVlGAkNS1bPFqEiku6SB4H2VUk
 Sdaqpc7fTfD3yasjHq5SaugHY7a2uQM7Tk2EE7p/tTFcOjBH0Ds364sAq6/8ytzbQTEZ
 WXX9JxSuT67vXfFr/jsSSJJVVJ6x4hAMSIP0tGI8i+SutX4hu6OnV3gMUq8tpfef7rcR
 tqHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Kr6ZVcZay8EU0V90kmOKNeQXrzMQvHdXq/jrY8vhZ5+iP4ZJIZiQEblBOZ6EbCbK4lDl+BoyhfA+hEQoObPFTvV65U3Y3Y3/euRComFw
X-Gm-Message-State: AOJu0YzRrRQ93WnMk7AoOQiADBf5GJdHFqTnmBvYSFGlPTlNg63nwxjJ
 2Fj20uHf5lgNy8i7NLKKtvdkgK+cTXTuRg8IDTJbYx725GDfhkojNa4YnCI8Fhc=
X-Google-Smtp-Source: AGHT+IFYy4B/g5w5Y3B19jbk4N8IBnPQwvEBCaNr6l0tavtJI1kbi8Yq6wQAsMTGuLdyiEwuv2pLaA==
X-Received: by 2002:a05:600c:3b07:b0:426:4978:65f0 with SMTP id
 5b1f17b1804b1-42811d9e0dcmr82301025e9.18.1722343837035; 
 Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] drm/meson: dw-hdmi: use generic clock helpers
Date: Tue, 30 Jul 2024 14:50:13 +0200
Message-ID: <20240730125023.710237-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

The Amlogic HDMI phy driver is not doing anything with the clocks
besides enabling on probe. CCF provides generic helpers to do that.

Use the generic clock helpers rather than using a custom one to get and
enable clocks.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 36 +++------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index bcf4f83582f2..2890796f9d49 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -619,29 +619,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 
 }
 
-static void meson_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
-static int meson_enable_clk(struct device *dev, char *name)
-{
-	struct clk *clk;
-	int ret;
-
-	clk = devm_clk_get(dev, name);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "Unable to get %s pclk\n", name);
-		return PTR_ERR(clk);
-	}
-
-	ret = clk_prepare_enable(clk);
-	if (!ret)
-		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
-
-	return ret;
-}
-
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -651,6 +628,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct meson_drm *priv = drm->dev_private;
 	struct dw_hdmi_plat_data *dw_plat_data;
+	struct clk_bulk_data *clks;
 	int irq;
 	int ret;
 
@@ -701,17 +679,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
 
-	ret = meson_enable_clk(dev, "isfr");
-	if (ret)
-		return ret;
-
-	ret = meson_enable_clk(dev, "iahb");
+	ret = devm_clk_bulk_get_all_enable(dev, &clks);
 	if (ret)
-		return ret;
-
-	ret = meson_enable_clk(dev, "venci");
-	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to enable all clocks\n");
 
 	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
 					      &meson_dw_hdmi_regmap_config);
-- 
2.43.0

