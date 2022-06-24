Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F9855A29E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532B110F259;
	Fri, 24 Jun 2022 20:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AF410F259
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102492;
 bh=O5yYZO94aw8iZ1BGipv/5FMHgPIAwWzYXkpT0AopObY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KJZZPaXt8WWB5YY78OIl4qifiaqhAF4nzilPfUTleAyW6K7SJLyf76z8gFUNRSF8W
 ShZmrS7crUMxWM/uz4+oUdbpSUs2JBUfruwVI5gPdJ56OnnOterT1oFJqFtXYBAbC3
 CIaLbEEk9WbUkvc2sZsCD6dpVrqinlzaemq7+NuY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mr9Bk-1nGwEn0Ali-00oEZA; Fri, 24 Jun 2022 22:28:12 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/28] drm/via: Add via_encoder.c
Date: Fri, 24 Jun 2022 15:26:17 -0500
Message-Id: <20220624202633.3978-13-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iKkjeAuycokqxXqHn5jyRz5HV/33VqEoBC3lDJPXUI77IWf+y6H
 fVJY1DGrq9nf7SJiSKIKWnhJT5wJrFnRR61u8kqKydm41SR6eP1IvWlnEmNaU/tEMh6zMZg
 UZT3eRxdRJIZMTpJWIwFHMWbvM0/rNM2mEP6UHrALCF1df1mY/F/EHegIy8sb/47Qdl+BVP
 g0VXd3dM1TFZAc0ipFfIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SZz4Yd9Ra0U=:+9AW6RyKIoQjHBWSqJ2hiL
 GRngeuMjjWAI8GOfd7RxJImsK1Z7J2RqKn3DiwXnQ1MJ3JnwFuJgwiLdQp2yaxg0IZKRa/hzd
 6AS7tK5wQDXD64fVkliXR+PFPqkGwJAoIcW+Fo8adhg9wccjI4FqeYj1RWf/iodVDieZOp8fj
 /46KDPxA208RhvaEEer1c4Dd4i36NKlMSEqkFInpmL5njXvVnZUtRxQzZNF3qHE+FcH1BNjWv
 4DIfV1KyqmhVyX4dwOEd/EW3rl4ohyaJKD01g08Pb3gFKYHhqcynySEZt9yi4W6MZ98Up2dz/
 AhEXRdtpGmRRbj4GX2KQinOjoLNtCHGGi0Me966CGPuGBawA9cBwBl/p2onAppOlc+nAtCHhh
 l1SOTe5lHaXG9W8Wa7wXjHFD9YbPEnJgYsb2lhQTCCgDcK1OUXsPtw7AlyaM2GFgWmj6t2H2z
 q9qltXep+a98EXG3NvEXdWR/aB0sN348pkshsGyxLGe0U15z561j7eKjPkfH0a0ZW/2y28d2+
 k/jH6Rhs+LqwasF7pm9pSIEXTxSrfqOoTdNQDkMnbOEAigllJbHoLwszj15XobzY9tuiYwgWc
 SUL7Es9iwbxeoNeUCf/llsL8ubERSzWVO9u/KNmTNrTbo+/tLiLXQoEsXkz174Lm68q8D7H2Y
 muT4td+j2tg7n4yPLHRLD6P0rcDF4rLCtfLJl0CAp6IG+cPIFnR3jBQ3wq6MeD0GR9NZJ0cPh
 HHHEXqShaCs++q6OFuEdS90rwvqfnt9ahHBiLMnZB8s3IkyyZMf1XnCXXJmLDM6G76DF1mi8O
 l+4Cj5qfd9UGMQEfG5yKHnxcP5GAXQ2r8GevzdwKXXLLFJoMqAxNUyWEjaWXDH0u1wxkLMU89
 GUkpXIKyL6sK5uJYrs3nJFkic+2xqtJtDgkqzQxDjHmA09v/RP3gT8rJcYAc3Dc0RkFGmizbR
 Ho2OoVsda2CC3nmd2IyvaxtY+aHc2qTqzK3H/yP9eNnc1McfPVGTHnlZTpEflFBSDsIAXZTQi
 UwV/8HEMCWEgApy/0G6Z4wwA5q7itE624Q9gJzOZyj1recUu+d/zBKluRkiJiWeztNttHVN5C
 HnMWBKk0CNiSQwCmFd0ienkyoShZ9muGao15lGF1h91dPCG++IxxOcNAQ==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_encoder.c | 173 ++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_encoder.c

diff --git a/drivers/gpu/drm/via/via_encoder.c b/drivers/gpu/drm/via/via_e=
ncoder.c
new file mode 100644
index 000000000000..eae693fc5141
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_encoder.c
@@ -0,0 +1,173 @@
+/*
+ * Copyright =C2=A9 2017-2018 Kevin Brace.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the n=
ext
+ * paragraph) shall be included in all copies or substantial portions of =
the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ */
+
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+
+#include "via_drv.h"
+
+
+void via_transmitter_io_pad_state(struct via_drm_priv *dev_priv,
+						uint32_t di_port,
+						bool io_pad_on)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_FPDPLOW:
+		via_fpdp_low_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_FPDPHIGH:
+		via_fpdp_high_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case (VIA_DI_PORT_FPDPLOW |
+		VIA_DI_PORT_FPDPHIGH):
+		via_fpdp_low_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		via_fpdp_high_set_io_pad_state(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		via_lvds2_set_io_pad_setting(VGABASE,
+					io_pad_on ? 0x03 : 0x00);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_transmitter_clock_drive_strength(
+					struct via_drm_priv *dev_priv,
+					u32 di_port, u8 drive_strength)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_clock_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_clock_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_transmitter_data_drive_strength(
+					struct via_drm_priv *dev_priv,
+					u32 di_port, u8 drive_strength)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_data_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_data_drive_strength(VGABASE,
+						drive_strength);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_transmitter_display_source(struct via_drm_priv *dev_priv,
+						u32 di_port, int index)
+{
+	u8 display_source =3D index & 0x01;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_DVP0:
+		via_dvp0_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_DVP1:
+		via_dvp1_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_FPDPLOW:
+		via_fpdp_low_set_display_source(VGABASE, display_source);
+		via_dvp1_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_FPDPHIGH:
+		via_fpdp_high_set_display_source(VGABASE, display_source);
+		via_dvp0_set_display_source(VGABASE, display_source);
+		break;
+	case (VIA_DI_PORT_FPDPLOW |
+		VIA_DI_PORT_FPDPHIGH):
+		via_fpdp_low_set_display_source(VGABASE, display_source);
+		via_fpdp_high_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_LVDS1:
+		via_lvds1_set_display_source(VGABASE, display_source);
+		break;
+	case VIA_DI_PORT_LVDS2:
+		via_lvds2_set_display_source(VGABASE, display_source);
+		break;
+	case (VIA_DI_PORT_LVDS1 |
+		VIA_DI_PORT_LVDS2):
+		via_lvds1_set_display_source(VGABASE, display_source);
+		via_lvds2_set_display_source(VGABASE, display_source);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
=2D-
2.35.1

