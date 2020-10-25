Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9E2987BD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2F36E838;
	Mon, 26 Oct 2020 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1CF6E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:07 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y16so7733570ljk.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94ko1KEkvd/nrOtCbnF94w0cywfdZ0jax9HR6cDdRe0=;
 b=Qm1yEfa2PRYppyIYsSGsQ5TtAvsTjs/w1RG8K6rIejNzxR30xYJQIaNybveQYKGldC
 1RolfvORMYcSXn/MU5GwkomdntMip26KkF0gBqd9zExi0ApfuFwbCtO6kuWZPZrFcol5
 UfpyvLJ4AM8BcGoQ/cGi/MD5NZfRfPdeplexgkmtBWbCgxKy1ePnxluoDSsyC1nzOW/S
 1WcsWUjnRl9ofY6o5C3iHiVM6WDf1lclsKyUVZO2Y/8VasHw1spGbsInm5kqcpS8My+s
 a20XQAV11bXpp2oHV7nQYzQ/0veTQasRJWXCT755xiW8F/fznAamBv/4sv1fPUNPdaUf
 Oo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94ko1KEkvd/nrOtCbnF94w0cywfdZ0jax9HR6cDdRe0=;
 b=YbzhxAlJGpAfM5bj896iZFn/W6L/yp7S4nLUx3W4tFOkhKSL9/c4RJhBkm2t74C8sI
 H8PF8iX2E4Emv+YlKnQp6o8XOlAjsT4cApuzyzQuYDFH9842pOk29mOonm8jUPRerJsV
 Hb+8MUuSygylNZKR1f4BdwnkivNoI1rcY8i9ALjuaBOiTMjx+NQi/crbPPL7py7RA4Lt
 xhjZkX5+ETzwU1rZP/ORcegs4eXnVqiKIHkF1PARLc14StyuWBqG7/qhpbFmvF2xtDlv
 09zUzu1SxL84anZ6W3nEXGmpTwQTpwWSqeRIDkVRh2Z5yMc9msM6STGIsjTtLizGoL3j
 kHXQ==
X-Gm-Message-State: AOAM531WBO4F8e0QXgkzO5wUiHU0Q/nDJLw2oS6Kjp0LTyigaHLMqXr2
 V1k8graJWXtVaRDZnzrldsQ=
X-Google-Smtp-Source: ABdhPJxJP5vQ+dbu//2kEod4jKNlPCrGWMiwzB9P67Gj2wl/LtiawKQIxeELq3dtTUVaMOR+rGAZpw==
X-Received: by 2002:a2e:7803:: with SMTP id t3mr4225150ljc.156.1603664285788; 
 Sun, 25 Oct 2020 15:18:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:05 -0700 (PDT)
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
Subject: [PATCH v6 15/52] dt-bindings: tegra30-actmon: Document OPP and
 interconnect properties
Date: Mon, 26 Oct 2020 01:16:58 +0300
Message-Id: <20201025221735.3062-16-digetx@gmail.com>
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

Document EMC DFS OPP table and interconnect paths that will be used
for scaling of system's memory bandwidth based on memory utilization
statistics. Previously ACTMON was supposed to drive EMC clock rate
directly, but now it should do it using interconnect framework in order
to support shared voltage scaling in addition to the frequency scaling.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../arm/tegra/nvidia,tegra30-actmon.txt       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-actmon.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-actmon.txt
index ea670a5d7ee3..412e939c65cb 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-actmon.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-actmon.txt
@@ -18,8 +18,30 @@ clock-names. See ../../clock/clock-bindings.txt for details.
 ../../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - actmon
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+- interconnects: Should contain entries for memory clients sitting on
+                 MC->EMC memory interconnect path.
+- interconnect-names: Should include name of the interconnect path for each
+                      interconnect entry. Consult TRM documentation for
+                      information about available memory clients, see MEMORY
+                      CONTROLLER section.
+
+For each opp entry in 'operating-points-v2' table:
+- opp-supported-hw: bitfield indicating SoC speedo ID mask
+- opp-peak-kBps: peak bandwidth of the memory channel
 
 Example:
+	dfs_opp_table: opp_table {
+		compatible = "operating-points-v2";
+
+		opp@12750000 {
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <51000>;
+		};
+		...
+	};
+
 	actmon@6000c800 {
 		compatible = "nvidia,tegra124-actmon";
 		reg = <0x0 0x6000c800 0x0 0x400>;
@@ -29,4 +51,7 @@ Example:
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car 119>;
 		reset-names = "actmon";
+		operating-points-v2 = <&dfs_opp_table>;
+		interconnects = <&mc TEGRA124_MC_MPCORER &emc>;
+		interconnect-names = "cpu";
 	};
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
