Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFC5A262E6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705F610E546;
	Mon,  3 Feb 2025 18:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="NiK6dPMC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="qVo34w8b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="p4htlggL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback25.i.mail.ru (fallback25.i.mail.ru [79.137.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74E510E546;
 Mon,  3 Feb 2025 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=vMI27AoYZKG1CD0cxeK+bWR5XL/P6T55MHlECj5RKqk=; 
 t=1738608456;x=1738698456; 
 b=NiK6dPMCBrza4Z3Sj+h2rLznWGUB3hZN9WlakPh+F0ysgxmXVtvE3ByFlIskam30vGWOfmmbUxmp3QPqt1Ye2wo7bbMfeCqII2FWTOZLfhdoI+1roI2dKAAFkLA4ZxMDqbVHz+gPOstM72sLQnWd6fe9tldVStrLlVuaSVepSeI=;
Received: from [10.113.18.238] (port=56206 helo=send146.i.mail.ru)
 by fallback25.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tf0yQ-0069WL-74; Mon, 03 Feb 2025 21:15:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=vMI27AoYZKG1CD0cxeK+bWR5XL/P6T55MHlECj5RKqk=; t=1738606506; x=1738696506; 
 b=qVo34w8bFrijIhbrXFPmrD+2Ot+D5WvjVzZtsOauZO1Mypkl8pNbbu62fvDtMEpRfo+ywOAa11T
 neQ7qaAvAPnHc5LFRnDZxLKHycZfkSrRG47xu+jP2HlZz3ImjkuEDYpgp0lfbTlVRT0j9Uyvr2EKj
 bwJy52r8g5pvVat2JqU=;
Received: from [10.113.74.228] (port=37222 helo=send127.i.mail.ru)
 by exim-fallback-5fbdbdcb77-pnkdf with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yN-00000000MRc-1hMe; Mon, 03 Feb 2025 21:15:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=vMI27AoYZKG1CD0cxeK+bWR5XL/P6T55MHlECj5RKqk=; t=1738606503; x=1738696503; 
 b=p4htlggLAIHgcnwJwmFX+nxKhamKTsaI1PeuNHaozBrCXhhNY1xAZMiesnWLb8JUgF83l3nEUHR
 U4QcFINzspvvMC5hqXOg6rA456LqF3gqftGgMAbuywVNkimDCNDk6HhPZ3K6xZGqkR01880L3Osz4
 piyy+XMpA8UDY+n1N5Y=;
Received: by exim-smtp-6d97ff8cf4-crh4d with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tf0yE-00000000H1P-1fMB; Mon, 03 Feb 2025 21:14:55 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 1/4] dt-bindings: display: panel: Add Visionox RM692E5
Date: Mon,  3 Feb 2025 21:14:24 +0300
Message-ID: <20250203181436.87785-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203181436.87785-1-danila@jiaxyga.com>
References: <20250203181436.87785-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF2193CC243B11556D4B3C007C06E5751BCD62213F67905E7AB0649A66F3AA3068BDA1AADECFE04B8598A8AF26F29BC2CA8CCD77A89BB61E5C074A40F52AF1438D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79CBBCC7DE3A5D56AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637826327602763C04B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D862F0D7E7066D67FEA51576F636F323C960FF3A77CDDDD7E0CC7F00164DA146DAFE8445B8C89999728AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80A9EC8C3488E7643F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C0085B890FD2717DA2D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C38486209235C84D5EBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE702706FBA10211704731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5369D1127B58F3B825002B1117B3ED696AD07EB059A5FB68A406406D89DD9EB8A823CB91A9FED034534781492E4B8EEADC24E78AA85F86F6CC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAB5AF39FC37094E5026FA46F59BDAFFA48B8FFBE6A9FD84395D19E6975599BBF673DC415E80A8BD9C56FE0738BD31C048F2B6330692F492F139AD299E36D9692496E903E34223801354DA1E504E663BD02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojks+hT+CyYL1LIkh1H03mOA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FF5005910AAC18673741D06F8E7BD5C4967C203FCFC3633DB5C591B039FEC00412C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1CB476F615DCA8D7C049FFFDB7839CE9E725523CC1EE150EB9BE279998AA1392682E1BE4275B237E129DA6FFDDAE8366B84F723779572AFA0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSpaVNpzbQKl5NyqHyU9iLcO
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C12D8BAB617684C85D049FFFDB7839CE9E725523CC1EE150EB080CF46EBE76E79C84AEBD1CDE12445EB7814337C72B12BC
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSpaVNpzbQKl5Jf1Wbpd8t+6
X-Mailru-MI: 20000000000000800
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

The Visionox RM692E5 is a 6.55” AMOLED panel used in Nothing Phone (1)
(sm7325-nothing-spacewar).

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../display/panel/visionox,rm692e5.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
new file mode 100644
index 000000000000..d4b4672815fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,rm692e5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox RM692E5 6.55" 2400x1080 120Hz MIPI-DSI Panel
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+
+description:
+  The Visionox RM692E5 is a generic DSI Panel IC used to control
+  AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - visionox,rm692e5
+      - items:
+          - enum:
+              - nothing,rm692e5-spacewar
+          - const: visionox,rm692e5
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: 1.8V I/O source voltage rail
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vddio-supply
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
+            compatible = "nothing,rm692e5-spacewar",
+                         "visionox,rm692e5";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_oled>;
+            vddio-supply = <&vdd_io_oled>;
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
2.48.1

