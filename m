Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D051C6CDA72
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7F810EAAB;
	Wed, 29 Mar 2023 13:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CCB10EABC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:18:39 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso18573192pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nd2Hzi5pbnX457/tZ1SGDUudK/Mgpe+Ly4/pUeQ6HnM=;
 b=BxNdyUGAorjHPinmo8knKGhWp8mcw/YgRk4iYNWDGp+87Odbgo0V0ajx8K99ZvbH3m
 uK1o/myHvEIucTiBG5DYCQ2UcxcizWIeVayEhlo/8lScUog6XsvXM6+6OOEyJd/pLOs2
 /RttKWJwSMHDK2hDoJcL5A8izTKP8wEnKCyoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nd2Hzi5pbnX457/tZ1SGDUudK/Mgpe+Ly4/pUeQ6HnM=;
 b=T7rBwfJ/07FSOiVPoG1KPXPcGi+hTKwy70LYegVNQNeJE8sqW3V99y/+iTBbooq1b3
 sJRsn428xo+5eSZxzNrIq3aMfeJm/bFEkAzrj8aDvu9BPEin7ql2GXfSix4BRFDoZEs8
 sAUCmzdIFbIUkeJwHEECcNnNymtXgkbN5bbHQcZ5RiTF/M05yE0IIGU/VaYiouFoJc/F
 JDLD/iRD7aNwSEYWGqMnYBpHU+rdhSO3Jh/RBK/o9/UnYH0RPNZzPG/fw/Nq0oGleR1s
 4WFufWgRGsJCEqxtvd9Dm83s6M12pV/XSe5YRG8QZRqdAZ/BAKwI75SDORCjLcf6QJDv
 DXbw==
X-Gm-Message-State: AAQBX9dQ+wJ+f5wBacDt3NsQNpEuddJdxzhzJCt8SEvS+Ff+rcBOfSQ0
 XCM+VfsLSLp6XXkVSZLWbYehpQ==
X-Google-Smtp-Source: AKy350bk2/fzr+dtM9w5K/plrUVW+fEKnyzucVJ/a5hXz7GHf87bUlhqvKmrLM/SThMMOW9uCmEMAA==
X-Received: by 2002:a17:90b:1d8e:b0:23f:37b6:48f4 with SMTP id
 pf14-20020a17090b1d8e00b0023f37b648f4mr20675024pjb.43.1680095918961; 
 Wed, 29 Mar 2023 06:18:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:18:38 -0700 (PDT)
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
Subject: [PATCH v7 08/12] ARM: dts: sun8i: a33: Add endpoint@0 to dsi_in_tcon0
Date: Wed, 29 Mar 2023 18:46:14 +0530
Message-Id: <20230329131615.1328366-9-jagan@amarulasolutions.com>
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

Allwinner R33 DSI node already has a port so add endpoint 0 for input
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
       compatible = "allwinner,sun6i-a31-mipi-dsi";

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

 arch/arm/boot/dts/sun8i-a33.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index b3d1bdfb5118..50c2424ec31e 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -269,7 +269,11 @@ dsi: dsi@1ca0000 {
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

