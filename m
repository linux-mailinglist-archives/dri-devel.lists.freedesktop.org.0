Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB8BC3917
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F7110E763;
	Wed,  8 Oct 2025 07:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DpRgA6Mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE8510E762
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-57edfeaa05aso8453320e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908679; x=1760513479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
 b=DpRgA6MooIioxpDr6/7uRJwwhOyxnz323ng7LfcvJ3vBAg3eKfuhmHNiFR3QXdsPcs
 anIFquJUUdeLnXDDaZGyMHSwifHRH3oFD3GtNyE4ioTC9kXqaxd4+LLzSa3SRmYILp5q
 jOhvt+S0Fs4ae9UAgAk9I+kZFCuhqGNJvlzDXL2t39x4dmuyTc87aeFRBh8970uiuhu5
 98hOb6OWotr+/SGmIqHzRIwVot6xgS76fYng/Hgb6D5K88+RzKrwY5fAmJ+LIRNKDcaQ
 w3NWcjFY4PyWQ0GFJaB7jHDasHbFYDjMUaeCqk7fKjboE4zzlH7l9ubAF0HLRhi2ZyXi
 tSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908679; x=1760513479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
 b=XbQtNwHuUalBJ963wzqLWMzqS3ky+0jqTv9h8oadwC6lC/IPczN6lZqwxWHavEqHDe
 eQqkDSryxluyKfEW/f0UQ4aRSP7YG2RdWJBKD/tozupBDj9hGhqd43jT0DYzUveQeWub
 TWgRv7xE5TFN+yimgl4ANq0jLe4zMTkVDoMSvSYayQ8bgMrJFPEEdArRTO9GUaSe+DN3
 LjtxgizcyriCoC/G28w9HxInHrMPcUJK2Qf5sItCNtiZM7ycPgE/sz9jMXzuQsAxssJd
 yUjyu7YmC+B6+8vQQ855+L9NYe9hF9RQr1Di5O1Eng6BL0ROwRpF+Iq7vlSljGVZV/ND
 vSIA==
X-Gm-Message-State: AOJu0Yw5jAHdJJ13pgBbKuoEy5Jx6ILtKXXB4FB1nW7ahxLubOyi0iB3
 1Y/lTrPOYmCMFgM+OH+vlreVL6cD1tDV7Whccqv1e532Bcj3LqMSj6OV
X-Gm-Gg: ASbGncuaSEMeT6dnZIUCw6adlG2zUgDW0AvWAp0e0OwkAMgZ+jgm5zqoRmvNNZRhJEr
 pdlaLx2hz1ZkGjSg3vhgbk+m+nx5vIQgYvJNvk4GpoLg6kVqrSR9BvPLeqcO9oaB/eQS7ELAZ6K
 BbGPZfgvyO/zaaTKKqK2OIRgLx8PvvXeZh2BWBCI2qM/liYXZ5903WWB3T+feRTKm9ODoLYL+/K
 +b5c7TeYTqqm4Lr+MAvCticQpetvDK8qMACR0rjQALEG9mn1wumnvOUn65sn0LKfX0xX91AVi8J
 2ko5dLf/YtgePJbpVS00PbpRHmJ8jXcSDWhvT/scsqOvvTBqe+cpxnR6Xo13IFM3LnTxODIx2K/
 iriLhCMNR0wTFzVFCyu4QMyQxWrcb0hcceBvAEQ==
X-Google-Smtp-Source: AGHT+IH6yVzn596rSyB3yJ9XBLWXz7u+miIMTSdihRGfwsNDTc+rfVY8kk2V15qCy1XHoAjhkBFITg==
X-Received: by 2002:a05:6512:3daa:b0:585:c51e:e99d with SMTP id
 2adb3069b0e04-5906d896bc4mr657722e87.3.1759908678413; 
 Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v4 03/24] dt-bindings: clock: tegra30: Add IDs for CSI pad
 clocks
Date: Wed,  8 Oct 2025 10:30:25 +0300
Message-ID: <20251008073046.23231-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
clk-tegra30 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/tegra/clk-tegra30.c         | 1 +
 include/dt-bindings/clock/tegra30-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca367184e185..ca738bc64615 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -53,6 +53,7 @@
 #define SYSTEM_CLK_RATE 0x030
 
 #define TEGRA30_CLK_PERIPH_BANKS	5
+#define TEGRA30_CLK_CLK_MAX		311
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC 0x8c
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..763b81f80908 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,7 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1

