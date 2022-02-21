Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C02F4BD8DB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D341E10EDC7;
	Mon, 21 Feb 2022 10:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C110E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:00:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9E34158025B;
 Mon, 21 Feb 2022 05:00:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 05:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=chvzDRKzJcpXha+S1it3KqO05assm8
 8lyC3LMOeyqIg=; b=QwJhwnkjWcpn9MfZxQefrCrfuX9j1Fo1wAsy8ECusttbQa
 U/ZDcCUY5pV8BNA1lGDKAwerjlITnXJWr0vtt/BTM/VxpdDOXziB1u0CuO6xHMsP
 smJlAoCl2UNzkp5PkjYeelonBgD8CTlW9q8+DuvE73Ez5mdj4x/REUM4dgCbflg4
 wPR9k9ypEyyQ4GPVzq7JPYy8tRzSTNYQE0mcfB+VMHSeTPE+1TfuUggZvuD7RpKC
 TzW28g7Ws/92h/gAaJMQujtMCzVPIOX/oqqWLDPr0iXYl2ZQAnrtmTJSkSl37ebH
 D6Pek2QO2n/u5FRdedD0dnGHqy2YCNV3zFb59EkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=chvzDR
 KzJcpXha+S1it3KqO05assm88lyC3LMOeyqIg=; b=akWYxQZmFRXGF/2y+xg6zQ
 T9OmvrfCVZ131si6Ii3Eh1EN2HAp9vBTU2hMQckT4APbndavaWtww0bliklGoB8R
 9S1YD2ucmzFAprl2c7CQjDF9VMFl79RoxZFZijK5+3wJO5KLpgGbL4Y8GpKHrLmI
 8lYk0ZEhTfrol3PdGpnwMMi6wxG26EBaR/IRcCWaPSxNDjim6jHH95qZszFFLNxP
 sBdHzecorvP77LltXtPMG4Yb7+FYvSdpCcCe4WXsCiwfBH2GmB/gxqxSbOredH6X
 l2KEI7igLCTe1ayUTjDl5jtZ7syM5XpKZwwu833Mjz28SdTT6Mf7h4tnQedPxnFQ
 ==
X-ME-Sender: <xms:qWITYjHoY_IlKb5G_Et3or2uUHRSN6C8sQIlkh5vHlnVCkXCXOqvmg>
 <xme:qWITYgX_R8pElCoLRcjJcCJN1LjJVsQEn0sv-fTNt--uujboq_5V-mfhgJgPzjX44
 22GBxcplbMgoZNisr4>
X-ME-Received: <xmr:qWITYlJrwjVdSWyXJlLy91eVgJ_Xokfq2DHrLQYkVLuZMzlzywPP-aLHSxXTu71jt-whrdy8807YwM-vhYanxS8hX7IxJKYhETpQ5uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qWITYhHKruBHmVUUZHOQ2KZ5WmC1emzq6MdjhniVdFyWJedBar7HUQ>
 <xmx:qWITYpUT5_VdRMtgW1Jddm7fM6UL-zMWZ-X0sh12qCYt8cizhi_WAA>
 <xmx:qWITYsPQPRP79OZOJpAsFzIS8fZydkNkkFdZGEf7pB4tqr4LWKc64Q>
 <xmx:qWITYhSRvna8uZxKCczyD9wnjkCq0TfETxqfjP5wsn3hWNiUaq31OA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 05:00:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 20/22] drm/armada: overlay: Remove redundant color encoding
 and range initialisation
Date: Mon, 21 Feb 2022 10:59:16 +0100
Message-Id: <20220221095918.18763-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The armada KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Limited Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in armada_overlay_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/armada/armada_overlay.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 424250535fed..a25539039efd 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -325,8 +325,6 @@ static void armada_overlay_reset(struct drm_plane *plane)
 		state->contrast = DEFAULT_CONTRAST;
 		state->saturation = DEFAULT_SATURATION;
 		__drm_atomic_helper_plane_reset(plane, &state->base.base);
-		state->base.base.color_encoding = DEFAULT_ENCODING;
-		state->base.base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 	}
 }
 
-- 
2.35.1

