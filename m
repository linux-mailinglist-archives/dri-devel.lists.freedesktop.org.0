Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D873F118275
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE5C89E38;
	Tue, 10 Dec 2019 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5B26E82E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:37:03 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id q127so8550437pga.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O3M2kUIZvh1y7QnzVDJ72RW9/rxyHw9ji71B/UMwuh4=;
 b=S44Wn2T5PcoqwaV3CVGoQ1DX9MYFHbLY8nvZt/g3ehUarxNrT2OSCdpjgUyTFPJwYR
 HmAJpQ2csDJi5yEBjb0YCWsYeAqXZlP2zOZmmD0y3asMy+6lmU70hwyPNBFOUgaNNEE0
 VTT4yqPiUiIXV+OeRrYBApkok60cYKDOQmDseZz/yNWXMfCjAy/dJTYmYU60yksY8p2Z
 s04xPejKe3eUmxzXKwnoNH24oCbbVZWmrx5O8y/LYwKDmqRoD7rpiR0h7KVYOnccqU2k
 FL/qkSC/026aXibE0xe0nccjQ4Aa+Bz5cQYw5TUMcHV0R+jxqrkKSSleaQz5xSR11RD+
 7zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O3M2kUIZvh1y7QnzVDJ72RW9/rxyHw9ji71B/UMwuh4=;
 b=rsTpmxKhoFen4Rect/dd4gHEyZpUmLf7npG6hM9TEB7mKzM5yqZm3LQJkb0aBgfxyr
 hw5RzzUUNvxfY1nyvHbZC8eZSq6BwXcegXbsVrXl7WfLnSa+WtwMLsusFCiWwruajOgi
 tjVDVFzZhhsA+MGiyvFdpy+C/O0H41WawCjnic+7mGtQ53nTE8sl0EPNlZaOUVmm9p+V
 x4SDONs2LkAAl0rl8eET6ObZpsfSBN+jph5tuppfz+qaPtxCCtbEmuN/12xZZK1PfPki
 9yAr6MqpMI/eekxOvnmSuSj92NKfZwtaEUvOqOZnLunVeV4TEURr+C50ndQdcaKL1/D5
 Ajug==
X-Gm-Message-State: APjAAAWa2p11ApTIDAcmnBgz1fKkTshJthI0tSENsRKV83RkxGAgflYd
 8O1JbELtWie8pnqMP7cnzhU=
X-Google-Smtp-Source: APXvYqwhny1ZVNzbPOBw/olf4ehlF11KH1tCeKi32VRZ+TDhrLTREKKuG5ium9HCOL33qjdar33b+Q==
X-Received: by 2002:a63:f5c:: with SMTP id 28mr23720083pgp.348.1575967023390; 
 Tue, 10 Dec 2019 00:37:03 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y128sm2246632pfg.17.2019.12.10.00.36.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Dec 2019 00:37:02 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kevin3.tang@gmail.com
Subject: [PATCH RFC 5/8] dt-bindings: display: add Unisoc's mipi dsi&dphy
 bindings
Date: Tue, 10 Dec 2019 16:36:32 +0800
Message-Id: <1575966995-13757-6-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:05 +0000
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

Adds MIPI DSI Master and MIPI DSI-PHY (D-PHY)
support for Unisoc's display subsystem.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dphy.txt      | 49 ++++++++++++++++
 .../devicetree/bindings/display/sprd/dsi.txt       | 68 ++++++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dphy.txt
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dsi.txt

diff --git a/Documentation/devicetree/bindings/display/sprd/dphy.txt b/Documentation/devicetree/bindings/display/sprd/dphy.txt
new file mode 100644
index 0000000..474c2b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dphy.txt
@@ -0,0 +1,49 @@
+Unisoc MIPI DSI-PHY (D-PHY)
+============================================================================
+
+Required properties:
+  - compatible: value should be "sprd,dsi-phy".
+  - reg: must be the dsi controller base address.
+  - #address-cells, #size-cells: should be set respectively to <1> and <0>
+
+Video interfaces:
+  Device node can contain video interface port nodes according to [1].
+  The following are properties specific to those nodes:
+
+  port node inbound:
+    - reg: (required) must be 0.
+  port node outbound:
+    - reg: (required) must be 1.
+
+  endpoint node connected from DSI controller node (reg = 0):
+    - remote-endpoint: specifies the endpoint in DSI node.
+  endpoint node connected to panel node (reg = 1):
+    - remote-endpoint: specifies the endpoint in panel node.
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+
+Example:
+
+	dphy: dphy {
+		compatible = "sprd,dsi-phy";
+		reg = <0x0 0x63100000 0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* input port*/
+		port@1 {
+			reg = <1>;
+			dphy_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+
+		/* output port */
+		port@0 {
+			reg = <0>;
+			dphy_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
diff --git a/Documentation/devicetree/bindings/display/sprd/dsi.txt b/Documentation/devicetree/bindings/display/sprd/dsi.txt
new file mode 100644
index 0000000..1719ff5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dsi.txt
@@ -0,0 +1,68 @@
+Unisoc MIPI DSI Master
+=============================================================================
+
+Required properties:
+  - compatible: value should be "sprd,dsi-host";
+  - reg: physical base address and length of the registers set for the device
+  - interrupts: should contain DSI interrupt
+  - clocks: list of clock specifiers, must contain an entry for each required
+	    entry in clock-names
+  - clock-names: list of clock names sorted in the same order as the clocks
+                 property.
+  - #address-cells, #size-cells: should be set respectively to <1> and <0>
+    according to DSI host bindings (see MIPI DSI bindings [1])
+
+Optional properties:
+  - power-domains: a phandle to DSIM power domain node
+
+Child nodes:
+  Should contain DSI peripheral nodes (see MIPI DSI bindings [1]).
+
+Video interfaces:
+  Device node can contain video interface port nodes according to [2].
+  The following are properties specific to those nodes:
+
+  port node inbound:
+    - reg: (required) must be 0.
+  port node outbound:
+    - reg: (required) must be 1.
+
+  endpoint node connected from DPU node (reg = 0):
+    - remote-endpoint: specifies the endpoint in DPU node.
+  endpoint node connected to D-PHY node (reg = 1):
+    - remote-endpoint: specifies the endpoint in D-PHY node.
+
+[1]: Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+SoC specific DT entry:
+
+	dsi: dsi@63100000 {
+		compatible = "sprd,dsi-host";
+		reg = <0 0x63100000 0 0x1000>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "clk_aon_apb_disp_eb";
+		clocks = <&clk_aon_top_gates 2>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dsi_in: endpoint {
+					remote-endpoint = <&dpu_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dsi_out: endpoint@1 {
+					remote-endpoint = <&dphy_in>;
+				};
+			};
+		};
+	};
\ No newline at end of file
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
