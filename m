Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846B28CCDA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 13:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F4C6E8CB;
	Tue, 13 Oct 2020 11:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57C46E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 11:54:45 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A54B322B2C;
 Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602590081;
 bh=OJC+w0qcbW9yHm4g3J8pvhMQfAwAW0kVnEPzeJJGYqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k0BxG69AG+5iW+BQA82ih0ugLW2wkvfA18eOnWckyri03Hb3hKXnJkJyBSgKyt9vv
 8qgXYbd6st3EajaGj0SXB8TXpA4HXz2WPZZB1npfzfJR3XDD6vp2LpUzqevQzpFgdv
 DliuhA71qYSU87xOsMxKHif/oQPKHVkW2d/0xhUU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSIt5-006CVq-A2; Tue, 13 Oct 2020 13:54:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v6 56/80] dt-bindings: fix references to files converted to
 yaml
Date: Tue, 13 Oct 2020 13:54:11 +0200
Message-Id: <81fe11d0079aaa48ff85370fd359150160943341.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kathiravan T <kathirav@codeaurora.org>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Lee Jones <lee.jones@linaro.org>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Andy Gross <agross@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There were several files converted to yaml, but the .txt file
is still referenced somewhere else.

Update the references for them to point to the right file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../bindings/display/tilcdc/tilcdc.txt           |  2 +-
 .../devicetree/bindings/mailbox/omap-mailbox.txt |  2 +-
 .../devicetree/bindings/media/i2c/tvp5150.txt    |  2 +-
 .../bindings/pwm/google,cros-ec-pwm.yaml         |  2 +-
 .../bindings/soc/qcom/qcom,smd-rpm.yaml          |  2 +-
 .../bindings/sound/google,cros-ec-codec.yaml     |  2 +-
 MAINTAINERS                                      | 16 ++++++++--------
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
index 8b2a71395647..3e64075ac7ec 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
@@ -37,7 +37,7 @@ Optional nodes:
    supports a single port with a single endpoint.
 
  - See also Documentation/devicetree/bindings/display/tilcdc/panel.txt and
-   Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt for connecting
+   Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml for connecting
    tfp410 DVI encoder or lcd panel to lcdc
 
 [1] There is an errata about AM335x color wiring. For 16-bit color mode
diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
index 35c3f56b7f7b..5fe80c1c19fc 100644
--- a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
@@ -69,7 +69,7 @@ The following are mandatory properties for the K3 AM65x and J721E SoCs only:
 			the interrupt routes between the IP and the main GIC
 			controllers. See the following binding for additional
 			details,
-			Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
+			Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
 
 Child Nodes:
 ============
diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index 6c88ce858d08..719b2995dc17 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -56,7 +56,7 @@ Optional Connector Properties:
                   instead of using the autodetection mechnism. Please look at
                   [1] for more information.
 
-[1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
+[1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml.
 
 Example - three input sources:
 #include <dt-bindings/display/sdtv-standards.h>
diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index 41ece1d85315..4cfbffd8414a 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -14,7 +14,7 @@ description: |
   Google's ChromeOS EC PWM is a simple PWM attached to the Embedded Controller
   (EC) and controlled via a host-command interface.
   An EC PWM node should be only found as a sub-node of the EC node (see
-  Documentation/devicetree/bindings/mfd/cros-ec.txt).
+  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 468d658ce3e7..2684f22a1d85 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -20,7 +20,7 @@ description: |
   present and this subnode may contain children that designate regulator
   resources.
 
-  Refer to Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
+  Refer to Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
   for information on the regulator subnodes that can exist under the
   rpm_requests.
 
diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index c84e656afb0a..3b9143af2c7c 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -13,7 +13,7 @@ description: |
   Google's ChromeOS EC codec is a digital mic codec provided by the
   Embedded Controller (EC) and is controlled via a host-command interface.
   An EC codec node should only be found as a sub-node of the EC node (see
-  Documentation/devicetree/bindings/mfd/cros-ec.txt).
+  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
 
 properties:
   compatible:
diff --git a/MAINTAINERS b/MAINTAINERS
index dffa948a2124..9e0f7b68bba5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1523,7 +1523,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/actions.yaml
 F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
-F:	Documentation/devicetree/bindings/dma/owl-dma.txt
+F:	Documentation/devicetree/bindings/dma/owl-dma.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.txt
 F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
 F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
@@ -5827,7 +5827,7 @@ L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/pinchartl/media drm/du/next
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
-F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.txt
 F:	drivers/gpu/drm/rcar-du/
 F:	drivers/gpu/drm/shmobile/
@@ -6952,7 +6952,7 @@ M:	Frank Li <Frank.li@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org
 S:	Maintained
 F:	Documentation/admin-guide/perf/imx-ddr.rst
-F:	Documentation/devicetree/bindings/perf/fsl-imx-ddr.txt
+F:	Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
 F:	drivers/perf/fsl_imx8_ddr_perf.c
 
 FREESCALE IMX I2C DRIVER
@@ -6960,7 +6960,7 @@ M:	Oleksij Rempel <o.rempel@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-imx.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-imx.yaml
 F:	drivers/i2c/busses/i2c-imx.c
 
 FREESCALE IMX LPI2C DRIVER
@@ -6968,7 +6968,7 @@ M:	Dong Aisheng <aisheng.dong@nxp.com>
 L:	linux-i2c@vger.kernel.org
 L:	linux-imx@nxp.com
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
 F:	drivers/i2c/busses/i2c-imx-lpi2c.c
 
 FREESCALE QORIQ DPAA ETHERNET DRIVER
@@ -11600,7 +11600,7 @@ MIPS GENERIC PLATFORM
 M:	Paul Burton <paulburton@kernel.org>
 L:	linux-mips@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/power/mti,mips-cpc.txt
+F:	Documentation/devicetree/bindings/power/mti,mips-cpc.yaml
 F:	arch/mips/generic/
 F:	arch/mips/tools/generic-board-config.sh
 
@@ -12455,7 +12455,7 @@ NXP SGTL5000 DRIVER
 M:	Fabio Estevam <festevam@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/sgtl5000.txt
+F:	Documentation/devicetree/bindings/sound/sgtl5000.yaml
 F:	sound/soc/codecs/sgtl5000*
 
 NXP SJA1105 ETHERNET SWITCH DRIVER
@@ -16737,7 +16737,7 @@ SYNOPSYS DESIGNWARE DMAC DRIVER
 M:	Viresh Kumar <vireshk@kernel.org>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/dma/snps-dma.txt
+F:	Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
 F:	drivers/dma/dw/
 F:	include/dt-bindings/dma/dw-dmac.h
 F:	include/linux/dma/dw.h
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
