Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8BC889C0E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3770610E790;
	Mon, 25 Mar 2024 11:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mEaUk7pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0F910E790
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:10:00 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso483058266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711364998; x=1711969798; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
 b=mEaUk7pZ9wzzYckmi9TGBO7MkX/a3ndQIEH/tpuBmel1pEzf1v4yoSBEtuzhhV8+qg
 uLsPG5b2AKy2wmiDDg+sCNFnB1Wt+DfjE+bcQid1FUz9A+mWDd4EdYhy/8M86T7R7G8L
 RcejeEO/nPUBRKAh6JIcxa+RxKyesV3yqUjnFyCEyefymbLmd3q25bvGQXNNX0YQ9wrl
 Q5eMtA8cQJU/B0h2htwD8W1L8EJKB/wrzdnbTEkb8b2k41RFQNm3eXc+dl0WY9yHacCo
 L8TgGp+k5v4s04swq88IlQ/dgaQ70raUCyaGeuB0ZCHHMTWy7puPiCCkP9SmGbj9vnFj
 MT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711364998; x=1711969798;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kTGO29vezq1Gc7J5O9OI72ko2OnA3sM69gX9LY6c8Y=;
 b=ZD0QiKjMAcHqAJRRKMbbh1VCns/AnYdxvXYzVo29vVJXtiwTFhJYPBt0cZcrF4EcoS
 MPcTM/HBA6qcmd1poYzF6Kb/X+scMada/Bs44tl3+Dj55GCmFbn/RiY4bZLDAX8yA3SY
 MxGDRiy0N3QDSEP3gVKL62r7wEVwgu0uSWYvAwjuNPXhMe7bHEhC6k1SM689wE8nch0g
 ox1bDkMk+gykX2+ysp5K8m1JpLH8578FSSR0kpWuT9S7BoQBiZHOmcpsXgOn1XUAx9jf
 dgoAXn4q6TC073+aVy2NaswPmdowN8GuiKehL0d3BDYtiDZsQZsZUM81kSbo7YIP9u5s
 YqLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqbRgSoCsc4n16ZRsueDsxuErTRm0h+tgKhaXwIUPkyAwd9M0XKRugZV7QngmK+Do6wenAFY8a13nesZPEkGr0NYRn+QiOCmJZAYDnYxqQ
X-Gm-Message-State: AOJu0YxyKqXsymOessFirrHfw5v/AdKrH+G6JM58cR8F8WGw0sSgDP47
 T49wQKT7+u5IUn9LpGJTPyMqyV5kFHXd6yLyx03IcPBzVphBmDrDPIaVQpNOMio=
X-Google-Smtp-Source: AGHT+IHd2loUo9esvRyCMJmbLmzeubWwPmclSwwr5gWi/CXFBjKiq/1gx79j0VlUc5MnXrG6uSfvvg==
X-Received: by 2002:a17:906:ae8e:b0:a47:52ff:194d with SMTP id
 md14-20020a170906ae8e00b00a4752ff194dmr2271273ejb.35.1711364998404; 
 Mon, 25 Mar 2024 04:09:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 04:09:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:50 +0100
Subject: [PATCH v11 4/7] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-4-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IE7LBQJSwmFpro9NRvngqeq31VcV/n9f72AsydUqbws=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt9++1oPrnjR7tTQa1Ol0n8wYjRZy17oMVcXzVP
 cqgFiMeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfQAKCRB33NvayMhJ0WMUEA
 CXRnTt7k4f4HAGknmsHODxGaAF/HThv+ptZ8CFtkMmHBbZzN4J3Gk11mdKg/k9ZWwRokrDvuupCdwO
 f8NLV62azMhLxpsx1FsDjVqVgUhV04e7OcSzfYkpWjloXO7V3G1r7g1d1mANLIomYCi2uW7R9gF21R
 qJGaGaVLkmPUBy5VYkOQSPSCjd4PkRFqQ1ZwiiCP23DNRdICPkIPfy8MUqZtlJlMaSHm/bIMxlFJGO
 DayCAnXbINnd4HFG8DOOsnLi936dtQwF39hAZf+PAygwBV/0ctv0pAmQdLcQw3ySQqb2gam9S6YTMH
 ixSV0Iro8prstkZZU4TdtBSzF9iMsk0eLHGyxBBPWEig8Qb+3fYlZ2zv4YJqrz26X1B7Edv75W0oBP
 0wH4a7+UKe5aGkcTJ8/aOipwnV0EDf6suxY0b3WsTpOSLmUJ12PjCFUxJkpDIlcA2rP+bnZSMzwCwS
 y2QCfsbvlYWQje9Q6YwJiBIOcbsJJCcpgb8XmMtE9HiH2S8yNMmBUTSZPYYqb8vHGEwHOuhMO65B9l
 zSNqFchB8ORbgObxgDfKOe4T9Ngu1ZPAiIMY7GlofBfzu0bpVMeonZ16WymC86Y0WLYqQjBy3fsjZ1
 DlekGujVu8UOStOHsh5Gwvp10BAJs4tb10Zxs+P2Nk/3dz/wXVipm/M/hONA==
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

