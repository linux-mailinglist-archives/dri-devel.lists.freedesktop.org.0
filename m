Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFBF144D79
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA936FB04;
	Wed, 22 Jan 2020 08:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430966EBF6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:41:29 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00L8be4c015298; Tue, 21 Jan 2020 03:41:10 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 2xkyta6tgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 03:41:10 -0500
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 00L8f9QR054542
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL); 
 Tue, 21 Jan 2020 03:41:09 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 21 Jan
 2020 03:41:08 -0500
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 21 Jan 2020 03:41:03 -0500
Received: from btogorean-pc.ad.analog.com ([10.48.65.146])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 00L8Sm9c001010;
 Tue, 21 Jan 2020 03:40:58 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 3/3] dt-bindings: drm: bridge: adv7511: Add ADV7535 support
Date: Tue, 21 Jan 2020 10:27:24 +0200
Message-ID: <20200121082719.27972-4-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200121082719.27972-1-bogdan.togorean@analog.com>
References: <20200121082719.27972-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-20,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=1
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210073
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 alexander.deucher@amd.com, tglx@linutronix.de, sam@ravnborg.org,
 matt.redfearn@thinci.com, Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ADV7535 is a part compatible with ADV7533 but it supports 1080p@60hz and
v1p2 supply is fixed to 1.8V

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/display/bridge/adi,adv7511.txt   | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
index 2c887536258c..e8ddec5d9d91 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
@@ -1,10 +1,10 @@
-Analog Device ADV7511(W)/13/33 HDMI Encoders
+Analog Device ADV7511(W)/13/33/35 HDMI Encoders
 -----------------------------------------
 
-The ADV7511, ADV7511W, ADV7513 and ADV7533 are HDMI audio and video transmitters
-compatible with HDMI 1.4 and DVI 1.0. They support color space conversion,
-S/PDIF, CEC and HDCP. ADV7533 supports the DSI interface for input pixels, while
-the others support RGB interface.
+The ADV7511, ADV7511W, ADV7513, ADV7533 and ADV7535 are HDMI audio and video
+transmitters compatible with HDMI 1.4 and DVI 1.0. They support color space
+conversion, S/PDIF, CEC and HDCP. ADV7533/5 supports the DSI interface for input
+pixels, while the others support RGB interface.
 
 Required properties:
 
@@ -13,6 +13,7 @@ Required properties:
 		"adi,adv7511w"
 		"adi,adv7513"
 		"adi,adv7533"
+		"adi,adv7535"
 
 - reg: I2C slave addresses
   The ADV7511 internal registers are split into four pages exposed through
@@ -52,14 +53,14 @@ The following input format properties are required except in "rgb 1x" and
 - bgvdd-supply: A 1.8V supply that powers up the BGVDD pin. This is
   needed only for ADV7511.
 
-The following properties are required for ADV7533:
+The following properties are required for ADV7533 and ADV7535:
 
 - adi,dsi-lanes: Number of DSI data lanes connected to the DSI host. It should
   be one of 1, 2, 3 or 4.
 - a2vdd-supply: 1.8V supply that powers up the A2VDD pin on the chip.
 - v3p3-supply: A 3.3V supply that powers up the V3P3 pin on the chip.
 - v1p2-supply: A supply that powers up the V1P2 pin on the chip. It can be
-  either 1.2V or 1.8V.
+  either 1.2V or 1.8V for ADV7533 but only 1.8V for ADV7535.
 
 Optional properties:
 
@@ -71,9 +72,9 @@ Optional properties:
 - adi,embedded-sync: The input uses synchronization signals embedded in the
   data stream (similar to BT.656). Defaults to separate H/V synchronization
   signals.
-- adi,disable-timing-generator: Only for ADV7533. Disables the internal timing
-  generator. The chip will rely on the sync signals in the DSI data lanes,
-  rather than generate its own timings for HDMI output.
+- adi,disable-timing-generator: Only for ADV7533 and ADV7535. Disables the
+  internal timing generator. The chip will rely on the sync signals in the
+  DSI data lanes, rather than generate its own timings for HDMI output.
 - clocks: from common clock binding: reference to the CEC clock.
 - clock-names: from common clock binding: must be "cec".
 - reg-names : Names of maps with programmable addresses.
@@ -85,7 +86,7 @@ Required nodes:
 The ADV7511 has two video ports. Their connections are modelled using the OF
 graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
-- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533, the
+- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533/5, the
   remote endpoint phandle should be a reference to a valid mipi_dsi_host device
   node.
 - Video port 1 for the HDMI output
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
