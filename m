Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C2B46F1B
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFF910E379;
	Sat,  6 Sep 2025 13:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RPNKLbWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AEF10E374
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:08 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-55f69cf4b77so3196706e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166847; x=1757771647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9i6OcQVl223L1rRsm8JFsKq6/v1CeE5Ws5ZJzPzHaTg=;
 b=RPNKLbWNY96zNqOfM4/hNBXqPyTyMwPm8BBJTe12KFbhCrWeKLD8EhoNAq0EwVQvvX
 FwappAKmOUPpLZHh4QGkE1gWUXtaobFfZtPI5lwDUQ+F+rnXFEmnrdpxnNJTaODJdx9r
 s4XhBuI1eG9MHlZJlVLzcaL9kje5x7fRbK6qkb3SSXtyh5NKkP9FK35kOVE/ldq3cLPq
 OygvlraayV3JZ7Fkt+y9rtbqEqHk+rQYr4GkdXvtvnbfKaMp68eI3WNMDXRvG3azgojk
 0/8AKSgXTxzXCSG5LCoe6iuhTJZIY9IuuRmXMcFDLeUcL1BZnY3d1BVpPmyDhxcuNL6B
 odzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166847; x=1757771647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9i6OcQVl223L1rRsm8JFsKq6/v1CeE5Ws5ZJzPzHaTg=;
 b=UzC+S8UCnOoAkVBBpp7oloMd4f39pRnDt6d9DX2A/VC/rJZa6OpeuI2EgI8o64ePKp
 QDqhhiBIUGlLENG+JxlVNGxH4Jhu2Sgl39CeKDC0TyQl8Uh+dhcFHTN4W/iVwTojHaYX
 tDMNlz6Vn+UZ2rPGGvUlrGqfEo+s2c1aWgLLZu8QlQm3FyhRry0XS0SvMm6G5bWOUjtU
 fGhG5nQNGCRtVsncbQgxtttO/S/1TFtQREgCC73RALK66UEz9H5gyxu15KxpclUl6BAA
 1j4P8Y7cTIe5oV7oe9kSUZ4TLKEdim5gbVyj7rnxglRUnC5Dy+0et44Q1olys1FfOqX7
 Ngqw==
X-Gm-Message-State: AOJu0YwxKVRKeKFHqaer/sU4S56yHQ1rc4CAGgcUpG2swrZ+Ea4w672f
 2uVifHqavF82w6YYPfzGVAjjU9s9tXwPnTY7d67IPIcBq4pb8CWes6y3
X-Gm-Gg: ASbGncv4ljZ2MZzhDCoKIoC8iZixJkbDsFw+/9NsUV369so2tlo8jJ8bDuTbLu1i4ie
 kKsRzjisTIebVOmFb921ps9wii/Y1NpJafa2QQtaJE0XP+RZ/jZkFyqNn2wc+7cCQWg2/8n5pKk
 qos9T8L8y/1E9VZhoBW5WKCGQRX1R48kyxZXx7m8czUPSqQsiRJY6FryLe/TL5Yr4ysW9lKW07i
 xP7ODhGCAN4sXscjhJPVrbWyXB/DM2I0J6ndrkVHJYzWFoFPv0AQXkqLItBGADObp8bsAwWG13Z
 3J9A1AZ5MFwQ2s1AmdninrDQDUj25yqCpzHHI+eZvuYkUTJm2ndAsu8ja/WoqWSbSiQm63DcYWR
 TF7R4T8Re9R3BXQ==
X-Google-Smtp-Source: AGHT+IHOTXlLeFAX4PeEb0CFRrWklYJRkXCSL3HIOnLPeENoT5B3vXrzBWCpqmbQzCgd2aQkyH/8qw==
X-Received: by 2002:a05:6512:1188:b0:55f:572e:2417 with SMTP id
 2adb3069b0e04-56263007fd8mr640516e87.56.1757166846889; 
 Sat, 06 Sep 2025 06:54:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:06 -0700 (PDT)
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
Subject: [PATCH v2 03/23] clk: tegra30: add CSI pad clock gates
Date: Sat,  6 Sep 2025 16:53:24 +0300
Message-ID: <20250906135345.241229-4-clamor95@gmail.com>
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

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add plld2 spinlock, like one plld
has to be used for clock gate registration.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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

