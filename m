Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B9E2B1758
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913B06E483;
	Fri, 13 Nov 2020 08:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB5489836
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 08:37:12 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id u2so2417563pls.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 00:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaUoYSUdJvqs+oll9H2A29HKqXrBBwjsOfx6mYBumWY=;
 b=ZIy2GJjcCFwfpMy4062YJvaK8zi7aYisftRctVk23KTPa3ygyvwW66WOCvtqPsaigT
 hEdxxfH4ogvdpV784/xVKofdQEIdDBvODGryVZX2nUzd6D+Ib3vP9ENoKqsxhg9PGFcd
 9fDP3/og/lYko6eh0JgM/HAm6rSMSGFIbu+eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaUoYSUdJvqs+oll9H2A29HKqXrBBwjsOfx6mYBumWY=;
 b=e+2zze5xGADLdigmqDs3rjBNwzVD2ZRq9cFV9ZygKEb3+d81twjcYEy27QJJnSTQTl
 wpq6aOWA5myAX7BLYd8h0JGJBIqIPMgxdH6cHZOsn3bPIj56BxtCufl2ylq2q7JBiXN6
 D+sdDwBW8bmfnjOMTz0qGjIunAxPYABLM99SahG5Gnx9NDozJv1LSTKvFGUvXTQqgplf
 3L2rvp9Dx++ISU33BW6G4+8dYU2HZ09Na9qot41bKn2Qqrf2Zl81SUROkh/LQ4VateDb
 2arh2moOy6vka3YlW0RYvNQEv97IYUSHr2jQiPaGU899hc97YrmLrtUiEBx4G9PJd1LR
 s7wQ==
X-Gm-Message-State: AOAM532vg55lhfz7WkX+s78UAjeDxFBCkjJiVe9lRwsZALv0hIY4qgOW
 6o9dpw5UPf6mHaVsGFUU3e1aJg==
X-Google-Smtp-Source: ABdhPJy7XEDWu/EeS5RAKL2jFwMrhKq4BgMz3vXq/F1wjzEjdEFSG4EeubSX7/hJRR+IOJD+bpF1bg==
X-Received: by 2002:a17:902:7c14:b029:d4:d894:7eed with SMTP id
 x20-20020a1709027c14b02900d4d8947eedmr22255515pll.81.1605170232380; 
 Thu, 12 Nov 2020 00:37:12 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id a8sm4328404pfa.132.2020.11.12.00.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 00:37:11 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add power supplies
Date: Thu, 12 Nov 2020 16:37:03 +0800
Message-Id: <20201112083704.1173908-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

anx7625 requires 3 power supply regulators.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../display/bridge/analogix,anx7625.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 60585a4fc22b..1aa08f10d894 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -34,6 +34,18 @@ properties:
     description: used for reset chip control, RESET_N pin B7.
     maxItems: 1
 
+  vdd10-supply:
+    description: Regulator that provides the supply 1.0V power.
+    maxItems: 1
+
+  vdd18-supply:
+    description: Regulator that provides the supply 1.8V power.
+    maxItems: 1
+
+  vdd33-supply:
+    description: Regulator that provides the supply 3.3V power.
+    maxItems: 1
+
   ports:
     type: object
 
@@ -55,6 +67,9 @@ properties:
 required:
   - compatible
   - reg
+  - vdd10-supply
+  - vdd18-supply
+  - vdd33-supply
   - ports
 
 additionalProperties: false
@@ -72,6 +87,9 @@ examples:
             reg = <0x58>;
             enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
 
             ports {
                 #address-cells = <1>;
-- 
2.29.2.222.g5d2a92d10f8-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
