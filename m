Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F9C149FAA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75F36EA37;
	Mon, 27 Jan 2020 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 711 seconds by postgrey-1.36 at gabe;
 Sun, 26 Jan 2020 18:53:42 UTC
Received: from mxa1.seznam.cz (mxa1.seznam.cz [IPv6:2a02:598:a::78:90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962336E9ED
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 18:53:42 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc16b.ko.seznam.cz (email-smtpc16b.ko.seznam.cz [10.53.18.17])
 id 6b21a3d7302ff7be6a886f89; Sun, 26 Jan 2020 19:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
 t=1580064820; bh=TUebci02NczpMGKvv2fnh9uv2ZSWEY0qvKQD2Z+NYG0=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=EDNmD3i8DH3cXS7pDkn+B7lsFHDnlgpsct3YbA22JRofDOvhiLbcgyZUBS+3f4UEE
 G2MkNjeKyTgnVaRGaSOBbnDNUAhQCiTjNwb3YK3TmEx3lvK9l0coCjgja0d/QOqWbw
 EdY7aUtN/D6UjptdM5IXH6SUvpGiEzbWejGTx4wk=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
 by email-relay24.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
 Sun, 26 Jan 2020 19:41:40 +0100 (CET)  
From: michael.srba@seznam.cz
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] dt-bindings: display/panel: add bindings for
 S6E88A0-AMS452EF01
Date: Sun, 26 Jan 2020 19:39:10 +0100
Message-Id: <20200126183911.17090-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Srba <Michael.Srba@seznam.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
use of their S6E88A0 controller.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 .../panel/samsung,s6e88a0-ams452ef01.txt      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt
new file mode 100644
index 000000000000..2dcf9580febd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt
@@ -0,0 +1,26 @@
+Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode controller.
+
+Required properties:
+  - compatible: "samsung,s6e88a0-ams452ef01"
+  - reg: the virtual channel number of a DSI peripheral
+  - vdd3-supply: core voltage supply
+  - vci-supply: voltage supply for analog circuits
+  - reset-gpios: a GPIO spec for the reset pin
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [1]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	panel@0 {
+		reg = <0>;
+
+		compatible = "samsung,s6e88a0-ams452ef01";
+
+		vdd3-supply = <&pm8916_l17>;
+		vci-supply = <&reg_vlcd_vci>;
+		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
