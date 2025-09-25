Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C27BA02F9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25D210E2D0;
	Thu, 25 Sep 2025 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NK65Ne+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E693010E2D0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:16 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-581b92e680bso2208797e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813435; x=1759418235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
 b=NK65Ne+ETSP2mlj3wdeYMzZJtQFT51yFhfLhQQd5s6Glbp/1B/yIBPtBpGRiHEPONn
 H9dXzg5wCYdtXWG9nZOnLU5+yOcHAwqGVQKB917nFImCBjVS7WYd9hRu7Afd92G+ancU
 o7uOMPgS7sW/06KZr06zhRB1DRORvdLv2q5aS5/AEPmL3BP9mPMM97Aun5n+96c06gI2
 U1nbIY6MyxwDa+UjlvdOeaUJ/bkSX/1D9s3M/LoXHbhm+P91nLThDLWyD7pObLOKqInq
 zW8U7zfdqbdf7LTo6gukH6HLXfC1fpgsa9MayN1SXZCDOcgm21fFoizGobP9qvkuxSUw
 IU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813435; x=1759418235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
 b=nYK8Uwg//Q4RA0zgjsrZ+7UoDXPQxic/3cnd1UvOmoDDVb5TdwmcgQrjJ+6f2+WF+7
 YynWLsOns4stBlCuyxFc5mV2Pawc+LAn4BnaOo4AC+RXE9atSeIgLPdi6ChkcnBMCP/o
 7e3+UsSt8/MFwGHhHwHOJQxfERx36GwX2x0xDFIgD6fIOOVQwg+T5Tgt1P47bCB5MGXo
 f2KE0XfKJFko3bBmjTLzCQbDGVkmYcI4QSK8Bd+KS0ZUgzZJDEvJ+Yrlx311WolaUrOy
 KITy/y/t7ruvf189yYBDNggxmBZwh5VNE8dhFHpR7W3UmfQLDN+sDBfhRwunM8dQ7lVB
 ofsw==
X-Gm-Message-State: AOJu0Yw1vp0IHt3E257O6ZmJ6KtcqUuVXvVRs4jpy1FPsfsVhlngDvE9
 SlMKl4qvdegyaxxU12GmWQiY+GXNMGJOOGNBkBsHeQw7ik+xQrgHjgPq
X-Gm-Gg: ASbGnctW625eV5g7YLNUtnZhP5lgAGfH9JKB0vXlIldLJsCVfqoCu8fppFsiAJ59FdB
 P0W82PkLjh2sjoiJ7kPH/x32lu33w6AC9bgtiIA7+9gp/LWpfwfsq8Bd2ywGAomsmBkAggVrM1x
 eBNgLbtEgZWg+wjLuF8Z6e/4sRis9Gla/fqgD/8RUQzQfoVzwav8fCURbEVhtdKerjv9tOzMp+F
 /0oKgdjMoV7zktmjUapxV8femXvoBZKX5BhxuZoE4eHjKHb4YoCYdYLYSWB2JNpOmmPS0wBINcz
 PPFSRsfjJqX/oCugEjFl2UnSwWBueMFuAMTv905IBPGxI8v9PHKeVVtQf4PLOJ29wGwAeZ2BfD5
 CtogLXSh38uG7ddpCaCJyu7A5
X-Google-Smtp-Source: AGHT+IEZhoVTWc3JU2yVQQC2NvFxzQUmxQf+nrYtPw/ltnEPLZ7YBlNqTjchqSYHU9qwgFPB+3ThRA==
X-Received: by 2002:a05:6512:10d4:b0:57e:2f8e:5f0c with SMTP id
 2adb3069b0e04-58306406032mr1045775e87.15.1758813434918; 
 Thu, 25 Sep 2025 08:17:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 02/22] dt-bindings: clock: tegra30: Add IDs for CSI pad
 clocks
Date: Thu, 25 Sep 2025 18:16:28 +0300
Message-ID: <20250925151648.79510-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

