Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBA12A7906
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30C06EA1B;
	Thu,  5 Nov 2020 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBB46E21A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:04 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id 141so28036712lfn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+t0DsU6My3tVxrD7Qav6SIahBsjxD5Qw2s4eUzqdGNQ=;
 b=WkXM3DJZpbpSnCdi4yI8wQF6f9BrMWMhqsOZgL2zHvULDlDWlu4jLi2R2pfW7jW7BK
 Dqb0BaDoTGu1UV0LeLVNGJdi/kS1I1NihnUo6PamXE1/EGl/QPfimEaEza4DaWo9CNbz
 y8AUmxp35Tc3QAb4FgplFCSityng7LxVMErWcDD8rFWGARJsLRtwW0Hi9OleawLXJNXh
 +VedqCCEuZ8aN7MDCuZyBV2gOoqey0e7Q7uI2nFI2MrqJT+6f9DnXB8mMSXun8t1m/ZG
 aVj0JnzmUKcXEHYVfEHEZF1Fhc1gxOYWeMEOYN032mSbAL6kxKSYVBUYqb5O0Q8MlJO3
 EVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+t0DsU6My3tVxrD7Qav6SIahBsjxD5Qw2s4eUzqdGNQ=;
 b=amJV/X3sLd0p2+jBEuXtaf2N7IpDL+m2gJ+5xWR7kQ/Nk4vHTmYBQusnOER3oWLhKK
 TQTcWSwOxVh6bWceXwruGVReaKK9QDg6cxgllGKbaL6RPOqwfBmlHDBy8ZQADCYOn8mg
 jEjxa4g5kkCk2yol/nvrTIj0k/hoONN8/uucK5mP4vK1eBUJwRuFbKc9I8cJ7LlELZL1
 AxO0xxSjBNJrNMltcD6ozyPLj8Meghe6KFs5DjElEqdznmTjFLdmRCKjYbqmKYDfbZVX
 rIM0qbWVWPsElOexcKBgkzOdqZUvsPbDLgg6ywKYVTG6j/aK4p9KSgPaY9mOuRATxK3T
 T7RQ==
X-Gm-Message-State: AOAM530xwBz0WWDaHpXwr/qxI+72bZ/QrLT8ChQOnfNRPgqJDjIlGTcC
 nH0Vg9rldsPRrcBzi/aZ2eo=
X-Google-Smtp-Source: ABdhPJxjRwPm3/FCNhHoiprA+/pMldPxGg+SakrPRMlSdIUNbY6uSU/rrqXSaCWic/NFBTtUkQ3GBg==
X-Received: by 2002:ac2:4569:: with SMTP id k9mr10939869lfm.327.1604508602608; 
 Wed, 04 Nov 2020 08:50:02 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:02 -0800 (PST)
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
Subject: [PATCH v7 27/47] ARM: tegra: Add DVFS properties to Tegra124 EMC and
 ACTMON device-tree nodes
Date: Wed,  4 Nov 2020 19:49:03 +0300
Message-Id: <20201104164923.21238-28-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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

Add EMC OPP DVFS/DFS tables and interconnect paths that will be used for
dynamic memory bandwidth scaling based on memory utilization statistics.
Remove unsupported EMC OPPs from board device-trees.

Note that ACTMON watches all memory interconnect paths, but we use a
single CPU-READ interconnect path for driving memory bandwidth, for
simplicity.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   8 +
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |  10 +
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  10 +
 .../boot/dts/tegra124-peripherals-opp.dtsi    | 419 ++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi               |   6 +
 6 files changed, 461 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
index 32401457ae71..a7ac805eeed5 100644
--- a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
@@ -1465,3 +1465,11 @@ timing-924000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
index 861d3f22116b..df4e463afbd1 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
@@ -2420,3 +2420,11 @@ timing-924000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
index c91647d13a50..a0f56cc9da5c 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
@@ -6649,3 +6649,13 @@ timing-792000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@924000000,1100;
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@924000000;
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
index d2beea0bd15f..35c98734d35f 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
@@ -2048,3 +2048,13 @@ timing-792000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@924000000,1100;
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@924000000;
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
new file mode 100644
index 000000000000..49d9420a3289
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@12750000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@12750000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@12750000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@12750000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@20400000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@20400000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@20400000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@20400000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@40800000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@40800000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@40800000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@40800000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@68000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@68000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@68000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@68000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@102000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@102000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@102000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@102000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@204000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@204000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@204000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@204000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@264000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@264000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@264000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@264000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@300000000,850 {
+			opp-microvolt = <850000 850000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@300000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@300000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@300000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@348000000,850 {
+			opp-microvolt = <850000 850000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@348000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@348000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@348000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@396000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@396000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@396000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@396000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@528000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@528000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@528000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@528000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@600000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@600000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@600000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@600000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@792000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x000B>;
+		};
+
+		opp@792000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@792000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@924000000,1100 {
+			opp-microvolt = <1100000 1100000 1150000>;
+			opp-hz = /bits/ 64 <924000000>;
+			opp-supported-hw = <0x0013>;
+		};
+
+		opp@1200000000,1100 {
+			opp-microvolt = <1100000 1100000 1150000>;
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x0003>;
+		};
+	};
+
+	emc_bw_dfs_opp_table: emc-bandwidth-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@12750000 {
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <204000>;
+		};
+
+		opp@20400000 {
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <326400>;
+		};
+
+		opp@40800000 {
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <652800>;
+		};
+
+		opp@68000000 {
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <1088000>;
+		};
+
+		opp@102000000 {
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <1632000>;
+		};
+
+		opp@204000000 {
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <3264000>;
+		};
+
+		opp@264000000 {
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <4224000>;
+		};
+
+		opp@300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <4800000>;
+		};
+
+		opp@348000000 {
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <5568000>;
+		};
+
+		opp@396000000 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <6336000>;
+		};
+
+		opp@528000000 {
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <8448000>;
+		};
+
+		opp@600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <9600000>;
+		};
+
+		opp@792000000 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <12672000>;
+		};
+
+		opp@924000000 {
+			opp-hz = /bits/ 64 <924000000>;
+			opp-supported-hw = <0x0013>;
+			opp-peak-kBps = <14784000>;
+		};
+
+		opp@1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x0003>;
+			opp-peak-kBps = <19200000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 1801e30b1d3a..46441d10a3fc 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/thermal/tegra124-soctherm.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra124-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra124";
 	interrupt-parent = <&lic>;
@@ -290,6 +292,9 @@ actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car 119>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA124_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
 	};
 
 	gpio: gpio@6000d000 {
@@ -660,6 +665,7 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 
 		#interconnect-cells = <0>;
 	};
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
