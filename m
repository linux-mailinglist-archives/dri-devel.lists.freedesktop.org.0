Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABB25681F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 16:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55F76E1ED;
	Sat, 29 Aug 2020 14:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07876E1ED
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 14:25:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D726820791;
 Sat, 29 Aug 2020 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598711153;
 bh=6gznRRrKsqAQNWmMyK3EtnSRpMtqnII6P6GgV9nfPDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ykSI5/vivMZCJ/zaqQo1HfS6rLP0th/ECZU3qUrs4QBNLMpoSQCspQsQFh6kiqmsI
 Y7xEH8oXyzlvQRE0WpAD96kv0vIpwAirg6JrfcPFqBtItQV2RFbD6i68BEbOEhOJ9U
 6Z1iMrsvNt+/i83xi7toS8eLB4ehdk4S/hm47wFk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 08/10] arm64: dts: exynos: Add compatibles to sysreg nodes
Date: Sat, 29 Aug 2020 16:24:59 +0200
Message-Id: <20200829142501.31478-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
References: <20200829142501.31478-1-krzk@kernel.org>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

System register nodes, implementing syscon binding, should use
appropriate compatible.  This fixes dtbs_check warnings:

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: syscon@13b80000:
    compatible: ['syscon'] is not valid under any of the given schemas

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 74ac4ac75865..b2eebdd88c3c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1015,17 +1015,17 @@
 		};
 
 		syscon_disp: syscon@13b80000 {
-			compatible = "syscon";
+			compatible = "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x13b80000 0x1010>;
 		};
 
 		syscon_cam0: syscon@120f0000 {
-			compatible = "syscon";
+			compatible = "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x120f0000 0x1020>;
 		};
 
 		syscon_cam1: syscon@145f0000 {
-			compatible = "syscon";
+			compatible = "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x145f0000 0x1038>;
 		};
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
