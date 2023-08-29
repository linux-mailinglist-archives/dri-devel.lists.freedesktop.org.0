Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03A78CA93
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F12810E422;
	Tue, 29 Aug 2023 17:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C653D10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:32 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso8723766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329451; x=1693934251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFpS6puAfr1Vvk5xVzMQk3TJscyGtiLTY36CCDlYgn4=;
 b=rd4R0yJ5NUtAr7vhhugqHokzMG56l1owqCa+6Uo9jX4+N93yF6mL+9b3ty5yWW1gb8
 45j8dPKZO5qBshEI153JhNmUeVkwS/HYRK/7Ig4EPjMahNhGO8glOHHCmG9M5QsEcjN+
 PZaZpsQ8MjKL4ZNaaYSP5RYuSNPzEVXRRrEQmVppf2asd7xYBwREmY6QDap/IoLNQJhP
 oMwmwhWExypc3amwKJTcTufbASYFqr+zAPb5KG5+Q2fU8+lktFnAMC903v4IiIq4gXK7
 IQK0Qnwn/VY6Xgl3lnbGpqlQKDL6bXiN5avdEyQXwSnICg3ZCR2QLy2/RQ7qAWvLaOxc
 WxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329451; x=1693934251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFpS6puAfr1Vvk5xVzMQk3TJscyGtiLTY36CCDlYgn4=;
 b=b1osZiXQGwWyJy++wHiOfLLUoirmmA772pu3rzeqYMmGldloJXMWV1BL3hfonI8DV7
 h89KGt2wamB8kf13qD4A6K0rQV2DOZkv4X8GEUi2J+DxpKV++kDZxbsrZPAlvbRZGsI3
 eIlzXNeZkoGTp0+oauftZUY5swIDD998DUWkxB1AEKPKBhognhST7SWMtQXEcFo3AFK5
 wMWhcis+vywx5yQ2ExMZOB47j0P9S9SYZ63nKn1mxDpqn6r2Wv2TdoLv/2drOUcNhQs+
 eMOF0Uh2AjChPMozYrCfnoTkYV45hFPjq8V1QBPdgHAuzdVtExj1XrAjgPRzPhRCarmy
 8jXQ==
X-Gm-Message-State: AOJu0Yw4Zt4rp/jao4xNuBcUvWXZz/jDtwvfKH+hfk0POqVHTYQOWaSg
 0lzjpDj/aBo7Y9+Qy3953g==
X-Google-Smtp-Source: AGHT+IEybP8U8H/6OMY/edFtzGMriI16g5JEKpV7+P1CM2OUvZ0MmOIK8JNoZk0RoYw/W+BVoa1UJQ==
X-Received: by 2002:a17:906:cc47:b0:9a5:bceb:1cf8 with SMTP id
 mm7-20020a170906cc4700b009a5bceb1cf8mr3568824ejb.3.1693329451153; 
 Tue, 29 Aug 2023 10:17:31 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:30 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 07/31] clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name
Date: Tue, 29 Aug 2023 19:16:23 +0200
Message-ID: <20230829171647.187787-8-knaerzche@gmail.com>
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
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SCLK_SDMMC is the parent for SCLK_SDMMC_DRV and SCLK_SDMMC_SAMPLE, but
used with the (more) correct name sclk_sdmmc. SD card tuning does currently
fail as the parent can't be found under that name
There is no need to suffix the name with '0' since RK312x SoCs do have a
single sdmmc controller - so rename it to the name which is already used
by it's children.

Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index 17bacf6dd6e7..75071e0cd321 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -310,7 +310,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(SCLK_MIPI_24M, "clk_mipi_24m", "xin24m", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(2), 15, GFLAGS),
 
-	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc0", mux_mmc_src_p, 0,
+	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(11), 6, 2, MFLAGS, 0, 6, DFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 
-- 
2.42.0

