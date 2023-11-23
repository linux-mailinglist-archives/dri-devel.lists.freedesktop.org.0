Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED27F5C3C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 11:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654C10E715;
	Thu, 23 Nov 2023 10:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826EA10E715
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 10:24:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 17603B82ADB;
 Thu, 23 Nov 2023 10:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C94AC433C8;
 Thu, 23 Nov 2023 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700735062;
 bh=Pcax73EaGd+1XlewYRlZvBtaVgqAdBc/HhyX2fk61bs=;
 h=From:To:Cc:Subject:Date:From;
 b=mQoxao9KDEU2xlG69GtUB5FQ27rfjbeUSZiXlTH+vc8xRvawtsZV5F2y2NpvTq58Z
 jAHtd2DJVpL+9W9AjqOIpGr/XAKJQ6hglnuCmMZukCdA4LAXQx7ERuukpyo+WIOdmf
 E5+2UFFbzA+WYEDI0d9HmmNmWK3sTwwLCsL1+HBy9bsNcDYxPa0N2YNG5XnAZOLC+g
 wka8i4rETXrJ6RzBYuRhpSUEAig9wQR5UQRRO+8arj3SPDIedc3gamNg2KS7fXRm2+
 /mdPowISrR6pGlfXKbVmZNCzsCR31krIB586njosrmg2Kp2Q2Q/FMoQuDYrKTr6vaT
 beeDTn45k1lkQ==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: simple: add Evervision VGG644804
 panel
Date: Thu, 23 Nov 2023 11:24:03 +0100
Message-Id: <20231123102404.2022201-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Evervision VGG644804 5.7" 640x480 LVDS panel compatible string.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3ec9ee95045f..2471c99a0c96 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -144,6 +144,8 @@ properties:
       - edt,etmv570g2dhu
         # E Ink VB3300-KCA
       - eink,vb3300-kca
+        # Evervision Electronics Co. Ltd. VGG644804 5.7" VGA TFT LCD Panel
+      - evervision,vgg644804
         # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
       - evervision,vgg804821
         # Foxlink Group 5" WVGA TFT LCD panel
-- 
2.39.2

