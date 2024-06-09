Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8290183D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 23:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB41C10E2AE;
	Sun,  9 Jun 2024 21:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="WRHE2LwF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="RZVLVMEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69F410E2AE
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=XgCW2Teyxjo1qJ/+v4hXt3hiuRDzeE/1a0ajHqVR6WM=; 
 t=1717967929;x=1718057929; 
 b=WRHE2LwFI9kJAe0Uu/tUGxkrW3NPPGMQJN1kM6mBRo18P0J/u2YTemTSlB7HqUqRUWymZnYygAetRkLr83f7nVV738BUCFcqR90nKRNk/PrZHjGrHw1xc9Larj2KwKYQhVFdBz8uiqdT37ij7kxOuxuJnGv1wCxWBErLNJ4TkGE=;
Received: from [10.12.4.20] (port=47366 helo=smtp44.i.mail.ru)
 by fallback16.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1sGPHL-002KB2-3A; Sun, 09 Jun 2024 23:36:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=XgCW2Teyxjo1qJ/+v4hXt3hiuRDzeE/1a0ajHqVR6WM=; t=1717965399; x=1718055399; 
 b=RZVLVMEz3VHBc8zjUTDUNfj8hvs8AEsMW5Z35grcllPtBtaYw2qvI4HIy2edkanJCaJ/zgVi0PS
 HVe5NRi55bd0RWEfyDXjacMU30kPww9RGaCQ6qSPzB0ovltPWYMSBtctbWstpKC4TFwzplFJY1s8r
 POJJlv8GWz7j3JwmpMU=;
Received: by smtp44.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sGPH5-00000004YbQ-2jgt; Sun, 09 Jun 2024 23:36:24 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com,
 Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS639RQ08
Date: Sun,  9 Jun 2024 23:36:17 +0300
Message-ID: <20240609203618.49413-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240609203618.49413-1-danila@jiaxyga.com>
References: <20240609203618.49413-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD948651DF6EBC8E8B222621CCF380C0F235C86A77A6A247FFB182A05F5380850404E84FBDD82675F9BD4FF92D56319F1972E2138EB373856867A4D2F7B2508D394DC39866218C5191E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE770FEBAE29342FA8FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063764BF1E09E94CC6278638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D875E801B35AE15423179B2FEBA43CD57B2C9B4D5420AE7347CC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8A9FF340AA05FB58CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C62B3BD3CC35DA5886E0066C2D8992A164AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3CA64746D51DB396CBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF4964A708C60C975A1DD303D21008E298D5E8D9A59859A8B65FF0BFC5AEE34BE675ECD9A6C639B01B78DA827A17800CE760469D7ADB81D431731C566533BA786AA5CC5B56E945C8DA
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5177F2A6FBBF53CE75002B1117B3ED6969AF1702879616AB219AC5B239BAD4335823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFC2046D000D58A9CFC2D0F7E31F8481E1B3FB62E9FC0306DC211A96A0D0AF8DD7649A938D59E33ED0FD6CD3E887ECC32FF45B9C3B59D2153AE15ADD81BFA704DCE25B990C371C36E0D035775BAD7A4FF02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj6D5zjHqYKv1Yl+a1Y8Sf+w==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949817A795F5C603EFD0CAC4385294E02B5FBF47824E877E99CE90547A8BF58688A1D2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4B653A1001F6F75E4542571B84DC1CDDAAF24926542F20ADDB647ED114AB003ACCE0692C6BF09384D4547AB07AD1460ADC5F3AE8F7E3F031E3ABB9FCC2388B9EA
X-7FA49CB5: 0D63561A33F958A5438D42E686A423E79A85A0FF7066BD4E13E058B0BEB7AF308941B15DA834481FA18204E546F3947CD2B897A0B7B208E1F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006371CE0A079F1B3D4BD389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3B95D3BAC42CD083E35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj6D5zjHqYKv0tM1y63Q3TmQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Samsung AMS639RQ08 is a 6.39 inch 1080x2340 MIPI-DSI CMD mode
AMOLED panel used in:
- Xiaomi Mi 9 Lite / CC9 (sdm710-xiaomi-pyxis)
- Xiaomi Mi 9T / Redmi K20 (sm7150-xiaomi-davinci)
- Xiaomi Mi 9T Pro / Redmi K20 Pro (sm8150-xiaomi-raphael)
Add a dt-binding for it.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../display/panel/samsung,ams639rq08.yaml     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
new file mode 100644
index 0000000000000..3a561156f5601
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams639rq08.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS639RQ08 EA8076-based 6.39" 1080x2340 MIPI-DSI Panel
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+  - Jens Reidel <adrian@travitia.xyz>
+
+description: |
+  The Samsung AMS639RQ08 is a 6.39 inch 1080x2340 MIPI-DSI CMD mode AMOLED panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams639rq08
+
+  reg:
+    maxItems: 1
+
+  vdd3p3-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsn-supply:
+    description: Positive source voltage rail
+
+  vsp-supply:
+    description: Negative source voltage rail
+
+  reset-gpios: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd3p3-supply
+  - vddio-supply
+  - vsn-supply
+  - vsp-supply
+  - reset-gpios
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,ams639rq08";
+            reg = <0>;
+
+            vdd3p3-supply = <&vreg_l18a_2p8>;
+            vddio-supply = <&vreg_l13a_1p8>;
+            vsn-supply = <&vreg_ibb>;
+            vsp-supply = <&vreg_lab>;
+
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.45.2

