Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF706E8B1B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3716E10EBB6;
	Thu, 20 Apr 2023 07:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D6D10E785
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:23:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5068e99960fso2657577a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681820612; x=1684412612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iXVc+fdjGw5n3d4wXWcs0LTiyGYElMYbnZP6JeDG1/U=;
 b=LP8/9050RJyBGN/wcpBviKkyE0HtsIJSnbwov2y2czsPCNQ5xB9UKDcvG6zcneydVf
 NkcjOP20dHA2j0yccUoGkrH7kaob6YipaeoGZICKjjxkvABWXD/Ud0osFWbsMz/C0dAz
 v5QK87noZHBsI3yB/i2RviKdf0zz7u49BVS92AnMoxtdaAlVt7PfJ+jBotOgEOXlnOeF
 JERPDAxY2++J71YV67Xb9aCGjecnYuc21LwKpvIH3GFlamoMIS+0StCuV3JwjTF524XJ
 nsgZXSvKTjTQDwfhErs5jepDHSqDiBo9lP+SXP631ZighoBTSPSbQReguTaLs4mBY1NZ
 tDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820612; x=1684412612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXVc+fdjGw5n3d4wXWcs0LTiyGYElMYbnZP6JeDG1/U=;
 b=gX+m4WkuGjdQljr41dH6je/ZFkz5FN7bI/yHeg7ug73FpPoJVwJPvAK7vNFDA1vkOZ
 HcS+9Ei0nDgfRYVurPLOulFA7f2ZW7c4rr+SmYvSK1IfUDTERe532wKIXRJRNxm13uEY
 dQstQrbJldcfKIYjUycNhFmCp48ZEPxh2noPmFeDL/oICcwTpW+QVfr/kUwnRi1Aj2qQ
 M/8MVPDrNGG2kUcLnW3qr7Ezw0EUlOQnw1K1/6W3X+nnLnwTkxa0vljvDceZFztj+qXn
 W6mzJ5mIhz642VJCGDtYvlDne+2LYyOFSUeNzCTtiWbUSa/PDV8PUyHbwpSyhR+A2etY
 8ZhQ==
X-Gm-Message-State: AAQBX9frhIFrIHcBK+oSNj3MDhBV5DixHO8FR7eltb6AtmZEUkAhTfxx
 cMteTqSq+Cs/6rNz/0OZXjI3FfP+Ckxfvg==
X-Google-Smtp-Source: AKy350bm2NQRP5sZ0iEvHdqNJMdnb57vYrkYLHvReL3Fu/D48luqKuF8Zmnzw3lP0yfGO0uecedaFQ==
X-Received: by 2002:aa7:d799:0:b0:505:4f7:8a50 with SMTP id
 s25-20020aa7d799000000b0050504f78a50mr2142533edq.5.1681820611996; 
 Tue, 18 Apr 2023 05:23:31 -0700 (PDT)
Received: from localhost.localdomain ([154.72.160.133])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a50cd8f000000b00506addaaab0sm2221252edi.32.2023.04.18.05.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:23:31 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] dt-bindings: display: bridge: icn6211: Add video-mode
 property
Date: Tue, 18 Apr 2023 13:22:05 +0100
Message-Id: <20230418122205.16632-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230418122205.16632-1-fusibrandon13@gmail.com>
References: <20230418122205.16632-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: marex@denx.de, Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 robert.foss@linaro.org, jagan@amarulasolutions.com, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the 'video-mode' property for specifying the DSI video mode and update
the example.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 .../bindings/display/bridge/chipone,icn6211.yaml   | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
index 5fb54375a..1f9335496 100644
--- a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
@@ -36,6 +36,16 @@ properties:
   enable-gpios:
     description: Bridge EN pin, chip is reset when EN is low.
 
+  video-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2 ]
+    description:
+      DSI video mode.
+      0 - burst mode
+      1 - non-burst mode with sync pulse
+      2 - non-burst mode with sync event.
+      Defaults to 2.
+
   vdd1-supply:
     description: A 1.8V/2.5V/3.3V supply that power the MIPI RX.
 
@@ -97,7 +107,8 @@ examples:
       bridge@0 {
         compatible = "chipone,icn6211";
         reg = <0>;
-        enable-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
+        enable-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>;
+        video-mode = <0>;
 
         ports {
           #address-cells = <1>;
@@ -107,6 +118,7 @@ examples:
             reg = <0>;
 
             bridge_in_dsi: endpoint {
+              data-lanes = <1 2 3 4>;
               remote-endpoint = <&dsi_out_bridge>;
             };
           };
-- 
2.30.2

