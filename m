Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0882A78E4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911B86E9E4;
	Thu,  5 Nov 2020 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72056E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t13so23633719ljk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/Sk3dwc3ZzPQh0+4njd7Ejlh1IFm+rB1ccMwqr+vGE=;
 b=l3LKe/mpPu0S8/dCOq6M2kz5lSPjJIkDiZkJ392mXO0421xd0wR0g+uOXZu3Dp6GNh
 tig0xwfVmcWuRwSddNabK0tKmD9eiUiHmMnpBBpYyQsiolkHs6ybryKNoGIVmvUoj6mT
 ZoVdAYiceuqcnDB8+mK/Y52+5BOgvmMeR8RuFYe5GfwIbOlNfG7+BJWLe6WZpsli+6Pf
 JdpL/bqxj2ePobj0I6x+B4d6skuRAUZdvSHHxJhupeFc3dDdE3n0DFN/kYXJWmBqH0GV
 6PBYnodpQBz72zJUvr33uIEYqRK5w81me4rBiefPXZLOBAHDnuZCa6+wdwuq0NWJzPtm
 LWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/Sk3dwc3ZzPQh0+4njd7Ejlh1IFm+rB1ccMwqr+vGE=;
 b=FGxWOwwEM6z84GS1SG1RPT6dwIu7BW/lF+S5uhxOIABLDYi+/uz9EFpyIDe3OcGP6J
 sWIQ5qNaN4efh9vyJloEDmmWVUiOYf4MtTwzSG/vBZUui1bwxnS/JiOLFnZNwKz0ZA/o
 kDQ0zmVbGHO7XR9156qbK00K1zUI/Ylv/0yosT0J8ozqhp9B02sTL5jZZFjlXPrnLieX
 WjRflhSSwJog+nRvxGp4gDtErOpmXTi0hIh8mAPCBH4+8MbNzXw1Ili29qUcoNNvPc8c
 jx5GL9R27G4zJBYKAOva4uTVOBkpq2BtRLi2I+FvwfvbGj7OdiR9jIeKOl7x5vEz6lIg
 I0+g==
X-Gm-Message-State: AOAM531PlzfsdgKQ2k33+TGJqYrNCHNjWbjjZ80pcyBUz84lxFk2rHzy
 Ei2cjMXP8ErOf4nTzYtBfUc=
X-Google-Smtp-Source: ABdhPJzOM97kyPaLdS5FBsoSI5pNCOmFXgHHRAlsYMvgYsazvVkHm7oOeCMGO/mgd30CUSSL1TDgdg==
X-Received: by 2002:a2e:3a08:: with SMTP id h8mr11610597lja.125.1604508588138; 
 Wed, 04 Nov 2020 08:49:48 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:47 -0800 (PST)
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
Subject: [PATCH v7 15/47] dt-bindings: tegra30-actmon: Document OPP and
 interconnect properties
Date: Wed,  4 Nov 2020 19:48:51 +0300
Message-Id: <20201104164923.21238-16-digetx@gmail.com>
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

Document EMC DFS OPP table and interconnect paths that will be used
for scaling of system's memory bandwidth based on memory utilization
statistics. Previously ACTMON was supposed to drive EMC clock rate
directly, but now it should do it using interconnect framework in order
to support shared voltage scaling in addition to the frequency scaling.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../arm/tegra/nvidia,tegra30-actmon.txt       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-actmon.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-actmon.txt
index ea670a5d7ee3..897eedfa2bc8 100644
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
+	dfs_opp_table: opp-table {
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
