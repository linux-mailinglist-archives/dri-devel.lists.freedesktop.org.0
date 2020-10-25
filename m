Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631232987EB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10546E96B;
	Mon, 26 Oct 2020 08:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B67A6E139
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i2so7711860ljg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/PNjU6itjrlyBa07JkRHNvay5XmCTm1sO/fh5dx5lk=;
 b=lQPso/WiJFAmOGYVl1iBH9ouDBMsFlTTViX4sx+MmmIEBjTcRDitlX2kVdMZ7U0yOB
 lRFxSsv5X1ZUyINJZPgPjjbx1hnslIu8ty8qNMVJ8Y6sgWCspG29RzF4vAGW+ch5otWg
 uUFkiT8F39OZj2dl9a6zt4S4bGn9i6VwCDFeYJNHcQo+JVhZJAw0HEVeRrgAypORoD0A
 K6XJKKlFrCj9P5c4ZW/qck04a+vfqA99dxI4s79rFEJpwPhsII+s6Knuw8DvGbWkmgAx
 XrtVx5yX3WQi51YBJwsdrGlJ7hQ3hV5amI77OrwskUMWA+4sl7TRKWC7t7BHHfnNXaNF
 w6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/PNjU6itjrlyBa07JkRHNvay5XmCTm1sO/fh5dx5lk=;
 b=opCQdUcyPbJPNxHtLZ4upjOMcyPJAMaygwQ8AErhNnRX0O0EKmQJwfH5nd5RJsWUju
 7Cq/mk7EhrQJJgVXp4BMS5JZEefajFUWPhEhrGdf2WI64dXxz1xTnvXili3e80m7yVCo
 j8d8ZvI7o49pN1MYsglbJ18ywOEVwQwT7SIva5h+JSADOlqNfb6u7HlP26/uDdF61RGU
 83g45FOFNmlrX0GPJEaCYKv40WmOT+JGrp9MVueeygCcFzaeLE1JtZo5h4BNx08ir0d+
 CQrAm9vtzYDBW1v5hKFIq0P4qXVqsG9JRQLVEbpgnIN+N3t1OIoTbsJvXX1YBgQxmHws
 izDw==
X-Gm-Message-State: AOAM532BqTHAFtKppDfWeINm20vPynBHokKsFqrT6tRMwL6aB3uY3HoU
 P9Dgg1IEH76rb8LLG0PL+Yw=
X-Google-Smtp-Source: ABdhPJwG6Hkkib/Jb8HPKUgje/QGgNKxkPlUMdgIM7PhcyXLFVojRxdBjbJNsNEM0zNH1Sr9HXO/MQ==
X-Received: by 2002:a2e:a288:: with SMTP id k8mr4678543lja.234.1603664276858; 
 Sun, 25 Oct 2020 15:17:56 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:56 -0700 (PDT)
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
Subject: [PATCH v6 07/52] dt-bindings: memory: tegra20: emc: Document OPP
 table and voltage regulator
Date: Mon, 26 Oct 2020 01:16:50 +0300
Message-Id: <20201025221735.3062-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SoC core voltage can't be changed without taking into account the
clock rate of External Memory Controller. Document OPP table that will
be used for dynamic voltage frequency scaling, taking into account EMC
voltage requirement. Document optional core voltage regulator, which is
optional because some boards may have a fixed core regulator and still
frequency scaling may be desired to have.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra20-emc.txt      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 0a53adc6ccba..8d09b228ac42 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -14,11 +14,23 @@ Properties:
 - clocks : Should contain EMC clock.
 - nvidia,memory-controller : Phandle of the Memory Controller node.
 - #interconnect-cells : Should be 0.
+- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
 Example:
 
+	emc_icc_dvfs_opp_table: emc_opp_table0 {
+		compatible = "operating-points-v2";
+
+		opp@36000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <36000000>;
+		};
+		...
+	};
+
 	memory-controller@7000f400 {
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
@@ -28,6 +40,8 @@ Example:
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		nvidia,memory-controller = <&mc>;
+		core-supply = <&core_vdd_reg>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 	}
 
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
