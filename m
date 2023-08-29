Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B678CA8F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F270D10E41A;
	Tue, 29 Aug 2023 17:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10EB10E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so598949066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329450; x=1693934250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bfzC+/2ZWaml8G5FoMVqEV7cfUPth65LiMOYJOwJeN0=;
 b=bZLW+p0zlfsLlVcBzVygKS55P0IRebfmfiqzvn+vw5Svt3aaCxEmAf/zNj4HxrSb3q
 CHnOvzQ8j2IRQp89lqASBmTMaDuVAlOqF67lYkaX0qkNbvZhD+R3bJntKXa78jgmITAm
 2DrvIUbAK8VifA3j4MPRrKZMMfmGgMhoQhZgwJDu4rLZXqE1lFOhDFB8kOHL3DWwlndP
 pjs//iT2Q/1C+vivTrj4iPoL6TyQVWojgwxQvJQTyBhgSgxY8mn3U4y6sfBl+JArMVty
 RsUGpKZBYW4fV4MlYjswm92/89GXO5MLr57K3JCxIoAiZqRuS/0xNbUN+CXSFTQEoqz+
 IPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329450; x=1693934250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bfzC+/2ZWaml8G5FoMVqEV7cfUPth65LiMOYJOwJeN0=;
 b=KqxkxUx7pxelQnJF/hcpsBWhZfJuovPJvW2+/4E8sBNyl5o2DM/wZDHCyU6orkIuMp
 OoxcgG/zCz4sThUBhoyM//vyznnlHBpXcfBiZ3YIgBQyr8Cto4vUXl5u5x2snXjGvyST
 SimxRCbiOVIaeYg3hQCcEHuCtdux51NpPlkYfQQGenmmoInRYAVCw0oEKmGZGQgii55T
 PiM2VybAPrrQdGSfW6yOeYR8hfV9z3mj9fBR7ha5J/VSQSMdFPoChSOXS6XXiTpxIzo8
 PNngG8Lq0SxUIN6BKvB876YwC0ayilg8amrV6ryqSaA/nmp4Y2mioeUBiY5q36clVpye
 y5qw==
X-Gm-Message-State: AOJu0Yw+u0vn6p/5S3rmy5hMNGRbI5Xplyxd9USEmollzbSzyFeMb+JU
 mBDy1/bMOvN7Mgh4lrJOyA==
X-Google-Smtp-Source: AGHT+IHd4qS1gu6W8/rBDv9L8vXPbe681EHcWWDTg19iW5zGN1XHAmvdeOISpan8OWf8b/vW0vdbkg==
X-Received: by 2002:a17:907:2e02:b0:9a1:f81f:d0d5 with SMTP id
 ig2-20020a1709072e0200b009a1f81fd0d5mr12345626ejc.54.1693329450187; 
 Tue, 29 Aug 2023 10:17:30 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:29 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 06/31] clk: rockchip: rk3128: Fix hclk_otg gate
Date: Tue, 29 Aug 2023 19:16:22 +0200
Message-ID: <20230829171647.187787-7-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, Finley Xiao <finley.xiao@rock-chips.com>,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Finley Xiao <finley.xiao@rock-chips.com>

HCLK_OTG gate is located in CRU_CLKGATE5_CON, not in CRU_CLKGATE3_CON.
CRU_CLKGATE3_CON bit 13 is already (correctly) defined for ACLK_GPU.

Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
[added commit message]
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index fcacfe758829..17bacf6dd6e7 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -484,7 +484,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(HCLK_I2S_2CH, "hclk_i2s_2ch", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),
 	GATE(0, "hclk_usb_peri", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(9), 13, GFLAGS),
 	GATE(HCLK_HOST2, "hclk_host2", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 3, GFLAGS),
-	GATE(HCLK_OTG, "hclk_otg", "hclk_peri", 0, RK2928_CLKGATE_CON(3), 13, GFLAGS),
+	GATE(HCLK_OTG, "hclk_otg", "hclk_peri", 0, RK2928_CLKGATE_CON(5), 13, GFLAGS),
 	GATE(0, "hclk_peri_ahb", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(9), 14, GFLAGS),
 	GATE(HCLK_SPDIF, "hclk_spdif", "hclk_peri", 0, RK2928_CLKGATE_CON(10), 9, GFLAGS),
 	GATE(HCLK_TSP, "hclk_tsp", "hclk_peri", 0, RK2928_CLKGATE_CON(10), 12, GFLAGS),
-- 
2.42.0

