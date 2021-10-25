Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23243A778
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3266E3A0;
	Mon, 25 Oct 2021 22:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074596E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id n7so12464699ljp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDfKTCKLqf9G6JM8mpqxRAZhh67bMGPfUrf1PMFZnmE=;
 b=DQFtiZJRzwYyQSiSot3eZPc+auvU6R1hIV8c2YYOgx26qKiphx3R+A0na2iyUTakrn
 Sq0hupn9tVdOtC7rxxuDeDialesAmRmSSuvDQV5iEVe6yTMDGII6voTtCHqkVqsPEwph
 63jgt5PFcWTSfyd3eC2/Kxc2bUINZlHjn8GtFk2r/OjtxSPzQlS6SXf6UZ2e4f+54eJR
 axJqj+c5qGuXI0vRosopHLIlmF9dBZMeTvL93zMutgyEacTwYla5w95Yq+cVctJGmch1
 zyxkZUjDUI7cJEcTvE2mDLcekGTndgo61UWOcbZ0naRb6UVpYY5Featjhd0LpP2owRJg
 vkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDfKTCKLqf9G6JM8mpqxRAZhh67bMGPfUrf1PMFZnmE=;
 b=6qzX5eSpHpYpK8mDkSbn4lfwDzKIT5+/PUOyWGr/ltj2hbOZEm2tLaZ73sl9tHX5pp
 VRJqNCflSleilQ8r8sNxg4y8xBj0eHfnJIjoECtsIuchEYQm/zAqmbRo5mOPKwAdRqKq
 0Xqj56EOp/QIH/FAerceeRqwf5DKy6lNbTxfYtxX50VVgcy+R2MP6OU9a5savYbCVTBR
 WOg0x8YmmLePMbIuFyItauVcm9Pf0yDQiP07kUmF2FLbXRsvqxK+IEQdEBtTWCxhwu2A
 wYUvqh/SQzQYAtAKu8rDjui2Jy0Vkuq8NbD0zW7q3z+dlPRJFC6NvVDG2Al/RE7PBxy8
 mriA==
X-Gm-Message-State: AOAM5332IL7HHv5GnkbiUt1VXrgF5HdziV6Y9NcYa93VCAYsm1qlyaKQ
 Xqn5YXF4HL2ezXtX36Br8Pw=
X-Google-Smtp-Source: ABdhPJwFpsaCaIGEu9dje2JzGoJR9fM9gDJwA22FgCRyQuGUDNEs8U9CXXplL2hhn74NH3CczfiiFA==
X-Received: by 2002:a2e:4a0a:: with SMTP id x10mr21689639lja.146.1635201977441; 
 Mon, 25 Oct 2021 15:46:17 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:17 -0700 (PDT)
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
Subject: [PATCH v14 34/39] ARM: tegra: Add 500MHz entry to Tegra30 memory OPP
 table
Date: Tue, 26 Oct 2021 01:40:27 +0300
Message-Id: <20211025224032.21012-35-digetx@gmail.com>
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

Extend memory OPPs with 500MHz entry. This clock rate is used by ASUS
Transformer tablets.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index ff25350869b3..af9640401402 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -216,6 +216,18 @@ opp-450000000-1250 {
 			opp-supported-hw = <0x0008>;
 		};
 
+		opp-500000000-1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <500000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp-500000000-1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <500000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
 		opp-533000000-1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
@@ -347,6 +359,12 @@ opp-450000000 {
 			opp-peak-kBps = <3600000>;
 		};
 
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <4000000>;
+		};
+
 		opp-533000000 {
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x000F>;
-- 
2.33.1

