Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E36ABEC2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC8610E238;
	Mon,  6 Mar 2023 11:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0424710E238
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:53:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZ9Os-0007KR-PP; Mon, 06 Mar 2023 12:53:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZ9Or-002EWs-PV; Mon, 06 Mar 2023 12:53:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZ9Oq-002fPG-Ud; Mon, 06 Mar 2023 12:53:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v6 1/2] dt-bindings: display: imx: Describe drm binding for
 fsl, imx-lcdc
Date: Mon,  6 Mar 2023 12:52:48 +0100
Message-Id: <20230306115249.2223042-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306115249.2223042-1-u.kleine-koenig@pengutronix.de>
References: <20230306115249.2223042-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=LGBP388eXSDg5Sh4xW/Yqw1YR9mypcnK1JjPdoElm2E=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBdQKHwEYtxDaV/z5cjvnMONPwLCLR71/3xlxO
 Zb2eL5zhoOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAXUCgAKCRDB/BR4rcrs
 CVrYB/4grsN2L140LJPRllDHrOmmq0VUt+jnyitg/LNSi5USndrgyBiEP0vnHzMYFs4klpJU1FD
 OwvRzZ4T5gIxycTWCsdT+FQf+XHnmkSJ/UCUzyEOHZmiZAwvVrGi3bmsKtJJEi/n3e9R810TRlj
 aE/V4ezD7B9Nyb3Lztx4ZyTCssIhYFzT6UJOvUioslNBDDyT2xmHW781Vl1HJpnQ+q//gxu/eus
 DlJZR9jBpM9kQ747BXwl8cPW5owDtePtlOUxEYALx1FN5qB9OWmNGzoeQDuYexNURW2/6QDP99z
 mLBD8SHIfN7BYklceHIptq4vxi5iWc9FQz0xSLEHGBklHRDk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify the existing (fb-like) binding to support the drm-like binding in
parallel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../bindings/display/imx/fsl,imx-lcdc.yaml    | 46 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
index 35a8fff036ca..c2b29622bceb 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
@@ -21,6 +21,9 @@ properties:
               - fsl,imx25-fb
               - fsl,imx27-fb
           - const: fsl,imx21-fb
+      - items:
+          - const: fsl,imx25-lcdc
+          - const: fsl,imx21-lcdc
 
   clocks:
     maxItems: 3
@@ -31,6 +34,9 @@ properties:
       - const: ahb
       - const: per
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
 
@@ -59,17 +65,55 @@ properties:
     description:
       LCDC Sharp Configuration Register value.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx1-lcdc
+              - fsl,imx21-lcdc
+    then:
+      properties:
+        display: false
+        fsl,dmacr: false
+        fsl,lpccr: false
+        fsl,lscr1: false
+
+      required:
+        - port
+
+    else:
+      properties:
+        port: false
+
+      required:
+        - display
+
 required:
   - compatible
   - clocks
   - clock-names
-  - display
   - interrupts
   - reg
 
 additionalProperties: false
 
 examples:
+  - |
+    lcdc@53fbc000 {
+        compatible = "fsl,imx25-lcdc", "fsl,imx21-lcdc";
+        reg = <0x53fbc000 0x4000>;
+        interrupts = <39>;
+        clocks = <&clks 103>, <&clks 66>, <&clks 49>;
+        clock-names = "ipg", "ahb", "per";
+
+        port {
+            parallel_out: endpoint {
+              remote-endpoint = <&panel_in>;
+            };
+        };
+    };
   - |
     imxfb: fb@10021000 {
         compatible = "fsl,imx21-fb";
-- 
2.39.1

