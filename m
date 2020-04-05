Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64EF19EEA6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 01:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865EE6E297;
	Sun,  5 Apr 2020 23:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218886E284
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 23:39:55 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 492E61265;
 Mon,  6 Apr 2020 01:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586129993;
 bh=JIynv/PFJ90OxTiK0luE9C0Ue4XEj7dYZ6mhjEAb5MM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dKqC4s8TO6aYVtS/f/KfqHZBtuo0OZ2j1j3crJR+gEcoeZDg3hGYPyl9HmdaJZSVf
 NdHvmJmpzQcfAHXSPAWJjIoMxqTalrYCDNJ9PAGql6zHNPycSQ2u0cxC8karHYclU9
 okUZKhio0Fe5xXxx1IUXQKqBsEEyhofsxmf6iSKc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: devicetree@vger.kernel.org
Subject: [PATCH/RFC 6/6] dt-bindings: display: bridge: Remove deprecated
 dw_hdmi.txt
Date: Mon,  6 Apr 2020 02:39:35 +0300
Message-Id: <20200405233935.27599-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dw_hdmi.txt has been replaced with synopsys,dw-hdmi.yaml, and all
references to the old file have been converted. Remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/bridge/dw_hdmi.txt       | 33 -------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
deleted file mode 100644
index 33bf981fbe33..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Synopsys DesignWare HDMI TX Encoder
-===================================
-
-This document defines device tree properties for the Synopsys DesignWare HDMI
-TX Encoder (DWC HDMI TX). It doesn't constitue a device tree binding
-specification by itself but is meant to be referenced by platform-specific
-device tree bindings.
-
-When referenced from platform device tree bindings the properties defined in
-this document are defined as follows. The platform device tree bindings are
-responsible for defining whether each property is required or optional.
-
-- reg: Memory mapped base address and length of the DWC HDMI TX registers.
-
-- reg-io-width: Width of the registers specified by the reg property. The
-  value is expressed in bytes and must be equal to 1 or 4 if specified. The
-  register width defaults to 1 if the property is not present.
-
-- interrupts: Reference to the DWC HDMI TX interrupt.
-
-- clocks: References to all the clocks specified in the clock-names property
-  as specified in Documentation/devicetree/bindings/clock/clock-bindings.txt.
-
-- clock-names: The DWC HDMI TX uses the following clocks.
-
-  - "iahb" is the bus clock for either AHB and APB (mandatory).
-  - "isfr" is the internal register configuration clock (mandatory).
-  - "cec" is the HDMI CEC controller main clock (optional).
-
-- ports: The connectivity of the DWC HDMI TX with the rest of the system is
-  expressed in using ports as specified in the device graph bindings defined
-  in Documentation/devicetree/bindings/graph.txt. The numbering of the ports
-  is platform-specific.
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
