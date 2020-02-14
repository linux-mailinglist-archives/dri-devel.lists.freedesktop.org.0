Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD43160D10
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78E36E88B;
	Mon, 17 Feb 2020 08:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FFA6FA7A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696638;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=3bosFD/maVT7s0PxPwS4PL1iP9bgaYLTqR2vJvqzmIk=;
 b=mgBIsiahrMBQxmsFFA0qGkIe9qtk2ymZQ9GunaZCHcgn3sy/UWK6Gyu3yy9ZHQhvue
 NBCZjo6EsUjyvUlejjPN5YBKEHVbLfe2KSkB8ynqgTGdrEqn5Q/xtNqjOYmOucJZJvTt
 J4AQsbwZTLiTvF5Lym9i/1x029z8VwOE68TS1LYzADFbe7q9inMSDZzjduXkw0zke87L
 n690+bmSyEWyZJbqnlr8d2Kg+UFRWO5Fm/PxbiVHwTjMt/q02B5nhnT4UrHWTPBAq6bM
 n//46ikbDFlyh/cyLWzS9bwQL+a2xes1CR46kXzCr2XljIpw9l5pSyyZ/CfhSTEfvnz8
 9p/A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1EGAVFl4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 14 Feb 2020 17:10:31 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Boddie <paul@boddie.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andi Kleen <ak@linux.intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 09/12] MIPS: CI20: defconfig: compile gpio-ir driver
Date: Fri, 14 Feb 2020 17:10:21 +0100
Message-Id: <e754e1cbb4504123a97fcf044e892afd2ed8abc8.1581696624.git.hns@goldelico.com>
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

The CI20 board has a gpio based IR receiver.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 74e5775b8a05..0458ea4d54e8 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -181,3 +181,8 @@ CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_LEDS_TRIGGER_CAMERA=m
+CONFIG_LIRC=y
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_RC_DEVICES=y
+CONFIG_IR_GPIO_CIR=m
+CONFIG_IR_GPIO_TX=m
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
