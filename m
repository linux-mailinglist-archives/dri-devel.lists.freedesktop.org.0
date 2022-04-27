Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FE0512D1A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A384B10E6AE;
	Thu, 28 Apr 2022 07:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 565 seconds by postgrey-1.36 at gabe;
 Wed, 27 Apr 2022 14:02:57 UTC
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2493610F36C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:02:57 +0000 (UTC)
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7BDED83E49
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651067608;
 bh=lRN//q0RUoYn1Nk0c/CSAhY6Ns1dN94oveT7N6gNYOc=;
 h=From:To:Cc:Subject:Date:From;
 b=DnvuUoY0oI0q2t+QWy0FlWO3JDwYtdEqwlgoPL8WEExuiewFV0x60ZD8rX2IkEEfF
 9p3UB8md4rJI+6yb3+HBcVen99oEmbTRJUOBtUiN1B4T6327QZKHgkMakA1HkFEQMa
 VFmzEEVI4cB2mr42nfWdWDnwIvFTjD3Th7HbynFPL7Meofi/tWVYrWPwIHRO76qMXJ
 +NIbX8jF16pHSWxmgfs/LyQaHoNQzFZ3ADR7Kj9LgpGQMvFyEefCi+RK1JPxnDr0Wo
 B6gRYRedBVZt0YtJjPLlyqydwtcMY/eXnM/oH0P/YtEtsvQzlCgw6258M2v+MFwF2P
 GxacDFEANvIpA==
Received: by janitor.denx.de (Postfix, from userid 108)
 id 344D8A01E1; Wed, 27 Apr 2022 15:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on janitor.denx.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from xpert.denx.de (xpert.denx.de [192.168.0.4])
 by janitor.denx.de (Postfix) with ESMTPS id 73C3FA00A4;
 Wed, 27 Apr 2022 15:53:17 +0200 (CEST)
Received: by xpert.denx.de (Postfix, from userid 535)
 id EC9F83E0398; Wed, 27 Apr 2022 15:53:16 +0200 (CEST)
From: Philip Oberfichtner <pro@denx.de>
To: 
Subject: [PATCH v3 1/4] dt-bindings: display: simple: Add DataImage
 FG1001L0DSSWMG01 compatible string
Date: Wed, 27 Apr 2022 15:52:27 +0200
Message-Id: <20220427135229.2339865-1-pro@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 28 Apr 2022 07:36:56 +0000
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
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DataImage FG1001L0DSSWMG01 10.1" 1280x800 TFT LCD panel compatible
string.

Signed-off-by: Philip Oberfichtner <pro@denx.de>

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

