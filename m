Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAAD654331
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5060E10E518;
	Thu, 22 Dec 2022 14:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A2610E518
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:33:52 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gh17so5334140ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3spaG/gmW2iurMqKAzeqtwdB73qDEY0NRjhBceQ6XKs=;
 b=CRqcUNirJ7ntkMUU3JTGsOB20UlhBrxRoqyYx/3ZS4wzpgONJrG2I2eRg06hDXUMcN
 CGWzv1hqWty3MdmlDNEkmXm5Wvd75JsO30NtYG6rUExTOsSTd2ejWM/Ph0Vvl4znq5cR
 ASJyzhJg7dtPga9J3IzuVm8cO4HrT5GWRX5Z2wnWWU8R+ioOxrk5PylVbB6v7DZuFC0I
 LJ6OcTUs0vB5PaNojBTWE7NVnvc8iR57BDNCFcPC5dyI2v2Z41IO48C8khaMVX+F2wOH
 2itQG6e4aRjBmTmFUmWle4aNRLym2mhAYcibcMvG+bDMR8Ho8oYFuUC6WFf/Q1+viOC9
 GsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3spaG/gmW2iurMqKAzeqtwdB73qDEY0NRjhBceQ6XKs=;
 b=1S0B6Pidjr5YnDWwePyf/758yyCRlu/yAG/OPxhSkvJtUBn+QL9rxX+orm5iMoJe96
 3qC9qWz73+5zHb86ZJI5YlLpYm/uod3KksK7+7CJW19oo+E8GvEVs9/kvbEk+UoZs9Cj
 Ti0ctAgWSOwm7S5y2hir3qXbu7QiJRXWM+SkVLxp7NeO6d3v4wtZKDqx+2Sn/ygvVCaj
 c4TUb75bcXdtvGr+kmPM27IlSB2L0oHs6GVRW1MF3D74+9PuVYTsDo5Wz5AtQplOsEfr
 SDAVta4omKdBiMn3ioa5j0dJ7h+G6325JZOjdI+9y8H1Ye6WyBEF8svjTBFc87gTRuSg
 aDKA==
X-Gm-Message-State: AFqh2koGPeMLWH/VIC/d0HIMir6Fq8Tgu5jmvcRje6CVAaZ/4p07VoN0
 kGvd3N/GKqSYS2S0QY6kRnEJl79bkuo=
X-Google-Smtp-Source: AMrXdXs5nNL5GxAUeP1wdSH8AGyRtbt3ZUxJM9gwb+vJpq0IniGq4U7xZeYGlX3TVYis4RhsdPUVwQ==
X-Received: by 2002:a17:907:6d95:b0:7c0:aabd:fef0 with SMTP id
 sb21-20020a1709076d9500b007c0aabdfef0mr5674298ejc.17.1671719630737; 
 Thu, 22 Dec 2022 06:33:50 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170907985400b007c0b6e1c7fdsm304754ejc.104.2022.12.22.06.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:33:50 -0800 (PST)
Message-ID: <4df211eb-4fcd-ee20-48a1-ce7712de552c@gmail.com>
Date: Thu, 22 Dec 2022 15:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 17/17] arm64: dts: rockchip: rk356x: remove hclk from dsi
 node
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

The hclk is not used in the dw-mipi-dsi-rockchip.c driver,
so remove hclk from the rk356x.dtsi dsi node.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 5706c3e24..2cb61a783 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -743,8 +743,8 @@
 		compatible = "rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi";
 		reg = <0x00 0xfe060000 0x00 0x10000>;
 		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-		clock-names = "pclk", "hclk";
-		clocks = <&cru PCLK_DSITX_0>, <&cru HCLK_VO>;
+		clock-names = "pclk";
+		clocks = <&cru PCLK_DSITX_0>;
 		phy-names = "dphy";
 		phys = <&dsi_dphy0>;
 		power-domains = <&power RK3568_PD_VO>;
@@ -771,8 +771,8 @@
 		compatible = "rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi";
 		reg = <0x0 0xfe070000 0x0 0x10000>;
 		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-		clock-names = "pclk", "hclk";
-		clocks = <&cru PCLK_DSITX_1>, <&cru HCLK_VO>;
+		clock-names = "pclk";
+		clocks = <&cru PCLK_DSITX_1>;
 		phy-names = "dphy";
 		phys = <&dsi_dphy1>;
 		power-domains = <&power RK3568_PD_VO>;
--
2.20.1

