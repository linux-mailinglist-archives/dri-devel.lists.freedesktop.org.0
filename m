Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C256003D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D0210F181;
	Wed, 29 Jun 2022 12:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F5514A688
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CF1C5320095D;
 Wed, 29 Jun 2022 08:38:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506321; x=1656592721; bh=tW
 9gHHAr3/SFxBGkP15TF2KXATD+AqOtU7XzI5GTQjU=; b=bH5aFMeVCaCkkJdqK0
 w5nwRtIoPjiILb1PeO1L/gKXV+/pkERqKQDyfYacPyQUOcPRVgEUenuo0Q66vxPb
 wuJMCvG6M0C64YSIDaT7o6UXhOohQaud69AV6vzUwesus/viBbIDTOh4/06CkPpW
 iClZUsEKSlH+/1W97Z++V7yRV2rUUlLixXdn1TsitUCX0fBK+R4mMuRzpjtqqEZY
 pL3LiC2iWuUa9apEKcE/dJ0s/cy8RRoPi6BN46ZBBPKxsdmwKg7+/K597dw7Bo17
 38CXF4+BgJZJQYf162HNEcGH2BOLhY45xTg0fuqIG0IEtGCPmTu9BsEWU3GJFmxi
 GnBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506321; x=1656592721; bh=tW9gHHAr3/SFx
 BGkP15TF2KXATD+AqOtU7XzI5GTQjU=; b=IM17SSUfIYOSkUE6oqn6Q90Wk49UJ
 hk4vRLMBCokQFhyB9HQEst6nDV568K4U+cvmfZflFUHMTkPvDxrKes8cnkLIgLy8
 HOfUdHk2P7VIsU+5PEkZdKvDhJp0r78zY5dGpw9ABHTGKDI4v3n3bGhLYDBpN4z2
 lTeBnJlzDLiMsKVqhKKbI6sUNrEIDeAIfEl83oHHYZW/cD5mDAWWZ3iJ9oRK+RIF
 EXcXsAiiGXF7W4AvCck7Fa+SM97Fwlsk2txGzh0ADBMSVvooCyD0DVuDRGfT0qkR
 a0pz9f30U+VytHNrCVj5NwIkBYNG3FZLcZWSkzebwZC3g3EqSnEAzmPXw==
X-ME-Sender: <xms:0Ue8YqEs7xy0XmSI5coDUIuiB_HjonDEM12XkpqJ-LBxxoh1XQhENw>
 <xme:0Ue8YrXCUD6DbWp_WbJWEz5GAnNExWJt-tGT5Plqpflo2AjrBdPgHH90TGUkkIRtI
 g70p_qyJIagQ3WaFls>
X-ME-Received: <xmr:0Ue8YkLdjYPmLt8ohOO3fbbCQY9s2C0fhvwI0NP8LjfIAXgCABOa5mo-XdvV5bPuPxLxxaEmUDSpT6qq45jxKU3BNwRrpNizr0MW6yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0Ue8YkHt6_H7ffNnYIrfbsOIOsUJ1WLZZX6v8cOsTCX4IZrpdRDeLw>
 <xmx:0Ue8YgUvzEpqxTe1zI4GoaE4dg3WCtF2HzpnpZHWeW3HSr_FvRooSA>
 <xmx:0Ue8YnMfsXodYJvhdzU7HUNPl-oJzUVE5mCTsExTQdtZ5HAlhTRnug>
 <xmx:0Ue8YuxoXyA44LFTdHsRcyJ3opH80o5RuB9Vb3WPZhu9z_5KW-mx1g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 70/71] drm/vc4: v3d: Rework the runtime_pm setup
Date: Wed, 29 Jun 2022 14:35:09 +0200
Message-Id: <20220629123510.1915022-71-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

