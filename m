Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545185A4E84
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9A510F2C5;
	Mon, 29 Aug 2022 13:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A450010F2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:48:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E936C32001E9;
 Mon, 29 Aug 2022 09:48:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780901; x=1661867301; bh=7t
 kcVJpPFPqS73hkLSqNddoty8y7Mqppm3709Io+PbQ=; b=cCk43HMNF5nJBloa3/
 VVVsh4xZvTMMkHTYoKsGnbJdLTeB3BcIvI4cRvF2VZcVU8gdm/4I20mIMn88gje4
 Y5p0NlZge/cYFhqE8Q+RLqyvL416o/MNob3fem36f+sLxzGtOcJdYlHaIo9gZtQ7
 QnuFi5z+OdRdmyv6/skUyP0SrD59QZWhhdxrItWNQS23cFDfDl+RV4fxORfY/cP9
 IYfdHR6J2xLOYjT6QZs77kaJgR3a30kjf2mTvz/4l6dvEx+TVzDUZE52edyZ9DmE
 fKWrH7vkEgJmaSQSy1eGG4cJKO+PlGhpzrAX4djoGiLumqEgJ9mA/lbMrV6crCI/
 wHhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780901; x=1661867301; bh=7tkcVJpPFPqS7
 3hkLSqNddoty8y7Mqppm3709Io+PbQ=; b=tOrXG1dk2GkVsOFSd3zR/M5Se1B9v
 nD2H/3hfm1F9+Z9zDcMjS5CueLuJF5aQv8op1J8nmjI1KrPBA0tG8R/zaSJjsBkf
 hQzHh3XPjharhQJ4xbvIby46mAsqAzBXVwygNlVBHuuyUUDHq+8vkQqWVEDxSSBG
 1+ueWROEbkqe72BuDIvUtdlDpJXTcdKW48IqBg5+rFaoCbSoGJ4F26xAlVslfcyI
 LJrXANwgn3lggb1rdvibyZZJ8Cs29D5NdQwejG6osGmWJxYUNp2nYMJ9fKKNqpkP
 OJI0gJg3rw8LSQ8CiMTe1Lu+4xQphGs3RZlMfmT4EJY1AfkJGhU2VvQEw==
X-ME-Sender: <xms:pcMMY3J6ydrdOWkh5x7QHVdSkKFykSAZL3ML6S54PgDfI2r9GHNhoQ>
 <xme:pcMMY7Kq2TAF6NIuki3JtsjZByWq6bUWPlSAnU8hm01a5F2yebl_VJZSVLtqlDHdG
 JODYuN-6X4QKZtwaDY>
X-ME-Received: <xmr:pcMMY_vxgQvBd97GqZeKZVD4xU_nC_oWzQJPF3UJboL8YjunvlLKlXUZsqh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pcMMYwb2AqiEBrCJ9i5RF0Y8G6A7tuWMkGMoDpPJTVdrdjWIVk3QvQ>
 <xmx:pcMMY-boF3AUcXyQPpDF3Rx5NAywShobkDRQRCCCx0-YZ47_tgnVsA>
 <xmx:pcMMY0BqW9638b1qSX23-csnXJP2Ab1yx89h7ORVL8FgHTze4XO6eg>
 <xmx:pcMMY0mkeYZ2gZOJPtKzzPK4sufiThsRP8gNIxn6e7bl_f49P9Visg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:48:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 8/8] drm/scdc: Document hotplug gotchas
Date: Mon, 29 Aug 2022 15:47:31 +0200
Message-Id: <20220829134731.213478-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829134731.213478-1-maxime@cerno.tech>
References: <20220829134731.213478-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's some interactions between the SCDC setup and the disconnection /
reconnection of displays. Let's document it and a solution.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/display/drm_scdc_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index 81881e81ceae..c3ad4ab2b456 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -35,6 +35,19 @@
  * HDMI 2.0 specification. It is a point-to-point protocol that allows the
  * HDMI source and HDMI sink to exchange data. The same I2C interface that
  * is used to access EDID serves as the transport mechanism for SCDC.
+ *
+ * Note: The SCDC status is going to be lost when the display is
+ * disconnected. This can happen physically when the user disconnects
+ * the cable, but also when a display is switched on (such as waking up
+ * a TV).
+ *
+ * This is further complicated by the fact that, upon a disconnection /
+ * reconnection, KMS won't change the mode on its own. This means that
+ * one can't just rely on setting the SCDC status on enable, but also
+ * has to track the connector status changes using interrupts and
+ * restore the SCDC status. The typical solution for this is to trigger an
+ * empty modeset in drm_connector_helper_funcs.detect_ctx(), like what vc4 does
+ * in vc4_hdmi_reset_link().
  */
 
 #define SCDC_I2C_SLAVE_ADDRESS 0x54
-- 
2.37.1

