Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A97455932
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCBD6E954;
	Thu, 18 Nov 2021 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E446E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C504580912;
 Thu, 18 Nov 2021 05:38:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 18 Nov 2021 05:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pKSOzxuXo36o8
 Dyygiise2cGIQgDDPAe1Oetiju93SI=; b=nSpiXbS3nAKAKfukl1tvb2qU6AC4k
 Ewv9Z4XJkFu3W1/b7u5H/TDnR6/x47LS1GplVBVccnmjBhFyWTtdmIbvWRdytIUH
 /BKZpgd4zILqPdw1jb/Jcx3cVOUY/SDJxGtKVNRYAKZK8pWkSxdXX3lQNdloDsoe
 5P0S37Ab3F9gjwJXbB3gymuASM3lcI4I9ju6uj1AHHNveUIfbwKePA1dv6GO5KBV
 H+lnr05id7BjTxH9v5+dYuleFWCfi/pEGl+Qojkw/wHt3nIOVOM0eaxuYs+KkKv6
 6Iipzlmc0dpoDgsVJT5+298Pq3/DbFnxlW4ptL1Xw8v3qx2fmIOLC+Mkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pKSOzxuXo36o8Dyygiise2cGIQgDDPAe1Oetiju93SI=; b=if+VJM/k
 HALfMd4sFrmyjMVqSiqcbKEKf0b1AJsMCAeG+u+GNYX31yW0GX2s98Rtro3dxcCZ
 ITWFEx6PoJ3A6OmnRv3j3b4Qs22Ggta0xOUl/LhzSF6POJ7S3pYuOzq/CFPuwPKK
 B1Rcf158NdFXv8ilsDbBd8e2DQH/7PEl0gvgOqeUR4XOzUiuI5fYRV3qRhXc7mTl
 PFk6878sxJMpQ5RYhIOOz11ELvRUwqqnODEl/oAlFlmQ4Q1NMsiBJUU3tUFib+pv
 4pvDaQthuP4b8v1rlgfFDRYeO64G1E7idLF+s7vD7akcmkJcK6olzvf77J6Y9kdS
 D0E+pnUV062T0g==
X-ME-Sender: <xms:KS2WYeFyZp2w6VGpfS4JAOPM_m48moJHYziQT0dhBarobCejcTA9sQ>
 <xme:KS2WYfUrN13Y4q9Qj1LPT433ljfXs2N4oFrkYPigLFgDzwX-t2vhkrsidfds5UOjT
 grer8LzudHAdO2ycp0>
X-ME-Received: <xmr:KS2WYYItODWTRwTnWK2-R_FXWqS1kPrgS8OZThGsRbD9yLtCIGr6AoknkxViae7n7zeL0Hg5pBbhuR5OkyVxskF2Z4wgCpKguz4yMxZWxqc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KS2WYYGYiRaCWCbGqIRh7cTBmYKkiVQLFCMrLlTikjzSQMEIHa5scg>
 <xmx:KS2WYUWZyegqnEFnObJXeDrgK3WxSUIr17m3BttP1JYA1wtcA_kPIQ>
 <xmx:KS2WYbPcDOBTgucd51qsO4BySATOlHaPEjLt5NNmC0qStA8ravbJFg>
 <xmx:KS2WYYTbqWPZrxQo4pI9InXcH0FHgOU4r8uGNdWWxL-bwaipkmT-hA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 07/13] drm/vc4: hdmi: Remove mutex in detect
Date: Thu, 18 Nov 2021 11:38:08 +0100
Message-Id: <20211118103814.524670-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
index 9a7864440d95..e0b30c9e9559 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -188,7 +188,16 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
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
 
@@ -220,13 +229,11 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
 		pm_runtime_put(&vc4_hdmi->pdev->dev);
-		mutex_unlock(&vc4_hdmi->mutex);
 		return connector_status_connected;
 	}
 
 	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
-	mutex_unlock(&vc4_hdmi->mutex);
 	return connector_status_disconnected;
 }
 
@@ -243,14 +250,21 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
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
 
 	vc4_encoder->hdmi_monitor = drm_detect_hdmi_monitor(edid);
 
@@ -270,9 +284,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		}
 	}
 
-out:
-	mutex_unlock(&vc4_hdmi->mutex);
-
 	return ret;
 }
 
@@ -1991,21 +2002,12 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
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
@@ -2040,6 +2042,8 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
@@ -2048,16 +2052,7 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
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
 
@@ -2069,6 +2064,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return 0;
@@ -2087,22 +2084,13 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
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
@@ -2116,22 +2104,13 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
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
@@ -2152,6 +2131,8 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index e6562bfa6fae..85bf25824832 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -186,15 +186,7 @@ struct vc4_hdmi {
 
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
2.33.1

