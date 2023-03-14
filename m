Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E526B9194
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F9F10E77B;
	Tue, 14 Mar 2023 11:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D896310E77B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:26:32 +0000 (UTC)
Received: from fabio-Precision-3551.. (unknown
 [IPv6:2804:14c:485:4b69:d086:7d15:2ce3:1a1b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 64D8F85B17;
 Tue, 14 Mar 2023 12:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1678792656;
 bh=ef9/+7LCdE2/mEAxSGXL9tBEYCf12iQaIsndD1dicjI=;
 h=From:To:Cc:Subject:Date:From;
 b=LbcmUStRAERbIOQZyqU8ERdrjFYfuS9hGZh4rg6s47BdmeNAG3pu6OU/+G95eqdr+
 j+m3CH9X/+J+YF/ydT9Qq1HduYyTaNF+JlKSAH8S4dDEI7YGyGGbpGWL84TLmcK5Ek
 Y3IxHN3f4ZqYKQHieYuvkbEjgDmXJfQkCIzkH1CpNRam9AO6aDgzgfwtQsLdwVV6aj
 CuRpryME+41hFMhIxah0KHOPBqXdOD6ng6dVshFQffXIpKekP4/qdcwI3KSrY3bUHb
 wZagFXUHVpMnW1u9RhgyRk2gxLXq7Hm2KiPa9QaITl43yE9hz0penlPUVKjpPIcSi0
 htKQwd3bCdwrQ==
From: Fabio Estevam <festevam@denx.de>
To: neil.armstrong@linaro.org
Subject: [PATCH 1/2] dt-bindings: display: seiko,
 43wvf1g: Add the 'enable-gpios' property
Date: Tue, 14 Mar 2023 08:17:23 -0300
Message-Id: <20230314111724.1520178-1-festevam@denx.de>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, CPHEALY@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an optional 'enable-gpios' property that can be used to turn on/off
the display.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/panel/seiko,43wvf1g.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
index cfaa50cf5f5d..496a39561db0 100644
--- a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
+++ b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
@@ -25,6 +25,8 @@ properties:
   avdd-supply:
     description: 5v analog regulator
 
+  enable-gpios: true
+
 required:
   - compatible
   - dvdd-supply
-- 
2.34.1

