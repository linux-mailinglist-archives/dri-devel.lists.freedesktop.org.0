Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1DB418C27
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7D56E7D0;
	Sun, 26 Sep 2021 22:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491156E5C6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:43:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z24so69315391lfu.13
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkvxncHOY8DvHcvIZZ5ALhHomt+6uxaaFq6TQ6h+fMg=;
 b=jVXoHlkHdIjsVQbhBj5b7uMh0ngrZd3PCHAddv4luagdEL6TKWeTpMQ+IO9TpBGwmy
 OqQvnHuhgLV8SPGruk2d2EWD2vLnFE6Msgsn8BnapdN1stWZsEp4K6n+wsNoGJuD0IER
 eY1LWvYENJqu2w8Z1eaDg5FloKTQR23sqI/yIxiBXAEfWx6ht/gAsrwPGcMdDDIih4IR
 53Ke9Er+8K9h9BnEbwMKEj5fUz2VmOPrLqNBce5GdSlqhm/mW++3r8QPVHLtgOE4u7BK
 mJd/qvmMNcdv6sNu8qxdNxkVxRx3ckDmC/TAeTmeShn6ADPvWSzoAPgxv8bX54iOtcSJ
 NYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkvxncHOY8DvHcvIZZ5ALhHomt+6uxaaFq6TQ6h+fMg=;
 b=Qzfml2uDXDTyA6EvgAp2VMrHfRV9MlScdqcYcl9K8t3b/jbP+i5T0tA7MrsMwAk/J0
 AT9BiVZKGRI7BrMg0wfQ6WDpiWtM9pNIEC2RJ0patDduD29iWBeJ+PoIwBwwFrF1QvPm
 xOxn1vMdaYW/HK2e0DwPiENKTccWBXfL3DBVDWtkrAadsW/9nxP0vYlqoDxUEBA9ufx1
 5EpnN9+dRnF0Oeldeqn8PiceTJEvFwECqGTipNZp0p1StBq8GChu2B55cnKLov3cz6AQ
 lyzdp+JSDMurwtDUTdKT7VlETVbSO33TQWTJqxL4y45g1Ctm+6CFMEfW1MldvBjIxj6w
 n4OQ==
X-Gm-Message-State: AOAM5319jN24zctuo4XHCwBu6EjnRjb6S5Y4e1olk19hZgwvyqKnTGk7
 wX0PIOIHKpKXsT/E9KsU2y8=
X-Google-Smtp-Source: ABdhPJzzD+Lqvq/0PXVYaK4xhRvgqBKhRcQUDKM/Bv8HOzifMLktWJTzFJ714BHPdsdFrCQQ0Hod7g==
X-Received: by 2002:a05:651c:1549:: with SMTP id
 y9mr10261640ljp.105.1632696187659; 
 Sun, 26 Sep 2021 15:43:07 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:43:07 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 35/35] ARM: tegra20/30: Disable unused host1x hardware
Date: Mon, 27 Sep 2021 01:40:58 +0300
Message-Id: <20210926224058.1252-36-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

MPE, VI, EPP and ISP were never used and we don't have drivers for them.
Since these modules are enabled by default in a device-tree, a device is
created for them, blocking voltage scaling because there is no driver to
bind, and thus, state of PMC driver is never synced. Disable them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index eb6e5518fb5f..05788c9cddc1 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -59,6 +59,7 @@ mpe@54040000 {
 			reset-names = "mpe";
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
 			power-domains = <&pd_mpe>;
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -70,6 +71,7 @@ vi@54080000 {
 			reset-names = "vi";
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -81,6 +83,7 @@ epp@540c0000 {
 			reset-names = "epp";
 			operating-points-v2 = <&epp_dvfs_opp_table>;
 			power-domains = <&pd_core>;
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -91,6 +94,7 @@ isp@54100000 {
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 09cb1ab75312..f9613384a487 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -145,6 +145,8 @@ mpe@54040000 {
 			power-domains = <&pd_mpe>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
+
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -158,6 +160,8 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -171,6 +175,8 @@ epp@540c0000 {
 			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
+
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -183,6 +189,8 @@ isp@54100000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
+
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
-- 
2.32.0

