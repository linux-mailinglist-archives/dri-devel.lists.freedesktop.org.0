Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD478D39C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D06210E4C1;
	Wed, 30 Aug 2023 07:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB6410E264
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 09:58:47 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4RZ5Pl4f7Lz9spy;
 Mon, 28 Aug 2023 11:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1693216187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CcdTn8UfAzM6slmsMgUhSxZcDnljzHovdfdn5UI8RBc=;
 b=PTUJNuELlPaeN8cSeuFfbUYhCLTZfBoJh+/EjxEUsdGMDLogysje1SCW1+7m4e49jaGBqd
 bQlfgAXUj+kbiVnEOycfCKoRTJeI7dcnu11XfKV7pbjJ/PADWuuy4Kie0tBl8rmpbKslvA
 NhahMutwHnvrGxEvoxRZQSRHqEcQmdtJQNawDUWvevVYSs+tABZfyEU7VJnTgKU3D5141k
 pir6ImIyoDsWSYKienWPgcaZZYmBqdMVeP+UuQgRNgJKhM4LV0QUSEUdrhvUOZkzP0PXjn
 aFZ2TV+385AD8534o+NuL6jeNTTDpyzL/7td51J8AFMEOQGmHhAzQfU5ED12Tw==
From: Elmar Albert <eal.git@mailbox.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display/panel: Add AUO G156HAN04.0 LVDS
 display
Date: Mon, 28 Aug 2023 11:49:42 +0200
Message-Id: <20230828094943.123676-1-eal.git@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7rgzgawhybhdfeyba56zuegtq5yy7img
X-MBO-RS-ID: 5833fdb31cba27b5bb8
X-Mailman-Approved-At: Wed, 30 Aug 2023 07:32:27 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Elmar Albert <ealbert@data-modul.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Elmar Albert <ealbert@data-modul.com>

Document support for the AUO G156HAN04.0 LVDS display.

G156HAN04.0 is a Color Active Matrix Liquid Crystal Display composed of
a TFT LCD panel, a driver circuit, and LED backlight system. The screen
format is intended to supportthe 16:9 FHD, 1920(H) x 1080(V) screen
and 16.7M colors (RGB 8-bits ) with LED backlight driving circuit.
All input signals are LVDS interface compatible.

G156HAN04.0 is designed for a display unit of notebook style
personal computer and industrial machine.

Signed-off-by: Elmar Albert <ealbert@data-modul.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 25b4589d4a58..cea702de664b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -67,6 +67,8 @@ properties:
       - auo,g121ean01
         # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
       - auo,g133han01
+        # AU Optronics Corporation 15.6" FHD (1920x1080) TFT LCD panel
+      - auo,g156han04
         # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
       - auo,g156xtn01
         # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
-- 
2.34.1

