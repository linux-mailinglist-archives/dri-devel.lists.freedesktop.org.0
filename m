Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD25E653649
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC1E10E476;
	Wed, 21 Dec 2022 18:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6010E476
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:26:27 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id fc4so38724895ejc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vxtaE1EEmdwnLeoknDdjbqn9RBDwfiNqk1bsNHc/eJw=;
 b=H4VxHHU+xeONEKkCpBNCFZS9t+9ooCkUgwbUw6St/ZhewwRXsL4AgLO6axA/Kytp0G
 zdftwx1ZiZIs6dEGmY1YRjhMvC4b45iT3SzwkvLE0y2gFJ/m4rBw/ZisHChvfknQDImo
 gjgJYMl3UUZzjK9VpEn3ubJiwUTuALdrN5En8KU7PXBKfaAqsdSgGkvkXc9TFKv71Eal
 HszyKsY6R5uWa3R+MvMCpMlyU3cw/TZSJg+Z/kssTXxi1JeAvy+58eK2wZFxy5x5VRju
 ukd+Q6VhjT3emgM0jJmwpoHFET6Aamflp0tH6yf51IeDdboTRlcaiKXVkJfh5lu2TDEA
 FT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vxtaE1EEmdwnLeoknDdjbqn9RBDwfiNqk1bsNHc/eJw=;
 b=V4CNPAfmF/k3hdqD0ExSw5lucbI9rIMMDnnMSmeUPZEf8bvRqyj32WA1dYR5ORJ29z
 iN9C9IKlwGh087fCw60UTH8872TO2/JhBvm5q6u4YdQqxvB3Q16Cjk3A3qwTTDEDaYrN
 4N3t0tB1H7hJBHy2TKb5AUtfG1mKNgEU19xRFY6M10WKqoATurpX7k/U2qx0oUO7sb8+
 FEYSK/m7pT8CRFpHqY572iDeCzBkgf1ry2SnkbzHLKyYMnOrqCxNthRzLf2d3t5YgCMu
 uDpElgKCathoeiRJB2gKH07QRZLpL6oC/AhT/s2GH+cQ6QzAtfpBcDvBxx1rLcAV8HiG
 Arjg==
X-Gm-Message-State: AFqh2kr3wbindXtk4O6EtYfleKPLDutjHxOQdK47HkZRKnPHcEMQ2vP1
 7NUTXq/yCqqL8cjYdIrSysnpzyA4bNw=
X-Google-Smtp-Source: AMrXdXuTjC9bvbIdq5RW0n49hi6uRuBosp9NyHqunZjTW2LMl2teBSgpdFGUefpiu55ZijE3DzCQ/g==
X-Received: by 2002:a17:906:a891:b0:7c1:4d35:a143 with SMTP id
 ha17-20020a170906a89100b007c14d35a143mr5486319ejb.3.1671647186041; 
 Wed, 21 Dec 2022 10:26:26 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 mh11-20020a170906eb8b00b007ad69e9d34dsm7413700ejb.54.2022.12.21.10.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:26:25 -0800 (PST)
Message-ID: <fafc6e31-601d-8106-b281-f6788d2709a1@gmail.com>
Date: Wed, 21 Dec 2022 19:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 10/12] arm64: dts: rockchip: rk3399: fix dsi node
To: heiko@sntech.de
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use generic node name for rk3399.dtsi dsi node.
With the conversion of rockchip,dw-mipi-dsi.yaml a port@1 node
is required, so add a node with label mipi_out.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 834d16acb..62047a5a0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1954,7 +1954,7 @@
 		};
 	};

-	mipi_dsi: mipi@ff960000 {
+	mipi_dsi: dsi@ff960000 {
 		compatible = "rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi";
 		reg = <0x0 0xff960000 0x0 0x8000>;
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH 0>;
@@ -1987,10 +1987,14 @@
 					remote-endpoint = <&vopl_out_mipi>;
 				};
 			};
+
+			mipi_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

-	mipi_dsi1: mipi@ff968000 {
+	mipi_dsi1: dsi@ff968000 {
 		compatible = "rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi";
 		reg = <0x0 0xff968000 0x0 0x8000>;
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH 0>;
@@ -2025,6 +2029,10 @@
 					remote-endpoint = <&vopl_out_mipi1>;
 				};
 			};
+
+			mipi1_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

