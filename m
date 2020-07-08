Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E821996B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C0B6EA2D;
	Thu,  9 Jul 2020 07:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72236E288
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:46:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AB1BBDF2;
 Wed,  8 Jul 2020 10:46:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 10:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=4NREBuy0f4ceXTelZ1c05+0MR5
 Jh1oCebiw4dhTmkwo=; b=mrot4VsbtbIj7r651H0GQW8ozK6aAsVAvln1MX6N54
 QVtozd2CTIW9mYGPPKm/Je5lqsm8YKbYhBMuNWglTfKizGwOpXN8iIeKESTVKY1s
 7bp27HpLpRn1K9W/DoKsySCz++H+q20VAeHm3FiQj222DG4R+SXDtOYIXgc5sKfH
 ODTrtiIzRt6GrFKUEjvWCQ5Il8t+jTuSpYHS/A5ZddupCLMKvwI1rknYYGAQH+J5
 qOltWUoI8CH6pAq2vClxvTzQ7lYagIscmL5Rnzni/TD3d9Gim6hLEVh/K2stfA/I
 zxTcasGRdLG8Sdj/iaUwQq9ijk+x6Q15dVW1/0oGJjfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4NREBuy0f4ceXTelZ
 1c05+0MR5Jh1oCebiw4dhTmkwo=; b=AgOptL+0VLoGiDi+SsFyCLLKauc6uq1B0
 an6opM9PmkFNYtzai5noRLpI+37B3e9mCZT7tYDS5kXElctl9n2+Kf/7nXRFJELf
 dfikWSf/8ks3ga8pOJwPNMs3DTGicwOZD72ykDH5NwFl2N0H1sJN7opJ5gwQ6lvQ
 AKgT1+cljjhPvofL0OpiCELOLkiGnql8a157imIcalAefiN+iCJcLnYp48A3AnFW
 grU2zldwFhUNownecpcNWM3zHhxB+YV89e/yI2aJdLjmzMoPP67UhWryRoePLICV
 xxT80fD9hYfHMGcINGU+hlhaKYnuiKHZYIRmaKjeERN0GgnOhfPLw==
X-ME-Sender: <xms:JtwFX97V55PVlIlyO6dbHGZOH_e5AL5nzt3bSUMz4Us28heyXridOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JtwFX66feTj8YlZBr2kQuxlIM311HHmjem0qBUY4pxly-IPAkUOC-Q>
 <xmx:JtwFX0epB2H0zg_666qv-MO06-YwUlMwlkyT77m-2byocavX5SYURg>
 <xmx:JtwFX2JJsBYOF-7qKdqFgDp93qCW0fHcEWtTwmRLrKajhqsEbPAIsg>
 <xmx:KdwFX2pxYtegwssixOJgEGszWwlAeIGYVmXFBnuXM8r9y6-FX9PENzPYfDg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30F7D328005D;
 Wed,  8 Jul 2020 10:45:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/vc4: hdmi: Add a name to the codec DAI component
Date: Wed,  8 Jul 2020 16:45:55 +0200
Message-Id: <20200708144555.718404-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the components for a given device in ASoC are identified by their
name, it makes sense to add one even though it's not strictly necessary.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 15a11cd4de25..a057db0d9baa 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -983,6 +983,7 @@ static const struct snd_soc_dapm_route vc4_hdmi_audio_routes[] = {
 };
 
 static const struct snd_soc_component_driver vc4_hdmi_audio_component_drv = {
+	.name			= "vc4-hdmi-codec-dai-component",
 	.controls		= vc4_hdmi_audio_controls,
 	.num_controls		= ARRAY_SIZE(vc4_hdmi_audio_controls),
 	.dapm_widgets		= vc4_hdmi_audio_widgets,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
