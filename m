Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5557091E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C59B9031D;
	Mon, 11 Jul 2022 17:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C8790319
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D5185C004B;
 Mon, 11 Jul 2022 13:40:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561246; x=1657647646; bh=x/
 lD2oTTN+wWUc+cm6hPKFFo18akL10ix6YMVi+j400=; b=MHnAGW/z1VSWVkd6NW
 deuNtjts/9C9TP2o9XBEra03hqhSS5FvqspiwLVvvZE8Vcjuuxdw6XO+ts9EkZH7
 DD6MkQqpcwM0ROWK0SPZLCKYhtF24mVTZXyF6trJHsg7+nK3tO+Uh2A34jrqWTtG
 B2TXglB7lhlkZHVOLjl4UxQ4LpiuoLQtJK85X7GiAP+QUxPdg1tE6YbHtAg0dZ34
 32KrhDpvzbYILz55NV4+xkRSsKh+bcOwfgv1u7Tfbei1wMr5U20X3l92khitTwvT
 MakA09MgUDKqBFG1NLJYUBFLvbsBHqFv5oGHvwjU3wARwgJM+AplbiXw+bzT5S9L
 gYPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561246; x=1657647646; bh=x/lD2oTTN+wWU
 c+cm6hPKFFo18akL10ix6YMVi+j400=; b=1CAgXa8fiBvUFoIV/Q5swQN4MnBZe
 rV5ZuHovOpuoXlRWmApOe/6wVWWZQD1X8VQges9S9Bx815lAzC0TH5S5Ve/lUmKK
 8A1gzsyRTNL1gXNDILYIxXizVyqkn13w48FrVMXxk7GDTUqzlGMqwpVx6lX7DjCI
 SlNV058bi5eXi2/QMI04BZhawImCWQJJFzIV2S+OkQ8ZC29ea8gLpH4D8hwCsdra
 xJSH6H4D7uR/dGrsFelDBqPMQnaTzoVYjFKup3DZDI7SU4Dl8E1DEfFtmDnhN014
 tRmdQl1Aes6ef0G08JyA9pEsH1hMMKsjvUrpWka0mIVl16Ao/N0nCPEJw==
X-ME-Sender: <xms:nmDMYjzsLA9cVrJI_oTCXCMl0fRyszPqU7mTab4rG7zeOipskg0fiw>
 <xme:nmDMYrSZpOmsoH8K9zzjKMghaJVCoITkdbRNsP_VoHhMhIzkClqWBEnGQeBV2kQFm
 PlWcsUA7h7hsYelbiQ>
X-ME-Received: <xmr:nmDMYtWBfR7JdhxhIuIyRd-gUv1ixu6XsCKGGHxn8j0hkVFc3QF9Txu3D2ivu5hjNnSVTaG3YyY5gY-OHCf8a4opHH5q3enjSANBlw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nmDMYtgRVWkVUzmTMn492fUAZD3PIn-52YRzqLAGyTq3wQhLrdYA3Q>
 <xmx:nmDMYlBtpEbPB6bIyciKgnIBjX6SklYWHFTLkUXLB9GeQ92kYPOaKw>
 <xmx:nmDMYmIH33SeSoKwX8o2tzGlPnhViYXKuxeT-My9XeacHtZLmO_Dww>
 <xmx:nmDMYg9ZHaaHyY9zg1o2n7YoySETGRR4brvtqqb6yK8sn6WceY_QsQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 37/69] drm/vc4: hdmi: Switch to drmm_kzalloc
Date: Mon, 11 Jul 2022 19:39:07 +0200
Message-Id: <20220711173939.1132294-38-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1e5f68704d7d..5681fafa4271 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2908,9 +2908,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct device_node *ddc_node;
 	int ret;
 
-	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
+	vc4_hdmi = drmm_kzalloc(drm, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
+
 	mutex_init(&vc4_hdmi->mutex);
 	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
-- 
2.36.1

