Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56892BA02F4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B268A10E95E;
	Thu, 25 Sep 2025 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DQVVL/89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00010E2D0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:18 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5688ac2f39dso1245257e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813437; x=1759418237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
 b=DQVVL/89jv/nUylOsLnb/vfYa6JmXV0Pjh6UGntm1iBtvMKLhmBJ5FeiSPYf6q0RB+
 C0kvqhJxJaQ1Nn44au1X1TcOYjQYEowYZ+qke7Y9QUPJsrGkw+G6c3zmVkXyZim6cwL5
 0YpGD/OZPaTBZthVA+kXj+lBqogTHlOn8pHgPc2jnHiiOCAIaovcLWapJ+DIiicUgfCT
 S7wDzTXduJEp6xTU7gOg4aRkSzC2FQP8kAqV2mHpyFYl9OuMElSji2fWad/U8fXuQHPO
 mKaHg6vCgXsiSjJwh+zGt83cMUtwG6+hnYDyuriHMZVeag8d6G8tCnF0UphIsZ2vcy3J
 E/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813437; x=1759418237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
 b=EvylLySYy2MHZ8aU3C+DsH987C3ZL2k8ykLTod0HWLPXzwyx+UM3ixJJZkpIsS77Qu
 hR24tssU1zxkxJhe3kWLyGdEjwjvv9PZsXMsMpOJKC83/XDxCT0Yko/hDFDM1CujrObk
 ldDHdoWjAmn6haEWQ3t4IeC94OOKkiFATvX0gCp6qfa8g/FqQsVtfKMZXCbKAzi6FEIN
 N0ekPloH9gbdWe/45dzUF8IIFg4x2Juq6ohT8Mcws2K6PfBdmRcmEJ9gN07q8llzax6l
 Aq+e2shOTgt/8Wwg+50dvat1+FLWDxKqVHvniHRD4yk6icQ4x+op90ThI7F53kaSot+I
 XjyA==
X-Gm-Message-State: AOJu0YyCBCKgEX+me9Z7ZYcBJ3IJGw3JeT7vJelr9cva0QFB8YJWVMxI
 5d7Lj94RXkpJTH1/wSP9aCFOc1d1py5Zf2Cxt5IKOS7qI7D3mEoDXYKy
X-Gm-Gg: ASbGncvqQHSxll0lYklT9/ge6JZfnd680fnKuhMM8Xe+/+3ox3y3XtGxE+fareva8rQ
 8wB+pIxLQcvly9vXe3cBTj7hwHmOLdn5pHfcgEF25ha1Yso7GdFhpPTAOrkCjPkDcSCQ61odEoS
 +6gOseaD4z4LuvVA6WCllJEz1L2RKNCETvpdBrVMPnTrkhg6ozUcY2a9AfZ03gdJoB0Ht2Ie3+X
 ie8fqCvvgdea8PdS3UHmmVQQaJbaqiiTrTWXNm+pzAO5nai6pwqrFYi86VEFbs3Cj9V2rqCwu5I
 yRXBMylNCL18kATFdySsnqJhukfaBatfYqqVi5Kdeb5Sjjz0L9Nq4YhhH76zow1NApxfzQv2uYn
 ZF15W8efCSfw98CdsfiaXqmX3
X-Google-Smtp-Source: AGHT+IE0utS+jecb/LkEfFuQRpDoO+zVGhi+NkEAr1FLNmKoWaS6Wce1hEkVKYRO90wTwE672u05Dg==
X-Received: by 2002:a05:6512:3e11:b0:57a:de0d:d9ce with SMTP id
 2adb3069b0e04-582d2f273a4mr1035976e87.44.1758813436654; 
 Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
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
Subject: [PATCH v3 03/22] clk: tegra30: add CSI pad clock gates
Date: Thu, 25 Sep 2025 18:16:29 +0300
Message-ID: <20250925151648.79510-4-clamor95@gmail.com>
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

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add a plld2 spinlock, like one plld
uses, to prevent simultaneous access since both the PLLDx and CSIx_PAD
clocks use the same registers

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra30.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca738bc64615..61fe527ee6c1 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -154,6 +154,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,16 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA30_CLK_CSUS,
-- 
2.48.1

