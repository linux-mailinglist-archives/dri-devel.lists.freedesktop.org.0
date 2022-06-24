Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B168855A2AB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616B210F27C;
	Fri, 24 Jun 2022 20:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FC410F2BA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102770;
 bh=JYmN/df28yY4gLXLIhAX5mM+5FlGHKS7OLg9tWNIxgU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CTbbtVhlwUmXHtalfvpQCcqbu0svF6JLaaiNDHdumGLicdrsR7RDaGPmwNfe8GKVi
 q51Ox7VCUfOEvf0QU5ILk+7FmJp8zNopFCym4HiCxcqYKIzHxjp/9wO22Tok5zu5gL
 UvIVKHpQ5efNqpgVRX30UU35RoJ+CDo/f3aUfw4o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MdNY2-1nVmCZ1E9Y-00ZMSI; Fri, 24 Jun 2022 22:27:48 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/28] drm/via: Add via_crtc_hw.c
Date: Fri, 24 Jun 2022 15:26:12 -0500
Message-Id: <20220624202633.3978-8-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6xB3hZP6jHjhUYwCs8oqhjjOR7jDV6a4FEeMLMwgKb5rwTurct7
 SL9kAzRknxX5XuqYM0p7OjoPLKjs21l1azG2jdQmAbQVRG22/d/3O5ESc9+5Wd6LhLm7kep
 3ebNXePWssb3T8I8/JSXoZBpStQS/H8oUE9fhgNuKKk1IrbT2pBh07W0okqVW5BezuFGDnt
 1Hr/g4Fwyr579fmlmaKTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9wWANpGWyHM=:z0MQNb1RfTM5R3t5ztfaxh
 8Zdrr8v6GjKSL1N8C9SLzQqS93d7KdMKKhrhvLkGIR4i1xVDh7ErU6nItuvtgGlzxvkP8xVnx
 sgDlZWXJuTBQMoGToGxHlkVyIFKFSnURCJAARydFRg5UpGKGYvVGPJlD2rUh24pnlDmkr+0gr
 50W3yvt9SJEN6fI/Iz9Fk/8BXPry+NRLX4U9WHiRYVSWz8NFBpnqPJcB791Bik10epKcT/rDw
 TFmTw5wdJ/WS9Dl+ZVyvFH6l3EhbZsstxfaPHa/F7wzSYVUaUC8LbLzEtK1ieknl2+FvGL0xn
 5/m1jFQdpQGOFTvQFbyk0Nyw0C+YT7MMx0X2344nLSDibF8Wq77nTTBs+weP8QZ91Nb9iqP3b
 ekd8+9LgEAHvU9AUzVCd+05ig2CKa3k6eAynfEb+6WyzTY3KSOSPqcFHckYkqvQVcscA9kQxj
 Z4X0CXSYbDTg5Goxcubjt1mzQSzF0tfyrAzPRSDJ9aNbTwZoKI6sFlUNq1stUyzHBYACQ7xnT
 v9u5AEnwoZDvZNRtT+5dpThbSgwS5MHYY6JwLB9g2IBPav4q/vPb2xLqqmh/3xkFAHXXWubK4
 5CgGzvrJ/zi/woJNUaUCWlEvevlAk7IeT/XelosLAYLR+23Lg5z8yTFl2RczV6c27V3hIRaHb
 UbKpwKgv9+QciNtlirqyD2eqVvpNlk+fVOlgyrVspUInjgzHtGBLhvsSLOQTFJ/wnXs6EqN+U
 fxuyaeQgvrO6Npm5jeA15+liU4kNJbqiogTCxvaE7F/6hxM/olg3ora5AF7pI18tYdyXMgI2e
 yPH9yFtMlebaF9FcYJ1dO5KK8kdbu/Qqx38KMlbcOx1GG/jvYRijNKKLk19KxsRb1U3YPGVD+
 BQqxi3mXNe62OJa4juMy0pMlsxMp55NqLHdEJM3Nd3ecmMTis7Xu6VbK0yE+EzvODOz9ND/CX
 JLfXvMPqqc4/RTeYTRYpk43WgoKk3pdT39noTduW4lDtHkrI5HmzxLevAh8yfffdQzgsjCaCn
 YO4sgKoWyupVPz3je77EigI63b1k6YPXQddW4aqeqxwhACNGwH+hx+DL0uGz5MflGz3GQBzPt
 tGUQxXoxPEW+2hz6Fqkg0WX2qH+TBNr29W0qu201CsC8wkPz/vVCUQrAg==
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
 drivers/gpu/drm/via/via_crtc_hw.c | 91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_crtc_hw.c

diff --git a/drivers/gpu/drm/via/via_crtc_hw.c b/drivers/gpu/drm/via/via_c=
rtc_hw.c
new file mode 100644
index 000000000000..f5446da52c0f
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_crtc_hw.c
@@ -0,0 +1,91 @@
+/*
+ * Copyright 2012 James Simmons. All Rights Reserved.
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
+ *
+ * Author(s):
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <video/vga.h>
+
+#include "via_crtc_hw.h"
+
+/*
+ * load_register_table enables the ability to set entire
+ * tables of registers. For each register defined by the
+ * port and the index for that register is programmed
+ * with a masked value.
+ */
+void
+load_register_tables(void __iomem *regbase, struct vga_registers *regs)
+{
+	u8 cr_index, orig, reg_mask, data;
+	unsigned int i;
+	u16 port;
+
+	for (i =3D 0; i < regs->count; i++) {
+		reg_mask =3D regs->regs[i].start_bit;
+		data =3D regs->regs[i].end_bit;
+		cr_index =3D regs->regs[i].io_addr;
+		port =3D regs->regs[i].ioport;
+
+		vga_w(regbase, port, cr_index);
+		orig =3D (vga_r(regbase, port + 1) & ~reg_mask);
+		vga_w(regbase, port + 1, ((data & reg_mask) | orig));
+	}
+}
+
+/*
+ * Due to the limitation of how much data you can write to a single
+ * register we run into data that can't be written in only one register.
+ * So load_value_to_register was developed to be able to define register
+ * tables that can load different bit ranges of the data to different
+ * registers.
+ */
+void
+load_value_to_registers(void __iomem *regbase, struct vga_registers *regs=
,
+			unsigned int value)
+{
+	unsigned int bit_num =3D 0, shift_next_reg, reg_mask;
+	u8 start_index, end_index, cr_index, orig;
+	unsigned int data, i, j;
+	u16 get_bit, port;
+
+	for (i =3D 0; i < regs->count; i++) {
+		start_index =3D regs->regs[i].start_bit;
+		end_index =3D regs->regs[i].end_bit;
+		cr_index =3D regs->regs[i].io_addr;
+		port =3D regs->regs[i].ioport;
+		reg_mask =3D data =3D 0;
+
+		shift_next_reg =3D bit_num;
+		for (j =3D start_index; j <=3D end_index; j++) {
+			reg_mask =3D reg_mask | (1 << j);
+			get_bit =3D (value & (1 << bit_num));
+			data |=3D ((get_bit >> shift_next_reg) << start_index);
+			bit_num++;
+		}
+
+		vga_w(regbase, port, cr_index);
+		orig =3D (vga_r(regbase, port + 1) & ~reg_mask);
+		vga_w(regbase, port + 1, ((data & reg_mask) | orig));
+	}
+}
=2D-
2.35.1

