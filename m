Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF387554D71
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356A21133D3;
	Wed, 22 Jun 2022 14:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81E21133BB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:45 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 97A593200962;
 Wed, 22 Jun 2022 10:35:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908544; x=1655994944; bh=tW
 9gHHAr3/SFxBGkP15TF2KXATD+AqOtU7XzI5GTQjU=; b=BKPjnaQPzWlRBTI6//
 K8xMjc+sAHdGnpBPIV44WY5stpYTEcj31ob5RwD5sAEtvrz77C+hCUqRDOW+8iE0
 iPR7BrBbg/ZFmtAX2KpHEoGT6fNLC6DmwqDZd4zi68APvc1eHBRTDNDy5CaYd3iJ
 a6bFMGMipB07e5zWRXh1tTT9BZHw4/2GKNf+zCQ0DRRqCHW+DeCwpb4tFp9tG9ku
 3hERe/VnTL6tQBB7sHaMzSiUjt/MyBcBgeS0uYTqm+C9wxGnTHVCAU7EqmMb8Wve
 82AUp+sjjxXuZnWZGzD9KU/fAjS6llcDzwOUy6KmSKNFJSvqndgvEsVqU8c0sHRs
 kxZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908544; x=1655994944; bh=tW9gHHAr3/SFx
 BGkP15TF2KXATD+AqOtU7XzI5GTQjU=; b=pHx+JVxs5ve6uHSgwt4t617rwqYx4
 fGxKzOTiuSc6TaLL+1BATQ4m6YMx1Vlaw/dI6MkGOIP1nqNYVDY8KgvBOK8tU7wP
 HpQoq1tNPkAkG5UqO14N4SZifMO0dLb8jxdI5LNGIWTYKHZsFMhtGamCSu7+CCNG
 iHqkIUJRWg/JRRHMEeVQ5UzvXUxDylGTVMjC1JhVuKQRAVRVAH0atqIBA+ThnWMm
 n9Rv2H+tacMOGK2S7CvBYQvXFoJBFgJTiGHrxJG3j7/nP3J9qH8G0zs9hQ6Ylg7s
 MQ5IMtTJiISgNxGgmcvzLyGdAx1y1gC7GGB1ex14rkFUehUEvFkTMJ4nQ==
X-ME-Sender: <xms:wCizYuApS-oUi-TVaDH1EiM1hIFldZh_w8Idf9ozThmZBKMTCpGz_Q>
 <xme:wCizYogwFmxXWBhpqN4M7NqPiwXIr0pH1psdFX9COkBBAmxWSyBlPeJglY7X0hsG2
 iR5PaAp26EViCgkGe4>
X-ME-Received: <xmr:wCizYhkyzZkuuvDtQcgvrlZSankE1ziv72zNet1uW8_wkTvOY4Hf2CtpbAeJpSJUyddbjebNdZs1lJ7se97c4hJWs8aIljqhnlG_EZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wCizYsw2UPkujuzqV_DhvzlyncZFN__sLOQq4Yzf8a5myV0RXk0OdA>
 <xmx:wCizYjRhtuDr_G7BV8ppv1F0yj2TEV-v6zDNhDALQVVek2J5jEdCJQ>
 <xmx:wCizYna30r2anCzOQI0JlqsfidRVebFUzx-Hcm1iZGB78YpsrAXH2A>
 <xmx:wCizYhNWdW6DBR8QF_-0O9HJZzNzXtEzZPTr9WF3uP_jqA8XKvirhw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 67/68] drm/vc4: v3d: Rework the runtime_pm setup
Date: Wed, 22 Jun 2022 16:32:08 +0200
Message-Id: <20220622143209.600298-68-maxime@cerno.tech>
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

At bind time, vc4_v3d_bind() will read a register to retrieve the v3d
version and make sure it's a version we're compatible with.

However, the v3d has an optional clock that is enabled only after the
register read-out and a power domain that wasn't enabled at all in the bind
implementation. This was working fine at boot because both were enabled,
but resulted in the version check failing if we were unbinding and
rebinding the driver because the unbinding would have turned them off.

The fix isn't as easy as calling pm_runtime_resume_and_get() prior to the
register access to power up the power domain though.

Indeed, the runtime_resume implementation will enable the clock mentioned
above, call vc4_v3d_init_hw() and then vc4_irq_enable().

Prior to the previous patch, vc4_irq_enable() needed to occur after our
call to platform_get_irq() and vc4_irq_install(), since vc4_irq_enable()
used to call enable_irq() and vc4_irq_install() will call request_irq().

vc4_irq_install() will also do some register access, so needs the power
domain to be on. So we ended up in a situation where
vc4_v3d_runtime_resume() needed vc4_irq_install() to have been called
before, and vc4_irq_install() needed vc4_v3d_runtime_resume().

The previous patch removed the enable_irq() call in vc4_irq_enable() and
thus removed the dependency of vc4_v3d_runtime_resume() on
vc4_irq_install().

Thus, we can now rework our bind implementation to call
pm_runtime_resume_and_get() before our register access to make sure the
power domain is on. vc4_v3d_runtime_resume() also takes care of turning the
clock on and calling vc4_v3d_init_hw() so we can remove them from bind.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 37 +++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index a2da0db73a5c..d82c86865079 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -463,41 +463,48 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 		}
 	}
 
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	vc4->irq = ret;
+
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err_disable_runtime_pm;
+
 	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
 		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
 			  V3D_READ(V3D_IDENT0), V3D_EXPECTED_IDENT0);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_runtime_pm;
 	}
 
-	ret = clk_prepare_enable(v3d->clk);
-	if (ret != 0)
-		return ret;
-
 	/* Reset the binner overflow address/size at setup, to be sure
 	 * we don't reuse an old one.
 	 */
 	V3D_WRITE(V3D_BPOA, 0);
 	V3D_WRITE(V3D_BPOS, 0);
 
-	vc4_v3d_init_hw(drm);
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
-	vc4->irq = ret;
-
 	ret = vc4_irq_install(drm, vc4->irq);
 	if (ret) {
 		DRM_ERROR("Failed to install IRQ handler\n");
-		return ret;
+		goto err_put_runtime_pm;
 	}
 
-	pm_runtime_set_active(dev);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 40); /* a little over 2 frames. */
-	pm_runtime_enable(dev);
 
 	return 0;
+
+err_put_runtime_pm:
+	pm_runtime_put(dev);
+
+err_disable_runtime_pm:
+	pm_runtime_disable(dev);
+
+	return ret;
 }
 
 static void vc4_v3d_unbind(struct device *dev, struct device *master,
-- 
2.36.1

