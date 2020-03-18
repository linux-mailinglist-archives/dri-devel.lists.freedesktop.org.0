Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165BA189FC9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA146E912;
	Wed, 18 Mar 2020 15:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD606E914
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:37:41 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F293AD06;
 Wed, 18 Mar 2020 16:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584545860;
 bh=6M7TDayBuHf/AQ3zrfgbS6qVFFDorJzCLe8RSBR3hvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DhCm5Os9bKTOUR4ilZ9V4c6ORHQdsmmEkTo6hSHlFA117LubcFWxwo6jgEgGAW7ok
 GnNkRxjWqL55caMp6RfRnK6TLH8t0XAv8qNkOCxMYgXGqsvOmEF2pelurjm7kp72eG
 4Lz9mtiEe/jqZj8F6gJT4jfJ6wbFbnukq/87sr4c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v11 3/5] arm64: dts: zynqmp: Add reset controller
Date: Wed, 18 Mar 2020 17:37:26 +0200
Message-Id: <20200318153728.25843-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
References: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DT node for the reset controller, handled through the firmware
interface.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 5e06e4c19d94..b195fd0dbeed 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -159,6 +159,11 @@ soc_revision: soc_revision@0 {
 			zynqmp_pcap: pcap {
 				compatible = "xlnx,zynqmp-pcap-fpga";
 			};
+
+			reset: reset-controller {
+				compatible = "xlnx,zynqmp-reset";
+				#reset-cells = <1>;
+			};
 		};
 	};
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
