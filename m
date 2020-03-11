Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A9182A8D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AC96EA45;
	Thu, 12 Mar 2020 08:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6FE89D56
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 12:51:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x3so3110500wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=voK4xVRATAJ1dlqqOLPJfEhvH/b2NcYPolGiaZ4ZDGY=;
 b=NgewE5pH2ubf6Xep9BPlnsu71Iiy5y6GiXL0m0Hyh+MRd2DG+R95m9E/YLe6mRzs4v
 3ht5N1r5cyzSzQze56KVTUWSn83NEy4YF3v4JdIkJJQ1OAqukdcwdYPH9l4bg808BYqf
 yWerZvk40Vg6b14GYcoD3M6apTJLfOKjaRAS+waH+xnv9jJ9N42fKeS3Mm/+ekoYDvJo
 mSkmmN37/H30f9kGrQ2HwqLke5C5xy01uQYE8Yz6rvX35y7RCTz17MqZVgltJ+zSvHpF
 Iiz0uOi0myzwYoF/ZaSXWxfk0VCS8HkBnt0ae4hqgmJtxxI5DbEmpSYMCIZwWAciXEW4
 vWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=voK4xVRATAJ1dlqqOLPJfEhvH/b2NcYPolGiaZ4ZDGY=;
 b=C6vea5OhdPebgGy6C9d0lC9wEpN3lDvlDsslZKTYCBifuKQtfqm/YyNFIcfg9eq0QV
 QHRfNuhBgz96G/Nj2Kh/W7B7xIuvH2J+DSM0pMS/Z7TeDYx3qIabqP6ilxK+kpad+QjQ
 JkaVJ6x5ZgowDgtRTcHuNaab0mnmJZecNh1Ekg2GjWwvPVnnh+qfxGwivH999F98uhVn
 G3vB21iGKVcalSpUBg0T2fTsV7mg85Gpw4lSUzFu5zejkDuuYgnNMHxE2mUCi0e72awS
 OayMzzYE6Pk137FNE8AFwOfhQKqIVDk1i+p7idkF3KFXdcppRACWNfb5eq8FFn5syisI
 WhSg==
X-Gm-Message-State: ANhLgQ3W4jQ44im3+ngoFUi9MpXmcLETqgQypYXn45HZ+RBpuZYYAe7h
 gm34/DhwJR0kX/WtsIGNd219fQ==
X-Google-Smtp-Source: ADFU+vuHzJoBWiuWXa93nVX3LEtEiiiQt1WnKL1tKPhNI2IxSKL3y13zZbv1e/00FBK/USQMhVXp2Q==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr3619222wmk.159.1583931104929; 
 Wed, 11 Mar 2020 05:51:44 -0700 (PDT)
Received: from robin.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm8843538wme.36.2020.03.11.05.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 05:51:44 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com
Subject: [PATCH v2 2/4] dt-bindings: display: bridge: add it66121 bindings
Date: Wed, 11 Mar 2020 13:51:33 +0100
Message-Id: <20200311125135.30832-3-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311125135.30832-1-ple@baylibre.com>
References: <20200311125135.30832-1-ple@baylibre.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, stephan@gerhold.net, jonas@kwiboo.se,
 heiko.stuebner@theobroma-systems.com, Jonathan.Cameron@huawei.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
 mchehab+samsung@kernel.org, andriy.shevchenko@linux.intel.com,
 sam@ravnborg.org, davem@davemloft.net, icenowy@aosc.io
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the ITE bridge HDMI it66121 bindings.

Signed-off-by: Phong LE <ple@baylibre.com>
---
 .../bindings/display/bridge/ite,it66121.yaml  | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
new file mode 100644
index 000000000000..1717e880d130
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE it66121 HDMI bridge Device Tree Bindings
+
+maintainers:
+  - Phong LE <ple@baylibre.com>
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The IT66121 is a high-performance and low-power single channel HDMI
+  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward compatible
+  to DVI 1.0 specifications.
+
+properties:
+  compatible:
+    const: ite,it66121
+
+  reg:
+    maxItems: 1
+    description: base I2C address of the device
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active low reset
+
+  vrf12-supply:
+    maxItems: 1
+    description: Regulator for 1.2V analog core power.
+
+  vcn33-supply:
+    maxItems: 1
+    description: Regulator for 3.3V digital core power.
+
+  vcn18-supply:
+    maxItems: 1
+    description: Regulator for 1.8V IO core power.
+
+  interrupts:
+    maxItems: 1
+
+  pclk-dual-edge:
+    maxItems: 1
+    description: enable pclk dual edge mode.
+
+  port:
+    type: object
+
+    properties:
+      endpoint:
+        type: object
+        description: |
+          Input endpoints of the bridge.
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vrf12-supply
+  - vcn33-supply
+  - vcn18-supply
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c6 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      it66121hdmitx: it66121hdmitx@4c {
+        compatible = "ite,it66121";
+        pinctrl-names = "default";
+        pinctrl-0 = <&ite_pins_default>;
+        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
+        vcn18-supply = <&mt6358_vcn18_reg>;
+        vrf12-supply = <&mt6358_vrf12_reg>;
+        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
+        interrupt-parent = <&pio>;
+        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
+        reg = <0x4c>;
+        pclk-dual-edge;
+
+        port {
+          it66121_in: endpoint {
+            remote-endpoint = <&display_out>;
+          };
+        };
+      };
+    };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
