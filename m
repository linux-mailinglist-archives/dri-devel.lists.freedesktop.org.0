Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E865C6F4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 20:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA1610E4C0;
	Tue,  3 Jan 2023 19:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEE310E4BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 19:07:15 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-14455716674so37866178fac.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn0RWIp29/DDAGotFO+F2cDyIEYDf7WQu136TlHaqBY=;
 b=dK8bSBvRLVbLCUgba0M1OefdxQvl+dAxePXW5kUBUYHcP2QQqqb+rjmrX7dy7oWCHr
 9KBiIWdkFBnqwhDgbDh+HR/SyMnBJDtHaBpvyV9oHafspDNOW3D/QlgfkkwdrvLj/Dl/
 JM4ZbL8RgWzGcLtpDwQGAHq9pyLpuEdkH77ITp0/mWv+ER9WPHLrWExRv6x0nCCgl+mP
 lHNKm10FofhSa7dM4pWmGyQ+uvDfOwECvQHiqzc6DGnNp+5ndP1q34RlYe26ArBp0Du+
 5oI5tcSy8rJgNr+VoluWjXmQpJqV4lktR0zoiVZQ/iqX2EESwZzJn7JI1l7Is3VIFmyC
 k4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn0RWIp29/DDAGotFO+F2cDyIEYDf7WQu136TlHaqBY=;
 b=bTY5Sdz8ddrooChlXofjfYKHTp0eHtxtNB+ldsyGQgHWMn2U8xhphQIwcu8j+x36t+
 VBVEJ0GOGsbQI+19Griz4/c6+oWmlGFNVAwthGiV5qqcUNbqVYWK5EdekneTyZf7tMtj
 vs5ZBQNRMUghgFf6XkAT420p2bjZAF+stnLszw3zuxaFBiscn22lfVhqgg881Qm0uCNf
 RRJbEEn9nDPqoLTvD2O7156JYAnPsBanBPJ0CCTfZo1tuMEzuGNxYq7y3PYhc+ijMxCS
 a8XO2MsZwWMIl3pdkHo/h12XrwtZGHn+SKyaAPOq1tu83q2ZVZ7vTW28Fb77gQMfS4S5
 psCA==
X-Gm-Message-State: AFqh2kqRYXUzZPhF9QzIK7YFHxFI+NbkxcfCaLObpTRNUq1Is4mquSg1
 DAH1NzKPBpYoXtcEiyWNqE4lq5DK07A=
X-Google-Smtp-Source: AMrXdXuKQ6CPrX+gmKrUhuvhXwp8wkIJVzqHeG7mhdtqg0BEUuNEdDKOHzQdIWLTkw3ZDbYYpk1/Gw==
X-Received: by 2002:a05:6870:6a8b:b0:150:e30e:4832 with SMTP id
 mv11-20020a0568706a8b00b00150e30e4832mr1032902oab.44.1672772835087; 
 Tue, 03 Jan 2023 11:07:15 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a056870ea9800b0014c7958c55bsm14752207oap.42.2023.01.03.11.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 11:07:14 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 4/4] arm64: dts: rockchip: add display to RG503
Date: Tue,  3 Jan 2023 13:07:07 -0600
Message-Id: <20230103190707.104595-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103190707.104595-1-macroalpha82@gmail.com>
References: <20230103190707.104595-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add Samsung AMS495QA01 panel to RG503.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../dts/rockchip/rk3566-anbernic-rg503.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
index 5dafcc86296b..b4b2df821cba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
@@ -47,6 +47,21 @@ gpio_spi: spi {
 		mosi-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
 		cs-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 		num-chipselects = <0>;
+
+		panel@0 {
+			compatible = "samsung,ams495qa01";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&lcd_reset>;
+			reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc_3v3>;
+
+			port {
+				mipi_in_panel: endpoint {
+					remote-endpoint = <&mipi_out_panel>;
+				};
+			};
+		};
 	};
 
 	/* Channels reversed for both headphones and speakers. */
@@ -94,6 +109,32 @@ &cru {
 	assigned-clock-rates = <1200000000>, <200000000>, <500000000>;
 };
 
+&dsi_dphy0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+
+	ports {
+		dsi0_in: port@0 {
+			reg = <0>;
+
+			dsi0_in_vp1: endpoint {
+				remote-endpoint = <&vp1_out_dsi0>;
+			};
+		};
+
+		dsi0_out: port@1 {
+			reg = <1>;
+
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+};
+
 &gpio_keys_control {
 	button-a {
 		gpios = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
@@ -146,6 +187,13 @@ spk_amp_enable_h: spk-amp-enable-h {
 		};
 	};
 
+	gpio-lcd {
+		lcd_reset: lcd-reset {
+			rockchip,pins =
+				<4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gpio-spi {
 		spi_pins: spi-pins {
 			rockchip,pins =
@@ -164,3 +212,10 @@ rk817_charger: charger {
 		rockchip,sleep-filter-current-microamp = <100000>;
 	};
 };
+
+&vp1 {
+	vp1_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp1>;
+	};
+};
-- 
2.34.1

