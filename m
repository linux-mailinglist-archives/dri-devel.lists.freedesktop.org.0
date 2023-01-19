Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F189674F0A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E9110EA68;
	Fri, 20 Jan 2023 08:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83BF10E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:49:29 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id d30so4539882lfv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whMWYQfGzaJPnTeJPhhjcLAVFGOi1DqjOoYU7lBrbEw=;
 b=E2T2D6DACq3966VESzWpx8PhFIHol1jPrku6s4cUp6lTE2hNExogTwiraPMFBdYmi4
 eeOuM2hw4Hwl53fTpWWHq4LhCyIuMjqYZe1uRMC45MXLZo40vX/jpMtqv7wN9fAG73FW
 uDsMQaX+Fq56W6q5iVMdfdu1N1VTkWQKREEbwkpIKm67BXjEzS8DqaiQdszp95LwCk4E
 aNbMAU6njxaomNOH7Ma0UZFq20W1ApDJs+VsbQtXvUeVps6RrzrpGT245Oo3EOng4kAZ
 SQCvPUSQiUYcHxllnIcUe3EDHtMoPxVXjWBT/ASG8cQ7QuDjHNV4hUq8S0oXL/vf6ucw
 FxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whMWYQfGzaJPnTeJPhhjcLAVFGOi1DqjOoYU7lBrbEw=;
 b=Cu43OGxwGjIrRAHj1VeQ7SRiEl4JX8iWHkag/h4TZYiNEWLqwGFmV2wOq+E8rPbcq6
 8smTs6gw8NSaakWiS7vyXncOdY+eNqSorXXgqdOwCJjfLuKoTKY32E1RRO5EvsotuEFb
 qne/mqZTRWYbbFbUAip7ij1UGPVlHIOXa+hBh6rCo5G+4IaA21fZphjMYVhH/Hbdmeh3
 gXtm/9GYWuhJq2B3J3xWBm8wGuAkDWyW1GD+x6zGfOiEYKIsghMOiS5fulMADz/BCint
 LeHfTmbg9k7jT07esm1s2qKf0c4y3wBM+xty6lFXD62LzKLuRVusA1jEersNYRZh7M20
 2Xhg==
X-Gm-Message-State: AFqh2kr1DbsEQu1geVEh9OQrG5zoHULsK1d3hz3xZgckj90AUV3TZ0Kh
 T5DIq/YSkvZoPF3yDDw+tg8=
X-Google-Smtp-Source: AMrXdXudzU4h7M6LO0PZkeIfHC/mW9RojDp0JElKBbO6CrK/AO11pQaR5TWVFRGk5TwTG4YmA8FvxA==
X-Received: by 2002:ac2:4c97:0:b0:4b6:fdc3:a668 with SMTP id
 d23-20020ac24c97000000b004b6fdc3a668mr2754311lfl.31.1674154168187; 
 Thu, 19 Jan 2023 10:49:28 -0800 (PST)
Received: from U19.ag.local (static.187.76.181.135.clients.your-server.de.
 [135.181.76.187]) by smtp.gmail.com with ESMTPSA id
 b31-20020a0565120b9f00b004d30752a561sm2112737lfv.298.2023.01.19.10.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:49:27 -0800 (PST)
From: Alibek Omarov <a1ba.omarov@gmail.com>
To: 
Subject: [PATCH 2/3] arm64: dts: rockchip: rk356x: add LVDS bindings
Date: Thu, 19 Jan 2023 21:48:04 +0300
Message-Id: <20230119184807.171132-3-a1ba.omarov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119184807.171132-1-a1ba.omarov@gmail.com>
References: <20230119184807.171132-1-a1ba.omarov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 alexander.sverdlin@siemens.com, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, macromorgan@hotmail.com,
 a1ba.omarov@gmail.com, linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exposes ports for VOP2 and for panel

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Link: https://patchwork.kernel.org/project/linux-rockchip/patch/20220923160115.2946615-3-a1ba.omarov@gmail.com/#25097661
Signed-off-by: Alibek Omarov <a1ba.omarov@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 5706c3e24f0a..34d1b943f312 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -827,6 +827,31 @@ hdmi_out: port@1 {
 		};
 	};
 
+	lvds: lvds {
+		compatible = "rockchip,rk3568-lvds";
+		clocks = <&cru PCLK_DSITX_0>;
+		clock-names = "pclk_lvds";
+		phys = <&dsi_dphy0>;
+		phy-names = "dphy";
+		power-domains = <&power RK3568_PD_VO>;
+		rockchip,grf = <&grf>;
+		rockchip,output = "lvds";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds_in: port@0 {
+				reg = <0>;
+			};
+
+			lvds_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	qos_gpu: qos@fe128000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe128000 0x0 0x20>;
-- 
2.34.1

