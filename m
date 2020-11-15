Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF732B3B0B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197EE89D3E;
	Mon, 16 Nov 2020 01:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB156E9EE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:31 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v144so22301076lfa.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
 b=pIMCQd7qMNyonqrksRdbw6jHLtLHnh4ZYFYfaRCLXZI1RhCMfs8lt+sDYGG0JeVPm4
 ezA0oZOlSBizlhGKwAEDDg5lk85d3VpYqLdUqYSX1vXEdh/8G4p5CSzTYvUEDyQ3xWmV
 Uly/onikTP61hEc36VZ0jRGs9UCnQaifWFpN01HdaEVBjh//Xy0evuYJqvVTvUrN1Jg7
 kiwDbBDJxoF4X5v99rKgYVuczOH2S1RA+eAliCmqk1MDvDEU0r0Rc8m1iraLpyqf9yz8
 5McbVmw9OmThl5gk/FFh8vrwaJ3wnEC4SQg7qtyLrbUxknsasYm46lMwoQaCDKRO/gNu
 4g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
 b=fmwvoPLyqXw9++HT83Xop2PbhKD9DkrnEJD1Z0cQr37JH7wNKTEaY7LObGdvnk4j3S
 dYA1Ll2VKy9YUWMl8jFrwkoAOjYYqASFK5tOBMo7INbTMWqn7PGTOPEE0FWN6Nab6pIq
 kZtG4u+h8XrfB1LQQNOgzpwWkuLjavU3q+Iz4ooP/Luxm1mxO9lhZnsDLdtNixcuK55B
 pDUGJdEenLzkOzz07CKsEx0KNTyRBUIHFFRAyRC+nInv9aoRucQNVt9tkbpzZX+Z+WFW
 fWn/bPhrHz/D8enb7bXuieFtwCcNdZ3XNPzbV9/V0EVK0uNyQ0A7FJJ/azgN1k9sJLg5
 i2DA==
X-Gm-Message-State: AOAM533eOCIKW4sFpi+eTiBQI9REVuQwgDhaRgn5SfQkxFfLv5uBNQrx
 O2GqLWP1LWZGzkMbIDATRolFCoo/XV4=
X-Google-Smtp-Source: ABdhPJydP12/dyMxuqwLIXwTLjBF6dCHGsmDaUNIMSCg0CAsgOTqSmwvSBwH8LTLeM95FEis+xeNgg==
X-Received: by 2002:a19:8686:: with SMTP id i128mr4118536lfd.333.1605476010454; 
 Sun, 15 Nov 2020 13:33:30 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:30 -0800 (PST)
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
Subject: [PATCH v9 13/17] ARM: tegra: Add interconnect properties to Tegra124
 device-tree
Date: Mon, 16 Nov 2020 00:29:18 +0300
Message-Id: <20201115212922.4390-14-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra124.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 64f488ba1e72..1801e30b1d3a 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -113,6 +113,19 @@ dc@54200000 {
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
 			nvidia,head = <0>;
+
+			interconnects = <&mc TEGRA124_MC_DISPLAY0A &emc>,
+					<&mc TEGRA124_MC_DISPLAY0B &emc>,
+					<&mc TEGRA124_MC_DISPLAY0C &emc>,
+					<&mc TEGRA124_MC_DISPLAYHC &emc>,
+					<&mc TEGRA124_MC_DISPLAYD &emc>,
+					<&mc TEGRA124_MC_DISPLAYT &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor",
+					     "wind",
+					     "wint";
 		};
 
 		dc@54240000 {
@@ -127,6 +140,15 @@ dc@54240000 {
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
 			nvidia,head = <1>;
+
+			interconnects = <&mc TEGRA124_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA124_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA124_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA124_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
 		};
 
 		hdmi: hdmi@54280000 {
@@ -628,6 +650,7 @@ mc: memory-controller@70019000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -637,6 +660,8 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <0>;
 	};
 
 	sata@70020000 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
