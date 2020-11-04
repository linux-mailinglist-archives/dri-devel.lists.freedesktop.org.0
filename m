Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE3A2A78E3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222CA6EA0A;
	Thu,  5 Nov 2020 08:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BB76E21A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v19so18768119lji.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0FVv3BbkAu5vijvZy0/g8D/gSJwLwAaxtQyTiLpi4B8=;
 b=DEbFYKMcdoH48FN2/uyXUSKvK0hCwgs9jDu+ko+KosDrC62VOnUtAL/3lEG+UwTtTP
 CRRI84LwRW1IqzJ1qVLNHGzelsTrjKI13WiIYf0t9MJXDrgYs+LdiblQYIbQ5YiaSa78
 R/fC75sA6xgcPx0AjKdHm+/jXFgBrxjsxXQocUq38LrRsEDQaMN2eRB1gAr9bHzI0ye6
 p4yCRU+itdACg1YMCB4JYW0hYdlNm2I0VbGJUr1Se3mSy+LasQ9xc0LG1Mnl/knF9Xkh
 nGf7OUjL1fNakCeZSqPOavJMScyiXtPR9huMzU6AmR+yQZlDnbSbYeJgptPGZQR5GjT5
 mz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0FVv3BbkAu5vijvZy0/g8D/gSJwLwAaxtQyTiLpi4B8=;
 b=qGH5UnaMHYFISuBADyhvIY47XTuXM6gQUZHKrMA9G3B49lr4OWtrhMaoTt3hy+Ciu+
 qkxfcDrAVGxFT1V8f+BYYOSMkL7xWQa+3jJ5a+CZrEg9aL0chEKkpaAfDRfZdQMWELAt
 8jfxCtjt99Y5bgGiSjlhT/py0HQBl5G1c/dS3mmhiXHMY3CCzwNC5Lvv3+jrB4o1ztoc
 uHhFsVgX4GoBRC8TuwXptVlTXKbVUckPj2gZ1lqPQg594dLacCzAJ4nYBqJyQ4MHlJBK
 bpSyHWadMHtaukbdIqHll3m96R8PzYw393kFYtrQvmgqDOEulXkBvKz5WxgPehVWapBZ
 imAg==
X-Gm-Message-State: AOAM533x8dyEu+7PG5Rieap/vj/9/s+63Cb7n8gt148kaqpEIADsPiyy
 fAslnvU2x7KZwArPAkxlFG0=
X-Google-Smtp-Source: ABdhPJwyAlb0a8HWHX8gVPMOoMubt/guWwT7XX6botKnEiM48IOWNSbdR9Xn4p979LWrEeFoDHl99w==
X-Received: by 2002:a2e:580a:: with SMTP id m10mr2371255ljb.167.1604508579935; 
 Wed, 04 Nov 2020 08:49:39 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:39 -0800 (PST)
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
Subject: [PATCH v7 08/47] dt-bindings: memory: tegra20: emc: Document OPP
 table and voltage regulator
Date: Wed,  4 Nov 2020 19:48:44 +0300
Message-Id: <20201104164923.21238-9-digetx@gmail.com>
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

The SoC core voltage can't be changed without taking into account the
clock rate of External Memory Controller. Document OPP table that will
be used for dynamic voltage frequency scaling, taking into account EMC
voltage requirement. Document optional core voltage regulator, which is
optional because some boards may have a fixed core regulator and still
frequency scaling may be desired to have.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra20-emc.txt    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index 82bc5b2ae7e5..67ac8d1297da 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -14,11 +14,25 @@ Properties:
 - clocks : Should contain EMC clock.
 - nvidia,memory-controller : Phandle of the Memory Controller node.
 - #interconnect-cells : Should be 0.
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+
+Optional properties:
+- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
 Example:
 
+	opp_table: opp-table {
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
@@ -28,6 +42,8 @@ Example:
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		nvidia,memory-controller = <&mc>;
+		core-supply = <&core_vdd_reg>;
+		operating-points-v2 = <&opp_table>;
 	}
 
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
