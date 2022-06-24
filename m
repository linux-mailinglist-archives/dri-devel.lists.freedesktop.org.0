Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B668C559FC9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE6510E152;
	Fri, 24 Jun 2022 18:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1026810E152
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 18:02:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BB74F84392;
 Fri, 24 Jun 2022 20:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656093737;
 bh=a0SH7CdRY8dR6Oq44gTp/XXWFp7PBdy3nFPdMbb5raU=;
 h=From:To:Cc:Subject:Date:From;
 b=jRXoi4b7et3SJ95Mu37JW3SEOJqkCH99G8k+ofYWG/eL1DJQzajBt/lqocwK/cT+q
 vflYXZxM8utj3OvZXJMRiTYXNtA+MBqNAwNTmC+vfZR11DJrW+oJpv6+4BjSGRR+zA
 w94jkz++AyQP9GjrzmOVl39IU+br8o8HRdU4VsnNwXhMpjGrsCN54hXc+bA8tok9FY
 jyE5vjCurG4YfNzQ9+udQ7Z6zXBVaQjKWACEih07cjsoPkbN138QPBoXtrv2ImTGcp
 0u1e/b1rKt7GpeN+NuyUuGmm7vGxf/PM7dO+OpMcXXd77q7Ws+MLNvVrByRCes/nEy
 MGzsBFf7yckGA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/2] dt-bindings: lcdif: Add compatible for i.MX8MP
Date: Fri, 24 Jun 2022 20:02:00 +0200
Message-Id: <20220624180201.150417-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 devicetree@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
and is completely different from the LCDIFv3 found in i.MX23 in that it
has a completely scrambled register layout compared to all previous LCDIF
variants. The new LCDIFv3 also supports 36bit address space. However,
except for the complete bit reshuffling, this is still LCDIF and it still
works like one.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: devicetree@vger.kernel.org
---
V2: No change
V3: No change
V4: No change
V5: Add AB from Rob
V6: No change
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 900a56cae80e6..876015a44a1e6 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -20,6 +20,7 @@ properties:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
           - fsl,imx6sx-lcdif
+          - fsl,imx8mp-lcdif
       - items:
           - enum:
               - fsl,imx6sl-lcdif
-- 
2.35.1

