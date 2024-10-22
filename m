Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327C9AB881
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 23:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEBE10E19D;
	Tue, 22 Oct 2024 21:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="pvhyOJW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-21.consmr.mail.ir2.yahoo.com
 (sonic305-21.consmr.mail.ir2.yahoo.com [77.238.177.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A68E10E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729632826; bh=h1lCgSE/gU2KPLaP5RWKCCeTWknmeiwR4F3guZcmDrA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=pvhyOJW8r6pGyAiaSVSXk/xJ2MnA0opx3a6Z8KcfKV0GbSi+sBrSI/vgE4cxIuWGNt57dTXQ1JERh0KD5oIzyKLcMJZi19iI0gAFCSTrua51RszNWIORVcbTodlEd+ytShypV6+FnUijO3be84KcQFb6uxZBBTRu6t0lEZiESa7ud+jEFsrUQKlgXXjmSfQfQ1Wb5VookjPNjgmOjRCZuNmbvEYU2yE0xUGpPz5D1vR8sP+/CXu2nm1G0AYDW7+s16tS1ug3WFvonMnrX66zvObDhkEvLBkh8yRlFgWQZeBmmampbUGWfwQDrdronGLkIOCUnvIJAZYxDzxlX+f1Ag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729632826; bh=X2uZdgF4fTV/joQRbapj2GYfAJ/NDlExMoKiPg862n5=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=kpsyfzhMyZhZW6+6VD5gRPw+fFltvwiSSalNQLDhhEAjNyYdVQvCM8JRh5B7VRKzcqgx2oRRJ7uXftOeVAPkYD8I9xMsNNcpbCJXzttHdJRinGDQ1wNdxltV2Wdhk/xbpL28LjIwhpzuOyfssyTzO1gKjgki5sdP5U7gm9exr05dtpor5h6eqxU4RONpli9y0iTKy4TCVtqDmSlFM4NBJcvlCC74xGEaI2bDVxZrAbrjA/Ks7SdfgxDQOwW08tsom4V+hlD6IPqiNpC5Q4WlwUTxHgQ7v5W47VxS3ogw98dbD4gzTBSqCUDQPs8UDna4jaFHCpx65PBudfDBKsDdvQ==
X-YMail-OSG: uYbzB0QVM1mf1dkM1r4zs7YmR3EcQvTldkkAyoGCJ1L6tw9eLrGuzDyeRmFUpWr
 HVDrPj2_hGi2YdbM_LxPpapgAoQhc6HFt8ZMzEpc_o.fJeQUQqVjBRQbUsGaBdNg176DcLWV8u9A
 FjcjqOBgyHD173eSN41njm_ys_2Xyh_BfGzoPE8bPnPIFeINjd5nYvduHe6ke8Y6KGaWkW1B.guK
 bN93gFIAO8IjaWGu.gKc0EVq22fsn6FU6OKWfb5mOt.1MthzSeLmHJeIbRnYjQCI4czZXvR_C7fg
 p5p62nuGPiaqQNjPgPFZh2skCTLQTKs0ob21Rmjg0TjTgd2up79mTd4EKnIb9DCacFFdj9WMLI2v
 bH4t18BmJ0apy_NFnkSp0gK3cAYOuq42oK7PCMGs_NvFg5DaxdHyEh6ZT527QEFsStciOSS3pQP.
 dv7xVECLgKmyUHsJDT2vwy_LsaSjxoYP9DmVfwQgBkjtugwQycI9BixtQqGLTpPiV81LU4CCRrY5
 0gFSIRKJvStJRi_lGuelIza8xbgKoDh.6zsFfLEGrwttCSig9hTPZOMms2ScRbiuixE73rkahXP0
 ctl7QyCf_VwAK6xcQccSLSAGK3PNjkz7ejRDN6h2SFEZNnbESy4BTB3dPx.SBpds4AYX8cbglY9a
 Oi0sQftcsFgyq8zocoq2VhEgZCgxOx8iBvuOoki92Ood6jRhGv9HaFhU02cHcUK5rvaN0MkdWhQf
 LFn3xYvKozYDukEq2o5lhJ3X6sYbtu_cdEXtsZPjiZrSFw2FA7icSDH3Fcn.X5HazsyS35HXrCva
 mVF07mlP4udE_nl97Yh9sK4XeDVIEG_imfU5xB7DM3FkS4fRF5ie5dsT8JNdLhKulzsc1pHPzbrV
 N0h5P8mnd8.fBgzWYsXmMfPOH512rjLXeyAdZo8xqHN6u4cQZxippgnQFHlKJrTd83NUt15T.7vF
 _1Qtm4Ns8Vxm_9QZybHX2wzKYxum.Up3hoYknxcaypebTuj3leqcBd.DKVvQWNxXz2u6Cm6gvzK1
 JWv_d4Vjig7Svk6m1hbMbMQgffIGAx2q5H5Qvy7CoKcfADIVUZ.jfKsbdmxE.pPlZ0GuOJxUf79f
 mbpPl8M5yd8PfjpR9H_BdrcC0a_AFGhW7ZYptC2eB0fW7JdI36HqvX1P80L1Ap52CXgSwl9fIIdS
 0Hn6xJcKnKPV4hfhPdm.TntqhdhVtxJoutnzmnSgIMqCCkNU6O9DYIyqQEWKzMIvYEZBDhppqzj5
 W2mkMbyhOAmFQl.N7M.C2G5IwVzrTx9RFmQ_VfPgL_N4CGt30LJvx0HyIIE_zGJpDjbHDA5970UM
 dJ6JqavepvGLUZLOw2Ms3OhEexAFLCNesZG021fDQt7gnXjhzU8twjbYi6DZt9TCz0wms.2.tlCl
 jylCSQIF8dLLv206Dx59FGSFrcE6SB1X1XX5xjsskkONzbEbyl9CfMkbdv9V9hMBsB2i1HyzThNq
 VNrDlr2QqoADsJqYZAbniHZpLL.S8aWT3pZtPazM4JcrK6Vt8NTfLpM1FACfAvWRgH5lucXBENcD
 dmEuonndgzsbuWB9NTulxnuOms1z1pyOU.wsBpPKDQ8iCmnyD3qVwrV3yC9SJ8rpLXw8czIC83iY
 E0Ca42o4qyO5FsmP7_vYOm5Zx1OshkvK5RTnAbvsd1I5OIv.IL734nie8jiovy.RXltfkgtt21N.
 x7l4WWL7bIrszu1RnhMQWM2M8IUxyNfcZV8iCawim6LxEi.X4CaorsAOuxpOUML3EFkvotkjm6Td
 B2vlw091Xdql099C9dMeZo_P7IPnpkdgzRPMUv69Llh1Vm6zCEff687YSHN2pUVz7wJsZWe2ihYl
 4jrGJPe4kLBkwkeFgCwBf6PyGifSJubl44NVHMjdaGTg02gzNKzRkg_at0fYeI88Y6nCOWli6l3q
 kXfGdoy13ekbu.IC.jfNcBYZ1OWqMjn7dtTk1eWjq3l4hD67mtZY2fPqIe.pKQXCS04vh62zLSJb
 7C2SM0ujA2.VblWyLnfe4tpfQ33zXFsqunC5zJbxGdhms9O1QacOskq9BIzCb9P20pK5vjjbF9CW
 pFAiId.n02KqhM.Qf2ChEi6_xxM8_pQppv8J_8ddd.j.7ovgicNyyhJMWWw1iEawgMfIbU5_Y8Og
 7tVyDVijPekmBaWlMMxkJYLB6iyloFYLPTietPuGt7bW3MB7B2I_OmoG7Wtf_s5ZoqdvZKFObJ6z
 qXMBSUjCXNSGDCb_CACjYIzyIPJRdFs2W6Mh1lHX77ul_9y2V.ORJdYSdTvIPN2vDyKd03mRb.jF
 h_yIV4Dp9G0ee2NHDDc1TxuLl8Rc0QOjJv7HhOSdH2GHUVrvK
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: eb9a8438-892f-4e82-aa11-b6e2c1ab0dcb
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ir2.yahoo.com with HTTP; Tue, 22 Oct 2024 21:33:46 +0000
Received: by hermes--production-ir2-c694d79d9-qjs6q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00a5d0a4af66107c7c1614b6d685cac8; 
 Tue, 22 Oct 2024 21:33:45 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v2 2/5] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24 bindings
Date: Tue, 22 Oct 2024 23:33:36 +0200
Message-Id: <25370285451d9c22204dfbaa368d48c22efd1eef.1729630039.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729630039.git.jahau@rocketmail.com>
References: <cover.1729630039.git.jahau@rocketmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Samsung AMS427AP24 panel with S6E88A0 controller.

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
Patch is based on current branch drm-misc-next.

Changes in v2:
 - Adapted property "flip-horizontal" to being moved to "panel-common.yaml".
---
 .../panel/samsung,s6e88a0-ams427ap24.yaml     | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
new file mode 100644
index 000000000000..2677bc578dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams427ap24.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS427AP24 panel with S6E88A0 controller
+
+maintainers:
+  - Jakob Hauser <jahau@rocketmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e88a0-ams427ap24
+
+  reg:
+    maxItems: 1
+
+  port: true
+  reset-gpios: true
+  flip-horizontal: true
+
+  vdd3-supply:
+    description: core voltage supply
+
+  vci-supply:
+    description: voltage supply for analog circuits
+
+required:
+  - compatible
+  - reg
+  - port
+  - reset-gpios
+  - vdd3-supply
+  - vci-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            panel@0 {
+                    compatible = "samsung,s6e88a0-ams427ap24";
+                    reg = <0>;
+
+                    vdd3-supply = <&pm8916_l17>;
+                    vci-supply = <&pm8916_l6>;
+                    reset-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+                    flip-horizontal;
+
+                    port {
+                            panel_in: endpoint {
+                                    remote-endpoint = <&mdss_dsi0_out>;
+                            };
+                    };
+            };
+    };
-- 
2.39.5

