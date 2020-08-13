Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 894DB24321A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 03:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8B46E34E;
	Thu, 13 Aug 2020 01:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188E86E2F8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 01:29:36 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21530F89;
 Thu, 13 Aug 2020 03:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597282173;
 bh=ZlzB1T9U9Heew1KU4fD4Cj6zVn59h8amfbtV76Mcljk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rFHpWyV7koZg2kc4nVVlgb94pA3p21JnHHSM4ZTAVD5agsGCn62xVCF8xei3XnX5m
 9XSp+6AIMQS6hk5s42uvbn8BtKQ92REm9oixp9FFynjQ5JT7kO7JpNRerjhQ3kB7iY
 mFANfWyoCw0vaP7k+hYwvJ0Jz/Mz5YzKd4dopL2k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] dt-bindings: display: mxsfb: Rename to fsl,lcdif.yaml
Date: Thu, 13 Aug 2020 04:29:06 +0300
Message-Id: <20200813012910.13576-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the mxsfb.yaml binding schema to fsl,lcdif.yaml to match the
usual bindings naming scheme.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/{mxsfb.yaml => fsl,lcdif.yaml}  | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/display/{mxsfb.yaml => fsl,lcdif.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/display/mxsfb.yaml
rename to Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index d15bb8edc29f..60210775c31e 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mxsfb.yaml#
+$id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale/NXP i.MX LCD Interface (LCDIF)
diff --git a/MAINTAINERS b/MAINTAINERS
index e3fac23383d2..fe1bda639a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11757,7 +11757,7 @@ M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/mxsfb.yaml
+F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 F:	drivers/gpu/drm/mxsfb/
 
 MYLEX DAC960 PCI RAID Controller
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
