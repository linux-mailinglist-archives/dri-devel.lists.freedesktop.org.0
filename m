Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CF574800
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8799E55;
	Thu, 14 Jul 2022 09:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9FF12B191
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:09 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6DBC3320085B;
 Thu, 14 Jul 2022 05:13:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 05:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657789986; x=1657876386; bh=eT
 0zSF3cV5jNmHhw2UQcLsfnkVpIpPO1gMaGY0kFNUA=; b=OoZf6jEWJ3zKGRhHAU
 PQRElg5XUoyu4iqQeDBauUo4bq4xaYPvGCJjWCNOq65bU+XcTEgIPfPvnLbZuYZE
 pA/kPZ73q/ELVvGH4jCMVVkF0ktRL73xo/5mc9/zuJKOaEnerRLRkDMvCUgRimVQ
 rHcBhC+I9dK1ajGuSlW87FECwaDMr6AMdATz7Oe1cB3NtGuEKZc4NYKiR6JYokw5
 DicdaKZfmIb5by8Vrw2HNAv17IBlZi2aHv9zIGyfaZOSmZrKVpCGAmxiajb189g0
 IYM5ruPMu3HPBktCY6WSd82fhRJF5dplWGUaxFF70TyA7F/Co+QZDH+zs21hMYei
 y9hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657789986; x=1657876386; bh=eT0zSF3cV5jNm
 Hhw2UQcLsfnkVpIpPO1gMaGY0kFNUA=; b=NHL8nvJfnawd964tUnUCS0e9drmxS
 d5P/2E3HUxmFLhbmSr/PokSaxOtHL9fXjqzfPTjJqrzQVgk/QqhsaWyu3kNUEnvQ
 Xn2tITYPpx9CZe2jdAGYMhJzCMvA93xyH1DwTrZTsylJ8wrcEHDkx4D56ge2ekuf
 ZVydAu5TeFUYvApbHYnWzOZ4gvICj8cUAjLBmalcBUgjdjSiwjsFVjk9S1rnh7dE
 KGaSqvorJEYrlJN2CK1AeOxJuUJz3R/KjmgWnusGLJvXoFlTzrM+bVvUAgiurY4l
 2ZJ7Sn5SSOiaAX39bFf4JFxKrWYUBIhmV5qa9OOLIMr5j+IcQxw7v6Sew==
X-ME-Sender: <xms:It7PYnbSx-PIKQwMOW8s1lsMJPNpY4pqGI-y6iOq8yzlg4MwRJkapA>
 <xme:It7PYma86COUCfiN-sZ0Ncu0MDG7apDaNj0hjYYXACtzYc2qeUXsoQhvgRbCurCfZ
 LqSrAyse_amAAk-FeU>
X-ME-Received: <xmr:It7PYp8zxHx9opUzo3zShB9NZY_J1JEnsQlaZrpJM9YxLEaYCxV9bhO4EoAY6qa9xzvLE3CnB4c38zmfhsW8jX-lB7U8o34u1JIXlHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:It7PYtpAYiOSDKx8V5oTc95zRykYsw6wECvclk7phnXAmvVsoX88Eg>
 <xmx:It7PYio9VWgHy4MD7FNF9E8t99Ozs0zx4K4jzlS4tka4Xr-cjVot3g>
 <xmx:It7PYjRj3VCybTv_ITkb6NdrpPOxvEnYW3aIf0LBxgwF-jM-BnLNeA>
 <xmx:It7PYh1MUQC2GAVyo70ECIKca9DP9LyXwVNhaNU08eg3v3vA13GY_Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:13:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 3/8] drm/vc4: hdmi: Remove mutex in detect
Date: Thu, 14 Jul 2022 11:12:47 +0200
Message-Id: <20220714091252.2089015-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714091252.2089015-1-maxime@cerno.tech>
References: <20220714091252.2089015-1-maxime@cerno.tech>
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

We recently introduced a new mutex to protect concurrent execution of
ALSA and KMS hooks, and the concurrent access to some of vc4_hdmi
fields.

However, using it in the detect hook was creating a reentrency issue
with CEC code. Indeed, calling cec_s_phys_addr_from_edid from detect
might call the CEC adap_enable hook with the lock held, eventually
resulting in a deadlock.

Since we didn't really need to protect anything at the moment in the CEC
code, the decision was made to ignore the mutex in those CEC hooks,
working around the issue.

However, we can have the same thing happening if we end up triggering a
mode set from the detect callback, for example using
drm_atomic_helper_connector_hdmi_reset_link().

Since we don't really need to protect anything in detect either, let's
just drop the lock in detect, and add it again in CEC.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 89 +++++++++++++---------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 +---
 2 files changed, 36 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 13407e06846f..aacc94d593f0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -233,7 +233,16 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	bool connected = false;
 
-	mutex_lock(&vc4_hdmi->mutex);
+	/*
+	 * NOTE: This function should really take vc4_hdmi->mutex, but
+	 * doing so results in reentrancy issues since
+	 * cec_s_phys_addr_from_edid might call .adap_enable, which
+	 * leads to that funtion being called with our mutex held.
+	 *
+	 * Concurrency isn't an issue at the moment since we don't share
+	 * any state with any of the other frameworks so we can ignore
+	 * the lock for now.
+	 */
 
 	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
 
@@ -258,13 +267,11 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base);
 		pm_runtime_put(&vc4_hdmi->pdev->dev);
-		mutex_unlock(&vc4_hdmi->mutex);
 		return connector_status_connected;
 	}
 
 	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
-	mutex_unlock(&vc4_hdmi->mutex);
 	return connector_status_disconnected;
 }
 
@@ -280,14 +287,21 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	int ret = 0;
 	struct edid *edid;
 
-	mutex_lock(&vc4_hdmi->mutex);
+	/*
+	 * NOTE: This function should really take vc4_hdmi->mutex, but
+	 * doing so results in reentrancy issues since
+	 * cec_s_phys_addr_from_edid might call .adap_enable, which
+	 * leads to that funtion being called with our mutex held.
+	 *
+	 * Concurrency isn't an issue at the moment since we don't share
+	 * any state with any of the other frameworks so we can ignore
+	 * the lock for now.
+	 */
 
 	edid = drm_get_edid(connector, vc4_hdmi->ddc);
 	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-	if (!edid) {
-		ret = -ENODEV;
-		goto out;
-	}
+	if (!edid)
+		return -ENODEV;
 
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
@@ -305,9 +319,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		}
 	}
 
-out:
-	mutex_unlock(&vc4_hdmi->mutex);
-
 	return ret;
 }
 
@@ -2381,21 +2392,12 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	u32 val;
 	int ret;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
-	 * .detect or .get_modes might call .adap_enable, which leads to this
-	 * function being called with that mutex held.
-	 *
-	 * Concurrency is not an issue for the moment since we don't share any
-	 * state with KMS, so we can ignore the lock for now, but we need to
-	 * keep it in mind if we were to change that assumption.
-	 */
-
 	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
 	if (ret)
 		return ret;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	val = HDMI_READ(HDMI_CEC_CNTRL_5);
@@ -2430,6 +2432,8 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
@@ -2438,16 +2442,7 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	unsigned long flags;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
-	 * .detect or .get_modes might call .adap_enable, which leads to this
-	 * function being called with that mutex held.
-	 *
-	 * Concurrency is not an issue for the moment since we don't share any
-	 * state with KMS, so we can ignore the lock for now, but we need to
-	 * keep it in mind if we were to change that assumption.
-	 */
+	mutex_lock(&vc4_hdmi->mutex);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -2459,6 +2454,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return 0;
@@ -2477,22 +2474,13 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	unsigned long flags;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
-	 * .detect or .get_modes might call .adap_enable, which leads to this
-	 * function being called with that mutex held.
-	 *
-	 * Concurrency is not an issue for the moment since we don't share any
-	 * state with KMS, so we can ignore the lock for now, but we need to
-	 * keep it in mind if we were to change that assumption.
-	 */
-
+	mutex_lock(&vc4_hdmi->mutex);
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
 		   (log_addr & 0xf) << VC4_HDMI_CEC_ADDR_SHIFT);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+	mutex_unlock(&vc4_hdmi->mutex);
 
 	return 0;
 }
@@ -2506,22 +2494,13 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	u32 val;
 	unsigned int i;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
-	 * .detect or .get_modes might call .adap_enable, which leads to this
-	 * function being called with that mutex held.
-	 *
-	 * Concurrency is not an issue for the moment since we don't share any
-	 * state with KMS, so we can ignore the lock for now, but we need to
-	 * keep it in mind if we were to change that assumption.
-	 */
-
 	if (msg->len > 16) {
 		drm_err(dev, "Attempting to transmit too much data (%d)\n", msg->len);
 		return -ENOMEM;
 	}
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	for (i = 0; i < msg->len; i += 4)
@@ -2542,6 +2521,8 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b3f404ca94b6..aef28c177107 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -194,15 +194,7 @@ struct vc4_hdmi {
 
 	/**
 	 * @mutex: Mutex protecting the driver access across multiple
-	 * frameworks (KMS, ALSA).
-	 *
-	 * NOTE: While supported, CEC has been left out since
-	 * cec_s_phys_addr_from_edid() might call .adap_enable and lead to a
-	 * reentrancy issue between .get_modes (or .detect) and .adap_enable.
-	 * Since we don't share any state between the CEC hooks and KMS', it's
-	 * not a big deal. The only trouble might come from updating the CEC
-	 * clock divider which might be affected by a modeset, but CEC should
-	 * be resilient to that.
+	 * frameworks (KMS, ALSA, CEC).
 	 */
 	struct mutex mutex;
 
-- 
2.36.1

