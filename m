Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DEB4F66F8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 19:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571DD10E125;
	Wed,  6 Apr 2022 17:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764B310E0A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 17:30:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C733F6197E;
 Wed,  6 Apr 2022 17:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B09C385A5;
 Wed,  6 Apr 2022 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649266214;
 bh=oonR2xgCOkK+2ZsJXKQdEiC5WZelRESZAkoTfAw8t7E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GmdCAI1PEXG/SQMmze443jy4k7raOrxY7mJu/mbfL29JTMs50hFJYyDQEZIXIFS6U
 6sIt9Gyo4XfjAEvTOCVYI2gpS88mTOwYESjW/FCz0EETOzglUdsDI/KHVwyd6/Ozfv
 cJXLy+/BtoY6/bMusBJ2tgSVE0SE57A2bTAyWge2Tnc4AZPCxoMdboLTbXic/+75zx
 JC4gWgIQknHrk7LLGTOyEhafG8bLwHPqZmHlIPOFSVkl7apatB4e9/Tmx/80VZzLaT
 U8yKUPY8ThKVhJzACG6taKj8KWR/vfJlYFsVHP9C7TmSNcTEDN5Onpp3JfQ8vg0L7c
 6uXazcIawcA6g==
Received: by wens.tw (Postfix, from userid 1000)
 id 527CF5FD20; Thu,  7 Apr 2022 01:30:11 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/4] dt-bindings: display: ssd1307fb: Add entry for SINO
 WEALTH SH1106
Date: Thu,  7 Apr 2022 01:29:54 +0800
Message-Id: <20220406172956.3953-3-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406172956.3953-1-wens@kernel.org>
References: <20220406172956.3953-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

The SINO WEALTH SH1106 is an OLED display driver that is somewhat
compatible with the SSD1306. It supports a slightly wider display,
at 132 instead of 128 pixels. The basic commands are the same, but
the SH1106 doesn't support the horizontal or vertical address modes.

Add a compatible string for it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../bindings/display/solomon,ssd1307fb.yaml         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 9baafd0c42dd..ade61d502edd 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -13,6 +13,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - sinowealth,sh1106-i2c
       - solomon,ssd1305fb-i2c
       - solomon,ssd1306fb-i2c
       - solomon,ssd1307fb-i2c
@@ -131,6 +132,18 @@ required:
   - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sinowealth,sh1106-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 1
+        solomon,dclk-frq:
+          default: 5
+
   - if:
       properties:
         compatible:
-- 
2.34.1

