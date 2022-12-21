Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22ED653652
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA6910E47B;
	Wed, 21 Dec 2022 18:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C16210E47B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:27:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m19so23177882edj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3spaG/gmW2iurMqKAzeqtwdB73qDEY0NRjhBceQ6XKs=;
 b=HJYnALiuBC4czUJZQZMxToOk+mUn6hrTGkmT7s0lKwO+15/vlhSGhhp6Q0iPWhrq5q
 jOWyUmDPVqgwiEsndnL+9LELnFj6lN0IgQeahNtuNDeD6I+9cH8auJHEXoqQv84Uuol5
 erYbwdjgpaNPJ9tz9g2UA2S8H0NMz3Yi4TJpRa5YJt1y9Y9GRdzXybOKpJCs/fMECfbH
 G2gKgF0DKSGU8Fk9hd9k8cR46MpIslUAKhz0qYKLV5PwwtfWAx5Vz1WI462A8uNdCQbq
 2TN9iKaJ2Cd+e32bc8z/xsyMN47sBiKojufwCMUHB5x7LY21rNIoTndGXIUyaY/jRZC3
 b56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3spaG/gmW2iurMqKAzeqtwdB73qDEY0NRjhBceQ6XKs=;
 b=b4tJeV9KZi/wnc+txEVZsUt+exg0WZ+Z66lXSAmnh7MTzoLSbN5iIuz5r9e2A5YTAm
 LymLOcR1X7dnMHlZCnKu+AJdeuNVUWtiAGfWjV+kPVD3VnB+s4NWrzGclfxNFQxSZHDq
 aJzC/MpbWi8Rh2i+uK+z28mUL2xkGZz1eYa4Xaa+qwelyWwzIYR2r0T1VVvoScLdjbAW
 ztbBmKiRltgNlo4Lnv8GsucS4NK2PihU3cJc+dAdWO3hn2Yl4DLQ2jnoC8R4WcOzOHql
 8FCjzYuN+IaNZuEWGBZI4G3jAwDt9Y1kkJnMMH2eTne0zlNGtHNR1rm9qT41aOFSCl0h
 xefw==
X-Gm-Message-State: AFqh2krHVW10TqgtD0aydcI0ZoeCKFGhTrUxxpqEy5/6/ZIbcxXwWjTm
 NRGKqdcknNv4ryCZbEfkzDc=
X-Google-Smtp-Source: AMrXdXuuboy0Cy7pIoYaHpGBK0/px3c7JvHO5JGIK2vGuTSmoniRYvRFRSPlPt/0TZewWYO1okg75Q==
X-Received: by 2002:a05:6402:685:b0:479:ab7d:1dad with SMTP id
 f5-20020a056402068500b00479ab7d1dadmr2840833edy.32.1671647252722; 
 Wed, 21 Dec 2022 10:27:32 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a056402129a00b0046dd0c2a08esm7351683edv.36.2022.12.21.10.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:27:32 -0800 (PST)
Message-ID: <621bc5c4-340e-683d-fa61-520b9ed45e1e@gmail.com>
Date: Wed, 21 Dec 2022 19:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 12/12] arm64: dts: rockchip: rk356x: remove hclk from dsi
 node
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

