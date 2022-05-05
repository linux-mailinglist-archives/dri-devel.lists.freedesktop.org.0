Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3451D58A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A5410FD0B;
	Fri,  6 May 2022 10:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F47F10F607
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 09:58:17 +0000 (UTC)
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 263D983EF3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 11:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651744696;
 bh=yXye+GgNkW8KmlgmC12gA+GGa2bu/xCUhSLnb8ilQqU=;
 h=From:To:Cc:Subject:Date:From;
 b=hETeX/PLZYuIWmmb5rH331UTXtQrQoVp7dkEK50dS2UlW68q6PVyvHw2C8AC+d7+w
 a/0vmf8Pqj2AYgqu7G27+YMA583iaOymWfMD6SpnXCxS5Eu6fma+RVcKBH01dhLGW1
 YPanuy2Xj4TgKNljM8tKAX28AfkkTIJ4297O8ZUOKsphSQ+ru8OzCDKv4GbWQ7ZTco
 bcsVZukk7iEcnofErwK6JKaEtd8YiAhn1qDRhgNBGmnKlY/zTUmQS+E1qCClhD74du
 PZXynoCtSo/piUGgGcmJEed6D3ALy7NvVN8Dl5Eu7iPufs/gFsdW+TTa/YArWTe7eu
 b20n2R9zAz46w==
Received: by janitor.denx.de (Postfix, from userid 108)
 id 3ADF4A0058; Thu,  5 May 2022 11:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on janitor.denx.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from xpert.denx.de (xpert.denx.de [192.168.0.4])
 by janitor.denx.de (Postfix) with ESMTPS id BC565A003A;
 Thu,  5 May 2022 11:58:04 +0200 (CEST)
Received: by xpert.denx.de (Postfix, from userid 535)
 id 87AB93E07D7; Thu,  5 May 2022 11:58:04 +0200 (CEST)
From: Philip Oberfichtner <pro@denx.de>
To: 
Subject: [PATCH v4 1/4] dt-bindings: display: simple: Add DataImage
 FG1001L0DSSWMG01 compatible string
Date: Thu,  5 May 2022 11:57:24 +0200
Message-Id: <20220505095725.902447-1-pro@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Fri, 06 May 2022 10:19:04 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 matthias.winker@de.bosch.com, Philip Oberfichtner <pro@denx.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DataImage FG1001L0DSSWMG01 10.1" 1280x800 TFT LCD panel compatible
string.

Signed-off-by: Philip Oberfichtner <pro@denx.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: matthias.winker@de.bosch.com

---

Changes in v4: Acked-by Krzysztof
Changes in v3: new
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..a6db3eff3b1a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -105,6 +105,8 @@ properties:
       - chunghwa,claa101wb01
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wb03
+        # DataImage, Inc. 10.1" WXGA (1280×800) TFT LCD panel
+      - dataimage,fg1001l0dsswmg01
         # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
       - dataimage,scf0700c48ggu18
         # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
-- 
2.34.1

