Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34684A9794C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6310E636;
	Tue, 22 Apr 2025 21:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="b2C9eIoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from send173.i.mail.ru (send173.i.mail.ru [95.163.59.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0B10E635
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=ww+OMOKLYPWz6Xo60SOjHNz4eYsFjualFmiWQ9TqLaM=; t=1745358087; x=1745448087; 
 b=b2C9eIoEgWA0twFQF7X9Wd7k0mKaZF7FJ29oZqGhhZMwN2MRmekBhIwZzEsgt0y/LQ03Zho+Tmm
 9b5PWY+hX16Bbhh+kfofCJ3BIkWIH+lBRHNY2+UaVHZdSA7/y405it3g8v2YzXw18WFO0WxKyzlS4
 SlSVfLOYihzwZt2LSLM=;
Received: by exim-smtp-77d8cdf77b-wlhm8 with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1u7LMg-00000000BOp-3Hpp; Wed, 23 Apr 2025 00:41:15 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 David Wronek <david@mainlining.org>, Jens Reidel <adrian@mainlining.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 30/33] arm64: dts: qcom: Add dtsi for Snapdragon 730/730g/732g
 (SM7150) SoCs
Date: Wed, 23 Apr 2025 00:31:34 +0300
Message-ID: <20250422213137.80366-14-danila@jiaxyga.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422213137.80366-1-danila@jiaxyga.com>
References: <20250422213137.80366-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-77d8cdf77b-wlhm8;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BB52388D93D8F010F8C0BC8999C924C60B00894C459B0CD1B95898D98639930DEA33594132A326AF8BECEBC53E0ECEAA12978257282F0134C2E1C7414A75FA687D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7618B6467FE8F94C6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB5533756605D4038907BE0FDB92F4D5D5403B004DEC33EE6F400E03591C4E76753431B4DF389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0998E19D2343267C68941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6A70DDFFB3186CBC5CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C22491A305D95A8A820D476E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B8D6148B8AE20A5ED3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735E4A630A5B664A4FFC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A568B1E39D0D7ED52C5002B1117B3ED6966BD55CCF701253B88D59E407A97E9958823CB91A9FED034534781492E4B8EEADD498EE1B303404E0C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF88EF0E5DEF55E9186E35D09433FD049E74683818B78A8D6A47C3BB7FBF1187366DD3C4C1BE61872B68A835CA8743990B013E092D8ECF3F38D59B53E1D0EAB012819F3F680F3C21E5EFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgvg6jxCsLI3Ys=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F608DBECF05CFDC75EDE2FBCE1621770AFAA14902EDE8C39DDC74916764D152E02C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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

Add base dtsi for SM7150-AA/SM7150-AB/SM7150-AC SoCs

Co-developed-by: David Wronek <david@mainlining.org>
Signed-off-by: David Wronek <david@mainlining.org>
Co-developed-by: Jens Reidel <adrian@mainlining.org>
Signed-off-by: Jens Reidel <adrian@mainlining.org>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 arch/arm64/boot/dts/qcom/sm7150.dtsi | 5010 ++++++++++++++++++++++++++
 1 file changed, 5010 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7150.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm7150.dtsi b/arch/arm64/boot/dts/qcom/sm7150.dtsi
new file mode 100644
index 000000000000..b295d7940a4f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7150.dtsi
@@ -0,0 +1,5010 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Danila Tikhonov <danila@jiaxyga.com>
+ * Copyright (c) 2025, David Wronek <david@mainlining.org>
+ * Copyright (c) 2025, Jens Reidel <adrian@mainlining.org>
+ */
+
+#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm7150-camcc.h>
+#include <dt-bindings/clock/qcom,sm7150-dispcc.h>
+#include <dt-bindings/clock/qcom,sm7150-gcc.h>
+#include <dt-bindings/clock/qcom,sm7150-videocc.h>
+#include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,sm7150-rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc1 = &sdhc_1;
+		mmc2 = &sdhc_2;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi3 = &spi3;
+		spi4 = &spi4;
+		spi6 = &spi6;
+		spi7 = &spi7;
+		spi8 = &spi8;
+		spi10 = &spi10;
+		spi11 = &spi11;
+	};
+
+	chosen { };
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x0>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <137>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			operating-points-v2 = <&cpu0_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x100>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_100>;
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <137>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			operating-points-v2 = <&cpu0_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x200>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_200>;
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <137>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			operating-points-v2 = <&cpu0_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x300>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_300>;
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <137>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			operating-points-v2 = <&cpu0_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x400>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd4>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_400>;
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <137>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			operating-points-v2 = <&cpu0_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x500>;
+
+			clocks = <&cpufreq_hw 0>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd5>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_500>;
+			capacity-dmips-mhz = <488>;
+			dynamic-power-coefficient = <137>;
+
+			qcom,freq-domain = <&cpufreq_hw 0>;
+
+			operating-points-v2 = <&cpu0_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_500: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x600>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd6>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_600>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <480>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			operating-points-v2 = <&cpu6_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_600: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "qcom,kryo470";
+			reg = <0x0 0x700>;
+
+			clocks = <&cpufreq_hw 1>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
+
+			power-domains = <&cpu_pd7>;
+			power-domain-names = "psci";
+
+			enable-method = "psci";
+			next-level-cache = <&l2_700>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <480>;
+
+			qcom,freq-domain = <&cpufreq_hw 1>;
+
+			operating-points-v2 = <&cpu6_opp_table>;
+
+			#cooling-cells = <2>;
+
+			l2_700: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+
+				core6 {
+					cpu = <&cpu6>;
+				};
+
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu_idle_states: idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			cluster_sleep_pc: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3048>;
+				min-residency-us = <6118>;
+			};
+
+			cluster_sleep_cx_ret: cluster-sleep-1 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41001244>;
+				entry-latency-us = <3638>;
+				exit-latency-us = <4562>;
+				min-residency-us = <8467>;
+			};
+
+			cluster_aoss_sleep: cluster-sleep-2 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4100b244>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <9826>;
+			};
+		};
+	};
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-sm7150",
+				     "qcom,scm";
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu0_opp1: opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			/* DDR: 4-wide, 2 channels, double data rate, L3: 16-wide, 2 channels */
+			opp-peak-kBps = <(200000 * 4 * 2 * 2) (300000 * 16 * 2)>;
+		};
+
+		cpu0_opp2: opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <(200000 * 4 * 2 * 2) (556800 * 16 * 2)>;
+		};
+
+		cpu0_opp3: opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <(300000 * 4 * 2 * 2) (768000 * 16 * 2)>;
+		};
+
+		cpu0_opp4: opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(300000 * 4 * 2 * 2) (940800 * 16 * 2)>;
+		};
+
+		cpu0_opp5: opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-peak-kBps = <(451000 * 4 * 2 * 2) (1190400 * 16 * 2)>;
+		};
+
+		cpu0_opp6: opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+			opp-peak-kBps = <(451000 * 4 * 2 * 2) (1305600 * 16 * 2)>;
+		};
+
+		cpu0_opp7: opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(547000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu0_opp8: opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <(547000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu0_opp9: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(547000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu0_opp10: opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <(768000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+	};
+
+	cpu6_opp_table: opp-table-cpu6 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu6_opp1: opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <(200000 * 4 * 2 * 2) (300000 * 16 * 2)>;
+		};
+
+		cpu6_opp2: opp-652800000 {
+			opp-hz = /bits/ 64 <652800000>;
+			opp-peak-kBps = <(200000 * 4 * 2 * 2) (652800 * 16 * 2)>;
+		};
+
+		cpu6_opp3: opp-806400000 {
+			opp-hz = /bits/ 64 <806400000>;
+			opp-peak-kBps = <(200000 * 4 * 2 * 2) (768000 * 16 * 2)>;
+		};
+
+		cpu6_opp4: opp-979200000 {
+			opp-hz = /bits/ 64 <979200000>;
+			opp-peak-kBps = <(200000 * 4 * 2 * 2) (940800 * 16 * 2)>;
+		};
+
+		cpu6_opp5: opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-peak-kBps = <(300000 * 4 * 2 * 2) (940800 * 16 * 2)>;
+		};
+
+		cpu6_opp6: opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <(300000 * 4 * 2 * 2) (1190400 * 16 * 2)>;
+		};
+
+		cpu6_opp7: opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+			opp-peak-kBps = <(547000 * 4 * 2 * 2) (1305600 * 16 * 2)>;
+		};
+
+		cpu6_opp8: opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			opp-peak-kBps = <(768000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu6_opp9: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1017000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu6_opp10: opp-1843200000 {
+			opp-hz = /bits/ 64 <1843200000>;
+			opp-peak-kBps = <(1017000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu6_opp11: opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <(1017000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu6_opp12: opp-2169600000 {
+			opp-hz = /bits/ 64 <2169600000>;
+			opp-peak-kBps = <(1017000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu6_opp13: opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <(1017000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+
+		cpu6_opp14: opp-2304000000 {
+			opp-hz = /bits/ 64 <2304000000>;
+			opp-peak-kBps = <(1017000 * 4 * 2 * 2) (1459200 * 16 * 2)>;
+		};
+	};
+
+	mdss_dsi_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-180000000 {
+			opp-hz = /bits/ 64 <180000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-275000000 {
+			opp-hz = /bits/ 64 <275000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-358000000 {
+			opp-hz = /bits/ 64 <358000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+	};
+
+	qup_opp_table: opp-table-qup {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-128000000 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmu-a76 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0
+					      &little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0
+					      &little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0
+					      &little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0
+					      &little_cpu_sleep_1>;
+		};
+
+		cpu_pd4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0
+					      &little_cpu_sleep_1>;
+		};
+
+		cpu_pd5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0
+					      &little_cpu_sleep_1>;
+		};
+
+		cpu_pd6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0
+					      &big_cpu_sleep_1>;
+		};
+
+		cpu_pd7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0
+					      &big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_pc
+					      &cluster_sleep_cx_ret
+					      &cluster_aoss_sleep>;
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: hypervisor@85700000 {
+			reg = <0x0 0x85700000 0x0 0x600000>;
+			no-map;
+		};
+
+		/* XBL and AOP are splitted */
+		xbl_mem: xbl@85d00000 {
+			reg = <0x0 0x85d00000 0x0 0x200000>;
+			no-map;
+		};
+
+		aop_mem: aop@85f00000 {
+			reg = <0x0 0x85f00000 0x0 0x20000>;
+			no-map;
+		};
+
+		aop_cmd_db_mem: aop-cmd-db@85f20000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x85f20000 0x0 0x20000>;
+			no-map;
+		};
+
+		sec_apps_mem: sec-apps@85fff000 {
+			reg = <0x0 0x85fff000 0x0 0x1000>;
+			no-map;
+		};
+
+		smem_mem: smem@86000000 {
+			reg = <0x0 0x86000000 0x0 0x200000>;
+			no-map;
+		};
+
+		tz_mem: trust-zone@86200000 {
+			reg = <0x0 0x86200000 0x0 0x2d00000>;
+			no-map;
+		};
+
+		camera_mem: camera@8ab00000 {
+			reg = <0x0 0x8ab00000 0x0 0x500000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@8b000000 {
+			reg = <0x0 0x8b000000 0x0 0x8400000>;
+			no-map;
+		};
+
+		venus_mem: venus@93400000 {
+			reg = <0x0 0x93400000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@93900000 {
+			reg = <0x0 0x93900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@95700000 {
+			reg = <0x0 0x95700000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: wlan-msa@97500000 {
+			reg = <0x0 0x97500000 0x0 0x180000>;
+			no-map;
+		};
+
+		npu_mem: npu@97680000 {
+			reg = <0x0 0x97680000 0x0 0x80000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@97700000 {
+			reg = <0x0 0x97700000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@97710000 {
+			reg = <0x0 0x97710000 0x0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: gpu@97715000 {
+			reg = <0x0 0x97715000 0x0 0x2000>;
+			no-map;
+		};
+
+		qseecom_mem: qseecom@9e400000 {
+			reg = <0x0 0x9e400000 0x0 0x1400000>;
+			no-map;
+		};
+
+		sec_cdsp_mem: sec-cdsp@9f800000 {
+			reg = <0x0 0x9f800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		dfps_data_mem: dfps-data@9e300000 {
+			reg = <0x0 0x9d700000 0x0 0x0100000>;
+			no-map;
+		};
+	};
+
+	smem: smem {
+		compatible = "qcom,smem";
+
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 26>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+
+		interrupts = <GIC_SPI 451 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 14>;
+
+		qcom,smem = <435>, <428>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_modem_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_modem_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		smp2p_ipa_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_ipa_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,sm7150-gcc";
+			reg = <0x0 0x00100000 0x0 0x1f0000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qfprom: efuse@784000 {
+			compatible = "qcom,sm7150-qfprom",
+				     "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x8ff>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@1a2 {
+				reg = <0x1a2 0x2>;
+				bits = <5 8>;
+			};
+		};
+
+		gpi_dma0: dma-controller@800000 {
+			compatible = "qcom,sm7150-gpi-dma",
+				     "qcom,sdm845-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <8>;
+			dma-channel-mask = <0x0f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x216 0x0>;
+
+			dma-coherent;
+
+			status = "disabled";
+		};
+
+		qupv3_id_0: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x203 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			i2c0: i2c@880000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c0_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi0: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi0_spi>,
+					    <&qup_spi0_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c1: i2c@884000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c1_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi1: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi1_spi>,
+					    <&qup_spi1_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c2: i2c@888000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c2_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c3: i2c@88c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c3_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi3: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi3_spi>,
+					    <&qup_spi3_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart3: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&system_noc A1NOC_SNOC_MAS QCOM_ICC_TAG_ALWAYS
+						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart3_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c4: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c4_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi4: spi@890000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi4_spi>,
+					    <&qup_spi4_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart4: serial@890000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&system_noc A1NOC_SNOC_MAS QCOM_ICC_TAG_ALWAYS
+						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart4_default>;
+
+				status = "disabled";
+			};
+		};
+
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,sm7150-gpi-dma",
+				     "qcom,sdm845-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
+
+			dma-channels = <8>;
+			dma-channel-mask = <0x0f>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0x4d6 0x0>;
+
+			dma-coherent;
+
+			status = "disabled";
+		};
+
+		qupv3_id_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x00ac0000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+
+			iommus = <&apps_smmu 0x4c3 0x0>;
+
+			dma-coherent;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			i2c6: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c6_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi6: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi6_spi>,
+					    <&qup_spi6_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c7: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c7_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi7: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi7_spi>,
+					    <&qup_spi7_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c8: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c8_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi8: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi8_spi>,
+					    <&qup_spi8_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart8: serial@a88000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x00a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&system_noc A1NOC_SNOC_MAS QCOM_ICC_TAG_ALWAYS
+						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart8_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c9: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c9_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			i2c10: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c10_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi10: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi10_spi>,
+					    <&qup_spi10_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart10: serial@a90000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&system_noc A1NOC_SNOC_MAS QCOM_ICC_TAG_ALWAYS
+						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart10_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c11: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_i2c11_default>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi11: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+
+				pinctrl-0 = <&qup_spi11_spi>,
+					    <&qup_spi11_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart11: serial@a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+
+				interconnects = <&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&system_noc A1NOC_SNOC_MAS QCOM_ICC_TAG_ALWAYS
+						 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart11_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+		};
+
+		mc_virt: interconnect@1380000 {
+			compatible = "qcom,sm7150-mc-virt";
+			reg = <0x0 0x01380000 0x0 0x40000>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sm7150-config-noc";
+			reg = <0x0 0x01500000 0x0 0x28000>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		system_noc: interconnect@1620000 {
+			compatible = "qcom,sm7150-system-noc";
+			reg = <0x0 0x01620000 0x0 0x40000>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+
+			camnoc_virt: interconnect-0 {
+				compatible = "qcom,sm7150-camnoc-virt";
+
+				qcom,bcm-voters = <&apps_bcm_voter>;
+
+				#interconnect-cells = <2>;
+			};
+		};
+
+		aggre1_noc: interconnect@16e0000 {
+			compatible = "qcom,sm7150-aggre1-noc";
+			reg = <0x0 0x016e0000 0x0 0x11080>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,sm7150-aggre2-noc";
+			reg = <0x0 0x01700000 0x0 0x1f080>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		mmss_noc: interconnect@1740000 {
+			compatible = "qcom,sm7150-mmss-noc";
+			reg = <0x0 0x01740000 0x0 0x1c100>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm7150-ufshc",
+				     "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk";
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			operating-points-v2 = <&ufs_opp_table>;
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x300 0x0>;
+
+			lanes-per-direction = <1>;
+			qcom,ice = <&ice>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <37500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm7150-qmp-ufs-phy";
+			reg = <0x0 0x01d87000 0x0 0x1000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ice: crypto@1d90000 {
+			compatible = "qcom,sm7150-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d90000 0x0 0x8000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
+		ipa: ipa@1e40000 {
+			compatible = "qcom,sm7150-ipa",
+				     "qcom,sc7180-ipa";
+			reg = <0x0 0x01e40000 0x0 0x7000>,
+			      <0x0 0x01e47000 0x0 0x2000>,
+			      <0x0 0x01e04000 0x0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			iommus = <&apps_smmu 0x520 0x0>,
+				 <&apps_smmu 0x522 0x0>;
+
+			interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_ipa_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_ipa_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&aggre2_noc MASTER_IPA 0 &system_noc SLAVE_OCIMEM 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_IPA_CFG 0>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_ipa_out 0>,
+					   <&smp2p_ipa_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			status = "disabled";
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+
+			#hwlock-cells = <1>;
+		};
+
+		tcsr_regs_1: syscon@1f60000 {
+			compatible = "qcom,sm7150-tcsr",
+				     "syscon";
+			reg = <0x0 0x01f60000 0x0 0x20000>;
+		};
+
+		tcsr_regs_2: syscon@1fc0000 {
+			compatible = "qcom,sm7150-tcsr",
+				     "syscon";
+			reg = <0x0 0x01fc0000 0x0 0x40000>;
+		};
+
+		tlmm: pinctrl@3500000 {
+			compatible = "qcom,sm7150-tlmm";
+			reg = <0x0 0x03500000 0x0 0x300000>,
+			      <0x0 0x03900000 0x0 0x300000>,
+			      <0x0 0x03d00000 0x0 0x300000>;
+			reg-names = "west",
+				    "north",
+				    "south";
+
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			gpio-ranges = <&tlmm 0 0 120>;
+
+			wakeup-parent = <&pdc>;
+
+			cci0_default: cci0-default-state {
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci2_default: cci2-default-state {
+				pins = "gpio27", "gpio28";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci2_sleep: cci2-sleep-state {
+				pins = "gpio27", "gpio28";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_i2c0_default: qup-i2c0-default-state {
+				pins = "gpio49", "gpio50";
+				function = "qup00";
+			};
+
+			qup_i2c1_default: qup-i2c1-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup01";
+			};
+
+			qup_i2c2_default: qup-i2c2-default-state {
+				pins = "gpio34", "gpio35";
+				function = "qup02";
+			};
+
+			qup_i2c3_default: qup-i2c3-default-state {
+				pins = "gpio38", "gpio39";
+				function = "qup03";
+			};
+
+			qup_i2c4_default: qup-i2c4-default-state {
+				pins = "gpio53", "gpio54";
+				function = "qup04";
+			};
+
+			qup_i2c6_default: qup-i2c6-default-state {
+				pins = "gpio59", "gpio60";
+				function = "qup10";
+			};
+
+			qup_i2c7_default: qup-i2c7-default-state {
+				pins = "gpio6", "gpio7";
+				function = "qup11";
+			};
+
+			qup_i2c8_default: qup-i2c8-default-state {
+				pins = "gpio42", "gpio43";
+				function = "qup12";
+			};
+
+			qup_i2c9_default: qup-i2c9-default-state {
+				pins = "gpio46", "gpio47";
+				function = "qup13";
+			};
+
+			qup_i2c10_default: qup-i2c10-default-state {
+				pins = "gpio110", "gpio111";
+				function = "qup14";
+			};
+
+			qup_i2c11_default: qup-i2c11-default-state {
+				pins = "gpio101", "gpio102";
+				function = "qup15";
+			};
+
+			qup_spi0_spi: qup-spi0-spi-state {
+				pins = "gpio49", "gpio50", "gpio51";
+				function = "qup00";
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio52";
+				function = "qup00";
+			};
+
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
+				pins = "gpio52";
+				function = "gpio";
+			};
+
+			qup_spi1_spi: qup-spi1-spi-state {
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup01";
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio3";
+				function = "qup01";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
+			qup_spi3_spi: qup-spi3-spi-state {
+				pins = "gpio38", "gpio39", "gpio40";
+				function = "qup03";
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio41";
+				function = "qup03";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
+				pins = "gpio41";
+				function = "gpio";
+			};
+
+			qup_spi4_spi: qup-spi4-spi-state {
+				pins = "gpio53", "gpio54", "gpio55";
+				function = "qup04";
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio56";
+				function = "qup04";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
+				pins = "gpio56";
+				function = "gpio";
+			};
+
+			qup_spi6_spi: qup-spi6-spi-state {
+				pins = "gpio59", "gpio60", "gpio61";
+				function = "qup10";
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio62";
+				function = "qup10";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
+				pins = "gpio62";
+				function = "gpio";
+			};
+
+			qup_spi7_spi: qup-spi7-spi-state {
+				pins = "gpio6", "gpio7", "gpio8";
+				function = "qup11";
+			};
+
+			qup_spi7_cs: qup-spi7-cs-state {
+				pins = "gpio9";
+				function = "qup11";
+			};
+
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
+				pins = "gpio9";
+				function = "gpio";
+			};
+
+			qup_spi8_spi: qup-spi8-spi-state {
+				pins = "gpio42", "gpio43", "gpio44";
+				function = "qup12";
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio45";
+				function = "qup12";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
+				pins = "gpio45";
+				function = "gpio";
+			};
+
+			qup_spi10_spi: qup-spi10-spi-state {
+				pins = "gpio110", "gpio111", "gpio112";
+				function = "qup14";
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio113";
+				function = "qup14";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
+				pins = "gpio113";
+				function = "gpio";
+			};
+
+			qup_spi11_spi: qup-spi11-spi-state {
+				pins = "gpio101", "gpio102", "gpio103";
+				function = "qup15";
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio92", "gpio102", "gpio103";
+				function = "qup15";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
+				pins = "gpio92";
+				function = "gpio";
+			};
+
+			qup_uart0_default: qup-uart0-default-state {
+				qup_uart0_cts: cts-pins {
+					pins = "gpio34";
+					function = "qup00";
+				};
+
+				qup_uart0_rts: rts-pins {
+					pins = "gpio35";
+					function = "qup00";
+				};
+
+				qup_uart0_tx: tx-pins {
+					pins = "gpio36";
+					function = "qup00";
+				};
+
+				qup_uart0_rx: rx-pins {
+					pins = "gpio37";
+					function = "qup00";
+				};
+			};
+
+			qup_uart3_default: qup-uart3-default-state {
+				qup_uart3_cts: cts-pins {
+					pins = "gpio38";
+					function = "qup03";
+				};
+
+				qup_uart3_rts: rts-pins {
+					pins = "gpio39";
+					function = "qup03";
+				};
+
+				qup_uart3_tx: tx-pins {
+					pins = "gpio40";
+					function = "qup03";
+				};
+
+				qup_uart3_rx: rx-pins {
+					pins = "gpio41";
+					function = "qup03";
+				};
+			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				qup_uart4_tx: tx-pins {
+					pins = "gpio53";
+					function = "qup04";
+				};
+
+				qup_uart4_rx: rx-pins {
+					pins = "gpio56";
+					function = "qup04";
+				};
+			};
+
+			qup_uart8_default: qup-uart8-default-state {
+				qup_uart8_tx: tx-pins {
+					pins = "gpio44";
+					function = "qup12";
+				};
+
+				qup_uart8_rx: rx-pins {
+					pins = "gpio45";
+					function = "qup12";
+				};
+			};
+
+			qup_uart10_default: qup-uart10-default-state {
+				qup_uart10_tx: tx-pins {
+					pins = "gpio110";
+					function = "qup14";
+				};
+
+				qup_uart10_rx: rx-pins {
+					pins = "gpio113";
+					function = "qup14";
+				};
+			};
+
+			qup_uart11_default: qup-uart11-default-state {
+				qup_uart11_tx: tx-pins {
+					pins = "gpio101";
+					function = "qup15";
+				};
+
+				qup_uart11_rx: rx-pins {
+					pins = "gpio92";
+					function = "qup15";
+				};
+			};
+
+			pri_mi2s_active: pri-mi2s-active-state {
+				pins = "gpio49", "gpio51", "gpio52";
+				function = "pri_mi2s";
+			};
+
+			pri_mi2s_ws_active: pri-mi2s-ws-active-state {
+				pins = "gpio50";
+				function = "pri_mi2s_ws";
+			};
+
+			ter_mi2s_active: ter-mi2s-active-state {
+				pins = "gpio53", "gpio54", "gpio55", "gpio56";
+				function = "ter_mi2s";
+			};
+
+			sec_mi2s_active: sec-mi2s-active-state {
+				pins = "gpio57";
+				function = "sec_mi2s";
+			};
+
+			qua_mi2s_active: qua-mi2s-active-state {
+				pins = "gpio58";
+				function = "qua_mi2s";
+			};
+		};
+
+		remoteproc_adsp: remoteproc@62400000 {
+			compatible = "qcom,sm7150-adsp-pas";
+			reg = <0x0 0x62400000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			memory-region = <&adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&apss_shared 24>;
+				qcom,remote-pid = <2>;
+
+				label = "lpass";
+
+				apr {
+					compatible = "qcom,apr-v2";
+
+					qcom,glink-channels = "apr_audio_svc";
+
+					qcom,domain = <APR_DOMAIN_ADSP>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						compatible = "qcom,q6core";
+						reg = <APR_SVC_ADSP_CORE>;
+
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+
+							iommus = <&apps_smmu 0x1b21 0x0>;
+
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1b23 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1b24 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1b25 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1b26 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1b27 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+
+						qcom,nsessions = <3>;
+
+						iommus = <&apps_smmu 0x1b28 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_cdsp: remoteproc@8300000 {
+			compatible = "qcom,sm7150-cdsp-pas";
+			reg = <0x0 0x08300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+				mboxes = <&apss_shared 4>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+
+						iommus = <&apps_smmu 0x1421 0x0>,
+							 <&apps_smmu 0x1441 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+
+						iommus = <&apps_smmu 0x1422 0x0>,
+							 <&apps_smmu 0x1442 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1423 0x0>,
+							 <&apps_smmu 0x1443 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1424 0x0>,
+							 <&apps_smmu 0x1444 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1425 0x0>,
+							 <&apps_smmu 0x1445 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1406 0x60>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_mpss: remoteproc@4080000 {
+			compatible = "qcom,sm7150-mpss-pas";
+			reg = <0x0 0x04080000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MSS>;
+			power-domain-names = "cx",
+					     "mx",
+					     "mss";
+
+			memory-region = <&mpss_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_modem_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apss_shared 12>;
+			};
+		};
+
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-618.0",
+				     "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x40000>,
+			      <0x0 0x0509e000 0x0 0x1000>,
+			      <0x0 0x05061000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_GRAPHICS_3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			zap-shader {
+				memory-region = <&gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-825000000 {
+					opp-hz = /bits/ 64 <825000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-supported-hw = <0x11>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-supported-hw = <0x19>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-supported-hw = <0x04>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-supported-hw = <0x1d>;
+				};
+
+				opp-610000000 {
+					opp-hz = /bits/ 64 <610000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-supported-hw = <0x02>;
+				};
+
+				opp-565000000 {
+					opp-hz = /bits/ 64 <565000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-430000000 {
+					opp-hz = /bits/ 64 <430000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-355000000 {
+					opp-hz = /bits/ 64 <355000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-267000000 {
+					opp-hz = /bits/ 64 <267000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-180000000 {
+					opp-hz = /bits/ 64 <180000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					opp-supported-hw = <0x1f>;
+				};
+			};
+		};
+
+		adreno_smmu: iommu@5040000 {
+			compatible = "qcom,sm7150-smmu-v2",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-v2";
+			reg = <0x0 0x05040000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "ahb",
+				      "bus",
+				      "iface";
+
+			power-domains = <&gpucc CX_GDSC>;
+
+			#iommu-cells = <1>;
+			#global-interrupts = <2>;
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-gmu-618.0",
+				     "qcom,adreno-gmu";
+			reg = <0x0 0x0506a000 0x0 0x31000>,
+			      <0x0 0x0b290000 0x0 0x10000>,
+			      <0x0 0x0b490000 0x0 0x10000>;
+			reg-names = "gmu",
+				    "gmu_pdc",
+				    "gmu_pdc_seq";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc";
+
+			power-domains = <&gpucc CX_GDSC>,
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,sm7150-gpucc",
+				     "qcom,sc7180-gpucc";
+			reg = <0x0 0x05090000 0x0 0x9000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo",
+				      "gcc_gpu_gpll0_clk_src",
+				      "gcc_gpu_gpll0_div_clk_src";
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		sdhc_1: mmc@7c4000 {
+			compatible = "qcom,sm7150-sdhci",
+				     "qcom,sdhci-msm-v5";
+			reg = <0x0 0x007c4000 0x0 0x1000>,
+			      <0x0 0x007c5000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&aggre1_noc MASTER_EMMC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMMC_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+
+			iommus = <&apps_smmu 0x340 0x0>;
+
+			bus-width = <8>;
+
+			qcom,dll-config = <0x000f642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			non-removable;
+			supports-cqe;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <200000 100000>;
+					opp-avg-kBps = <100000 50000>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <2718822 1359411>;
+					opp-avg-kBps = <261438 300000>;
+				};
+			};
+		};
+
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,sm7150-sdhci",
+				     "qcom,sdhci-msm-v5";
+			reg = <0x0 0x08804000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			iommus = <&apps_smmu 0x2a0 0x0>;
+
+			bus-width = <4>;
+
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <120000 80000>;
+					opp-avg-kBps = <60000 40000>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <160000 100000>;
+					opp-avg-kBps = <80000 50000>;
+				};
+
+				opp-208000000 {
+					opp-hz = /bits/ 64 <208000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <200000 120000>;
+					opp-avg-kBps = <100000 60000>;
+				};
+			};
+		};
+
+		usb_1_hsphy: phy@88e2000 {
+			compatible = "qcom,sm7150-qusb2-phy",
+				     "qcom,qusb2-v2-phy";
+			reg = <0x0 0x088e2000 0x0 0x400>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_ahb",
+				      "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pmu@90b6300 {
+			compatible = "qcom,sm7150-cpu-bwmon",
+				     "qcom,sdm845-bwmon";
+			reg = <0x0 0x090b6300 0x0 0x600>;
+
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <4577000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <7110000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <9155000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <12298000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <14236000>;
+				};
+			};
+		};
+
+		pmu@90cd000 {
+			compatible = "qcom,sm7150-llcc-bwmon",
+				     "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x090cd000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&llcc_bwmon_opp_table>;
+
+			llcc_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <762000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <1144000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <1720000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <2086000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <2597000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <2929000>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <3879000>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <5161000>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <5931000>;
+				};
+
+				opp-9 {
+					opp-peak-kBps = <6881000>;
+				};
+			};
+		};
+
+		compute_noc: interconnect@80a8000 {
+			compatible = "qcom,sm7150-compute-noc";
+			reg = <0x0 0x080a8000 0x0 0x1400>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		dc_noc: interconnect@9160000 {
+			compatible = "qcom,sm7150-dc-noc";
+			reg = <0x0 0x09160000 0x0 0x3200>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		system-cache-controller@9200000 {
+			compatible = "qcom,sm7150-llcc";
+			reg = <0x0 0x09200000 0x0 0x50000>,
+			      <0x0 0x09280000 0x0 0x50000>,
+			      <0x0 0x09600000 0x0 0x50000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gem_noc: interconnect@9680000 {
+			compatible = "qcom,sm7150-gem-noc";
+			reg = <0x0 0x09680000 0x0 0x3e200>;
+
+			qcom,bcm-voters = <&apps_bcm_voter>;
+
+			#interconnect-cells = <2>;
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm7150-dwc3",
+				     "qcom,dwc3";
+			reg = <0x0 0x0a6f8800 0x0 0x400>;
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>,
+					       <150000000>;
+
+			interconnects = <&aggre2_noc MASTER_USB3 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_USB3 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			wakeup-source;
+			ranges;
+			dma-ranges;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x0a600000 0x0 0xe000>;
+
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+
+				iommus = <&apps_smmu 0x540 0>;
+
+				phys = <&usb_1_hsphy>;
+				phy-names = "usb2-phy";
+
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+
+				dma-coherent;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint { };
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint { };
+					};
+				};
+			};
+		};
+
+		cci0: cci@ac4a000 {
+			compatible = "qcom,sm7150-cci",
+				     "qcom,msm8996-cci";
+			reg = <0x0 0x0ac4a000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAMCC_CPAS_AHB_CLK>,
+				 <&camcc CAMCC_CCI_0_CLK>,
+				 <&camcc CAMCC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+			pinctrl-names = "default",
+					"sleep";
+
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac4b000 {
+			compatible = "qcom,sm7150-cci",
+				     "qcom,msm8996-cci";
+			reg = <0x0 0x0ac4b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAMCC_CPAS_AHB_CLK>,
+				 <&camcc CAMCC_CCI_1_CLK>,
+				 <&camcc CAMCC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-0 = <&cci2_default>;
+			pinctrl-1 = <&cci2_sleep>;
+			pinctrl-names = "default",
+					"sleep";
+
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sm7150-videocc";
+			reg = <0x0 0x0ab00000 0x0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm7150-camcc";
+			reg = <0x0 0x0ad00000 0x0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sm7150-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&gcc GCC_DISP_SF_AXI_CLK>,
+				 <&dispcc DISPCC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "nrt_bus",
+				      "core";
+
+			interconnects = <&mmss_noc MASTER_MDP_PORT0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP_PORT1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x800 0x440>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@ae01000 {
+				compatible = "qcom,sm7150-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISPCC_MDSS_AHB_CLK>,
+					 <&dispcc DISPCC_MDSS_ROT_CLK>,
+					 <&dispcc DISPCC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISPCC_MDSS_MDP_CLK>,
+					 <&dispcc DISPCC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "rot",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc DISPCC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-344000000 {
+						opp-hz = /bits/ 64 <344000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-430000000 {
+						opp-hz = /bits/ 64 <430000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,sm7150-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISPCC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISPCC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISPCC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISPCC_MDSS_ESC0_CLK>,
+					 <&dispcc DISPCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISPCC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISPCC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,dsi-phy-10nm";
+				reg = <0x0 0x0ae94400 0x0 0x200>,
+				      <0x0 0x0ae94600 0x0 0x280>,
+				      <0x0 0x0ae94a00 0x0 0x1e0>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,sm7150-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae96000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 5>;
+
+				clocks = <&dispcc DISPCC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISPCC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISPCC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISPCC_MDSS_ESC1_CLK>,
+					 <&dispcc DISPCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISPCC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISPCC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>,
+							 <&mdss_dsi1_phy 1>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&mdss_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,dsi-phy-10nm";
+				reg = <0x0 0x0ae96400 0x0 0x200>,
+				      <0x0 0x0ae96600 0x0 0x280>,
+				      <0x0 0x0ae96a00 0x0 0x1e0>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm7150-dispcc";
+			reg = <0x0 0x0af00000 0x0 0x200000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&sleep_clk>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi1_phy 1>,
+				 <0>,
+				 <0>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm7150-pdc",
+				     "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x30000>;
+
+			interrupt-parent = <&intc>;
+
+			qcom,pdc-ranges = <0 480 94>,
+					  <94 609 31>,
+					  <125 63 1>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sm7150-tsens",
+				     "qcom,tsens-v2";
+			reg = <0x0 0x0c263000 0x0 0x1ff>, /* TM */
+			      <0x0 0x0c222000 0x0 0x1ff>; /* SROT */
+
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <15>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sm7150-tsens",
+				     "qcom,tsens-v2";
+			reg = <0x0 0x0c265000 0x0 0x1ff>, /* TM */
+			      <0x0 0x0c223000 0x0 0x1ff>; /* SROT */
+
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+
+			#qcom,sensors = <10>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sm7150-aoss-qmp",
+				     "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+		};
+
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x0001100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x0100000>,
+			      <0x0 0x0e700000 0x0 0x00a0000>,
+			      <0x0 0x0c40a000 0x0 0x0026000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+
+			interrupt-controller;
+			#interrupt-cells = <4>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		sram@146aa000 {
+			compatible = "qcom,sm7150-imem",
+				     "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x146aa000 0x0 0x2000>;
+
+			ranges = <0 0 0x146aa000 0x2000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sm7150-smmu-500",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x15000000 0x0 0x100000>;
+
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
+
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			dma-coherent;
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x17a00000 0x0 0x10000>,  /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>; /* GICR * 8 */
+
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+			#interrupt-cells = <3>;
+			interrupt-controller;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+		};
+
+		apss_shared: mailbox@17c00000 {
+			compatible =  "qcom,sm7150-apss-shared",
+				      "qcom,sdm845-apss-shared";
+			reg = <0x0 0x17c00000 0x0 0x1000>;
+
+			#mbox-cells = <1>;
+		};
+
+		watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-sm7150",
+				     "qcom,kpss-wdt";
+			reg = <0x0 0x17c10000 0x0 0x1000>;
+
+			clocks = <&sleep_clk>;
+
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		timer@17c20000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+
+			ranges = <0 0 0 0x20000000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@17c21000 {
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <0>;
+			};
+
+			frame@17c23000 {
+				reg = <0x17c23000 0x1000>;
+
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <1>;
+
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				reg = <0x17c25000 0x1000>;
+
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <2>;
+
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				reg = <0x17c27000 0x1000>;
+
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <3>;
+
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				reg = <0x17c29000 0x1000>;
+
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <4>;
+
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				reg = <0x17c2b000 0x1000>;
+
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <5>;
+
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				reg = <0x17c2d000 0x1000>;
+
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+
+				frame-number = <6>;
+
+				status = "disabled";
+			};
+		};
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+			      <0x0 0x18210000 0x0 0x10000>,
+			      <0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&cluster_pd>;
+
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS 2>, <SLEEP_TCS   3>,
+					  <WAKE_TCS   3>, <CONTROL_TCS 1>;
+
+			label = "apps_rsc";
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm7150-rpmh-clk",
+					     "qcom,sc7180-rpmh-clk";
+
+				clocks = <&xo_board>;
+				clock-names = "xo";
+
+				#clock-cells = <1>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sm7150-rpmhpd";
+
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				#power-domain-cells = <1>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_svs_l2: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					};
+
+					rpmhpd_opp_nom: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp11 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+		};
+
+		osm_l3: interconnect@18321000 {
+			compatible = "qcom,sm7150-osm-l3",
+				     "qcom,osm-l3";
+			reg = <0x0 0x18321000 0x0 0x1400>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GPLL0>;
+			clock-names = "xo",
+				      "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
+		cpufreq_hw: cpufreq@18323000 {
+			compatible = "qcom,sm7150-cpufreq-hw",
+				     "qcom,cpufreq-hw";
+			reg = <0x0 0x18323000 0x0 0x1400>,
+			      <0x0 0x18325800 0x0 0x1400>;
+			reg-names = "freq-domain0",
+				    "freq-domain1";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GPLL0>;
+			clock-names = "xo",
+				      "alternate";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
+
+		wifi: wifi@18800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x0 0x18800000 0x0 0x800000>;
+			reg-names = "membase";
+
+			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&apps_smmu 0x240 0x1>;
+
+			memory-region = <&wlan_msa_mem>;
+
+			status = "disabled";
+		};
+	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpu0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu0_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu1_thermal: cpu1-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				cpu1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu1_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu2_thermal: cpu2-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				cpu2_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu2_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu3_thermal: cpu3-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				cpu3_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu3_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu3_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu3_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu4_thermal: cpu4-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu4_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu4_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu5_thermal: cpu5-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu5_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu5_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu5_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu6_thermal: cpu6-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu6_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu6_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu6_alert1>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu7_thermal: cpu7-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				cpu7_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu7_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu7_alert1>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu8_thermal: cpu8-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				cpu8_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu8_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu8_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu8_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu8_alert1>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu9_thermal: cpu9-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				cpu9_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu9_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu9_crit: cpu-crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu9_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu9_alert1>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		aoss0-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				aoss0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				aoss0_crit: aoss0-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpuss0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss0_crit: cluster0-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpuss1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss1_crit: cluster0-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss0-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				gpuss0_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpuss0_crit: gpuss0-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpuss1-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				gpuss1_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpuss1_crit: gpuss1-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		aoss1-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				aoss1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				aoss1_crit: aoss1-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cwlan-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cwlan_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cwlan_crit: cwlan-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		audio-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				audio_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				audio_crit: audio-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				ddr_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				ddr_crit: ddr-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		q6-hvx-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				q6_hvx_crit: q6-hvx-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				camera_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				camera_crit: camera-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdm-core-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				mdm_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				mdm_crit: mdm-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdm-dsp-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				mdm_dsp_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				mdm_dsp_crit: mdm-dsp-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		npu-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				npu_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				npu_crit: npu-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				video_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				video_crit: video-crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+
+		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.49.0

