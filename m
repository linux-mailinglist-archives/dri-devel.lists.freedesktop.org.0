Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516292987D6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE346E874;
	Mon, 26 Oct 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BED56E192
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h20so7720728lji.9
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0740cGeDLzxAAo2TlTDiFrIsS1dz3vXBgXp/Zr3nT0c=;
 b=ttfvcCvbOafUKmL4941gOnJUcNMZQnIWFg3j0/UPwjrDMICvY7cEhW95qBrNz8UGpu
 +7S51ZsnZuiiS2MJobt6Gidz/RSA2Xw4xYuH9oM3Q2Jy6N7/n2E2An9iYblptzyLDHHM
 ME/EIOlOUgL7PCU7x3KSWu/5zl1pA5jBEVwtgIEaV7vx55u6rxNwC2SLFA+6UUxEPFM7
 e0ilSLR9ZYsXyOJT2J12p/uRnT5+Z5og4pJ55/CRKcvrGoqCldL9Y+zd3gQYYA1BTcRq
 ezgAwFmkocimIX/DZC9HT/DcgBpt9PDn0it2Aux+kBf1UTRX770yjJ+HZ5RsIV/YmoRq
 Pg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0740cGeDLzxAAo2TlTDiFrIsS1dz3vXBgXp/Zr3nT0c=;
 b=DAB6tTUi42OXm84UXDYSHazjgJHiZzRYDOX9gp+TkGf91ysvmPz/2LFW86lp/ozVU/
 aOhRKh917TvpGSGfp38KlHVPjWJBXX2SkiW2H1CQXM6eUfyLDSGr8oLYjvnBjIQYKdoW
 B6HDg5nMaW0KSZmcC1o56qii3TcjOGaqlbvTgm/9FVyjPvQah423/fbn/r0d48Wc5Zkh
 988e68BfUqi4AnQTtgph+fQmm5aT2NAkizOWkwwJkXbxgh22hj0A4Qt/8HTrVC19ubhx
 LzLFi9AqSZA/lEgRFCSdVbRzs2MCR9jE46b2w44BvNCnlnOR1DVUucuVlf2yDA8uHTzC
 EueA==
X-Gm-Message-State: AOAM533bpAkeDZjFFmyyft7Sp4h8pX3336m98rY9N0gp1Ogd+rQRKVeY
 19lmUxwzNoDL5+0UCWyawJM=
X-Google-Smtp-Source: ABdhPJxloaTwFeklwsY/+5Ju68thV+F7bYpTG2xFtB2QPPixyhirfXN8cys+UbWW0w4n6gI9Gs5AlQ==
X-Received: by 2002:a2e:9450:: with SMTP id o16mr198285ljh.296.1603664277969; 
 Sun, 25 Oct 2020 15:17:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:57 -0700 (PDT)
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
Subject: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
Date: Mon, 26 Oct 2020 01:16:51 +0300
Message-Id: <20201025221735.3062-9-digetx@gmail.com>
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

External Memory Controller can gather various hardware statistics that
are intended to be used for debugging purposes and for dynamic frequency
scaling of memory bus.

Document the new mfd-simple compatible and EMC statistics sub-device.
The subdev contains EMC DFS OPP table and interconnect paths to be used
for dynamic scaling of system's memory bandwidth based on EMC utilization
statistics.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra20-emc.txt | 43 +++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 8d09b228ac42..382aabcd6952 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -4,7 +4,7 @@ Properties:
 - name : Should be emc
 - #address-cells : Should be 1
 - #size-cells : Should be 0
-- compatible : Should contain "nvidia,tegra20-emc".
+- compatible : Should contain "nvidia,tegra20-emc" and "simple-mfd".
 - reg : Offset and length of the register set for the device
 - nvidia,use-ram-code : If present, the sub-nodes will be addressed
   and chosen using the ramcode board selector. If omitted, only one
@@ -17,7 +17,8 @@ Properties:
 - core-supply: Phandle of voltage regulator of the SoC "core" power domain.
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
 
-Child device nodes describe the memory settings for different configurations and clock rates.
+Child device nodes describe the memory settings for different configurations and clock rates,
+as well as EMC activity statistics collection sub-device.
 
 Example:
 
@@ -31,17 +32,34 @@ Example:
 		...
 	};
 
+	emc_bw_dfs_opp_table: emc_opp_table1 {
+		compatible = "operating-points-v2";
+
+		opp@36000000 {
+			opp-hz = /bits/ 64 <36000000>;
+			opp-peak-kBps = <144000>;
+		};
+		...
+	};
+
 	memory-controller@7000f400 {
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
 		#interconnect-cells = < 0 >;
-		compatible = "nvidia,tegra20-emc";
+		compatible = "nvidia,tegra20-emc", "simple-mfd";
 		reg = <0x7000f400 0x400>;
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		nvidia,memory-controller = <&mc>;
 		core-supply = <&core_vdd_reg>;
 		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
+
+		emc-stats {
+			compatible = "nvidia,tegra20-emc-statistics";
+			operating-points-v2 = <&emc_bw_dfs_opp_table>;
+			interconnects = <&mc TEGRA20_MC_MPCORER &emc>;
+			interconnect-names = "cpu";
+		};
 	}
 
 
@@ -120,3 +138,22 @@ Properties:
 						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 						 0 0 0 0 >;
 		};
+
+
+
+Embedded Memory Controller statistics gathering sub-device
+
+EMC statistics subdev gathers information about hardware utilization
+which is intended to be used for debugging purposes and for dynamic
+frequency scaling based on the collected stats.
+
+Properties:
+- name : Should be emc-stats.
+- compatible : Should contain "nvidia,tegra20-emc-statistics".
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- interconnects: Should contain entries for memory clients sitting on
+                 MC->EMC memory interconnect path.
+- interconnect-names: Should include name of the interconnect path for each
+                      interconnect entry. Consult TRM documentation for
+                      information about available memory clients, see MEMORY
+                      CONTROLLER section.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
