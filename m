Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22F2F74B5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E0A6E1B2;
	Fri, 15 Jan 2021 08:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6196E15D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 07:03:01 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id q20so4913046pfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 23:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rU651G1q8SPGxvy1RlE5EGkWyPFzSWihmuiOJwz0Sb0=;
 b=UiPe/K8OEIfEc+DaQYUt/imBoVx48hzIE4EuvFN5bSYro7pRpKZ/V+ScLTWxzaG9Dp
 QGOkdL4tbMdnjHEr5/+fQOv0zQlbMzudRg3ByfTIFLTqZVwHdFUpZFz5pOoHo9BfQ2L4
 PdlnbVHqBY8mtTqp7AMHnzwYmjtGZQVf/N/C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rU651G1q8SPGxvy1RlE5EGkWyPFzSWihmuiOJwz0Sb0=;
 b=ELMC+fGa+11nGmM7v1tr187QprXxKIIBDOQt81yh/PiYM53xc6mGbXeLF274hx1q46
 05fXe7PD/ofVHPf1pWIXRrvY2S93eL9Wp7wZdoIOUB+sMg3gvb2K/9GteSiyG3cf1MGq
 acHT5SfFG377NA0q/OKYcFD2BfRu6B7oZL3AWzhSBfMTwSY3VzvajU8gh2D5TAInhMHp
 NR6eaKplKNibyujAjuh3NRJGwsL2orzWwRFOPR2AF4O4tQjh6ive8GXq7k20/Nuh9PHH
 ajrvVMc8+SN7x3tIbNP4ZL/0n9rf3sKwCbyN1lhTHWQsDGs2LxbMCULA7QE80vLjnZGR
 7qGg==
X-Gm-Message-State: AOAM530y64CtolWBosPFho3cHSo0V4Qy3a1OmJuqd6umXDv+NG3ASTq+
 MSmK77DDW2VEA8sHU3P649aM1Q==
X-Google-Smtp-Source: ABdhPJwwnHBqKTxgk9dBqJY8K268Shf+AZRV+hcUdg8NVF2FkJLIhWDbWyQZX6vKfEEIWEih66QInQ==
X-Received: by 2002:a63:5642:: with SMTP id g2mr11276841pgm.434.1610694181339; 
 Thu, 14 Jan 2021 23:03:01 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id x12sm7101064pfj.25.2021.01.14.23.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 23:03:00 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Xin Ji <xji@analogixsemi.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v3 1/2] dt-bindings: drm/bridge: anx7625: Add power supplies
Date: Fri, 15 Jan 2021 15:02:50 +0800
Message-Id: <20210115070250.2271571-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625 requires 3 power supply regulators.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4fc22b..3ae97d9523e5 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,15 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  vdd10-supply:
+    description: Regulator that provides the supply 1.0V power.
+
+  vdd18-supply:
+    description: Regulator that provides the supply 1.8V power.
+
+  vdd33-supply:
+    description: Regulator that provides the supply 3.3V power.
+
   ports:
     type: object
 
@@ -55,6 +64,9 @@ properties:
 required:
   - compatible
   - reg
+  - vdd10-supply
+  - vdd18-supply
+  - vdd33-supply
   - ports
 
 additionalProperties: false
@@ -72,6 +84,9 @@ examples:
             reg = <0x58>;
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
 
             ports {
                 #address-cells = <1>;
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
