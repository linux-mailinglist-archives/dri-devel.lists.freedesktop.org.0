Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C85896705
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD76112707;
	Wed,  3 Apr 2024 07:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PbpkAlEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0856B1126FB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:46:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-33edbc5932bso4345707f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712130406; x=1712735206; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
 b=PbpkAlECBYDNUYsAzUQstp5GIfjSyujcfWW1T1DL1zaxwXDoOf1ErkCMAWZ78+xJLK
 rzLU8dU8USHLLTUGA8e5Zxpv4Xej2BTKc+t6SGcaGXi4IFGvFQfO1fdWjvGnmbdmnRUh
 uXEkPnOuHE2LiT9VoCw6YSfkV2wAkN5jWVV2IJtHj4Yt0Q3a6il4Jo3zoNjN4UGQvGUg
 mTtawfMNA5LkfUFXWOzZ6aR0BFoLUmvpG4gLOfilm+oq3G2LxtDLtoqfGJb53M5CC3kr
 w5YTV2ZnWCOhDpdgmVKXqjAN71RAnvlZ/hnPlmvfKXkh+E89Fb3S+87lNTC/pMB+2/Zy
 jUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712130406; x=1712735206;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
 b=NbbkKtAYn56aM7w/Ul9hAistFlaoGl4acylR+MkLOhwmNWdrzx3rgd7yI5j6Ue2Zl2
 2iiiL0R8Jsal5f+X9JoGmMngmoTTyUz7qfAt4JKvQ8PZE+8LFhbVFKwDrc64cNnmSUpu
 7V48xwaVL/Or450+OWdg1cT71PdjPSLcMVAZDYqiYaGGah1WY3kcDhOKjAelxkvzZjgo
 c09VwR8OAcgUmB99fzIU7JZJhTSe0WMXojUwK3K15m5K0HTpj7CqByTn33hDh7ZrUzQv
 1H5EAW3X1RYBZ7FSqdoEZmO2aUj273R3A3HCVsAEprg0remIaj0hkcMpHl2muSsds74o
 evnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq7ZnaiJIu7EGWIVBk14Sf8yaoswVwem9qTjfmmDy+3CocfoXI5djRDmVl+9CZHv4xARcDzoGkvBHDeHbxGtgpISMEWcMjJwPd1VWf9Ubm
X-Gm-Message-State: AOJu0Ywe1Tc39pBtIh0CXWTuG7Ep8ovaAYoKRGVDD69vTKnkSnye1otG
 fULp2qw5eupV00wl56amZ9VeEuX8AdEjbTQR+h6BBBkKAkoRQFNrNj57nKn5Rgk=
X-Google-Smtp-Source: AGHT+IGGBq46h/V4vx/Me2v91oAoyllp45G9fkusl1z2wLTpALiMyIumG2Nx4o8WN9H7lVUQlHmBwA==
X-Received: by 2002:a5d:4a87:0:b0:343:3dba:79ad with SMTP id
 o7-20020a5d4a87000000b003433dba79admr1387682wrq.26.1712130406071; 
 Wed, 03 Apr 2024 00:46:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 00:46:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:35 +0200
Subject: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IE7LBQJSwmFpro9NRvngqeq31VcV/n9f72AsydUqbws=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQlejcQpqrYrAdfaoIKddWFOfQjzYTGqO7gkkwmM
 X08eYFCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXgAKCRB33NvayMhJ0Q7FD/
 4pXY/d5+OF74duX+1KwCp8i59NBBA/JfD4gBGLG/y8peYkyi6uFoymroebTIXBTdk5OktdRxI2MY6k
 Yjcg/mDVItK4u5zTwrCSiL9dojIKHN5PueEDWQS6IV8/RsmrtJZOG/womzzmlOkl6B3/hR/49K9k6c
 oT1r6jV1q6/dCwoLjJZUs0qxsf2dbBS4lm7Kg9n8/j3+b1wq25ppIbXnbkACOXs4BOU+PKclGRwKJF
 StBh28gamk0zR5pezCjDBe3sdyYaVKkWXFHc2q5ph6bfpmZyz1+b/EMk9rmhxixkT8LeMNCf8IUAug
 Wz/jxtAyVjXCwwJHdFoiqdfg047aMW+ev4DjGD3gYEgivIruNyU7a7PqKlHimMxjx18m/3Z7gENtez
 Bu9iz3iMAbGc7tpsJpTimlVpLnY9m3sXgmkyV53z0w0/wFTGEPJJ1ovAVsfNJkq3pufN6AhdeJ6CWb
 O0htkhM8Xu3woGTfwn8NwVex41/0839yVaVOseg2JCEWrffVta4km1puojyKb/kSPer1cpbRugbmL1
 ff6acKY/vNIQ8OGAI8V6gW83mtpbrFI5ZJX9eK4CUBq6cMjlfo2zdDYfmCffnOw+CExXEtcT3LBPCV
 0XaCwjwkkEsUfB4ElfVGrV+pgK89u2lGxo6GINqE01Rrwy66Rj4gX+hgcRPg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index a6bc1bdb3d0d..a10cff3ca1fe 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
+		return ret;
+	}
+
 	switch (mipi_dsi->dsi_device->format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;

-- 
2.34.1

