Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55C2B3AEF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79DA89CF6;
	Mon, 16 Nov 2020 01:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62306E9EE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:29 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 74so22373050lfo.5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dchum/w5tW6S8qZoSmLsyitcs7JqpsShTrIAD3uRjUU=;
 b=lZ8ly5BP+GAZtwOTaCG6bm2jamYGmQ1lPIt0NgmI0L4N8tdD4vYRhYmMCegDlgpDOT
 y+juXcTSiM1H3aBXYYNrFO9OVuduhjIxbNaKectXAFHFy0l6gUWPs02ZJbVqAdJzN+AL
 A9S3zJcZrgIkR20oYW3EVN9nm1h7iJz5NA+7sFqBBIt0QnG202qiY+E6GN+SeH7s+j49
 y0gxZ9g40ACIGEEAhAZvZP1CaD7Nxx+1dLYN8oW0B2/eWbOgxMcoedDMqMmr36vftlgv
 hwvaz3Rnx9SbI2J5/SEaKSLrcl+6xzcHjqaIcPdMwC4oxA6HY70Fjvdcs/D303Qd8Xoy
 zrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dchum/w5tW6S8qZoSmLsyitcs7JqpsShTrIAD3uRjUU=;
 b=Tfn6P22ohoxlygw7DywwOYTVpQAJ5Fk8Ki3LZ1GEmVJuVUEtrgx1zQ9sdpf8DTmg0g
 PtJzJ8PUYwAzp5LfWCRlyQ40QwUwGbsgYsKKtjpMZTRWxedG66Xber/XnmJ1P1vjBzJJ
 Iv+K/+kogS3QmYxR0nucbyrdeFp4+eRzLKvVNkRhocVUJ7lQaWzgYS09o2ihH+gEc41q
 SIro8C7naBjaaLWFRf4ewiDYRp9P/qnl3jUyuuYRQIEM7+xVehHXzOXk/XZcVSlJWAaq
 p7YKywta0stUevjq1MOYYlVkDE4HteoyA4agD4Af/2/iVOBW9rIdb34dLIvJB1V/V/a+
 UzLw==
X-Gm-Message-State: AOAM530daGA5pKwZ1A/xGFzGiOAtYonap8HHLtgRGXoD/3i5nbDViIGK
 aIdlbefnOlpJJKYoMhaQCwI=
X-Google-Smtp-Source: ABdhPJyiEMqI4M+YykOETmnrfbOOMNbdn5crvsVaOCjr6hbbt68QMSbomgV4ubWJVKv4aAAc6KEjWw==
X-Received: by 2002:a19:5f0b:: with SMTP id t11mr4695777lfb.326.1605476008317; 
 Sun, 15 Nov 2020 13:33:28 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:27 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v9 11/17] ARM: tegra: Add interconnect properties to Tegra20
 device-tree
Date: Mon, 16 Nov 2020 00:29:16 +0300
Message-Id: <20201115212922.4390-12-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115212922.4390-1-digetx@gmail.com>
References: <20201115212922.4390-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect properties to the Memory Controller, External Memory
Controller and the Display Controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9347f7789245..2e1304493f7d 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -111,6 +111,17 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAYHC &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -128,6 +139,17 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -630,15 +652,17 @@ mc: memory-controller@7000f000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
