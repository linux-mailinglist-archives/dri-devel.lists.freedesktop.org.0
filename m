Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E470C186DBD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 15:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F081289830;
	Mon, 16 Mar 2020 14:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD732897F0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:46:59 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4BC48400DE;
 Mon, 16 Mar 2020 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584370019; bh=CSXgu1Fl5WfUS91bKBQktad7Yrg6yqP4RJTvw8e9FHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VWs8ZLZ0AfPj6Q/AcdXj0hwzeGadPXLw3W8nSwoG4wJpmIki57IfdJdS7hpu2pq1C
 FTnXU4XNxQlktkYxjTkiVFoeN7alFG5yluIDc1qDsibHrY+YtO3Y2Cl4r3lCcnWZV7
 a426jVae5VjmhPDYbEW3gYVfRu3l16r3+6+hMYnAd3Dyk3I7Db3dZeHMRNJhyXrbz5
 JjAYGQUWPrLBjG/2kcs8xN5sHnzHhMSUTV+SLI/rgjBm6wzQ7zofdO7PU4L5aEbEQ4
 12wxtryS4JMyLnSug5A0KXF7T7ht9QJeJaNaAcDLLMtOL6Hi41fmJ9Ug0wqWochtJF
 QM9Bg5o2JwAig==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4EB44A0062;
 Mon, 16 Mar 2020 14:46:57 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 2/2] dt-bindings: Document the Synopsys ARC HDMI TX bindings
Date: Mon, 16 Mar 2020 17:46:47 +0300
Message-Id: <20200316144647.10416-3-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316144647.10416-1-Eugeniy.Paltsev@synopsys.com>
References: <20200316144647.10416-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds documentation of device tree bindings for the Synopsys
HDMI 2.0 TX encoder driver for ARC SoCs.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 .../display/bridge/snps,arc-dw-hdmi.txt       | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
new file mode 100644
index 000000000000..d5e006b392cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
@@ -0,0 +1,73 @@
+Synopsys DesignWare HDMI 2.0 TX encoder driver for ARC SoCs
+================================
+
+The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
+with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.
+
+These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
+with the following device-specific properties.
+
+
+Required properties:
+
+- compatible : Shall contain
+  - "snps,dw-hdmi-hsdk" for HSDK4xD compatible HDMI TX
+
+- reg: See dw_hdmi.txt.
+- interrupts: HDMI interrupt number.
+- clocks: See dw_hdmi.txt.
+- clock-names: Must contain "iahb" and "isfr" as defined in dw_hdmi.txt.
+- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
+  corresponding to the video input of the controller and one port numbered 1
+  corresponding to its HDMI output.
+
+Example:
+
+hdmi: hdmi@0x10000 {
+	compatible = "snps,dw-hdmi-hsdk";
+	reg = <0x10000 0x10000>;
+	reg-io-width = <4>;
+	interrupts = <14>;
+	clocks = <&apbclk>, <&hdmi_pix_clk>;
+	clock-names = "iahb", "isfr";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			hdmi_enc_input: endpoint {
+				remote-endpoint = <&pgu_output>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			hdmi_enc_out: endpoint {
+				remote-endpoint = <&hdmi_con>;
+			};
+		};
+	};
+};
+
+hdmi-out {
+	...
+
+	port {
+		hdmi_con: endpoint {
+			remote-endpoint = <&hdmi_enc_out>;
+		};
+	};
+};
+
+pgu {
+	...
+
+	port_o: port {
+		pgu_output: endpoint {
+			remote-endpoint = <&hdmi_enc_input>;
+		};
+	};
+};
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
