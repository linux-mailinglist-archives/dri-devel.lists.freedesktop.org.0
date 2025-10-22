Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A493CBFC710
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D438B10E7B2;
	Wed, 22 Oct 2025 14:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ETbWg+1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C510E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so5676870f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142886; x=1761747686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
 b=ETbWg+1zwE+iDpeOUXYDWUVlLTLLS4wIOvwut5wyBunXst7CHmwjswxm39KsZCSByK
 ycnAYwoGw03ydYBz5g7PiaLAxK8VWlKXvZYPHzRlam8gk+4sKrQC+nWfcuQBWU6TXKKH
 JgWObU7sQ2/ytG4sMyg23OOp5eiJRxtEydd9DN4rMwnhxPYUsmOkvfC0PgPMQlVAV1ca
 av/ZQkx2tQKz6m5LRRHL9Tve2LDqYiUR9Lci18Puxjmi9eB8JXiXeKNJpKqiLriKWsbi
 o+CHpEUzfeqih31dZuCnn2039umlFD3+5RykuL6zeBl3AaWTFL3Rn9TuNZelVAqDQu37
 4E5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142886; x=1761747686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
 b=Ol+z5XPB+XoPAEzqq3mUTMYOMRRj4FUIe/n2HsCUv9Apns4VL3l4LFRwy4KPgUeJr/
 ufBEDvMscFmii5Tw+HRKqxXk7vbAVX+VvYthCZClZV+y+P1EZzSHsGx88He7Ds3upB9o
 V50OhP9mWUcgVrHAid922jm80Su16OjQRlUHo9qbUlzoSTJzUW8rxerbx2LEHo2DBSy6
 bUhzuYmnscoE11ABqAlAX2gIRsQ3JdX60B12J2khcqm6P7JdJQh22cU7/j5UBQOfAgp/
 uf8a6tyxrGQcoJtXBKLFz7s15Pb7X4ezso3wQnObwkw+peo9WrXkJn3PTgkMW6Z2D4DR
 Wkqg==
X-Gm-Message-State: AOJu0Yx0GpK+NgPPoSwzOpev/H8036a5NzhDd6SXS//eLi4TUgvkA0ZL
 KWIiZYAcuSIQeuyMXjTJWe85hJUb67hozwNxQnaci5Kg22eKHFx7YPcc
X-Gm-Gg: ASbGncshOK2lO0YIrYZlR7cgv+TlnNdKGFKMYKf6ccKCjyLncTBnWSkKZIO9rXsSmiD
 Y1dg8X+oUvBUmJYKL3fOj7pbYvIPQuaWIL5f6bht7V7aUQ9jdVWJ94r6jCJecjS6pTsBKIaIojY
 3ZFxMUaUJX6OjA7P+22x+0Ldn2Z/9xjkeOjtanQMexPV4HBhwQEy+p//1DYxE/p9XHOQYwJOr6F
 h3f9gFytLVJmYCneHCczN6lNSkfe6PiiLhhtB8jDPA/hJM+zM3hVMDFnw59wzD+j6VESdzyR0yh
 ZHcP2nNJ+QXsTuu33a6BXXAE+ueKX3yq+UJEtgcg97vBu3nEYBA1m8ptURQHopQNTcXyGF9AU58
 1iYVpNKu+Lg4jms3vpal6rsgSACN73iiQOR5yadbsKysywzNUOysJ07EcLSPTQaEAOdknubcnWL
 065g==
X-Google-Smtp-Source: AGHT+IFCY+Sxhr527k6+OJwXsM0mYpA87pB8vo+egXovwmlWxMOKiHZRGcuNGUJAN41+XF6ergNZUg==
X-Received: by 2002:a05:6000:3113:b0:427:7ec:ea41 with SMTP id
 ffacd0b85a97d-42707ecea7bmr13107185f8f.57.1761142886167; 
 Wed, 22 Oct 2025 07:21:26 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:25 -0700 (PDT)
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
 linux-staging@lists.linux.dev
Subject: [PATCH v5 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad
 clocks
Date: Wed, 22 Oct 2025 17:20:30 +0300
Message-ID: <20251022142051.70400-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

