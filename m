Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845FD16A29F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13746E326;
	Mon, 24 Feb 2020 09:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4190D6E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id E69695C7;
 Mon, 24 Feb 2020 04:08:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=HvoZm/CXRFjaX
 9itj5UKgqnwKV1jLHEaQ0lrY8kkzVk=; b=MGDZcc/Aq+Rw4qJP/RvJzxTT9zuhi
 Vw+TSvutgz7J4MvR9+z/TbcjkJv4Zi88/MjjG+cIgUqJsI6OO5SuD6cRd72CXOQt
 JxLhFehkvSPlU3Yt2PPeUezeD8RxbQ4PMvq33YaFO0gZSq09wVLDMkWB1nol/HYU
 zKJ+4w2Txt1LtjjDqVyb3jQFYTc1pLhDQ9m90nKDOGn1+VeU5CEZEEQYc8WGeWrs
 7hP4oZ1/foDhV2db+JDIY7KrI6OJfLakLunHY9SQXPmBh3y2zqRDAd6eP4pWny2o
 sIHXd8Voz0Vo+ngIbUWFwe980Mbxc4t/nPmSzlPgrB4vfa38Dqd5m32wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HvoZm/CXRFjaX9itj5UKgqnwKV1jLHEaQ0lrY8kkzVk=; b=c+QKLXSW
 +lO4HtiCmhypK+Tn77ju2BGiGE7BW8mK1MP50t1b4EQ6lLOqGGTBV82mAINI5Xpa
 c9BFIe4wm1tirltt+UcyDrTn4jy2fCDSd35PXwpblyEdb6Db9fl2WK3BFnvJTyOc
 A1N9YrBqwqUynzJ2lVZ+9dBnXsg0KFQDzRf35dfQldUZDPyjbvBrF6pi6rzYIEZ2
 VLaFWgRTTe7Z6O93/VZyloD70+j1TC08nV35OS9x/KY3NqoBrnGvhX5r2+qNyS4H
 OL8rqQSdRQX5KiS2uFMc11sSQa2J73YBVw4OQf0pS44k5UL224UO9p7Xgo6pgxjJ
 W1g1YvEbQGr0Zw==
X-ME-Sender: <xms:qpJTXui9P-ESxQHWQI0LBhgMVPCVH-_TflmnM0T37CJ4nj8eXhQIeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegovehorg
 hsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgjfhgggfes
 tdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvg
 estggvrhhnohdrthgvtghhqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qpJTXptRT016RRkMhbPQfof06Wfpic8DS3Pheb28o5RxhTaMcZ1pyw>
 <xmx:qpJTXuzKfIDjKvfhnyFsq8vH8PHwy67PHK6l2qfL59Ixa8tVZi1GGw>
 <xmx:qpJTXuYQ-EYI7Ph_T6fUEUFtwoVw5M2SOelNa6j3CuwQXXR9bbteHQ>
 <xmx:qpJTXqIMbS5I4ZHSFhuiDyYWNPNy0FtWfuosE_chf1Ddj-TKPAbvkKnsV_4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D4A3328005A;
 Mon, 24 Feb 2020 04:08:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 06/89] dt-bindings: clock: Add a binding for the RPi Firmware
 clocks
Date: Mon, 24 Feb 2020 10:06:08 +0100
Message-Id: <9166f3acdc2a64e3f3ca1cd2e283005ee2df37c9.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The firmare running on the RPi VideoCore can be used to discover and
change the various clocks running in the BCM2711. Since devices will
need to use them through the DT, let's add a pretty simple binding.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
new file mode 100644
index 000000000000..d37bc311321d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/raspberrypi,firmware-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi Firmware Clocks Device Tree Bindings
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  compatible:
+    const: raspberrypi,firmware-clocks
+
+  raspberrypi,firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      Phandle to the mailbox node to communicate with the firmware.
+
+required:
+  - "#clock-cells"
+  - compatible
+  - raspberrypi,firmware
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware_clocks: firmware-clocks {
+        compatible = "raspberrypi,firmware-clocks";
+        raspberrypi,firmware = <&firmware>;
+        #clock-cells = <1>;
+    };
+
+...
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
