Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C575ADF73
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CE310E562;
	Tue,  6 Sep 2022 06:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7C810E449
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 17:16:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e13so12175647wrm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WUkQWFeaJEpRmCMCeC5H0e01SJTSdoAluI/3ZHffQec=;
 b=KRzIb9xvRSM6Mplxtn5bTHZHQZGfAhcrIjCCKHU2e93WHngHSu8VlsSJFaGWIyucby
 bDXFaZKqWnTJc23XyqWhnlPUTrkYR0RoPyG3u/1/pQC27tnQ0Y0gtd5ae0q+sebK3VWY
 4vwoHXYDBoq1bEv89Hb/MbDeiaOHeMFPcIqoCEQZRjlEAcqRpbS5MA1YON2IUTbIcAZK
 lLjsoObOKljR4tvcj/WXqCV2dnmbawFPubd3YPN6N9sa4bBJxSw0bCW9v498ExGdwg6Y
 NXqLF+7IbA9lxxxkbqamA0IA3PNcBn5yJMSImqP6hFrapcGoFTBuZVOCZKA3TjvPeL18
 gY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WUkQWFeaJEpRmCMCeC5H0e01SJTSdoAluI/3ZHffQec=;
 b=k8NCCWZC/EEGrABGZyiksV6MHy4aG4GP02udYclCs7rHqjJ6u0mTGomli2TFKPBz3s
 9b3nl0AwqRbPCeLLtjWbiQs7/0dooHNMd8ilfxEzL/jz5hW/1Ox/N1qi7UV6Fg4+PMs8
 LgeygPDX0CpcvFgkc/Rer7IRvRvhWaxacTXMigzYCiwf5PNcYhkM3xlHs67T1i2l9jz2
 BTgintLvkQD4sv8o2Wr/5jat2KRsxC7MGw3X6buNBvJARN/X5NAkQ7XluPZ34DAR1he7
 AumFBfo01KDPHbacWXWFGj+/6XSm8z6X5173UC1NtBFsa1v6UPBE2fG8IvpygtVyGdoW
 LZGw==
X-Gm-Message-State: ACgBeo1Hf8fmLVrhlm0r0jGeFR9HtAYfi8QM5Vqxzc6qjiqy489okUiu
 Gf7PB9fEQ3EmC1dMJ+KnuLs=
X-Google-Smtp-Source: AA6agR5Nxeu56Er6g5rkDeoSz+06KNQ9pCwbj2Yh5prPUnqlQfoaZny43onJt5aJLXnFQEywU5iB8A==
X-Received: by 2002:adf:f642:0:b0:226:d4b1:8502 with SMTP id
 x2-20020adff642000000b00226d4b18502mr23772737wrp.553.1662398168829; 
 Mon, 05 Sep 2022 10:16:08 -0700 (PDT)
Received: from Clement-Blade14.home
 (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr.
 [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 10:16:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 2/5] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Mon,  5 Sep 2022 19:15:58 +0200
Message-Id: <20220905171601.79284-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a simple cooling map for the GPU.

This cooling map come from the vendor kernel 4.9 with a
2°C hysteresis added.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 51 +++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 5a28303d3d4c..1259ab0c3956 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -186,6 +186,7 @@ gpu: gpu@1800000 {
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1072,9 +1073,55 @@ map0 {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+			polling-delay-passive = <1000>;
+			polling-delay = <2000>;
 			thermal-sensors = <&ths 1>;
+
+			trips {
+				gpu_alert0: gpu-alert-0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_alert1: gpu-alert-1 {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_alert2: gpu-alert-2 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				// Fordid the GPU to go over 756MHz
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu 1 THERMAL_NO_LIMIT>;
+				};
+
+				// Fordid the GPU to go over 624MHz
+				map1 {
+					trip = <&gpu_alert1>;
+					cooling-device = <&gpu 2 THERMAL_NO_LIMIT>;
+				};
+
+				// Fordid the GPU to go over 576MHz
+				map2 {
+					trip = <&gpu_alert2>;
+					cooling-device = <&gpu 3 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1

