Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA3270BF2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4536E19C;
	Sat, 19 Sep 2020 08:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2061E6ED10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 14:59:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2D710D31;
 Fri, 18 Sep 2020 10:59:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 18 Sep 2020 10:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=VRaF5CPvjf3skCTZYEO7ytV1iC
 dIPLsXrglAvxy/Ysw=; b=o9BCmB3GOwuQ5vYgmY4mbOw4Br27dD68gjWhcLGQBw
 X+LQWfT9IyU9wG3dVLIqT6FCB3q1XovoAsatqzjcJ4NktII+LImudcYjjBk/pKLh
 Tq77WOwGcKiZ6myov28ob8crKC/IpbZZIsa8t+i1yeyOMjXGWcx5Ffc9pcV4JMZg
 au551GXVrdBP3c9CDEWBNW/TWjFNgg/Fvq547Ql8UpMWc7K/Ah6kmkFR2k9vHOcE
 D12EwVPAahckLeNWpF1uLH99b3zAeIiOmYVfsb/pFSYGU+ciAakhmTwp9ICdl9GZ
 pht6jPfiGp3EBily9pEWf8ht4ymIkhzVH7Mas5KamJ4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VRaF5CPvjf3skCTZY
 EO7ytV1iCdIPLsXrglAvxy/Ysw=; b=amE1Bquz/ZYOuiPP81qsaiZZaJm3CRUNZ
 8HfJLX2M29Exse1lIElE6yxE5fv/drE/mDOfzR/sMRGVki1vvBOihmgGVpD2B8YM
 txtW/BSNNp2Fr0gHXruqB1ukaI8fngPkw8nIAdFzzDEkdS7UBXb/6Ecx9edDIRrW
 DezG3rLYgexyUpoKUr3fqiugL5rV2Ko3on5iteJZgOpzd5xjj8l6DrgzMhlSDMnj
 BJAym40nq01OYRqWoGk5F1w+68iHsE6gYVL5SdIpug6UgAqJhycFUBhRabDOwYUt
 ykb6f4CapAaZDPuzLwnmEj1hWibwQNnxoRTSoH+QfirBHuCU9UqUg==
X-ME-Sender: <xms:S8tkX7tvsm6yYZgqpz_AwsOso8KcD7zL8-ccFIzWkUGL5FzPAsNR5w>
 <xme:S8tkX8ewteT65L1X2ojL0sKUl6GvwGosMIt3e3vKzCcLJXAW95f_C5rIDUZdfAsvX
 pCSbG_1ODCde_OVm5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeigdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:S8tkX-xmAx-bsO6jUL9rSSxJCQPPBmM_t3zdWJra-7QcVVIEFapicA>
 <xmx:S8tkX6NGXhHXo8XfKfUHmFTG_6bLv4okxqmjDQVC2p440tme_USHDQ>
 <xmx:S8tkX79JIs362Bc34h2WSJ6ldH9Bwac1Q1_uXLO7UmlACxKsZV4Q7A>
 <xmx:TMtkX7w5V-xd0EVahM9QVkx8x09B4QXogUErDw-Ukg7VpUqsV7DOfw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A99493280065;
 Fri, 18 Sep 2020 10:59:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/2] drm/vc4: kms: Assign a FIFO to enabled CRTCs instead of
 active
Date: Fri, 18 Sep 2020 16:59:17 +0200
Message-Id: <20200918145918.101068-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HVS has three FIFOs that can be assigned to a number of PixelValves
through a mux.

However, changing that FIFO requires that we disable and then enable the
pixelvalve, so we want to assign FIFOs to all the enabled CRTCs, and not
just the active ones.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index af3ee3dcdab6..01fa60844695 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -643,7 +643,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		unsigned int matching_channels;
 
-		if (!crtc_state->active)
+		if (!crtc_state->enable)
 			continue;
 
 		/*
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
