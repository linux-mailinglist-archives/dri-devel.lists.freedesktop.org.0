Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC335578CF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFE010E4F3;
	Thu, 23 Jun 2022 11:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 529 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jun 2022 11:32:58 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB7B10F0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:32:58 +0000 (UTC)
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0C50184334
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 13:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655983445;
 bh=3o4Grvbqdsg3HB2LYvNqzR5lHAEkLUwsW4H/pOMCxAQ=;
 h=From:To:Cc:Subject:Date:From;
 b=xg2fVJ65X9bCn0ZcQSPPZEcdxKoBsm1fo1Bp9gq4TGfHJv0LxJW8Qzb6QRVvt7yHe
 AJSgQRfufrK0AlRUrOrpB7Ak2Nkps/dUJDp2FTd0NxLcbL6EYzWHa5N033kNCQIFIN
 kHD2ZJB2RD+6hCEMicxGqHsM3d/g3bPvO9dds4beT0g8jOXCCSDwoziDYd3M6FuIAt
 JbNrE3t7KkAzhCGoECpRs7U0tQcDqgF/VbanI0xB6+m2uEISvSTf+vta3N3htotmz1
 mrJc5MgJ8MLoS6WyvL7s4fCqY3MDuZkarz3nPSKpm6sHyYQHIucLVtwvFK4CBbB97U
 oLr+Yho6/EZlQ==
Received: by janitor.denx.de (Postfix, from userid 108)
 id CD439A0387; Thu, 23 Jun 2022 13:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on janitor.denx.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from xpert.denx.de (xpert.denx.de [192.168.0.4])
 by janitor.denx.de (Postfix) with ESMTPS id 3F7E9A0050;
 Thu, 23 Jun 2022 13:23:54 +0200 (CEST)
Received: by xpert.denx.de (Postfix, from userid 535)
 id C47A73E06AF; Thu, 23 Jun 2022 13:23:53 +0200 (CEST)
From: Philip Oberfichtner <pro@denx.de>
To: 
Subject: [RESEND v5 1/2] dt-bindings: display: simple: Add DataImage
 FG1001L0DSSWMG01 compatible string
Date: Thu, 23 Jun 2022 13:22:56 +0200
Message-Id: <20220623112257.4178461-1-pro@denx.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 23 Jun 2022 11:35:37 +0000
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

Changes in v5: none
Changes in v4: Acked-by Krzysztof
Changes in v3: new
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 21ba90c9fe33..217ee448a51b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -107,6 +107,8 @@ properties:
       - chunghwa,claa101wb03
         # DataImage, Inc. 4.3" WQVGA (480x272) TFT LCD panel with 24-bit parallel interface.
       - dataimage,fg040346dsswbg04
+        # DataImage, Inc. 10.1" WXGA (1280×800) TFT LCD panel
+      - dataimage,fg1001l0dsswmg01
         # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
       - dataimage,scf0700c48ggu18
         # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
-- 
2.35.3

