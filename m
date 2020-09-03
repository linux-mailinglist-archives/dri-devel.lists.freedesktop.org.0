Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31ED25D208
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F266EAD9;
	Fri,  4 Sep 2020 07:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487B26E4E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1A702C29;
 Thu,  3 Sep 2020 04:03:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RQL2p0XNTFOVc
 zFS1RiCOdkrFsHPgmafoyYC4B9enjU=; b=HfZajquNfgYrf88rR81bIYG++P5Ub
 naSqUgUW6Uo+ENC7aJO5XfeRXyIXPEFvxJdD6/fYCefemhase7DR38UsvGUQwr4b
 bVnO9QFyfqQ1tMT4h+o5zhcKaRXa4/keTQIhkMFqeJp9mNsc4NNSuLym/26qtJK7
 uQSS5byjSwulhUyUN94gSF/w1zayalWfP6bzKqmBE8bCYlu8YrlUk3MHI68pP124
 MA/s20Sh7Qs2YQeXA026F188D0HGZRh7MdH7lM3gSIoYG8Xf9P3AZ8XX0FH9lCiu
 wD0mTFWvWXvmQ1RelJY7NIcDTaveT7nT3DqHsXRckxESbbYLwyXj9nT9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=RQL2p0XNTFOVczFS1RiCOdkrFsHPgmafoyYC4B9enjU=; b=QJTJkKWO
 d/fZzPhV57bt5bj69jnyXUrepWCB9+auDCZ4Z+V/vU4g6ZhdG3ITtPenW4Ad53Zi
 O/NE5SAHQiJIZliY8FjcCtHV9r9uiknntIPUwxqi5VlYQbqBc+wCyq3W3MAuux9P
 YA1cVtLSgQCotjIqBfhz6Pejz71QEZ/FvkAgKAotA3y2GCa2TZeGERbaccQQ9KFE
 rkFnEGsuCDAoUEhat5qYfxcON3KIt1Hbc7WecoObiuWG0t/rlv+JvtDLMhC0YRrV
 eArgcnG/ktZJYm0M8a1fJIRW91sd/v6SOSW4TAoW47489MLcVu11wCVyu9UErvTa
 sfXWqjX4mrX+rQ==
X-ME-Sender: <xms:QqNQX8LNWbZNyGUsBX6QuD24rmK46s05ugNfMJhXqTqEvw-LhNHpEw>
 <xme:QqNQX8ID54Xkkvjy_x-klHLXD1JaaRuTqcVAWDaL8GHf6zOVKXUJa_h2_ZX1uwF4A
 OhMbM_d7xcezaw1DV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegle
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QqNQX8s99Trwh2qADNvDMtNNI_AFFS-vmg7hrI5pZpS5Svd_foYdiw>
 <xmx:QqNQX5Yd97VQn1MrciGBHMS1C2DpQtNgRNINcmlizG-VnS3oRdHOUQ>
 <xmx:QqNQXzYhWBVL6DfvF1JWfSsrJAfOldBkgBDZmHcFhi-76w_KZZrWfw>
 <xmx:QqNQXxALO0MHO1yL-c_9xTctwmeG6A_ZoEPQE7pExzuCTn3B0-KAn52G-xc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56CC2306005B;
 Thu,  3 Sep 2020 04:03:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 57/80] drm/vc4: hdmi: Store the encoder type in the variant
 structure
Date: Thu,  3 Sep 2020 10:01:29 +0200
Message-Id: <2736a86b498551ba9dbc5803c5bb910627a2550c.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4 CRTC will use the encoder type to control its output clock
muxing. However, this will be different from HDMI0 to HDMI1, so let's
store our type in the variant structure so that we can support multiple
controllers later on.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9e2bc6cb690e..f6d18bdbd1bb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1267,7 +1267,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base.base;
-	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
+	vc4_hdmi->encoder.base.type = variant->encoder_type;
 	vc4_hdmi->pdev = pdev;
 	vc4_hdmi->variant = variant;
 
@@ -1446,6 +1446,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct vc4_hdmi_variant bcm2835_variant = {
+	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 0c32dc46d289..0d529db4b3ab 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -27,6 +27,9 @@ struct vc4_hdmi;
 struct vc4_hdmi_register;
 
 struct vc4_hdmi_variant {
+	/* Encoder Type for that controller */
+	enum vc4_encoder_type encoder_type;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
