Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB15911BA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C088B4368;
	Fri, 12 Aug 2022 13:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Fri, 12 Aug 2022 11:55:18 UTC
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6453BAE6BD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 11:55:18 +0000 (UTC)
Received: from mail.dh-electronics.com (unknown [77.24.89.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx2.securetransport.de (Postfix) with ESMTPSA id 34FAA5E911;
 Fri, 12 Aug 2022 13:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1660304805;
 bh=fbnAMyRh8wvq7TCAWCxHV4tQFskBMN3RaYIZybVxiro=;
 h=From:To:CC:Subject:Date:From;
 b=NuZn/hVYq3p9DIKyzN44PxfIfJWbKbaXYfGUmNAMruy5XCtx2G9BsROZhPavyYMC7
 Q6Mx30c2qWFgonmvriBqXRzYh12HQetz5Y4YSJELaZK+sTAdJ3tWnC72OW6ZylQ3wv
 IbZ//YeOwBKNKQlk4WuN+EW9wtnwfgHt3vfNw5lCfHTLSAbhZ2fv+LYdM6a0K4Azoi
 j+sq0PNEffEVpvsPbu4blYfNCi49TvxLyt9WFYNOkQ2+i/Q6j/Fue3FzG/Qh1yun69
 Rrh6vxll3MqBf1QD596dUDQmYJz1AiMdSJbBjQKjLzH6QnCwaRhwdoeQDOzbG1ddFJ
 WAWOi7KuG9GKg==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 12 Aug 2022 13:46:39 +0200
Received: from Stretch-CN.dh-electronics.org (10.64.6.116) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12 via Frontend Transport; Fri, 12 Aug 2022 13:46:38 +0200
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dt-bindings: display: simple: Add Multi-Inno Technology
 MI0800FT-9 panel
Date: Fri, 12 Aug 2022 13:46:00 +0200
Message-ID: <20220812114600.4895-1-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 12 Aug 2022 13:52:21 +0000
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Multi-Inno Technology MI0800FT-9 8" 800x600 DPI panel
compatible string.

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index bc8e9c0c1dc3..5d9d7683efea 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -234,6 +234,8 @@ properties:
       - mitsubishi,aa070mc01-ca1
         # Multi-Inno Technology Co.,Ltd MI0700S4T-6 7" 800x480 TFT Resistive Touch Module
       - multi-inno,mi0700s4t-6
+        # Multi-Inno Technology Co.,Ltd MI0800FT-9 8" 800x600 TFT Resistive Touch Module
+      - multi-inno,mi0800ft-9
         # Multi-Inno Technology Co.,Ltd MI1010AIT-1CP 10.1" 1280x800 LVDS IPS Cap Touch Mod.
       - multi-inno,mi1010ait-1cp
         # NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
-- 
2.11.0

