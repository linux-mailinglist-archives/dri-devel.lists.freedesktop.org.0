Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5DBB08EF9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0910E82E;
	Thu, 17 Jul 2025 14:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HmtQfXbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B81310E82E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:22:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-553d2eb03a0so2523855e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752762124; x=1753366924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
 b=HmtQfXbWNwM2rZtDS3WpGjk4DAwHQgcpoYivoeEiWEuUEJI/vCvwJsG3hLOczvVOuG
 4/sW80d6wM1nsmIn5O1PTTJab95XWuhk3+Qs1KOIfw0VEFx7pcRroHxl6QTqdekxIltm
 ftF/efIMbTyvDjbw4MBSqN0EhFMNpoY4gzCr2b9PvO3WmvDBhQ0zhNq78P0toUA5/DZd
 +tOUn3OSwOK/GyGxlpC7tk7ftEvaY6ZLi7L7nPlon0gSNm80qjfxmmjPcqHImYYlgsr6
 24TCNv/cvqoYhDiMwlFF72QDjVcW+84ALS/nKsS6zC3VD62GP34HuU5QccfLcF1krlAA
 dB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752762124; x=1753366924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
 b=mUKparSBP41gbdLpjGXSqDexMDabqeIL0mmYM7HdBAaHjoI/ALWiA1XrhYmcceA15r
 OSB+hxtV3zIZ3KF6jQLPKqZMoyEioyE8v3zepiGpo6nD919xlIhYOVrg7+TUU+JfJ62r
 Zbw55DKGQ2B9xuPeKJIKHtrJVor52mdPc4XfSfZilVkQqYOZZN1a6p9Apu9x7oda//82
 0N52Xy5cs2EO/dIUnFHV2lzayYL72VmLCXVssAzS2k/ZzqsF/BwLKl6YstzQbV7IJphR
 t4syRGFcf+RjxpNtJuoOg5wAH5TzIngHr21YCerS89v2Yml3H1Yen589+v615AHY/0DP
 QkiA==
X-Gm-Message-State: AOJu0YxdQHpAnch+OVbajeHQSOA/m7f0A/Qd8pLz0ZzgiAthIEoMrOWa
 3lrPl4fHJFsSukdmdaY9btID0tiNmPeHZP/VHdvZ8ApJxxRaSH5llc+q
X-Gm-Gg: ASbGnctZb5aEFt1mt1pCNvzNvoNjeVfMZiKfsamJXsNGX8lr4lQQPung1AOsDi1N0GX
 myC4o55tNDDmnNSpEuTU61ZWhrRDyF4JjV8xwS3SLFlNmC23WAvqCtFRhVRqWoPGB0v9Cjp+iAY
 udjmjHZMzws+rZeB6l6bo9frSq9+jyBNPZskbNFACmI0/f69QkeTv2PuH7Fh2tupnwtSsINnF26
 lCh+bm1vFEhaZqYSqavV95apyFo1feST+km4r/WhkpcmgEVQ+4VIYhVr0MPo9RZ0T6nBwSglxNQ
 n0PqLRycY2i7kZ+WNyLkqKc9DK1xm8GtCr9/Vc62YWuZqQsu2yCuGmIs/pVv6KNRZfGNaLg3d4h
 NSwvbeAo4/A78cA==
X-Google-Smtp-Source: AGHT+IFVLvSyFMYeWgDO3Q9TkYiZnGsx1YBjsxvDp2uUcTuS3i6Q4FWTpirXn5sKnIPguPZLkF6lZA==
X-Received: by 2002:a05:6512:15a2:b0:553:2969:1d6d with SMTP id
 2adb3069b0e04-55a28cc948amr1101140e87.13.1752762123691; 
 Thu, 17 Jul 2025 07:22:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.60]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 07:22:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v1 2/5] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Thu, 17 Jul 2025 17:21:36 +0300
Message-ID: <20250717142139.57621-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
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

Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..551ef0cf0c9a 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -802,9 +802,8 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_MC] = clk;
 
 	/* dsi */
-	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-				    48, periph_clk_enb_refcnt);
-	clk_register_clkdev(clk, NULL, "dsi");
+	clk = tegra_clk_register_periph_gate("dsi", "pll_d_out0", 0, clk_base,
+				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_DSI] = clk;
 
 	/* pex */
-- 
2.48.1

