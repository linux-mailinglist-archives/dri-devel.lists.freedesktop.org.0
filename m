Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79243118279
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3AB6E830;
	Tue, 10 Dec 2019 08:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFEB6E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:36:55 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x8so8548579pgk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 00:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8aLq+zy1een00EBR5gN+QvF45u2P32aHof0Im7Tyw5A=;
 b=ID8MYin392wjJCTORhHWXcvHVnVhFIpi587MhFLIgIdPKGS17DEOddSgBZrFw2Fwrq
 PUeOpi/F3cwzQJ0wbX7KOMrNI3Zmd7xUchOhXceBwtf+86jpJUY7cyspi9/PPxTIYLGq
 duv8wJIgDM4eSGWoDK7SdAeYuTMs2biu9SBPfi8t/obKIhqCZsTc5G9P5+NoCIS0otzu
 M7Flw0Qjsa5zATKmfhbT4NPJwB3eVjYrjKWiYydx7eXscIvfe1j7QVJqnvLtKgp3wJb1
 UAIn57kuvJ2b4bapShQtp5AANO2sxYjC2SFDJ+3uduiqcjhsQgviH8cHxJYJNhQzSyHH
 LXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8aLq+zy1een00EBR5gN+QvF45u2P32aHof0Im7Tyw5A=;
 b=MbenqTSrhkLOWVWO/T5qEM8zgrT0F4TMdFHijKObgkMLZasTMcber+UXI1IOAFe0la
 nyxBlhqlNmxRZbZHiFi2M5WA+nGoANJ0mVs+V0uIT28/CJtMpLVTmox8k0jZlCq+IWSf
 lL/gBA1GWnpQjWyuAKQS3P8hxPLa3X9RINjPva1c3zHR3N72fj2p/K+Gjy0/wTcF8Ycl
 HTpcVX4ne/7ZwBZmQMTMvf5GfUNCis8rF4O8thEHn1mK8HN45Uc+7h3PAp/B7Z5sGdLj
 P7+3kAlttKPgFJZghnsuTXkSsJ9yXuu7NGwJorYZaPRnbGn8QeRFexzcheWmxxY8upR2
 8csw==
X-Gm-Message-State: APjAAAXkBqUrul5bfx5ItufI6qCx2v1SY4P3H7mkIFWEckuIcl7+Ajhy
 NJCmP97po+gPouCCZoCtqP8=
X-Google-Smtp-Source: APXvYqzGXYvWKHpEqVKsvI7bRoXjkDFpKrzHgLjzj+1HuAaG2gLFB4oqdQPvOfr6i7EFQSemwkx8pg==
X-Received: by 2002:a63:3e03:: with SMTP id l3mr23512465pga.118.1575967015262; 
 Tue, 10 Dec 2019 00:36:55 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y128sm2246632pfg.17.2019.12.10.00.36.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Dec 2019 00:36:54 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kevin3.tang@gmail.com
Subject: [PATCH RFC 3/8] dt-bindings: display: add Unisoc's dpu bindings
Date: Tue, 10 Dec 2019 16:36:30 +0800
Message-Id: <1575966995-13757-4-git-send-email-kevin3.tang@gmail.com>
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

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dpu.txt       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.txt

diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.txt b/Documentation/devicetree/bindings/display/sprd/dpu.txt
new file mode 100644
index 0000000..25cbf8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dpu.txt
@@ -0,0 +1,55 @@
+Unisoc SoC Display Processor Unit (DPU)
+============================================================================
+
+DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
+which transfers the image data from a video memory buffer to an internal
+LCD interface.
+
+Required properties:
+  - compatible: value should be "sprd,display-processor";
+  - reg: physical base address and length of the DPU registers set.
+  - interrupts: the interrupt signal from DPU.
+  - clocks: must include clock specifiers corresponding to entries in the
+	    clock-names property.
+  - clock-names: list of clock names sorted in the same order as the clocks
+                 property.
+  - dma-coherent: with this property, the dpu driver can allocate large and
+		  continuous memorys.
+  - port: a port node with endpoint definitions as defined in document [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Optional Properties:
+  - iommus: a phandle to DPU iommu node.
+  - power-domains: a phandle to DPU power domain node.
+
+
+Example:
+
+SoC specific DT entry:
+
+	dpu: dpu@63000000 {
+		compatible = "sprd,display-processor";
+		reg = <0x0 0x63000000 0x0 0x1000>;
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "clk_src_128m",
+			"clk_src_153m6",
+			"clk_src_384m",
+			"clk_dpu_core",
+			"clk_dpu_dpi",
+			"clk_aon_apb_disp_eb";
+
+		clocks = <&clk_twpll_128m>,
+			<&clk_twpll_153m6>,
+			<&clk_twpll_384m>,
+			<&clk_dpu>,
+			<&clk_dpu_dpi>,
+			<&clk_aon_top_gates 2>;
+
+		dma-coherent;
+		dpu_port: port {
+			dpu_out: endpoint {
+				remote-endpoint = <&dsi_in>;
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
