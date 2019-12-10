Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2938118289
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B1C6E842;
	Tue, 10 Dec 2019 08:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC07D6E82E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:37:15 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id b137so8553534pga.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 00:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=izzwB8GMZJtES8ZNzh6CcmsnyTygddhapLbM209XNjI=;
 b=RY5ElSrvt9m23bn6KokPJuIx7mpooAE3UOGD8182QQ2aLBbw/3XARg3U4NssfIn4uf
 DIm2/IwlKT2SsUkIqx1FSNTP4G7bo3CRntEOR38TFdltdHqa/Qj0xvV9RitldJjW4t++
 tpve1aMOlW+HDP0150nclSp9OB/w9CpiLiEAeA8iyLmtUHBwZiZJNrOKo5rV94p3nbzs
 6QzDmC4trEU9d2ntnMUXeKvvN1vO5CM829dKmLFJjI6lI3d5BcIGm5FWOI2+mVNpFNr0
 10SDE/VVfKol+2nsCqSg9qJethOqcoFd/EAzPp47hyo/vhgHdTYbZRR21xPwUjhYovww
 Afqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=izzwB8GMZJtES8ZNzh6CcmsnyTygddhapLbM209XNjI=;
 b=sdA+rCEzn31C4GLMmNZ8SAeOLB45vzOrI6L7U3nZ/0QBWLwmm+VUW47TyXBM1PBv+u
 mP9YO45wOa7rtxM+NBwYlMSKiGGYPvM8+4NlP2vLukkldjMdJbUl+LoCS0Fe3PExwknN
 EnY7PNLbKvqPFfLkEi9lK9uc0stJ/5mUcdb528TVBvqDtlUT91GGtTuyigqfHTExyq68
 dYqIMzo+G33LEkksJXubmKvpgDrjAkotZVQQvFxDtjlGls0ZFF6WD5+fdnSj9i6iMGGi
 IdpPAayQg3E70rDoLu36HYoKU8x+H8qmDz4D8uuwxrt2NaXS/D1jBDsQW7K/re+6ysHH
 RaFA==
X-Gm-Message-State: APjAAAUvhuWln2tPaJgLz6O5ZKw/JLYmuQN+JUptlTqfQSjnBgt05/Xk
 CVuw2W+jf+P7DEygm1Z46HE=
X-Google-Smtp-Source: APXvYqxtI/cPX825d6dJH84afTJ2EE+ZB7g4K8G2rqcPi3OiL/v8zCDGAp1+6vtHxRwnEBV6UZhfZQ==
X-Received: by 2002:a63:4466:: with SMTP id t38mr23512976pgk.316.1575967035473; 
 Tue, 10 Dec 2019 00:37:15 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y128sm2246632pfg.17.2019.12.10.00.37.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Dec 2019 00:37:15 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kevin3.tang@gmail.com
Subject: [PATCH RFC 7/8] dt-bindings: display: add Unisoc's generic mipi panel
 bindings
Date: Tue, 10 Dec 2019 16:36:34 +0800
Message-Id: <1575966995-13757-8-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds generic MIPI panel support for Unisoc's display subsystem.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/panel.txt     | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/panel.txt

diff --git a/Documentation/devicetree/bindings/display/sprd/panel.txt b/Documentation/devicetree/bindings/display/sprd/panel.txt
new file mode 100644
index 0000000..a4017af
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/panel.txt
@@ -0,0 +1,110 @@
+Unisoc Generic MIPI Panel
+================================================================
+
+Required properties:
+  - compatible: must be "sprd,generic-mipi-panel"
+  - reg: panel ID
+  - #address-cells, #size-cells: should be set respectively to <1> and <0>
+  - port: video port for DPI input
+  - sprd,dsi-work-mode: the following dsi mode can be select:
+	0: cmd mode,
+	1: video burst mode,
+	2: video non-burst mode with sync pulse,
+	3: video non-burst mode with sync event
+  - sprd,dsi-lane-number: number of dsi lanes to use, default is 4
+  - sprd,dsi-color-format: data format for video stream transmission, currently
+	supports "rgb888", "rgb666", "rgb666_packed", "rgb565" and "dsc", defaults rgb888
+  - sprd,phy-bit-clock: the transmission rate of the clock lane for High-Speed,
+	the unit is Kbps, and the default value is 500Mbps
+  - sprd,phy-escape-clock: the transmission rate of the clock lane for Low-Power,
+	the unit is Kbps, and the default value is 20Mbps
+
+
+Optional properties:
+  - width-mm: see [2] for details
+  - height-mm: see [2] for details
+  - sprd,esd-check-enable: esd check function enable switch
+  - sprd,esd-check-mode: esd detection method, default is register
+	0: register,
+	1: TE signal
+  - sprd,esd-check-period: esd detection cycle, unit ms, default 1000ms
+  - sprd,esd-check-register: if register detection is used, this attribute must be configured
+  - sprd,esd-check-value: if register detection is used, this attribute must be configured
+  - sprd,reset-on-sequence: timing of the reset pin when the lcd power on
+	<1 5>, <0 5> means first keep high for 5ms, then keep low for 5ms
+  - sprd,reset-on-sequence: timing of the reset pin when the lcd power off
+  - sprd,use-dcs-write: bool attribute, indicating whether to use the dcs to send inital & sleep cmds,
+	default use generic
+  - sprd,initial-command: lcd initialization command set
+  - sprd,sleep-in-command: lcd suspend command set
+  - sprd,sleep-out-command: lcd resume command set
+  - display-timings: see [1] for details
+
+
+	[1] Documentation/devicetree/bindings/display/panel/display-timing.txt
+	[2] Documentation/devicetree/bindings/display/panel/panel-common.yaml
+
+Example
+-------
+
+Panel specific DT entry:
+
+	&dsi {
+		panel {
+			compatible = "sprd,generic-mipi-panel";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			port {
+				reg = <1>;
+				panel_in: endpoint {
+					remote-endpoint = <&dphy_out>;
+				};
+			};
+		};
+	};
+
+	/ { lcds {
+        lcd_mipi_hd: lcd_mipi_hd {
+                sprd,dsi-work-mode = <1>;
+                sprd,dsi-lane-number = <4>;
+                sprd,dsi-color-format = "rgb888";
+                sprd,phy-bit-clock = <1100000>;
+                sprd,phy-escape-clock = <20000>;
+                width-mm = <68>;
+                height-mm = <121>;
+                sprd,esd-check-enable = <0>;
+                sprd,esd-check-mode = <0>;
+                sprd,esd-check-period = <1000>;
+                sprd,esd-check-register = <0x0A>;
+                sprd,esd-check-value = <0x9C>;
+                sprd,reset-on-sequence = <1 5>, <0 5>, <1 20>;
+                sprd,reset-off-sequence = <0 5>;
+                sprd,use-dcs-write;
+                sprd,initial-command = [
+                        39 00 00 02 b0 00
+                        39 00 00 04 B3 31 00 06
+                        ];
+                sprd,sleep-in-command = [
+                        13 0A 00 01 28
+                        13 78 00 01 10
+                        ];
+                sprd,sleep-out-command = [
+                        13 78 00 01 11
+                        13 32 00 01 29
+                        ];
+                display-timings {
+                        timing0 {
+                                clock-frequency = <64000000>;
+                                hactive = <720>;
+                                vactive = <1280>;
+                                hback-porch = <31>;
+                                hfront-porch = <31>;
+                                vback-porch = <32>;
+                                vfront-porch = <16>;
+                                hsync-len = <20>;
+                                vsync-len = <2>;
+                        };
+                };
+        };
\ No newline at end of file
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
