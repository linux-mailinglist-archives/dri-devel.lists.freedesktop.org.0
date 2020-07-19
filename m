Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED6225895
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A856E187;
	Mon, 20 Jul 2020 07:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.al2klimov.de (smtp.al2klimov.de
 [IPv6:2a01:4f8:c0c:1465::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055E76E042
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 10:10:19 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 6DB27BC078;
 Sun, 19 Jul 2020 10:10:14 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 b.zolnierkie@samsung.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH for v5.9] ARM: dts: mxs: Replace HTTP links with HTTPS ones
Date: Sun, 19 Jul 2020 12:10:08 +0200
Message-Id: <20200719101008.57623-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 arch/arm/boot/dts/imx23-pinfunc.h     | 4 ++--
 arch/arm/boot/dts/imx28-pinfunc.h     | 4 ++--
 arch/arm/boot/dts/imx53-tx53-x13x.dts | 4 ++--
 arch/arm/boot/dts/mxs-pinfunc.h       | 4 ++--
 include/video/imx-ipu-v3.h            | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx23-pinfunc.h b/arch/arm/boot/dts/imx23-pinfunc.h
index 5c0f32ca3a93..f9d7eb6679de 100644
--- a/arch/arm/boot/dts/imx23-pinfunc.h
+++ b/arch/arm/boot/dts/imx23-pinfunc.h
@@ -7,8 +7,8 @@
  * License. You may obtain a copy of the GNU General Public License
  * Version 2 at the following locations:
  *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
+ * https://www.opensource.org/licenses/gpl-license.html
+ * https://www.gnu.org/copyleft/gpl.html
  */
 
 #ifndef __DT_BINDINGS_MX23_PINCTRL_H__
diff --git a/arch/arm/boot/dts/imx28-pinfunc.h b/arch/arm/boot/dts/imx28-pinfunc.h
index e11f69ba0fe4..ffd5412b70ae 100644
--- a/arch/arm/boot/dts/imx28-pinfunc.h
+++ b/arch/arm/boot/dts/imx28-pinfunc.h
@@ -7,8 +7,8 @@
  * License. You may obtain a copy of the GNU General Public License
  * Version 2 at the following locations:
  *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
+ * https://www.opensource.org/licenses/gpl-license.html
+ * https://www.gnu.org/copyleft/gpl.html
  */
 
 #ifndef __DT_BINDINGS_MX28_PINCTRL_H__
diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/imx53-tx53-x13x.dts
index 6cdf2082c742..a34d98cf6ed4 100644
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -41,8 +41,8 @@
  * License. You may obtain a copy of the GNU General Public License
  * Version 2 at the following locations:
  *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
+ * https://www.opensource.org/licenses/gpl-license.html
+ * https://www.gnu.org/copyleft/gpl.html
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/mxs-pinfunc.h b/arch/arm/boot/dts/mxs-pinfunc.h
index c6da987b20cb..6766292eee30 100644
--- a/arch/arm/boot/dts/mxs-pinfunc.h
+++ b/arch/arm/boot/dts/mxs-pinfunc.h
@@ -7,8 +7,8 @@
  * License. You may obtain a copy of the GNU General Public License
  * Version 2 at the following locations:
  *
- * http://www.opensource.org/licenses/gpl-license.html
- * http://www.gnu.org/copyleft/gpl.html
+ * https://www.opensource.org/licenses/gpl-license.html
+ * https://www.gnu.org/copyleft/gpl.html
  */
 
 #ifndef __DT_BINDINGS_MXS_PINCTRL_H__
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index 06b0b57e996c..749490e3c66e 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -5,8 +5,8 @@
  * Public License.  You may obtain a copy of the GNU Lesser General
  * Public License Version 2.1 or later at the following locations:
  *
- * http://www.opensource.org/licenses/lgpl-license.html
- * http://www.gnu.org/copyleft/lgpl.html
+ * https://www.opensource.org/licenses/lgpl-license.html
+ * https://www.gnu.org/copyleft/lgpl.html
  */
 
 #ifndef __DRM_IPU_H__
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
