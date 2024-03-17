Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274D87DE2C
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 16:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C6B10EE5C;
	Sun, 17 Mar 2024 15:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e5s9aQm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E5610EE5C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 15:57:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44B11FF1;
 Sun, 17 Mar 2024 16:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710691044;
 bh=jqkasTgZB6padVpRfMWcFIhzP0VCrABsnxxJ6KVL2fU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e5s9aQm3QHe7a8vL07hhhDvSFq7ZdlMAz3gZClBSqAX1CQZxfrjTcnnbR7/z52t0D
 ISiiQA3M8qTkyR63Sgkl2XpyPu5+no6n89eEsAiD/fl94FwnkTYQ6sguNi3FTQ4grt
 GQxKQpKLVD698LpUaXxgiWEmIZeyaRsS7hPNi9kg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: ili9881c: Add Startek KD050HDFIA020-C020A
 support
Date: Sun, 17 Mar 2024 17:57:45 +0200
Message-ID: <20240317155746.23034-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240317155746.23034-1-laurent.pinchart@ideasonboard.com>
References: <20240317155746.23034-1-laurent.pinchart@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the compatible value for Startek KD050HDFIA020-C020A panels.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index b1e624be3e33..a015dce72f60 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -19,6 +19,7 @@ properties:
           - ampire,am8001280g
           - bananapi,lhr050h41
           - feixin,k101-im2byl02
+          - startek,kd050hdfia020
           - tdo,tl050hdv35
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
-- 
Regards,

Laurent Pinchart

