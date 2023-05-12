Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29007008BF
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA7E10E6AE;
	Fri, 12 May 2023 13:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE6010E6A0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:12:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so71873835e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897125; x=1686489125;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SLBWgiMNwkyCqNWdGx1K4+ygLk3VG9D6DZvu6fKUhDY=;
 b=kYz0ju11D6jUTa4HLXMUI85kDspC8Jjx1paZ1AgUvlNEARse9VXMp67EppR0eALwn+
 rON/U5JQf1qFpk72jiCjxTvJ+mMPKvQLO84oXFvSd+f8Uf3sHhp8Aj0FT0EaiCJ2G9Ug
 8u9OhYquKpxtVOHwm4MOEmS65MpzV7bRgKTlYHC7l0ss5eYzgP71CRacXDtsys6US5e3
 ckFtgA8JfPVM06HtNNLE9cE41REzpGjbgtBDRzGubaWC7Dfu9UEx3Sb6dqXVXT7YzhDQ
 wyh5BrdOZuANfwrWAvJY7RdWfXkNTeHZ2+kcDhoZxfGIapZv3iAmKzCAObbGks2C4asp
 seKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897125; x=1686489125;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLBWgiMNwkyCqNWdGx1K4+ygLk3VG9D6DZvu6fKUhDY=;
 b=EY0o8B5U7p1WNwvkIZ6pZQ6cv+6B8gejFtTtFGjPvU4oOS1dT0+hYsdInqZC+6Z6OX
 cN4IbTyRAMo9IduQ8IR2YnM9kG15gM0aRZVNfs6ZZvLDtL0k8Ha4Y/lJJ2wov4SSD/0m
 RooKRY/vWyPhozDfuPFD52G3SQ4sZummv5o1o+2aGs4hwYuzAhJwofMooFy2W0XcZu4t
 P2TWjP4g3PvUVJlRCPe6wEYCVemZUaWdcIHuJwgsAb2mZa0EbCg10VXbFb/xdF0h6zGO
 gTx+dprGkUE4OytwBLYjLYRTou1XEn0zawj3bzggD90D4ZYNhZZRggOZOTFs7iTPeSbB
 ddxg==
X-Gm-Message-State: AC+VfDxE8dCMDpdCvO8FTLgdCqqHvPp7cwVwoPzjnUjTo4QVqSGDZgNC
 mGP/gGuBEYsUteb1MtWbyYtNuA==
X-Google-Smtp-Source: ACHHUZ5uobz/omWHn5suWrUkzrTkBzpmD/f63IcO56rfuCbjWofaJT0wtqRIazvDS1RzoQKBzvVilA==
X-Received: by 2002:a05:600c:214f:b0:3f4:23cd:6dcf with SMTP id
 v15-20020a05600c214f00b003f423cd6dcfmr14235255wml.15.1683897125511; 
 Fri, 12 May 2023 06:12:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:12:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:42 +0200
Subject: [PATCH v4 11/13] drm/panel: khadas-ts050: update timings to
 achieve 60Hz refresh rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-11-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PM1rVoTLiKdVLACMoQ2eP/3H3+GG4xHNSxcdM1deMu0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsWCqwAYpj12TIzbwlkf9rcKbazvmpNPhFYFGGi
 4wO5G1CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FgAKCRB33NvayMhJ0VpWD/
 9DOHdC5AgFrJ1Q9ndeQRh8i4b4H6g8HoCtu/gw1crViqRJUFlOcGhexl5J2mfmiB6r7lsT9+dO/n5b
 rjMPRX/2S8rSw3L15zq+0Ru0idzsr3SCRWs9U0b6xd2EAu0/XKtJdnavjO/nSqVUXbnW0VDZGTW3Pd
 vqcYT0xocfyBd+3kFjqsTRTq7zW9/0+0i7rYYJGfXedE6QIZc5P2NzcfecyBxtltL/o9IMVcDriJqV
 Ox5v4fHagv2aC5O2OrqeqbUdl7i3MnB5W3eshagZwHdXPsWSFeiw8I7WqZ+r2zHe0uD0Ms/oQzgWC9
 nzqUOwazrnR4UBkpkmAOinQDVXpOoviv7qB9TrvIUB37UMJbgmo/wGgPnvbX7aF1RgUQ9ywHDEwmmv
 pvr7YIuF+sMUbDfQGeYfTnjVNYjXWaDRQbbqkZRuLrUaKhKhXOOxmzTfaaRVue4aMXMgNKB3pgwT/3
 IJMg+o4O7TrsSIArWSik5wlsf+pFcT6oDxrKsVqoGzoK3EwAWZZgDcCwskZv/S/Bn8g/86Jh1NX0U0
 uY33smO/L190yI4FYLJd917+c6M7PFebcRd7Lm3+zVYFuFcx9FHYNkhsMqU6d3ZoV4mXrQe0EkDUMs
 F25zx1aZ+UIoKSCg/Ji5H8mByAcYHjH6hn5ziy2VenKxjpoZvIKultpyvFiw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This updates the panel timings to achieve a clean 60Hz refresh rate.

Link: https://lore.kernel.org/r/20221025-ts050-timings-v1-1-5c824bbb24d9@linaro.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 1ab1ebe30882..b942a0162274 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -568,7 +568,7 @@ static const struct khadas_ts050_panel_cmd init_code[] = {
 	{0xfb, 0x01},
 	/* Select CMD1 */
 	{0xff, 0x00},
-	{0xd3, 0x05}, /* RGBMIPICTRL: VSYNC back porch = 5 */
+	{0xd3, 0x22}, /* RGBMIPICTRL: VSYNC back porch = 34 */
 	{0xd4, 0x04}, /* RGBMIPICTRL: VSYNC front porch = 4 */
 };
 
@@ -717,15 +717,15 @@ static int khadas_ts050_panel_disable(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode default_mode = {
-	.clock = 120000,
-	.hdisplay = 1088,
-	.hsync_start = 1088 + 104,
-	.hsync_end = 1088 + 104 + 4,
-	.htotal = 1088 + 104 + 4 + 127,
+	.clock = 160000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 117,
+	.hsync_end = 1080 + 117 + 5,
+	.htotal = 1080 + 117 + 5 + 160,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 4,
-	.vsync_end = 1920 + 4 + 2,
-	.vtotal = 1920 + 4 + 2 + 3,
+	.vsync_end = 1920 + 4 + 3,
+	.vtotal = 1920 + 4 + 3 + 31,
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 

-- 
2.34.1

