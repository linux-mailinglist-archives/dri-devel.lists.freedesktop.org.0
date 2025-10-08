Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0198BC3905
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6447910E6FF;
	Wed,  8 Oct 2025 07:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJAsJTAE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295E510E090
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:17 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-578ecc56235so4635287e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908675; x=1760513475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
 b=QJAsJTAEPlnf9uuVYHHhSfXcV2KSLd3tb2b/CMRFSNjCfYDM9SB/e7ond4R/xiRi4C
 Z+diwD1L6P3wRvQrLEkBYWzMlGF1SIwspEn5PSTjOt3u5KSB00DQJYG+gR2YFoevXpPe
 xBfFAE06Z6LZ5S0s4IuzVWln7JjHz3f/xM9a+6D4WG10SGHiJ1yfqwEVKAi47agm5siG
 QFUtTityPvLFVrefSI6IrPU71wjeQUKRd7DOJMvIRIlW8pWoEmgbom2l7rEdhm1O7dp6
 FyEG/y2nTTGrf3RR036f6veM9/O8Fc0UudzVXXSjIY2vsxcC31DLahoe0EKK87hWPClN
 gILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908675; x=1760513475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
 b=pXKDubMFb8dtxUT5UjI8tpb8Ic9Flno2JPPMpkhG0tiYlpbrpQj75yb81sfhBqe/DQ
 UJZFwo9yEL2vYCzkuOZPxHxJ+0LvLbDm8uTEQXCSs9VsqSnRGDL/17H/UvK8CumFejLc
 PhWNW1XYy7U5vu499lBfHnsqYH0FytZmOes4kzSLJ0Zp6CHOp5/OeJzBLuZT297XDvbQ
 9x1Q7pz515n2Zm/hTGUuXZu090vvYAlXKAVqrTtl2ZdSXh8veNyhA+89bKjo0s89C4DX
 ZACylthAbtgkKSw8gln5buyCTYb/DrXGWclTaiPDr2Umc1gabWoUIRWFX5tfzDMrIo2U
 Vezg==
X-Gm-Message-State: AOJu0YzBAsNUOvNmhaTCJnlpLztIGU6MCyzC4xEpees6Au7DLxN2fa/5
 FfLPEsCzngh2weyMtP7+7UKIcDhT+ScXoaXt+6aPNewsbt/QzneQMq5j
X-Gm-Gg: ASbGncscwkPgbFhN9WJU0KneKn+FBzSi/UnCX+e+ea2LGN3RUga57sx+AipmgqNWUvH
 tNdbdOZJwBFt0hc9m9E6cHyLjJFRCDdxPC3BLtjRljh9cJO/nuqDxfP6APiNpFjMHxWvOZ8AgVb
 nThQj97btr6Yyu1GnYp5aGeHrUUp0tWrzZmFvZmWMRC8qANpWlAfJfnDl/Klg4bs5OzNI36l+yn
 ASk2ASe3FiNacnTyqdhau7KLC47lZlHT0Mq3u38H2OrpG/I5AhUz7aNrqQhGjE9PMXLd5t5b7A5
 IRBRufQneH46GuuRjoMGQ6jKIdDYSV9cTThyaCZRzT8GA5d1UJK22ZTd3bsVSfGGogJJZM/XtWN
 fTffxbiRQePIPL5zCaJ0gadkDlS9sFRVPmjYEnQ==
X-Google-Smtp-Source: AGHT+IH4w5wUowLiJI7hgdEtUtkCn/YDDLljjRvew5jTKIWe64MrO+dc17yhYkOKlcC57NaNakIcLQ==
X-Received: by 2002:a05:6512:4028:b0:57d:b8a1:832b with SMTP id
 2adb3069b0e04-5906d89edbdmr712455e87.24.1759908675110; 
 Wed, 08 Oct 2025 00:31:15 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:14 -0700 (PDT)
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
Subject: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
Date: Wed,  8 Oct 2025 10:30:23 +0300
Message-ID: <20251008073046.23231-2-clamor95@gmail.com>
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

Add csus_mux for further use as the csus clock parent, similar to how the
cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev parent
name lists to resolve checkpatch warnings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra20.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 737fc2000f66..1a1758fd7def 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2222,14 +2222,18 @@ static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.drvtype_in_mux = false,
 };
 
-static const char *cdev1_parents[] = {
+static const char * const cdev1_parents[] = {
 	"dev1_osc_div", "pll_a_out0", "pll_m_out1", "audio",
 };
 
-static const char *cdev2_parents[] = {
+static const char * const cdev2_parents[] = {
 	"dev2_osc_div", "hclk", "pclk", "pll_p_out4",
 };
 
+static const char * const csus_parents[] = {
+	"pll_c_out1", "pll_p_out2", "pll_p_out3", "vi_sensor",
+};
+
 static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 {
 	struct tegra_pmx *pmx = platform_get_drvdata(pdev);
@@ -2239,6 +2243,9 @@ static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 
 	clk_register_mux(NULL, "cdev2_mux", cdev2_parents, 4, 0,
 			 pmx->regs[1] + 0x8, 4, 2, CLK_MUX_READ_ONLY, NULL);
+
+	clk_register_mux(NULL, "csus_mux", csus_parents, 4, 0,
+			 pmx->regs[1] + 0x8, 6, 2, CLK_MUX_READ_ONLY, NULL);
 }
 
 static int tegra20_pinctrl_probe(struct platform_device *pdev)
-- 
2.48.1

