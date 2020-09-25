Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C627A80F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC096E2D5;
	Mon, 28 Sep 2020 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BC16EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 13:07:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63E0858019F;
 Fri, 25 Sep 2020 09:07:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 25 Sep 2020 09:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=yfqnMhKpr8pgZ
 AWhPgWiszau1UyetuDjVZE2g4WewhA=; b=aYVBLF5+o78CUOqUinnvgGh0gfBtK
 fPTTttmK+mu+B7Mh/x5qDbcD3tBKidK/PZ5BObkVt5m9hHbFzxDQCD+jyt4m2O2E
 3ZmHj3MWpVkv4ve23OMedgOup97h3ry8WccWhrATIyX6WQwGI1sRt6UvMIzCrEzl
 JuXKma+yyDf9VIcqfb9i7AUCJYeoXDMEcxr2EV7hxOmfd9XyBH4HAfPZqCpW+59C
 v1CsP9PV5d4q0zSbD/uX/o4diXZ4z9jZX1VjAW/okaCYYCgD3REq4qZEEvYB1Uac
 uDXwDumsm1eKWRiAhI9JMpA75jtig44Ps+svB/c2or6Of9hJYPhLHfGoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yfqnMhKpr8pgZAWhPgWiszau1UyetuDjVZE2g4WewhA=; b=e/dgkXin
 fnwZIbL0KdRUpkDYU8k8EzYtXmrpqvEedtiI09mUSt7U0rqLs1AlMZNwzKsoXcn1
 EfeEqRhe29xvwE2BP+kPzJ1MfaA7ccNrpcBRikOfGWg5S2dm1nW00+Y4qgvwz5aY
 y/hMPN8XVI8948ZVj5P83lMxI8bMKJBJxIz5yKSZ1v62QPwkoH4kOD+Kl6AjeZI2
 ftfqrkbh6LeTSv39J+4RTx18+rf9UPrCQFwV4m88OnxZP7WziTgMh6Y9p0rpWWGi
 1tf9A0YCNdbdTemdOTrk/8MytJIHjsNDsHX3WaO/GmOMt/K7g0fIyIxhahFOUHYr
 MXh/QNcEW4Ljgg==
X-ME-Sender: <xms:pOttXyC71Xi5RBLCbyFJRbA39GPNfKO4pDJSEchPbtJmTua5aBm2yw>
 <xme:pOttX8iIlQJqjC0Llo7leNi36JM4VMGAVTLtx6bK_7U7UGJ3iez07j2eDw7h5V82U
 4CCX7VPW5UfLj-msZ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pOttX1lFT_I7GJH3Qcf-dTc1atGvwsKeqIPOv5k7txsH99PNZxUrxw>
 <xmx:pOttXwzp_cRNYXkjISjhltfgBFjZ9xFVeqTD3_0knyk8fZC-o3-YWw>
 <xmx:pOttX3TG0HrlFEcoJviOh2Ov5TZyMmZOUdPygzLfiHZiHAbzl_K_zg>
 <xmx:pOttXzpbuXhEFM3DUL9Wi8jgmf3IYVcLFNVVZ-xV2EQrpLqqqnMrDg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2CE23064684;
 Fri, 25 Sep 2020 09:07:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/2] ARM: dts: rpi-4: disable wifi frequencies
Date: Fri, 25 Sep 2020 15:07:44 +0200
Message-Id: <20200925130744.575725-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200925130744.575725-1-maxime@cerno.tech>
References: <20200925130744.575725-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RPi4 WiFi chip and HDMI outputs have some frequency overlap with
crosstalk around 2.4GHz. Let's mark it as such so we can use some evasive
maneuvers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index ca24c2c737ab..1b739c3a9a12 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -174,12 +174,14 @@ &gpio {
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	raspberrypi,disable-wifi-frequencies;
 	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	raspberrypi,disable-wifi-frequencies;
 	status = "okay";
 };
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
