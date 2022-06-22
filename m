Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BEB554D48
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBD21126E0;
	Wed, 22 Jun 2022 14:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B6511264F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3E97D32009A1;
 Wed, 22 Jun 2022 10:34:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908448; x=1655994848; bh=jT
 JMEDNzTpwjmwwQg2jBYt5NGju7jhot0aLVHBAdi5E=; b=DaCEFxt7cbj9bRFgUa
 6Ko5oUIrtNVSkRGRPLjkKKI5CyIMwB/gpY2HYFZbd7qkivz6aRnsAARTNLTAZyEh
 9yRa9Lb8H7skOS+ZTVzm6RnM3BfX/FcGuuZ5eK3vSIwlpHADDrfAgkdKc3tbtJWF
 HVZY/PPgkzhpWK7Hfo1i/0b31t97YKI3iC8Xap12s8sA3q88FKbcWtnTcWbG3pnE
 VeX812XN6B2dreeMF2Vle248Fy2FHR1qpNjpysgAEgiAdFAwSj6TidFqO/3otx3Y
 vr6Z/MHTgjW0Yo7Z8yHoHWlO8ZQt5tbQWMsFwqGdARN+aaxxyiQMUpcUZw1iaSRZ
 6Ynw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908448; x=1655994848; bh=jTJMEDNzTpwjm
 wwQg2jBYt5NGju7jhot0aLVHBAdi5E=; b=pWYuV+S/hHkxVJ0z727VmijVv7HoO
 ayW1fvzMZNfU95ETJxFgiMX6kkbkdvrALU7Llwy2RdBRTaYNvqGFKlBmrKWU8dFq
 ak4FawdzJuAfUDe2dHxxLRJ8s5P/rK0koLzLalJH+uCkYHqPFeIsvZyox0Euu2P6
 xXLA/qWbee56oM3lLC6HB/21h2ZdPJLdbDJ33mAivGM2A+Kj1NkrLvOCHcORqcMo
 ODQjla2yLiTUWsJgcni1o7TkOJM5B0T0BvY7yBmz7VHk2ateLiYbra5cc6SDTckH
 c9EBtm+Z1D5iY0kl+rMtfXVAegokRLB8Mu99mMEbT637e8CPnvksGh/TQ==
X-ME-Sender: <xms:YCizYmI2i5CAiKjHP3fMnstinU9EnPgIGnsMAI7bMjjSFEtZzILQ3A>
 <xme:YCizYuJPcAQWlGb-ntz7vcinWEQubcmL9zcxqTo8x5gBrFYT0psstvLiynaMeBFfg
 2cC14q02Jg0AdSLzCQ>
X-ME-Received: <xmr:YCizYmtnT2NUhK02LVw9ilIis5Q4hWZPZXgOQ2I2_AXs9A51RIUUS2fXoeiHLtmIEfCGornU1Hja3FxNje-ePOY5sOpc3njrcHtkyPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YCizYraWQAV5GERaqiW5SSqd9HFq9ZYSHoqI3BQbpVbh63SA34rWUw>
 <xmx:YCizYtZz80P1JhCirovhzwkYoaRZhUfWfSBYFdUU3_AOGMtx6Cwxdw>
 <xmx:YCizYnAy6YZVYFAv9GJ9JQSG925BdjlcoUk995sJ7gN_jFJJNvSipg>
 <xmx:YCizYsUqpGV81DRCajnWHD8gLUX4VPtnadrxFoDWnRYJ2TgmApTotA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 36/68] drm/vc4: hdmi: Switch to drmm_kzalloc
Date: Wed, 22 Jun 2022 16:31:37 +0200
Message-Id: <20220622143209.600298-37-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 823d812f4982..fd7bfcd1696f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2834,9 +2834,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

