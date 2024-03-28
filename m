Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6ED88FCFA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1D11123BF;
	Thu, 28 Mar 2024 10:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="QwJDo/6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268891123B0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:28:00 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 09AC488125;
 Thu, 28 Mar 2024 11:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1711621677;
 bh=XTqSQFcCxiyIb0b9KpW5vjiLA/F/iTpaiUM8cy2VNNo=;
 h=From:To:Cc:Subject:Date:From;
 b=QwJDo/6kl5MfFwdzTIxolnOEVYZ6eWSbXxc+XwKmEktZf0H8xjy+AJw+h8vxN1p4v
 KATPRpqiOTQO1HoY+5O5/sQOgsGlPmRKp4dL4RZoQmyjc2yBKsFq498hunJzzdok0X
 JK34PGIqSJghO5Er/S4rgDSyZGdmkf51N2VJYjQasZGqFADNKLui8YRwZY+fYHhrG5
 FovHn57au41Fe5JJzpMBFfPAKdDR0WWmLR+jAvREi02Y4Y4HT11ds+4tZlQX8XpYs8
 pHGb0tHEtzW140h881U6mZHtXsU6W7f4VTe2t6mSUnQYheENFpllz9BE70WAdA0E5l
 bdseRrqeW2IGg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: simple: Document support for
 Innolux G121XCE-L01
Date: Thu, 28 Mar 2024 11:27:35 +0100
Message-ID: <20240328102746.17868-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

Document support for Innolux CheMei 12" G121XCE-L01 XGA LVDS display.

G121XCE-L01 is a Color Active Matrix Liquid Crystal Display composed of
a TFT LCD panel, a driver circuit, and LED backlight system. The screen
format is intended to support the 4:3, 1024(H) x 768(V) screen and either
262k/16.7M colors (RGB 6-bits or 8-bits) with LED backlight driver circuit.
All input signals are LVDS interface compatible.

Documentation [1] and [2] indicate that G121X1-L03 and G121XCE-L01 are
effectively identical panels, use the former as RGB 6-bits variant and
document the later as RGB 8-bits variant.

[1] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G121X1-L03_Datasheet.pdf
[2] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G121XCE-L01_Datasheet.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index e0f6aa9a025c4..931d98836e121 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -190,6 +190,8 @@ properties:
       - innolux,g121i1-l01
         # Innolux Corporation 12.1" G121X1-L03 XGA (1024x768) TFT LCD panel
       - innolux,g121x1-l03
+        # Innolux Corporation 12.1" G121XCE-L01 XGA (1024x768) TFT LCD panel
+      - innolux,g121xce-l01
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
       - innolux,n116bca-ea1
         # Innolux Corporation 11.6" WXGA (1366x768) TFT LCD panel
-- 
2.43.0

