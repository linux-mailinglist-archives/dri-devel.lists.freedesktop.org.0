Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18220609E1A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 11:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F68910E2F2;
	Mon, 24 Oct 2022 09:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD23E10E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 09:36:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CCA66320051E;
 Mon, 24 Oct 2022 05:36:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 24 Oct 2022 05:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1666604204; x=1666690604; bh=/h
 PV9tvGj5CIwdo7Dqj2HMcdpEdPNBnI2P5xGii9vAQ=; b=ZWfQ97QYhbdYZSu1Xy
 MBoKQnIb8F58P0ryqFL5ywQ3q4la2nkx2aT2DjwiV9CGIdbVUXyTYktVDvSqWdNT
 u3ys7Mq3P1kun7e0upXvVdV+c5HegenPpVWPQyeiSxaRhwdw6idJxZRWVeBGIbrf
 bJmRuCiPQd2ygTrbWnzsCW6r2DPGqnfx1vuAQH8ajiucIEAMId6Z6y9JBS5rSyPP
 kaHI8EbeNqMJ12O1BT5G3ijU6USY1Ja6Q9nxvsR88gNgEM1pQOvjRBD7zLDnJSSo
 sZ8e8Q9usz6vrO3jlB0J8mLKkmhnjGf7MqXPfYQpX//VuEm2Twzk5juPOOPuM026
 fieA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666604204; x=1666690604; bh=/hPV9tvGj5CIw
 do7Dqj2HMcdpEdPNBnI2P5xGii9vAQ=; b=KA70f9SQgTVmjdOJc7YnSM9USg+H5
 61cbrq6B37LJKK6uyHPnbFr7924AlFF6remQ7u6WeciUZSsf8dTIAVOp1b+p4Z4S
 keluiPZJuF4SDyjW60Jk6HLlDX+gFgs1cQ6ch30Hajb3nO+PsZQDTg8gCWgJt7wL
 q793ESgdDA6hhkZltfv9lVzsfEvYCz1fD8h3F76mQWpAv5sHOZT5Q5oN84FNdOy6
 0VBnWk6HF4vUQ418dS7GypgCazYoVY1WEcDxbxFVQizHTgKZy7nY9Xqrtkz9fOC2
 f0PkEe8ahDMmPCmgDkZ/s29bN8RFtBWWxvrIf8O1+LftxBZOBJ4ULGkvA==
X-ME-Sender: <xms:q1xWYxi9f8DZ9rX20Fd_6hbYh-rMDomThVb-Ibs66Glm74fbfZxo0Q>
 <xme:q1xWY2AvXSQNtKe6dJU2dqTo591UkoxW4QCk3szeWpfVnvpbUiEcEqxeKZ699ZSyR
 kkMpiPKpZUf8qnc-Ko>
X-ME-Received: <xmr:q1xWYxHEHRh-IqBhCfi5XBvRb6WzKuXMx152HIyVzYLzRgcwwvn-weZq0SWpVbM8EoU40w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeevleeugfejledugfffje
 duhfffhffhgfdvjeeuhfekvdeiuedvjeegteeghffhleenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:q1xWY2QtY8Wot5SmW6AcVLdgmutqY_Idpg4rUZQY-xmUPfFxWu8WKQ>
 <xmx:q1xWY-zvdfLAGfsdJpROqXNPEiVnI_kXDg-l2k5otPZet36x5yVsxQ>
 <xmx:q1xWY87LO4hw5_AwnogwQlgqJr9xJL0mt6AW4yGTlyZazMkC8-nZ6Q>
 <xmx:rFxWY_rzSG2K7cl3UQXLdZR76HLtPj-oelUw6vgg5H4J1aVxgNtHTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 05:36:43 -0400 (EDT)
From: maxime@cerno.tech
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/vc4: hdmi: Fix outdated function name in comment
Date: Mon, 24 Oct 2022 11:36:34 +0200
Message-Id: <20221024093634.118190-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024093634.118190-1-maxime@cerno.tech>
References: <20221024093634.118190-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A comment introduced by commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link
on hotplug") mentions a drm_atomic_helper_connector_hdmi_reset_link()
function that was part of the earlier versions but got moved internally
and is now named vc4_hdmi_reset_link(). Let's fix the function name.

Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9e549fa07467..79eda8f5fea0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -410,9 +410,8 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 * .adap_enable, which leads to that funtion being called with
 	 * our mutex held.
 	 *
-	 * A similar situation occurs with
-	 * drm_atomic_helper_connector_hdmi_reset_link() that will call
-	 * into our KMS hooks if the scrambling was enabled.
+	 * A similar situation occurs with vc4_hdmi_reset_link() that
+	 * will call into our KMS hooks if the scrambling was enabled.
 	 *
 	 * Concurrency isn't an issue at the moment since we don't share
 	 * any state with any of the other frameworks so we can ignore
-- 
2.37.3

