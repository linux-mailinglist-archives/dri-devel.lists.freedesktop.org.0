Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB0554D72
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ADC1133CF;
	Wed, 22 Jun 2022 14:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C343E1133CF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 97E963200942;
 Wed, 22 Jun 2022 10:35:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908547; x=1655994947; bh=Re
 awkRMJ8LKdk/DjyJv/gQ5A2bJhpQaE3jvLxUM3anw=; b=wifK32D2g97dxTc9OX
 bpdz20JLgZCUBsYujzdtwXEcA8KVooCTyyvbdTUdMHvmRrXybX7Sdvfr5YNmqRoK
 Pc87T5fU7r9Knq61c0FghqkvYzEFCIlPwSFk62/KYnXluTO7ly8jAdDWprH0tgpT
 hwKHFb0DOnWq7B06yP9XFJBoeE86AMAbVgUgmPN6QJocMTUtobQCqkqdaHEWtniW
 3Hr14qlSc///5BlBhGFaEshiMth6yYR40ZccwqArshbzSlx30vYJC8iAW6q7E26X
 QLGnS+IkQmMRks9Q16+41OI4KCe/WxVdvvOe6HVpMr4Q2suGZtr04Mh8s1kQgAbe
 CzLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908547; x=1655994947; bh=ReawkRMJ8LKdk
 /DjyJv/gQ5A2bJhpQaE3jvLxUM3anw=; b=vLGN6SWHkPoyOzKGQfCGwPw5uAB/v
 kbf+vIjqf4UX1ZBwqxK3osqkufdONSNmfKng46+hnJdHD65WsRdrWTAR1gLdvKHV
 1Dk5AcIDKdZ/LaOk+Tl/X5K+kLlTtv0vnVLG51TSks4hraIzeqEZ183ZeRKKZAnI
 wITcpWsQbb4SlGJOVV8yiL4FIzXkEHQjqD82OP0DqPC8wFrpFLFvQCKVB1ISOvRz
 1GAop/2s4f/HUQ+NrbHnLBsRvcWRjL/s7P3NIbD6LXQoNtUmKGYhYTz343gBHkoa
 6ADrPB4NnMvQnOwvTNTba/kYjepQr8KlhSEHr5cbxfoVFD/ywB4F4Cerw==
X-ME-Sender: <xms:wiizYmtZ6ki2JrbQ5Yae5OLbb2gsaPdJ9FgADEaUMQKD5Nuj4EpKwg>
 <xme:wiizYrdQuBhJby-40PCgG0QrRnS3R9GOWW9slpeRfVU9-CTDTJ4XjjEGw1jV-NVce
 _rN4mt0VsZ9x7coN0o>
X-ME-Received: <xmr:wiizYhwgEzH93Djk2PwT5RlnnQTy5zArqgCXO0bAT2n5C8BRLH5dJV3hAc1g19OVCkwlBZGUK-0jQ5cQEiadrsCPK1dOb01JxW7nnDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wiizYhNAsToY_zvQji8pBOe1w_UyeeEUStgA8BmxAdjqzqvNId5GYQ>
 <xmx:wiizYm8e0QT0JEDkRBU4W6xnsNuNb5VP-clBgknTbyctglPyefA6DQ>
 <xmx:wiizYpVLnL__thbD9hYMMlJMy8f3nsw8P5dwnKUHg0OEJ4Mn8JjmJA>
 <xmx:wyizYqZU4uws7XQcsVxn5wb_Fa1xdvdK-cPT_NTaWtdg1reMVUG7uQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 68/68] drm/vc4: v3d: Switch to devm_pm_runtime_enable
Date: Wed, 22 Jun 2022 16:32:09 +0200
Message-Id: <20220622143209.600298-69-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index d82c86865079..40f04157ea39 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -468,11 +468,13 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	vc4->irq = ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_disable_runtime_pm;
+		return ret;
 
 	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
 		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
@@ -501,9 +503,6 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 err_put_runtime_pm:
 	pm_runtime_put(dev);
 
-err_disable_runtime_pm:
-	pm_runtime_disable(dev);
-
 	return ret;
 }
 
@@ -513,8 +512,6 @@ static void vc4_v3d_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
-	pm_runtime_disable(dev);
-
 	vc4_irq_uninstall(drm);
 
 	/* Disable the binner's overflow memory address, so the next
-- 
2.36.1

