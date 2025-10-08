Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB66BC390E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9871310E762;
	Wed,  8 Oct 2025 07:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eIFOQjMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE6710E762
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-57dfd0b6cd7so8387387e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908680; x=1760513480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
 b=eIFOQjMFxgrHvZzlHwJtdRLgdChNLEWr/nnUyY1neooueuLdoqTg73Ps8ZXxdNIhK8
 14RqPWDvMSb+vvanpuJGb/GlMo699PIRBjxbBWjBb3J37y7e3GnQ0RO+ID8+5iMdt1H4
 kCP09o5SA6nkTMomHBnPKWC8hmhTvjqb++VSV1HO2UBiPZYJHiFLanjN7x7z9WwdzvyX
 VH6MeVPyYW6W0vLkF61ORP6iGmGWQAMqZsUdl5tXp/HFZTbBRB940v/yM9uFdN/G8y0g
 ci12vnoYKo3TFDmfcc1r8B+UHQDRIa1wveWNHUEIuK9X0Xpzs9efn1SAZyb/8S3fvpwe
 SyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908680; x=1760513480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
 b=j9bI5jH0VhjszQceeLbDQWH1HBGBaLzpamy2ppZNzbgV7eLi5+z6Ghb49LBjKMlhlK
 nfIvLsk7DN9NHbWz7gX4XW6bRKSCkQou8CFv1czBFFDxw337C1zNlykN6RR66ZHWPQfe
 /XCWcUEt7tiDvj7HVIREN6kUHkUzchxLffoSDfZ4aowc3gwlbrSj7sr9LfPGFWGmhVST
 CtkZQLSJcbVikSnS6EWm7Yq0tYKnQuhirllLaE1tGsk1q/xH3VFWzyLXILrMeFWDWWKx
 ccNo4bpQAg3RevnQV2dkz60Go8P6oMYHX+xuxT7xxFAM+S9WKd8fFdiyUew/ItKANZts
 oZDw==
X-Gm-Message-State: AOJu0YyhQSOjGPbevlRR1hAxsOgEPHeHZJOiXBltqmd0eiIdHmb1Xr96
 959BCj/DlrECsb34zJ2juFMAvGt+y+DxB9kd5fDtBFo+Vk9AQGGRM9rQ
X-Gm-Gg: ASbGncuGZh56KtAE+47tFa+GSWkwb24cGOd2ERvarNQu/2SlQ80H9Mno5Yt94j3zohw
 YKR+pAZCWTM5vsdX3QEXMF4784SEk90BHAnqx4y9qxnFH3q6nlCAKOqcxnUUXLyriqhtocX2NCO
 cqDhquyd2dPwlQgiX6b7eYWsZp+ZheMrcldHI22LEWspOOxGtPPXsrjh0v95avp7WsKYcrSJvtX
 YBr0mx2PuVB71rnzuJELsQ8UtACMP6+eINEJAdluhc3Avy6g1u9Lbrsii1Lu5rJWLd30TVv5gIq
 55qGvIJFZJMVQBSDehn5wz+8vbsO9pLCUjSSd9yKFaULLAMe5FFX1o50wztwartAe3IwkeQ2IKW
 l+BuUlQwMgkKvBVlxwLvag9EBB0xWH2TlK0MX5MW8BVRYut3Y
X-Google-Smtp-Source: AGHT+IEZP4fCBr+12IlYOXrH9a+CoFe5hewGhtwyyj6VYBFCCNVd4VpYfDkKVBWv8lYOk7dl7gjLUg==
X-Received: by 2002:a05:6512:2312:b0:590:6598:4edf with SMTP id
 2adb3069b0e04-5906d9e92camr655190e87.47.1759908680085; 
 Wed, 08 Oct 2025 00:31:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:19 -0700 (PDT)
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
Subject: [PATCH v4 04/24] clk: tegra30: add CSI pad clock gates
Date: Wed,  8 Oct 2025 10:30:26 +0300
Message-ID: <20251008073046.23231-5-clamor95@gmail.com>
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

