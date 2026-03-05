Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG2XOLPGqWmcEgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:08:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B509C216CF7
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65AA10EC57;
	Thu,  5 Mar 2026 18:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="kMv2HY+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B807510EC52
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=xwcBePG6sNEWpweHlUmZfJdvbnJloC7mT6REuR9qIdg=; b=kMv2HY+1obgYipx2KcnUAI0XkT
 G1MkYihwMB3+mXfQa7DLo4swsyYB18cXuSzq4YZRGvouNab9u01r/9O1esZ1bAYG+oBizkeW9yYHE
 7iSeAvYZyw4FU4xNyU3iaCb93MjCIfNFrIEhHEeFGqp8Qn87OJKySnRKcvq0WQZ8MPQA=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vyD7k-0002aR-6E; Thu, 05 Mar 2026 13:08:36 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, hugo@hugovil.com,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Thu,  5 Mar 2026 13:06:23 -0500
Message-ID: <20260305180651.1827087-9-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
Subject: [PATCH v2 08/15] ARM: dts: imx6ul-var-som-concerto: order DT
 properties
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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
X-Rspamd-Queue-Id: B509C216CF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=x];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[hugovil.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hugo@hugovil.com,m:hvilleneuve@dimonoff.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,nxp.com,pengutronix.de,bootlin.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

reorder pinctrl_gpio_leds to respect alphabetical order.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
index 1cf4a4d6495f2..d40264b553240 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
@@ -140,18 +140,18 @@ MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
 		>;
 	};
 
-	pinctrl_gpio_leds: gpio-ledsgrp {
-		fsl,pins = <
-			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
-		>;
-	};
-
 	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
 		fsl,pins = <
 			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
 		>;
 	};
 
+	pinctrl_gpio_leds: gpio-ledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
+		>;
+	};
+
 	pinctrl_pwm4: pwm4grp {
 		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
-- 
2.47.3

