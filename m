Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F44654324
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C4D10E501;
	Thu, 22 Dec 2022 14:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A69410E501
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:32:26 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u9so5434568ejo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gRs/p77llC39s0EwuTCxcUjkyPLLZDJFzUsSm629Z0A=;
 b=Xl7qLiaS4H2MqrIAU1WtcuHZ0kD83PrmWdy2noxljwhNbTxBx2EmWiwDE0Uu6usFkZ
 zULq2JeBJQtg0kG6OkXkDrlLiCZErHvdtVOpxZeizVoHsAdfdfLIg86AhWfUCSzHWD+2
 guYt9bcEKM12W7iWyF02F7jpVM8125nm+VBIPrJB+dOPsrS1yYL1DP+wJFmlCnJr9l31
 wJHxoD2XRKndira/Ya/zup4aif45CJZgGHLoYFqHGPwneLRvpPCHx/0a6SHMD1ZZKYg9
 Hj+h0zkdXLr8lOmTdYNemhFM0jYs5FQsWDWIeYqNVlnKyphuwQ0zboqX7LbJcXAwj7kE
 IrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRs/p77llC39s0EwuTCxcUjkyPLLZDJFzUsSm629Z0A=;
 b=aAB3zLDVV2fCLnARk7fN0E1wJ9TNODC/2K+ZC7T+9LeywnNEyLA1kYKPxA7zu2IVAm
 XrnN+iD2T4WV9L6KEl2giL92lZmQicvJ3RyrjbHLekgxMHyye1/7lJMDcGd+vbhPLkXK
 WoFzqIXqNqpTbC9nLCmaDRlebV4TaaIhWL0+PAHyNYzBk6Ysm+7PcZo7tGo/wyL5zfp5
 TBBlPLXB0v8UDQybz90YG8iRq6RXevDkxXFaqv96m4VvoWsVXQ4BHWuhEYFS0Op9ACR3
 oqBzwHuG8G+KNiRLGrD2oybvEMSpTrDRPY3tIyJoaly56DbPV5v8nT8lkeGXwwhLMBmH
 M+qw==
X-Gm-Message-State: AFqh2kr4lYpvXlpd8gcu+c8hLr51hZ/hRYeNOCuWGbjBWyDWt2oago8i
 v60out8jpQUQ5tIBCawx6bo=
X-Google-Smtp-Source: AMrXdXsgv/n3jTfE7Jv0jiLSsvNygkcFwiea6D9Qjp8nzKtaD2AgVwCh95QdJ5axyGyCNMhswZ4CJA==
X-Received: by 2002:a17:907:a091:b0:7c1:23ef:4bb9 with SMTP id
 hu17-20020a170907a09100b007c123ef4bb9mr4258591ejc.13.1671719544480; 
 Thu, 22 Dec 2022 06:32:24 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1709067fc400b007bb32e2d6f5sm290577ejs.207.2022.12.22.06.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:32:24 -0800 (PST)
Message-ID: <1e019e9e-a8da-3d57-2770-f6b81bbbf591@gmail.com>
Date: Thu, 22 Dec 2022 15:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 14/17] arm64: dts: rockchip: rk3399: fix dsi node
To: heiko@sntech.de
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Language: en-US
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use generic node name for rk3399.dtsi dsi node.
With the conversion of rockchip,dw-mipi-dsi.yaml a port@1 node
is required, so add a node with label mipi_out.
Also restyle.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V6:
  Restyle
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 834d16acb..2250533cf 100644
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
@@ -1982,15 +1982,20 @@
 					reg = <0>;
 					remote-endpoint = <&vopb_out_mipi>;
 				};
+
 				mipi_in_vopl: endpoint@1 {
 					reg = <1>;
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
@@ -2025,6 +2030,10 @@
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

