Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45665160CF7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E136E85A;
	Mon, 17 Feb 2020 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D176FA79
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696639;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=87P0OD8XaKZo4miCqHORxCklVwyh7VqETa9wtLbJ/YE=;
 b=qxv/+h99QwgTwZc05a6ooHjegDY8pTzsw4ixl/N2L/Fi3yNH1clbnbJYQ/iSAUkTYx
 Ojtpqdct8jzY6bfunElunrksdiYNO18TgoIfFY8J+XB6W0h+TakRESNkHJWp4/DFhTw+
 QCHfCbsqQHyFPlFA5iofZcqCq4BT3Bx4bz9fDOGiDt2WNdmm75pVwxr3+7nNaN3JrctO
 K/ltkHaLBvuNVSTcHAp9ktcl/q/PJMxLJkEOa5kQAGtJN2w5BlP7uLoqehOxHKW1Q8Gb
 7uSnGIX84FihIRMaAj/a763kXoDTwhmhY03ZBjXW9XXBOO+HRrekGNb61e+5Y3s9rvkG
 VWvA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1EGAWFl6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 14 Feb 2020 17:10:32 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Boddie <paul@boddie.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andi Kleen <ak@linux.intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 11/12] MIPS: CI20: defconfig: configure for
 CONFIG_KEYBOARD_GPIO=m
Date: Fri, 14 Feb 2020 17:10:23 +0100
Message-Id: <7f4bd0fa642e6a1d2143787a0452889297a888de.1581696624.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SW1 button is hooked up to send input events.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 0458ea4d54e8..0db0088bbc1c 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -89,6 +89,7 @@ CONFIG_I2C_JZ4780=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
+CONFIG_KEYBOARD_GPIO=m
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
