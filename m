Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C76CDA73
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CE010EABE;
	Wed, 29 Mar 2023 13:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9D10EABE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:18:45 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so16149711pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayYxgFJMhixN73Dm9Yf7ruaoOJe6G2KL+MHmxqG0S5Q=;
 b=Tkq5mhDm5ZQ+yiV1OtfyRGIvcm6whneUFGGlczqp/vSrs7C7VXKmht8Y87gNnukLVv
 UblkzhL6hGy/9w74FwGQJB48hURwaWI57RoCIqlyhZ3vJWNQRbd4X52ve0dQ/geHdmTN
 Ximd50oNuNiixWKqCTuhz632/5gMF7XMR1vSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayYxgFJMhixN73Dm9Yf7ruaoOJe6G2KL+MHmxqG0S5Q=;
 b=qFQFELLLg08kM9oJsWiP0wjeurhBFUmL9BLCPimOpW78H77lRtRwqV1lqDexde2XNN
 A4NF7g6+YFf1t5pB0nfZfmGM8IEnnyfOrH4AksJaqfHzWvzHUKtpsRWEQ8SdPIoPNy/U
 PHBlNp65Do10b9FrVZRT5LtTxVYeaOayZ+X4h3Pv0qv/4hYlgT9GdVXu5vz1FsImKL3f
 qFfU0/fhdGwGorLIvWdiu9fqViosDT91xBBf6xxogpLblT0AfoPmkcqzfPRAqtsguEr9
 q1NSLNS3iu/AU5p6ToniwTllxn9NllPvni9CvILt/kqps2MugeDAz4itAii8LRn2VcXR
 cwLA==
X-Gm-Message-State: AAQBX9eo9yXbtamZqvt9wC8Jamuffy+Vi5qokVoB+tQ+InLEu7fCmD/4
 j3PNIzFwU5LILSmGM8WoUTcf7w==
X-Google-Smtp-Source: AKy350YO+Kpdu0/vAJkHuRQaxWiiCBUBvweO4jcD6ZDCYS8/PYA2ZACp2GIqrs5TCbiYnZ9OHuAaCg==
X-Received: by 2002:a17:90b:1b49:b0:23d:1fc0:dd20 with SMTP id
 nv9-20020a17090b1b4900b0023d1fc0dd20mr20207025pjb.17.1680095925196; 
 Wed, 29 Mar 2023 06:18:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:18:44 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 09/12] arm64: dts: rockchip: a64: Add endpoint@0 to
 dsi_in_tcon0
Date: Wed, 29 Mar 2023 18:46:15 +0530
Message-Id: <20230329131615.1328366-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131615.1328366-1-jagan@amarulasolutions.com>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI downstream devices are likely to be Panel, Bridge and
I2C-Configured Bridge.

It is possible to connect all three devices using upstream OF-graph port
or ports node however only Panel and Bridge are possible to connect via
child node but not possible to connect I2C-Configured Bridge via child
node since I2C-Configure bridges are child of I2C not upstream DSI hosts
and it must represent them via port or ports with endpoint linking.

Allwinner A64 DSI node already has a port so add endpoint 0 for input
tcon so that the downstream DSI devices can use endpoint 1 to connect
Panel or Bridge or I2C-Configured Bridge.

An example of the I2C-Configured downstream bridge representation is,

i2c1 {
       bridge@1b {
	     compatible = "ti,dlpc3433";

             ports {
                  port@0 {
                         reg = <0>;

                         bridge_in_dsi: endpoint {
                                remote-endpoint = <&dsi_out_bridge>;
                                data-lanes = <1 2 3 4>;
                         };
                  };

	          port@2 {
	                 reg = <2>;

                         bridge_out_dmd: endpoint {
                                remote-endpoint = <&dmd_out_bridge>;
                         };
                  };
             };
       };
};

dsi {
       compatible = "allwinner,sun50i-a64-mipi-dsi";

       port {
             dsi_in_tcon0: endpoint@0 {
	          reg = <0>;
		  remote-endpoint = <tcon0_out_dsi>;
	     };

	     dsi_out_bridge: endpoint@1 {
	   	  reg = <1>;
		  remote-endpoint = <&bridge_in_dsi>;
	     };
	};
};

Note that existing device bindings are untouched and still represent
the downstream devices via child nodes since the sun6i-mipi-dsi host
will migrate to a standardized single helper to lookup for a
downstream device via child or OF-graph port or port node.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 77b5349f6087..3ed566dc2172 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1189,7 +1189,11 @@ dsi: dsi@1ca0000 {
 			#size-cells = <0>;
 
 			port {
-				dsi_in_tcon0: endpoint {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi_in_tcon0: endpoint@0 {
+					reg = <0>;
 					remote-endpoint = <&tcon0_out_dsi>;
 				};
 			};
-- 
2.25.1

