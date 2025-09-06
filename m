Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC8B46F2A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862E010E374;
	Sat,  6 Sep 2025 13:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dw5i0dX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57810E0FE
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:07 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5607a240c75so3072898e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166845; x=1757771645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wmFPnjEOhtHe75Vr1hkySKhaOYSvurifERbXhZkjEA=;
 b=dw5i0dX58il9HBBVvcyDd4YhiFleClT2xPQfmxyrHTRyuunB7JjvtX28sx3pT93MgS
 eizo4v46cJVZ3jB1rftR+Ah3LBpJJYTGQkpWG3EGK40pVsD6ozLf67guBbYorTKkxV6n
 nlkGCV+3ZnRa/Nw63N2kr8+BDS9YJO8QFMqS/dnTYfVckZsUm95HZad/C3ZXYEFrL89s
 HdtLqL1Zg8FZcTiVKui3M6eAYvMJSkg7EEpgfewtElNRORO963+oNMGtQ2m7HKfH/opA
 gEcKHLsvdxJVUCw3IaKprXo4ffGIu2PueUYOlV4RQokE6Q8ZaSy2tX4r79tzDp4LUF8Y
 1U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166845; x=1757771645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wmFPnjEOhtHe75Vr1hkySKhaOYSvurifERbXhZkjEA=;
 b=Rwmf0gmdatSIqb8ZXEN0OsGvOyQ4jYhVmeNaAIwFyAjbrpSoCrwu+47aAe5v/CiCX4
 Vc9Ow0H5qxPHPjl+gBhBjaVum7MmsS0zAz6FXYHqFiWHqdjK2MQszR5spK53D9LNrX6G
 8wzsYY0ucGsss4wcTKxN5dnsfdZv9+oG78GyKqIQhmGjt3lAaHfAVWYyU2GC5FZ3OZDi
 uctEabIh/xkjH+RXpSV7xoxJDnc1HS2kgRIJ81/k3jb3tlJDpuKy2lq/6BMHZqgpnHDu
 bZfag9SSNB9FuCXePbtFgCwOwjVOy911rPjCpwKIlHQHrcj80vE3a4MNH3ijwPID9D4r
 u1oQ==
X-Gm-Message-State: AOJu0Yyjz7Vj1Wu5spSVLoL4EsSm4jIYcTOjct22+OJOUicH21KFAId+
 2oEdaDsohYzhRZHsVgxxCd6bvI9fhrJKTJYHXX0oYk0y64pjNWpcaXap
X-Gm-Gg: ASbGncu4CF+lD6Qprf//PgHYznpfg4gv37o24uzU7a4tXt9mKOm1VV3csgQgz5vTByx
 rqZBxoHtzBuznrNl5PJF/LWW2VbzFeY0zX9BAlATw8MxuNCEyf3HDwhby9nUSj3vbMTOLaiq1QF
 cXlarxN1I0q0IAgJd41JggPQXmhG5C+ixvFl50c8lCUemLRv4Vw9c8lQsXwFX4YpfHE/AoH6UNk
 wYWYz5aq/7oFT3va2oEKckWA3EYqJ/nzK36l3jpp0reEpN9a8SQ8Hcf/3w7zuEwoM3nLt5B4Zxu
 +dxQhy0iLCfaKpwcfqi4QXC1QCXug/VG16BCt3NZHcjVCiBUA8qxX88awLH/jRzzZF0sFTNNp8c
 YV+lfMNNviGX0S1C4uYb0xs5L
X-Google-Smtp-Source: AGHT+IF1oIuD7hAEOhucs7ujWwrMDLFuXJtRrwVwRJHgHcWW0EsIpJZ1uQrHmNQzYSIeaL4YgL0RTA==
X-Received: by 2002:ac2:5687:0:b0:55f:4ac2:a5a8 with SMTP id
 2adb3069b0e04-5625fbf0b05mr589085e87.13.1757166845287; 
 Sat, 06 Sep 2025 06:54:05 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad
 clocks
Date: Sat,  6 Sep 2025 16:53:23 +0300
Message-ID: <20250906135345.241229-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

