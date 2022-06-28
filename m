Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954E55F095
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B14113E2D;
	Tue, 28 Jun 2022 21:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA76113E2D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453219;
 bh=NfgfLLsglAaz/bfTVEHoL1LeuzOlre6K6A95foTbP9Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U9c4UuTQLNEjsSI0dtxOWA4vPrF3eCgdNd++PnE/49b/DmRr+rGRxBAt1A3X1JYRr
 +1nZxgMLNVSRlD/mCashurQvxlMHqGJ+TKScOvXW+yzGas6yzWpSbR/7a6D+KBsLZp
 ubyQXZae7CoQJGcLkgIlQ2HfKmtw+/0ACh0qUVbw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MLQxN-1oN13S1Djn-00ISot; Tue, 28
 Jun 2022 23:53:38 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/32] drm/via: Add via_disp_reg.h
Date: Tue, 28 Jun 2022 16:52:18 -0500
Message-Id: <20220628215246.19706-5-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JKocuKuhgJkKjAdQCQjRCsj4lHAdAI/rHpnEQKysBvU0KTK3SN9
 GKjLYGVv28XlB/OC/xMhUPbPT6CuXLQ4W8aX/Xj104JIQYBsQS02osSBMpPNzjrCNnXZt9o
 ufy5yUXWNZbzcI4JcbDSfSH7kYtgcPUS2SOvWivMxfpbbnjuvRSEbkQhHCiv9p9SZ5aStjB
 UABDPDDd9AmJlepy22Jdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:822Oc+P9pxI=:60aoVxSb6byyfC8c4WkGLb
 wIvUxe9CW2xlgPQ9dOLteomOmGTJogS8uZlIbovavgw3TH4etsdUIj7fDkibwlLYtzmXaTr3b
 SO9D560+SpuTvQojLtI8t3Op5domvElw7TqnZ2JeN7iHvU3Kl/plJdpEucPMPJDjBzH6VylX0
 aN8c3DNKHNIKuzwTJACIslcThX7T8gvtWEoZUGxvZBHRFTLhIgSDdDxExAkHHTrycxB6jBD2S
 wAR8qqbYpkSZf6QagUA8tyNlczvtAIKbrwJGNLrShYx7Zk4PnOvZgAr7Y8LKomya2Z5mAUkdL
 quBv59XxJPOROobVMKa38d3e+y6OsmyCfeGCcW2TlZHxNnCleZqNtLineRcmFkPFKrfS6Td//
 2vuMTVNVqLVrbCx9Y2olS/d4cl3Xc/T96FtEcfCvOtAQI6dj5AYN2YbflDJlijnqdq7h77e77
 8PsyXXHHpuCfjhvC0A9EVAGMz/IrT4Zx5BOnJCnnhK7zgxpd8WhGWr3NIaQa0+r9i2iXc9a5y
 8xET2YOmdfPyTw9p7nnCEEBny5nOX9WZ2Yzasd959nGZc4mAxFi3Mj8lQygJEaMFWPA3VUaSL
 Bsa0wRURHnteWLeyvhNveF5SAp5vOaCqDmPiyVUZS6SJmW303uKo6Jwy0xoEg6wIkU2dOjqY0
 GmpjwqGnU2gZSyI1sj9DrflXCDT6YNnObsTjnQ+H2h5/jbFFYVffZF/LtvQ/9Hoye4/WHUA8I
 J3QpMp8Evxvg3dX0q4ILntRazTtJwvydllf2dZ3LQ2bw1H37+/UpsWKr4lcWBW6DtuSyzpljo
 F1UOJAL0k4eR3S6z/pD7om/4aNY1p21tfG1hHMfkXVq+cXsbtI5/u/U83hDm0w7WW2ZJ+JtZC
 3/75mRywQNxctiO9stEEdxqeDeypNrWYYG1b9wMV5I4mV0py6zlL37eU5j1nsKZk4mMivubFD
 Qo7P4I170bLjQ1t9FZ0Que4NRQEL9qtvNKGlMOr33BKZgmLSaY8yAJN0aGdV1HJjBfyjMTqGI
 klZJMiwATh7+evURBvsLumwIdbqaDwmIHoNsJ3XVTFX3Z7ksOuZlbrznJ1swU4tiit1NAiZqq
 mfSNh0JsOCVtumDeSVpv48j6rmrWFY2OllYtzO7SbXQeLBInhICqp7m5Q==
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

Likely originated from VIA Technologies.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_disp_reg.h | 513 +++++++++++++++++++++++++++++
 1 file changed, 513 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_disp_reg.h

diff --git a/drivers/gpu/drm/via/via_disp_reg.h b/drivers/gpu/drm/via/via_=
disp_reg.h
new file mode 100644
index 000000000000..e2bd895bb495
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_disp_reg.h
@@ -0,0 +1,513 @@
+/*
+ * Copyright 1998-2009 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2009 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __VIA_DISP_REG_H__
+#define __VIA_DISP_REG_H__
+
+/********************************************************/
+/* Definition IGA Design Method of FIFO Registers	*/
+/********************************************************/
+#define IGA1_FIFO_DEPTH_SELECT_FORMULA(x)		((x >> 1) - 1)
+#define IGA2_FIFO_DEPTH_SELECT_FORMULA(x)		((x >> 3) - 1)
+
+/* Define Display OFFSET */
+/* VT3314 chipset */
+#define CN700_IGA1_FIFO_MAX_DEPTH		96	/* location: {SR17,0,7}*/
+#define CN700_IGA1_FIFO_THRESHOLD		80	/* location: {SR16,0,5},{SR16,7,7}*=
/
+#define CN700_IGA1_FIFO_HIGH_THRESHOLD		64	/* location: {SR18,0,5},{SR18,=
7,7}*/
+#define CN700_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	128	/* location: {SR22,0,4}. =
(128/4) =3D64,
+							 * P800 must be set zero, because HW
+							 * only 5 bits */
+#define CN700_IGA2_FIFO_MAX_DEPTH		96	/* location: {CR68,4,7},{CR94,7,7},=
{CR95,7,7}*/
+#define CN700_IGA2_FIFO_THRESHOLD		80	/* location: {CR68,0,3},{CR95,4,6}*=
/
+#define CN700_IGA2_FIFO_HIGH_THRESHOLD		32	/* location: {CR92,0,3},{CR95,=
0,2}*/
+#define CN700_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	128	/* location: {CR94,0,6}*/
+
+/* For VT3324, these values are suggested by HW */
+#define CX700_IGA1_FIFO_MAX_DEPTH		192	/* location: {SR17,0,7}*/
+#define CX700_IGA1_FIFO_THRESHOLD		128	/* location: {SR16,0,5},{SR16,7,7}=
*/
+#define CX700_IGA1_FIFO_HIGH_THRESHOLD		128	/* location: {SR18,0,5},{SR18=
,7,7} */
+#define CX700_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	124	/* location: {SR22,0,4} *=
/
+
+#define CX700_IGA2_FIFO_MAX_DEPTH		96	/* location: {CR68,4,7},{CR94,7,7},=
{CR95,7,7}*/
+#define CX700_IGA2_FIFO_THRESHOLD		64	/* location: {CR68,0,3},{CR95,4,6}*=
/
+#define CX700_IGA2_FIFO_HIGH_THRESHOLD		32	/* location: {CR92,0,3},{CR95,=
0,2} */
+#define CX700_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	128	/* location: {CR94,0,6}*/
+
+/* VT3336 chipset */
+#define K8M890_IGA1_FIFO_MAX_DEPTH		360	/* location: {SR17,0,7}*/
+#define K8M890_IGA1_FIFO_THRESHOLD		328	/* location: {SR16,0,5},{SR16,7,7=
}*/
+#define K8M890_IGA1_FIFO_HIGH_THRESHOLD		296	/* location: {SR18,0,5},{SR1=
8,7,7}*/
+#define K8M890_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	124	/* location: {SR22,0,4}.=
*/
+
+#define K8M890_IGA2_FIFO_MAX_DEPTH		360	/* location: {CR68,4,7},{CR94,7,7=
},{CR95,7,7}*/
+#define K8M890_IGA2_FIFO_THRESHOLD		328	/* location: {CR68,0,3},{CR95,4,6=
}*/
+#define K8M890_IGA2_FIFO_HIGH_THRESHOLD		296	/* location: {CR92,0,3},{CR9=
5,0,2}*/
+#define K8M890_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	124	/* location: {CR94,0,6}*=
/
+
+/* VT3327 chipset */
+#define P4M890_IGA1_FIFO_MAX_DEPTH		96	/* location: {SR17,0,7}*/
+#define P4M890_IGA1_FIFO_THRESHOLD		76	/* location: {SR16,0,5},{SR16,7,7}=
*/
+#define P4M890_IGA1_FIFO_HIGH_THRESHOLD		64	/* location: {SR18,0,5},{SR18=
,7,7}*/
+#define P4M890_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	32	/* location: {SR22,0,4}. =
(32/4) =3D8*/
+
+#define P4M890_IGA2_FIFO_MAX_DEPTH		96	/* location: {CR68,4,7},{CR94,7,7}=
,{CR95,7,7}*/
+#define P4M890_IGA2_FIFO_THRESHOLD		76	/* location: {CR68,0,3},{CR95,4,6}=
*/
+#define P4M890_IGA2_FIFO_HIGH_THRESHOLD		64	/* location: {CR92,0,3},{CR95=
,0,2}*/
+#define P4M890_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	32	/* location: {CR94,0,6}*/
+
+/* VT3364 chipset */
+#define P4M900_IGA1_FIFO_MAX_DEPTH		96	/* location: {SR17,0,7}*/
+#define P4M900_IGA1_FIFO_THRESHOLD		76	/* location: {SR16,0,5},{SR16,7,7}=
*/
+#define P4M900_IGA1_FIFO_HIGH_THRESHOLD		76	/* location: {SR18,0,5},{SR18=
,7,7}*/
+#define P4M900_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	32	/* location: {SR22,0,4}.*=
/
+
+#define P4M900_IGA2_FIFO_MAX_DEPTH		96	/* location: {CR68,4,7},{CR94,7,7}=
,{CR95,7,7}*/
+#define P4M900_IGA2_FIFO_THRESHOLD		76	/* location: {CR68,0,3},{CR95,4,6}=
*/
+#define P4M900_IGA2_FIFO_HIGH_THRESHOLD		76	/* location: {CR92,0,3},{CR95=
,0,2}*/
+#define P4M900_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	32	/* location: {CR94,0,6}*/
+
+/* For VT3353, these values are suggested by HW */
+#define VX800_IGA1_FIFO_MAX_DEPTH		192	/* location: {SR17,0,7}*/
+#define VX800_IGA1_FIFO_THRESHOLD		152	/* location: {SR16,0,5},{SR16,7,7}=
*/
+#define VX800_IGA1_FIFO_HIGH_THRESHOLD		152	/* location: {SR18,0,5},{SR18=
,7,7} */
+#define VX800_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	64	/* location: {SR22,0,4} */
+
+#define VX800_IGA2_FIFO_MAX_DEPTH		96	/* location: {CR68,4,7},{CR94,7,7},=
{CR95,7,7}*/
+#define VX800_IGA2_FIFO_THRESHOLD		64	/* location: {CR68,0,3},{CR95,4,6}*=
/
+#define VX800_IGA2_FIFO_HIGH_THRESHOLD		32	/* location: {CR92,0,3},{CR95,=
0,2} */
+#define VX800_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	128	/* location: {CR94,0,6}*/
+
+/* For VT3409 */
+#define VX855_IGA1_FIFO_MAX_DEPTH		400
+#define VX855_IGA1_FIFO_THRESHOLD		320
+#define VX855_IGA1_FIFO_HIGH_THRESHOLD		320
+#define VX855_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	160
+
+#define VX855_IGA2_FIFO_MAX_DEPTH		200
+#define VX855_IGA2_FIFO_THRESHOLD		160
+#define VX855_IGA2_FIFO_HIGH_THRESHOLD		160
+#define VX855_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	320
+
+/* For VT3410 */
+#define VX900_IGA1_FIFO_MAX_DEPTH		400
+#define VX900_IGA1_FIFO_THRESHOLD		320
+#define VX900_IGA1_FIFO_HIGH_THRESHOLD		320
+#define VX900_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	160
+
+#define VX900_IGA2_FIFO_MAX_DEPTH		192
+#define VX900_IGA2_FIFO_THRESHOLD		160
+#define VX900_IGA2_FIFO_HIGH_THRESHOLD		160
+#define VX900_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	320
+
+#ifdef VIA_VT3293_SUPPORT
+/* For VT3293 */
+#define CN750_IGA1_FIFO_MAX_DEPTH		96
+#define CN750_IGA1_FIFO_THRESHOLD		76
+#define CN750_IGA1_FIFO_HIGH_THRESHOLD		76
+#define CN750_IGA1_DISPLAY_QUEUE_EXPIRE_NUM	32
+
+#define CN750_IGA2_FIFO_MAX_DEPTH		96
+#define CN750_IGA2_FIFO_THRESHOLD		76
+#define CN750_IGA2_FIFO_HIGH_THRESHOLD		76
+#define CN750_IGA2_DISPLAY_QUEUE_EXPIRE_NUM	32
+#endif
+
+/* CLE266 and KM400 IGA1 FIFO Depth Select */
+static struct vga_regset iga1_cle266_fifo_depth_select[] =3D {
+	{ VGA_SEQ_I, 0x17, 0, 6 }
+};
+
+/* K8M800 or later IGA1 FIFO Depth Select */
+static struct vga_regset iga1_k8m800_fifo_depth_select[] =3D {
+	{ VGA_SEQ_I, 0x17, 0, 7 }
+};
+
+/* CLE266 and KM400 IGA2 FIFO Depth_Select */
+static struct vga_regset iga2_cle266_fifo_depth_select[] =3D {
+	{ VGA_CRT_IC, 0x68, 4, 7 }
+};
+
+/* K8M800 or later IGA2 FIFO Depth_Select */
+static struct vga_regset iga2_k8m800_fifo_depth_select[] =3D {
+	{ VGA_CRT_IC, 0x68, 4, 7 },
+	{ VGA_CRT_IC, 0x94, 7, 7 },
+	{ VGA_CRT_IC, 0x95, 7, 7 }
+};
+
+/* CLE266 and KM400 IGA1 FIFO Threshold Select */
+static struct vga_regset iga1_cle266_fifo_threshold_select[] =3D {
+	{ VGA_SEQ_I, 0x16, 0, 5 }
+};
+
+/*  K8M800 or later IGA1 FIFO Threshold Select */
+static struct vga_regset iga1_k8m800_fifo_threshold_select[] =3D {
+	{ VGA_SEQ_I, 0x16, 0, 5 },
+	{ VGA_SEQ_I, 0x16, 7, 7 }
+};
+
+/* CLE266 and KM400 IGA2 FIFO Threshold Select */
+static struct vga_regset iga2_cle266_fifo_threshold_select[] =3D {
+	{ VGA_CRT_IC, 0x68, 0, 3 }
+};
+
+/* K8M800 or later IGA2 FIFO Threshold Select */
+static struct vga_regset iga2_k8m800_fifo_threshold_select[] =3D {
+	{ VGA_CRT_IC, 0x68, 0, 3 },
+	{ VGA_CRT_IC, 0x95, 4, 6 }
+};
+
+/* CLE266 and KM400 IGA1 FIFO High Threshold Select */
+static struct vga_regset iga1_cle266_fifo_high_threshold_select[] =3D {
+	{ VGA_SEQ_I, 0x18, 0, 5 }
+};
+
+/* K8M800 or later IGA1 FIFO High Threshold Select */
+static struct vga_regset iga1_k8m800_fifo_high_threshold_select[] =3D {
+	{ VGA_SEQ_I, 0x18, 0, 5 },
+	{ VGA_SEQ_I, 0x18, 7, 7 }
+};
+
+/* IGA2 FIFO High Threshold Select */
+static struct vga_regset iga2_fifo_high_threshold_select[] =3D {
+	{ VGA_CRT_IC, 0x92, 0, 3 },
+	{ VGA_CRT_IC, 0x95, 0, 2 }
+};
+
+/* CLE266 and KM400 IGA1 FIFO Display Queue Expire */
+static struct vga_regset iga1_cle266_display_queue_expire_num[] =3D {
+	{ VGA_SEQ_I, 0x22, 0, 4 }
+};
+
+/* K8M800 and later IGA1 FIFO Display Queue Expire */
+static struct vga_regset iga1_k8m800_display_queue_expire_num[] =3D {
+	{ VGA_SEQ_I, 0x22, 0, 4 }
+};
+
+/* IGA2 FIFO display queue expire */
+static struct vga_regset iga2_display_queue_expire_num[] =3D {
+	{ VGA_CRT_IC, 0x94, 0, 6 }
+};
+
+/***********************************************/
+/************* Offset register *****************/
+/***********************************************/
+
+/* IGA1 Offset Register */
+static struct vga_regset iga1_offset[] =3D {
+	{ VGA_CRT_IC, 0x13, 0, 7 },
+	{ VGA_CRT_IC, 0x35, 5, 7 }
+};
+
+/* IGA2 Offset Register */
+static struct vga_regset iga2_offset[] =3D {
+	{ VGA_CRT_IC, 0x66, 0, 7 },
+	{ VGA_CRT_IC, 0x67, 0, 1 },
+	{ VGA_CRT_IC, 0x71, 7, 7 }
+};
+
+/***********************************************/
+/*********** Fetch count register **************/
+/***********************************************/
+
+/* IGA1 Fetch Count Register */
+static struct vga_regset iga1_fetch_count[] =3D {
+	{ VGA_SEQ_I, 0x1C, 0, 7 },
+	{ VGA_SEQ_I, 0x1D, 0, 1 }
+};
+
+/* IGA2 Fetch Count Register */
+static struct vga_regset iga2_fetch_count[] =3D {
+	{ VGA_CRT_IC, 0x65, 0, 7 },
+	{ VGA_CRT_IC, 0x67, 2, 3 }
+};
+
+/************************************************/
+/*********** IGA Scaling Factor Registers *******/
+/************************************************/
+#define LCD_HOR_SCALE_FACTOR_FORMULA(x, y)	(((x - 1) * 4096) / (y - 1))
+#define LCD_VER_SCALE_FACTOR_FORMULA(x, y)	(((x - 1) * 2048) / (y - 1))
+
+static struct vga_regset lcd_hor_scaling[] =3D {
+	{ VGA_CRT_IC, 0x9F, 0, 1 },
+	{ VGA_CRT_IC, 0x77, 0, 7 },
+	{ VGA_CRT_IC, 0x79, 4, 5 }
+};
+
+static struct vga_regset lcd_ver_scaling[] =3D {
+	{ VGA_CRT_IC, 0x79, 3, 3 },
+	{ VGA_CRT_IC, 0x78, 0, 7 },
+	{ VGA_CRT_IC, 0x79, 6, 7 }
+};
+
+/***********************************************/
+/*********** CRTC timing register **************/
+/***********************************************/
+
+/***************************************************/
+/* Definition IGA1 Design Method of CRTC Registers */
+/***************************************************/
+#define IGA1_HOR_TOTAL_FORMULA(x)	(x / 8) - 5
+#define IGA1_HOR_ADDR_FORMULA(x)	(x / 8) - 1
+#define IGA1_HOR_BLANK_START_FORMULA(x)	(x / 8) - 1
+#define IGA1_HOR_BLANK_END_FORMULA(x)	(x / 8) - 1
+#define IGA1_HOR_SYNC_START_FORMULA(x)	(x / 8) - 1
+#define IGA1_HOR_SYNC_END_FORMULA(x)	(x / 8) - 1
+
+#define IGA1_VER_TOTAL_FORMULA(x)	(x - 2)
+#define IGA1_VER_ADDR_FORMULA(x)	(x - 1)
+#define IGA1_VER_BLANK_START_FORMULA(x)	(x - 1)
+#define IGA1_VER_BLANK_END_FORMULA(x)	(x - 1)
+#define IGA1_VER_SYNC_START_FORMULA(x)	(x - 1)
+#define IGA1_VER_SYNC_END_FORMULA(x)	(x - 1)
+
+/***************************************************/
+/* Definition IGA2 Design Method of CRTC Registers */
+/***************************************************/
+#define IGA2_HOR_TOTAL_FORMULA(x)	(x - 1)
+#define IGA2_HOR_ADDR_FORMULA(x)	(x - 1)
+#define IGA2_HOR_BLANK_START_FORMULA(x)	(x - 1)
+#define IGA2_HOR_BLANK_END_FORMULA(x)	(x - 1)
+#define IGA2_HOR_SYNC_START_FORMULA(x)	(x - 1)
+#define IGA2_HOR_SYNC_END_FORMULA(x)	(x - 1)
+
+#define IGA2_VER_TOTAL_FORMULA(x)	(x - 1)
+#define IGA2_VER_ADDR_FORMULA(x)	(x - 1)
+#define IGA2_VER_BLANK_START_FORMULA(x)	(x - 1)
+#define IGA2_VER_BLANK_END_FORMULA(x)	(x - 1)
+#define IGA2_VER_SYNC_START_FORMULA(x)	(x - 1)
+#define IGA2_VER_SYNC_END_FORMULA(x)	(x - 1)
+
+/****************************************************************/
+/* Definition IGA1 Design Method of CRTC Pixel timing Registers	*/
+/****************************************************************/
+#define IGA1_PIXELTIMING_HOR_TOTAL_FORMULA(x)		(x - 1)
+#define IGA1_PIXELTIMING_HOR_ADDR_FORMULA(x)		(x - 1)
+#define IGA1_PIXELTIMING_HOR_BLANK_START_FORMULA(x)	(x - 1)
+#define IGA1_PIXELTIMING_HOR_BLANK_END_FORMULA(x)	(x - 1)
+#define IGA1_PIXELTIMING_HOR_SYNC_START_FORMULA(x)	(x - 1)
+#define IGA1_PIXELTIMING_HOR_SYNC_END_FORMULA(x)	(x - 1)
+
+#define IGA1_PIXELTIMING_VER_TOTAL_FORMULA(x)		(x - 2)
+#define IGA1_PIXELTIMING_VER_ADDR_FORMULA(x)		(x - 1)
+#define IGA1_PIXELTIMING_VER_BLANK_START_FORMULA(x)	(x - 1)
+#define IGA1_PIXELTIMING_VER_BLANK_END_FORMULA(x)	(x - 1)
+#define IGA1_PIXELTIMING_VER_SYNC_START_FORMULA(x)	(x - 1)
+#define IGA1_PIXELTIMING_VER_SYNC_END_FORMULA(x)	(x - 1)
+
+#define IGA1_PIXELTIMING_HVSYNC_OFFSET_END_FORMULA(x, y)	\
+	((x / 2) - 1 - (x - y))
+
+/************************************************/
+/*      Define IGA1 Display Timing              */
+/************************************************/
+
+/* IGA1 Horizontal Total */
+static struct vga_regset iga1_hor_total[] =3D {
+	{ VGA_CRT_IC, 0x00, 0, 7 },
+	{ VGA_CRT_IC, 0x36, 3, 3 }
+};
+
+/* IGA1 Horizontal Addressable Video */
+static struct vga_regset iga1_hor_addr[] =3D {
+	{ VGA_CRT_IC, 0x01, 0, 7 },
+	{ VGA_CRT_IC, 0x45, 1, 1 }
+};
+
+/* IGA1 Horizontal Blank Start */
+static struct vga_regset iga1_hor_blank_start[] =3D {
+	{ VGA_CRT_IC, 0x02, 0, 7 },
+	{ VGA_CRT_IC, 0x45, 2, 2 }
+};
+
+/* IGA1 Horizontal Blank End */
+static struct vga_regset iga1_hor_blank_end[] =3D {
+	{ VGA_CRT_IC, 0x03, 0, 4 },
+	{ VGA_CRT_IC, 0x05, 7, 7 },
+	{ VGA_CRT_IC, 0x33, 5, 5 }
+};
+
+/* IGA1 Horizontal Sync Start */
+static struct vga_regset iga1_hor_sync_start[] =3D {
+	{ VGA_CRT_IC, 0x04, 0, 7 },
+	{ VGA_CRT_IC, 0x33, 4, 4 }
+};
+
+/* IGA1 Horizontal Sync End */
+static struct vga_regset iga1_hor_sync_end[] =3D {
+	{ VGA_CRT_IC, 0x05, 0, 4 }
+};
+
+/* IGA1 Vertical Total */
+static struct vga_regset iga1_ver_total[] =3D {
+	{ VGA_CRT_IC, 0x06, 0, 7 },
+	{ VGA_CRT_IC, 0x07, 0, 0 },
+	{ VGA_CRT_IC, 0x07, 5, 5 },
+	{ VGA_CRT_IC, 0x35, 0, 0 }
+};
+
+/* IGA1 Vertical Addressable Video */
+static struct vga_regset iga1_ver_addr[] =3D {
+	{ VGA_CRT_IC, 0x12, 0, 7 },
+	{ VGA_CRT_IC, 0x07, 1, 1 },
+	{ VGA_CRT_IC, 0x07, 6, 6 },
+	{ VGA_CRT_IC, 0x35, 2, 2 }
+};
+
+/* IGA1 Vertical Blank Start */
+static struct vga_regset iga1_ver_blank_start[] =3D {
+	{ VGA_CRT_IC, 0x15, 0, 7 },
+	{ VGA_CRT_IC, 0x07, 3, 3 },
+	{ VGA_CRT_IC, 0x09, 5, 5 },
+	{ VGA_CRT_IC, 0x35, 3, 3 }
+};
+
+/* IGA1 Vertical Blank End */
+static struct vga_regset iga1_ver_blank_end[] =3D {
+	{ VGA_CRT_IC, 0x16, 0, 7 }
+};
+
+/* IGA1 Vertical Sync Start */
+static struct vga_regset iga1_ver_sync_start[] =3D {
+	{ VGA_CRT_IC, 0x10, 0, 7 },
+	{ VGA_CRT_IC, 0x07, 2, 2 },
+	{ VGA_CRT_IC, 0x07, 7, 7 },
+	{ VGA_CRT_IC, 0x35, 1, 1 }
+};
+
+/* IGA1 Vertical Sync End */
+static struct vga_regset iga1_ver_sync_end[] =3D {
+	{ VGA_CRT_IC, 0x11, 0, 3 }
+};
+
+/************************************************/
+/*      Define IGA2 Display Timing              */
+/************************************************/
+
+/* IGA2 Horizontal Total */
+static struct vga_regset iga2_hor_total[] =3D {
+	{ VGA_CRT_IC, 0x50, 0, 7 },
+	{ VGA_CRT_IC, 0x55, 0, 3 }
+};
+
+/* IGA2 Horizontal Addressable Video */
+static struct vga_regset iga2_hor_addr[] =3D {
+	{ VGA_CRT_IC, 0x51, 0, 7 },
+	{ VGA_CRT_IC, 0x55, 4, 6 },
+	{ VGA_CRT_IC, 0x55, 7, 7 }
+};
+
+/* IGA2 Horizontal Blank Start */
+static struct vga_regset iga2_hor_blank_start[] =3D {
+	{ VGA_CRT_IC, 0x52, 0, 7 },
+	{ VGA_CRT_IC, 0x54, 0, 2 },
+	{ VGA_CRT_IC, 0x6B, 0, 0 }
+};
+
+/* IGA2 Horizontal Blank End */
+static struct vga_regset iga2_hor_blank_end[] =3D {
+	{ VGA_CRT_IC, 0x53, 0, 7 },
+	{ VGA_CRT_IC, 0x54, 3, 5 },
+	{ VGA_CRT_IC, 0x5D, 6, 6 }
+};
+
+/* IGA2 Horizontal Sync Start */
+static struct vga_regset iga2_hor_sync_start[] =3D {
+	{ VGA_CRT_IC, 0x56, 0, 7 },
+	{ VGA_CRT_IC, 0x54, 6, 7 },
+	{ VGA_CRT_IC, 0x5C, 7, 7 },
+	{ VGA_CRT_IC, 0x5D, 7, 7 }
+};
+
+/* IGA2 Horizontal Sync End */
+static struct vga_regset iga2_hor_sync_end[] =3D {
+	{ VGA_CRT_IC, 0x57, 0, 7 },
+	{ VGA_CRT_IC, 0x5C, 6, 6 }
+};
+
+/* IGA2 Vertical Total */
+static struct vga_regset iga2_ver_total[] =3D {
+	{ VGA_CRT_IC, 0x58, 0, 7 },
+	{ VGA_CRT_IC, 0x5D, 0, 2 }
+};
+
+/* IGA2 Vertical Addressable Video */
+static struct vga_regset iga2_ver_addr[] =3D {
+	{ VGA_CRT_IC, 0x59, 0, 7 },
+	{ VGA_CRT_IC, 0x5D, 3, 5 }
+};
+
+/* IGA2 Vertical Blank Start */
+static struct vga_regset iga2_ver_blank_start[] =3D {
+	{ VGA_CRT_IC, 0x5A, 0, 7 },
+	{ VGA_CRT_IC, 0x5C, 0, 2 }
+};
+
+/* IGA2 Vertical Blank End */
+static struct vga_regset iga2_ver_blank_end[] =3D {
+	{ VGA_CRT_IC, 0x5B, 0, 7 },
+	{ VGA_CRT_IC, 0x5C, 3, 5 }
+};
+
+/* IGA2 Vertical Sync Start */
+static struct vga_regset iga2_ver_sync_start[] =3D {
+	{ VGA_CRT_IC, 0x5E, 0, 7 },
+	{ VGA_CRT_IC, 0x5F, 5, 7 }
+};
+
+/* IGA2 Vertical Sync End */
+static struct vga_regset iga2_ver_sync_end[] =3D {
+	{ VGA_CRT_IC, 0x5F, 0, 4 }
+};
+
+/* IGA1 pixel timing Registers */
+#define	IGA1_PIX_H_TOTAL_REG		0x8400		/* [15:0]  */
+#define	IGA1_PIX_H_ADDR_REG		0x8400		/* [31:16] */
+#define	IGA1_PIX_H_BNK_ST_REG		0x8404		/* [15:0]  */
+#define	IGA1_PIX_H_BNK_END_REG		0x8404		/* [31:16] */
+#define	IGA1_PIX_H_SYNC_ST_REG		0x8408		/* [15:0]  */
+#define	IGA1_PIX_H_SYNC_END_REG		0x8408		/* [31:16] */
+#define	IGA1_PIX_V_TOTAL_REG		0x8424		/* [10:0]  */
+#define	IGA1_PIX_V_ADDR_REG		0x8424		/* [26:16] */
+#define	IGA1_PIX_V_BNK_ST_REG		0x8428		/* [10:0]  */
+#define	IGA1_PIX_V_BNK_END_REG		0x8428		/* [26:16] */
+#define	IGA1_PIX_V_SYNC_ST_REG		0x842C		/* [10:0]  */
+#define	IGA1_PIX_V_SYNC_END_REG		0x842C		/* [15:12] */
+#define	IGA1_PIX_HALF_LINE_REG		0x8434		/* [15:0]  */
+
+#define	IGA1_PIX_H_TOTAL_MASK		0x0000FFFF	/* [15:0]  */
+#define	IGA1_PIX_H_ADDR_MASK		0xFFFF0000	/* [31:16] */
+#define	IGA1_PIX_H_BNK_ST_MASK		0x0000FFFF	/* [15:0]  */
+#define	IGA1_PIX_H_BNK_END_MASK		0xFFFF0000	/* [31:16] */
+#define	IGA1_PIX_H_SYNC_ST_MASK		0x0000FFFF	/* [15:0]  */
+#define	IGA1_PIX_H_SYNC_END_MASK	0xFFFF0000	/* [31:16] */
+#define	IGA1_PIX_V_TOTAL_MASK		0x000007FF	/* [10:0]  */
+#define	IGA1_PIX_V_ADDR_MASK		0x07FF0000	/* [26:16] */
+#define	IGA1_PIX_V_BNK_ST_MASK		0x000007FF	/* [10:0]  */
+#define	IGA1_PIX_V_BNK_END_MASK		0x07FF0000	/* [26:16] */
+#define	IGA1_PIX_V_SYNC_ST_MASK		0x000007FF	/* [10:0]  */
+#define	IGA1_PIX_V_SYNC_END_MASK	0x0000F000	/* [15:12] */
+#define	IGA1_PIX_HALF_LINE_MASK		0x0000FFFF	/* [15:0]  */
+
+#endif
=2D-
2.35.1

