Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC4897F33
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 07:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9B710F583;
	Thu,  4 Apr 2024 05:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7304112C00
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 05:10:32 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id AEDF81C0B3E;
 Thu,  4 Apr 2024 14:01:18 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo <shawnguo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 David Rientjes <rientjes@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Javier Martinez Canillas <javierm@redhat.com>, Guo Ren <guoren@kernel.org>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v7 23/37] dt-bindings: display: sm501 register definition
 helper
Date: Thu,  4 Apr 2024 14:00:02 +0900
Message-Id: <dac98a697c8e850054f984964af62a209f241c83.1712205900.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712205900.git.ysato@users.sourceforge.jp>
References: <cover.1712205900.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Miscellaneous Timing and Miscellaneous Control registers definition.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/dt-bindings/display/sm501.h | 76 +++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 include/dt-bindings/display/sm501.h

diff --git a/include/dt-bindings/display/sm501.h b/include/dt-bindings/display/sm501.h
new file mode 100644
index 000000000000..a6c6943642e4
--- /dev/null
+++ b/include/dt-bindings/display/sm501.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef __DT_BINDING_DISPALY_SM501__
+#define __DT_BINDING_DISPALY_SM501__
+
+/* Miscellaneous Conntrol */
+#define SM501_MISC_CONTROL_PAD_24	0
+#define SM501_MISC_CONTROL_PAD_12	1
+#define SM501_MISC_CONTROL_PAD_8	2
+
+#define SM501_MISC_CONTROL_USBCLK_XTAL	0
+#define SM501_MISC_CONTROL_USBCLK_96MHZ	1
+#define SM501_MISC_CONTROL_USBCLK_48MHZ	2
+
+#define SM501_MISC_CONTROL_RFSH_8US	0
+#define SM501_MISC_CONTROL_RFSH_16US	1
+#define SM501_MISC_CONTROL_RFSH_32US	2
+#define SM501_MISC_CONTROL_RFSH_64US	3
+
+#define SM501_MISC_CONTROL_HOLD_EMPTY	0
+#define SM501_MISC_CONTROL_HOLD_8TR	1
+#define SM501_MISC_CONTROL_HOLD_16TR	2
+#define SM501_MISC_CONTROL_HOLD_24TR	3
+#define SM501_MISC_CONTROL_HOLD_32TR	4
+
+/* Miscellaneous timing */
+#define SM501_MISC_TIMING_EX_HOLD_0	0
+#define SM501_MISC_TIMING_EX_HOLD_16	1
+#define SM501_MISC_TIMING_EX_HOLD_32	2
+#define SM501_MISC_TIMING_EX_HOLD_48	3
+#define SM501_MISC_TIMING_EX_HOLD_64	4
+#define SM501_MISC_TIMING_EX_HOLD_80	5
+#define SM501_MISC_TIMING_EX_HOLD_96	6
+#define SM501_MISC_TIMING_EX_HOLD_112	7
+#define SM501_MISC_TIMING_EX_HOLD_128	8
+#define SM501_MISC_TIMING_EX_HOLD_144	9
+#define SM501_MISC_TIMING_EX_HOLD_160	10
+#define SM501_MISC_TIMING_EX_HOLD_176	11
+#define SM501_MISC_TIMING_EX_HOLD_192	12
+#define SM501_MISC_TIMING_EX_HOLD_208	13
+#define SM501_MISC_TIMING_EX_HOLD_224	14
+#define SM501_MISC_TIMING_EX_HOLD_240	15
+
+#define SM501_MISC_TIMING_XC_INTERNAL	0
+#define SM501_MISC_TIMING_XC_HCLK	1
+#define SM501_MISC_TIMING_XC_GPIO	2
+
+#define SM501_MISC_TIMING_SM_DIV1	0
+#define SM501_MISC_TIMING_SM_DIV2	1
+#define SM501_MISC_TIMING_SM_DIV4	2
+#define SM501_MISC_TIMING_SM_DIV8	3
+#define SM501_MISC_TIMING_SM_DIV16	4
+#define SM501_MISC_TIMING_SM_DIV32	5
+#define SM501_MISC_TIMING_SM_DIV64	6
+#define SM501_MISC_TIMING_SM_DIV128	7
+#define SM501_MISC_TIMING_SM_DIV3	8
+#define SM501_MISC_TIMING_SM_DIV6	9
+#define SM501_MISC_TIMING_SM_DIV12	10
+#define SM501_MISC_TIMING_SM_DIV24	11
+#define SM501_MISC_TIMING_SM_DIV48	12
+#define SM501_MISC_TIMING_SM_DIV96	13
+#define SM501_MISC_TIMING_SM_DIV192	14
+#define SM501_MISC_TIMING_SM_DIV384	15
+
+#define SM501_MISC_TIMING_DIV336MHZ	0
+#define SM501_MISC_TIMING_DIV288MHZ	1
+#define SM501_MISC_TIMING_DIV240MHZ	2
+#define SM501_MISC_TIMING_DIV192MHZ	3
+
+#define SM501_MISC_TIMING_DELAY_NONE	0
+#define SM501_MISC_TIMING_DELAY_0_5	1
+#define SM501_MISC_TIMING_DELAY_1_0	2
+#define SM501_MISC_TIMING_DELAY_1_5	3
+#define SM501_MISC_TIMING_DELAY_2_0	4
+#define SM501_MISC_TIMING_DELAY_2_5	5
+
+#endif
-- 
2.39.2

