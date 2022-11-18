Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5360162F01E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 09:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E7F10E1ED;
	Fri, 18 Nov 2022 08:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E720810E6F4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 08:00:12 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1668758410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TaI9aGA9XbCGiPwXu4jigiwF3LSQGb8o+rfJJko6kMs=;
 b=C5qMk0Z/tdBqe4+CkW4b1JwQQ4kYNy1NVI0tLGvQjptpxmy9WkL+wZoZICWWOyRfvC4k1L
 0gmqjSX3VDkXzgTlhWbrxoYCGgaHx8Ver7X3spDvlXDwU92rtolT1/4AQ9knILwz5n3sdQ
 a4QEYIdNMXDG01Ovew94QC7xNQyQI94=
From: richard.leitner@linux.dev
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: simple: add support for InnoLux
 G070ACE-L01
Date: Fri, 18 Nov 2022 08:58:55 +0100
Message-Id: <20221118075856.401373-1-richard.leitner@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 18 Nov 2022 08:52:43 +0000
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Richard Leitner <richard.leitner@skidata.com>

Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
string.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org

---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 18241f4051d2..fd3e5ad769dc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -174,6 +174,8 @@ properties:
       - innolux,at043tn24
         # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
       - innolux,at070tn92
+        # Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel
+      - innolux,g070ace-l01
         # Innolux G070Y2-L01 7" WVGA (800x480) TFT LCD panel
       - innolux,g070y2-l01
         # Innolux G070Y2-T02 7" WVGA (800x480) TFT LCD TTL panel
-- 
2.38.1

