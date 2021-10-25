Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994543A786
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171456E3C1;
	Mon, 25 Oct 2021 22:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC186E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:23 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h11so3747750ljk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUl5NgtppOXN7aMrj+VJMJxgtwwCvjbf2LUP4ZJTZHk=;
 b=dM8HQOakT9lKwnlzX8oDz69wX5j1TjDnrC8XDQpJ3/grT/a5UOQT72pKmmWOeA+nw5
 hwS1AaicnlAS+Q3JuF+ijqvdVe4Un6yYFhFplrdKyeGItVsGKKcqDiC/7fQHeHpKybn0
 mi8KXBeDO3NELpLv4ar+VQwjOxNzn0V1FHmGK4K54a2y92lJV8T2Xs4iQadhxe1H5kx8
 949C5LowvQw9vTNqSPVd5lnBVNk3LEVCdQxC2NHFJOFUZ6q/S9pksA16cLzksRcTmCPm
 sc8c3tPIr72zAsfojA2oE0GaEnvZY0XTwZQWzo9WhpgugqOWsN43BXToZPztYXToBEiP
 J7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUl5NgtppOXN7aMrj+VJMJxgtwwCvjbf2LUP4ZJTZHk=;
 b=iDAsZK3v5ZmlLAVPklCsfhe1oowePyeGTjuTq4ynrpW6aCUefOWAoS6cgVhnX8wq1E
 dc2jFsLqdSkOwbhvf8qs5AMmCDwInzXI4yk6zkq3xfSvTF//Qhc8eavXW+VIZDsDQbKN
 HempLNzjiQr66PBwkabAvE+8IIquNDkCZLJGFw7xCT5tImHBQ3Mog5324upWvG4mEeYp
 Ar4JwCjqCoQpbWzQdYaVp9eoCDs8eFm7zItUrBe1QscZEdP4oXvP2CVisSTatoow2YKH
 ADHpS0MS0wUQ/u/yykTwIcQjV5IUVN/rzoe1IR7GZ0eJNi490g4V9iP5WrfHQCXJrwhe
 tyJg==
X-Gm-Message-State: AOAM531ww81rqzKNeFJEMM80AuZxcUWxSLAuUBt05mSwHFsWG+C+oqGl
 +yfj3JiG8wbs/2edSNyyYxA=
X-Google-Smtp-Source: ABdhPJznfzGWMyl02ihP30IcAisfmZn0lCnSMUeLm2QIKB/p5f1vAU2HQg628QiAR5z1U8DIPh6cDw==
X-Received: by 2002:a05:651c:556:: with SMTP id
 q22mr21587546ljp.314.1635201982105; 
 Mon, 25 Oct 2021 15:46:22 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:21 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 39/39] ARM: tegra20/30: Disable unused host1x hardware
Date: Tue, 26 Oct 2021 01:40:32 +0300
Message-Id: <20211025224032.21012-40-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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
index 7b69ffc57abe..8010b40d7377 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -59,6 +59,7 @@ mpe@54040000 {
 			reset-names = "mpe";
 			power-domains = <&pd_mpe>;
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -70,6 +71,7 @@ vi@54080000 {
 			reset-names = "vi";
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -81,6 +83,7 @@ epp@540c0000 {
 			reset-names = "epp";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&epp_dvfs_opp_table>;
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
index c1be136aac7d..d961ce3761e6 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -145,6 +145,8 @@ mpe@54040000 {
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
+
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -158,6 +160,8 @@ vi@54080000 {
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -171,6 +175,8 @@ epp@540c0000 {
 			operating-points-v2 = <&epp_dvfs_opp_table>;
 
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
2.33.1

