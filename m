Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB38904E38
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674A510E7C8;
	Wed, 12 Jun 2024 08:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="iCPVLGcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp16.i.mail.ru (smtp16.i.mail.ru [95.163.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F1B10E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=U6H7m9rn1ont4JnIsu735i9df6dAMVHhZ5dGcdbkTGk=; t=1718181256; x=1718271256; 
 b=iCPVLGcqmIPI4bHI8jxgMd9aQ2vwiXw9oU9e4ukC9d2wnHLTj6IhBCXMKODzDGxDpsH1V+lEP6n
 KAbf7g5v7+1//ZM2RpyHeObt6zNsJIR5R98EVkpnDH6JdEq3wkxOb8OKhwsctxpiIUilfLGVNPhCP
 VV0Gg3AVoBs+CUl6U94=;
Received: by smtp16.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHJQs-00000006Iqv-0Zgf; Wed, 12 Jun 2024 11:34:15 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com,
 Danila Tikhonov <danila@jiaxyga.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Samsung AMS639RQ08
Date: Wed, 12 Jun 2024 11:34:04 +0300
Message-ID: <20240612083405.15750-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612083405.15750-1-danila@jiaxyga.com>
References: <20240612083405.15750-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp16.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA41DE42749F357741E440C2FC2F02794100894C459B0CD1B9B462186C9BC58FAF87FE86DE270AD9EE78DBB8B790F7592218367D251A7F91BDFB652AD2CEFA51F0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79EDB57D1FB735487EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637652CD06254D2F21C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81CC26A5B2A11A62E05E8BD7C2AB4DD114FA82405F105C83BCC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8989FD0BDF65E50FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB2AD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C30F1327A8DDF03E57BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE7AEA1580DED4E70E3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A58B7662086DA4EA7F5002B1117B3ED69692F3F20CAA1392DC3D2BBC1EF78EDEBE823CB91A9FED034534781492E4B8EEADEEA082C9A12FE455C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF657ED76238B4970709C7ACD258638398FB073F545CD638C0E4417B80A4A4F36B3D7E4ABC8EFFEBBE04A26A3878DC13300493BDFCB3B841E11DB24A82BF7F4F225860FF72398FDAAFF59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKMzo5MYpu27dg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981B214AC7FA6C3016405E38EDE555C280619C529AB51C89D1858B8FE9733CA9F552C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/samsung,ams639rq08.yaml     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
new file mode 100644
index 0000000000000..f5b6ecb96f994
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
+description:
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
+    description: Negative source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  reset-gpios: true
+  port: true
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
+additionalProperties: false
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

