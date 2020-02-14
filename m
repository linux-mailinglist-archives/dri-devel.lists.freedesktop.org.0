Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BDA160CF4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BF86E84F;
	Mon, 17 Feb 2020 08:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EAB6FA78
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696637;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=tc4xhvDjnfG1jLVOTwuj+X2pkCzFOljdsKLqfh9DWVg=;
 b=pXug1D/7b/6lC9o+2qzYQcxCVR+cVRLzbIIwdCOOInKRrHYX0aYhNiYGvgJnzTJ6mx
 kDs7YYrWAamIcVSApa0R81m0Wxv3wfWczhp8ziWX8NaneLz7CkQPm8nWHborbtzAbKfi
 o9ZxALSWgQ0yqRTdNMHPY0i7ZTFmVSCW/jp8B+TFgeLExuNtCmmh3pNoL/ZSY+IUzP1a
 56jV1YvityS9Svl5OMPsX57tUx0MxsOKDlkOj9geA6YBm5fy8f+2fPt6MgLdEdz4D+v+
 K2l/o47kP/NCwBgJJF6H5Di0M5hvH0rFo1i2bW5EdOPa719snkX0i8sPiIHewkw3gjqQ
 hufw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1EGASFkz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 14 Feb 2020 17:10:28 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Boddie <paul@boddie.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andi Kleen <ak@linux.intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 04/12] MIPS: CI20: defconfig: compile leds-gpio driver into
 the kernel and configure for LED triggers
Date: Fri, 14 Feb 2020 17:10:16 +0100
Message-Id: <4a4e7f7a7d3cbb7a65134091e9f64aab6ff10482.1581696624.git.hns@goldelico.com>
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

DTS has been augmented to add some gpio-leds. We need the leds-gpio driver
and enable the triggers.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index e0d3c9d4c2ae..30a47a7a2994 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -167,3 +167,16 @@ CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon console=ttyS4,115200 clk_ignore_unused"
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_MTD=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=m
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_TRANSIENT=y
+CONFIG_LEDS_TRIGGER_CAMERA=m
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
