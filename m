Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717398CE90B
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 19:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F11C10EF69;
	Fri, 24 May 2024 17:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="FZ1YP1P3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZfZgGsW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Fri, 24 May 2024 10:41:20 UTC
Received: from wfhigh3-smtp.messagingengine.com
 (wfhigh3-smtp.messagingengine.com [64.147.123.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA89F10EEC1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 10:41:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id BBEF61800147;
 Fri, 24 May 2024 06:35:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 24 May 2024 06:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1716546956; x=
 1716633356; bh=eclUnGiLLnNnnM77HcHvRQHDumlGa2n2Q4eUNfZG2Ws=; b=F
 Z1YP1P3EHotWrQdFapSdxkR8L/c8ivBwVZbW8IxFWecy2+1+eGUKM3VJkTu46wyH
 S66EqHV4nMB/9VtngAGtTLCPWLZmfNNBaZwstCNYBeUpm1wIiLQXR93XStWFVcnq
 c+7j5aCYZt6IT6+88kLVmql6A0mgL1XQeo36+lQCUs9YaAL94HM7wN6KGtOjBpPw
 KHUHDf+N7UlHZQK8BUBGUMGZkJVt5+ZLm6P6Vb0YAeM9AlpWJfapXVScMMpRDmOK
 7H8vEL0K43maK20fFU0vicJFonR/uVmiI2yVGzvKkA09DjDSzOwQUF0DqS7wLMxH
 kzHoxLdKPfR6rE4CunW4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716546956; x=
 1716633356; bh=eclUnGiLLnNnnM77HcHvRQHDumlGa2n2Q4eUNfZG2Ws=; b=Z
 fZgGsW44sH4s8LfZ7H41tZYxyB6axStg7GYSV4pAm4u7mU4w4Zzl3BGRTKczikFp
 Tn9+faqE3XsCMFklWiftO0sVoLgbMS28Cz9DSlV64SNb4Io7JuvLfBLnw81lnkIu
 z05UonMK6avEZSdAX8Mtsf/HUgoDlC3zDi/rKwFyHMgEjUc2vrsaRadFekDPY0xC
 mHkJnkWJA7E00yy8iPZDJB0+wSsdciU4v8RPIgnj5nube4AS4OrcgXvrPTSVhL9X
 HJifKPP5W2ujzoWTgIhsIahAmNZ4+ESR/79YCmezNDesKoYm7ptE8szxgNT/lx8k
 swymg5rd8R6B6woirsYBQ==
X-ME-Sender: <xms:jG1QZowbpKTREZYhtXyiFioMRFRYEpX-SBlesWrsNDq3ifbKB5E_6w>
 <xme:jG1QZsSepZ-MQOaMM5-SExIA9EIzr8sfM_ORng6u6rpZLyH3gSQ1CS_GPnk43OpCr
 L94jN_tegGPYGa2iA>
X-ME-Received: <xmr:jG1QZqUJORL5_lgpxgGrNdD4pc7zEWzle1PugoHbmMY2Icy6NHLVQzpdiacKnvOLxgffGHvd7NOQtHg9YwhIjkO6dTMndKZ0ZQxawKrjD230TGdN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeeffffhudejkeefffffvefgffelleevgeeikedvtdehfeeigedvjeffjeeu
 keeggfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
 shhtrdgtohhm
X-ME-Proxy: <xmx:jG1QZmjF8j8HuM-7VOWwpQFvyDGjhYBA_v6B3Lvp0agtS79mnBbi4Q>
 <xmx:jG1QZqBB3b8CGYx2mKQh5gGwTsq5N30_PChE_paZKxYwNZPfm_809w>
 <xmx:jG1QZnJNkToPXqALEV8pxvAcjDDDOZTHwxPeMaWCwZ242xuaP5ZN-w>
 <xmx:jG1QZhD3Jy9GnpdD8R4RZodaEJu0awXgGmrztvzI9zHmMO1cSHCtvA>
 <xmx:jG1QZkxwXKyajpsdcLETsW3VKtvLQlxzTyMCd_DkQZM3f-IQdkaI4cs7>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 06:35:51 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
Date: Fri, 24 May 2024 22:33:13 +1200
Message-ID: <20240524103506.187277-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524103506.187277-1-ryan@testtoast.com>
References: <20240524103506.187277-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 May 2024 17:09:22 +0000
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

The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
OEM, used in a number of handheld gaming devices made by Anbernic.

Add a device tree binding for the panel.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../bindings/display/panel/wl-355608-a8.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml b/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
new file mode 100644
index 000000000..af12303e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/wl-355608-a8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WL-355608-A8 3.5" (640x480 pixels) 24-bit IPS LCD panel
+
+maintainers:
+  - Ryan Walklin <ryan@testtoast.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: wl-355608-a8
+
+  reg:
+    maxItems: 1
+
+  spi-3wire: true
+
+required:
+  - compatible
+  - reg
+  - port
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi_lcd: spi {
+        compatible = "spi-gpio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sck-gpios = <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
+        mosi-gpios = <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
+        cs-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
+        num-chipselects = <1>;
+
+        panel: panel@0 {
+            compatible = "wl_355608_a8";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+            backlight = <&backlight>;
+            power-supply = <&reg_lcd>;
+            pinctrl-0 = <&lcd0_rgb888_pins>;
+            pinctrl-names = "default";
+
+            port {
+            	panel_in_rgb: endpoint {
+                    remote-endpoint = <&tcon_lcd0_out_lcd>;
+                };
+            };
+        };
+    };
-- 
2.45.1

