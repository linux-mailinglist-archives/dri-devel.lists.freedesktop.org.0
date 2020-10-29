Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647029FFB4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC786E98A;
	Fri, 30 Oct 2020 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF236E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:40:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5359C5807A6;
 Thu, 29 Oct 2020 09:40:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 09:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=AlPaKbObCf1UP
 OhToR/2CHjxPwe8x1lxL13BLb8N0m8=; b=O1sy2dccVDRs+OelKQXpo0+TMXiO0
 ubUg58/Tk+0KqS5Y4bbE4W2dyaGuaSOYzqBFvzXqTE2Wbue56QffxFonqAEPHqQI
 LF5TFTywdaFERfWskqMQUxv/2tcNwdPeNZ4AEyXV/dXdEUcizpg2f4DN0eshOAN+
 ISRiwrgX506iGO6ffZCWlDneK3qJMsxrZsyRZaUifnkBZE15/qwuo/JEx6eBWoox
 fmjZrRhStO8bLWCilqzzXRkYSpdEpRIUfmo14DK47IYBVE7bOpoAdl7lLAgmOmQM
 Ppz4FRPWObelTvT5NG8yLPqQZ7oF2iEb8hRlmioV1hnm+XNmWMGCR5rbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=AlPaKbObCf1UPOhToR/2CHjxPwe8x1lxL13BLb8N0m8=; b=PvwbvD56
 MBmXbtIOi4oIJrnzx1EvZOZoaizj67vpI86QpZxwj5qJiBqu2PquJGUfWjuu68UR
 19mICNQeCUhlUypdh+FS5JUzq5UfjZaHurQixcDuI6kY9FELdLjKDCYTpssnoI9o
 85Wk8Pzo9EIzrCHYuvqIZGEZc49ofB9fp/s4hZtxdMvM8WCLc78t4lN34S36W9g8
 URLBy2ua9lwUEjxh2KMKMJdcGsPTSFJ0fW8Nmlws7Ox87ImUMQYVbG4LnzcyoMPy
 5msx/YD++7i0AWEgtUcw5AlfIEqzb+nqsWg0FRcbxBI9YUQn5AJGnHEAGe4iJPr4
 dPO0/GuTVYJPGQ==
X-ME-Sender: <xms:SMaaX1HqUgSOELFphaGf1_sxtBQ8PNiXNL3Z2wMn7HDZbq_gJHkLbQ>
 <xme:SMaaX6WmdN6KveWEAPEf53G2FZO6FRLwq25QzQi4hPn7gt64Pz9A9JdGgCXStTzaq
 gogYgr4Wg4ipmxqPlU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SMaaX3KK3zI0Lef-R3Dn9wkOTNLSRbFsIz7y4-SFUELwdukQ9lw0zA>
 <xmx:SMaaX7HKi0H8ozszhG7t1EnqEfg8St9s1yTe9JeTJ5EIbW_ctJhOng>
 <xmx:SMaaX7UXEBap3_Y--k1qaaaYbRDgAzAgUxq8OE-6mwVSTDo5ocr3CA>
 <xmx:SMaaX0UzUVrwwZ-TgKvYc4zkBm0yLiz4Z6GiuIpJJyIPiR_2LsN3DQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C524B3280060;
 Thu, 29 Oct 2020 09:40:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 3/3] ARM: dts: rpi-4: disable wifi frequencies
Date: Thu, 29 Oct 2020 14:40:18 +0100
Message-Id: <20201029134018.1948636-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029134018.1948636-1-maxime@cerno.tech>
References: <20201029134018.1948636-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RPi4 WiFi chip and HDMI outputs have some frequency overlap with
crosstalk around 2.4GHz. Let's mark it as such so we can use some evasive
maneuvers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Changed the property name
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 09a1182c2936..403bacf986eb 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -181,12 +181,14 @@ &gpio {
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	wifi-2.4ghz-coexistence;
 	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	wifi-2.4ghz-coexistence;
 	status = "okay";
 };
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
