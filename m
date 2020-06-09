Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F01F4EFE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B361A89F73;
	Wed, 10 Jun 2020 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5986E2D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x18so8496860lji.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THFCg3hKPmLC0meEu1tU7N3iWwUxXusX7wxKM7keO5E=;
 b=mNlr5JOg4ibZJbPR/QoS0NVbhOoZg7qhUMAg+LkPxA4lVqfJ3ScEB+lf2kYh1vUwdj
 Y/qqbIaEvcCTPMWpbMKKcYGsvBa2T1Nigt9WiU1Tcp9BhNqjw9n+d69/A8FsT/A3Am7T
 qAXuETV1u6j6b7b04350uUeyijVY28l2Tb0lUOczxEWxRMwS2SNN8tEyTh1XOZIacZSa
 B/SYiF2LQB9KhUIrtuGkyt/GJgmY0fL1KbQVsR6nXutGPaHzoOB8loMjs0Z1IL3bF4+c
 s8mPif9RvF40lCpuB+EHW6cs5IzdiFgU2UjHy+/soGVHcy8tEfmpym2GcoW0FFFDJiLD
 SHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THFCg3hKPmLC0meEu1tU7N3iWwUxXusX7wxKM7keO5E=;
 b=Tjq0+u536HHdQOER1AnAjrXnZR7sU9sKeNgQQbYGdNweHhzsq5C+t5FGd9sUyGIiqq
 r3jdIueg4tjh9j74bJTGyClQtvA9JQ8+AG6bENTQ09uYtl1FrCPRIBq6ZmfxtADGjNWQ
 89dTWc6EqwObtMuVy5Arffc9GnoG/U4ZxgyrbDmT0pE/gqdcRt6ncXXdJpCCaB6GRYBd
 W8TM/AjjkesQ4YXw3aKNq8yUDoNcg6IvfCiLehHto+zoo13Q9yfMT2g94FBPaB/YtU44
 fnUZH/+LQMBTczy4u/SBKfDxdKn5KDUhdaso+ww0eJYGc+x55iRiE16b5YQpG9xdpolK
 UTXw==
X-Gm-Message-State: AOAM530QrijQLPlHS5YgsdO+weO0Mn2Rdd4ax+NBH8S6iGfORCrU3fUJ
 mZzffQ7qRV2H/l0dSO85NJw=
X-Google-Smtp-Source: ABdhPJzLpzFZbkSq5sri0+eLAtETFypE21d1qeDpAKvqDBb2E5Hi2u+SEX/f9NwdBl903TmDUO6FMw==
X-Received: by 2002:a2e:860d:: with SMTP id a13mr11153440lji.344.1591708495561; 
 Tue, 09 Jun 2020 06:14:55 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:55 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 25/37] ARM: tegra: Add interconnect properties to Tegra20
 device-tree
Date: Tue,  9 Jun 2020 16:13:52 +0300
Message-Id: <20200609131404.17523-26-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect properties to the memory controller, external memory
controller and the display controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index c3b8ad53b967..974048e83541 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -109,6 +109,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -126,6 +135,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -626,15 +644,17 @@ mc: memory-controller@7000f000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x200>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
