Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53145A4E78
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB8E10F29F;
	Mon, 29 Aug 2022 13:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839F10F278
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:48:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 05D5B3200645;
 Mon, 29 Aug 2022 09:47:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 09:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661780879; x=1661867279; bh=RB
 N8wvNkGXXWpA5NSb3ISMxUFiqyLWKa2TlSyoSllxQ=; b=oEKwL0j2FKNW4xffBr
 ZTBeTj34Q7fjaPQx7JxCp4j7LqyUtj0osYP/cRNkz/y+zeAyxZXTdQHfBNYHMenI
 rEbV1nVddsx4QVn5BRzn5AQ6zT97KgYkwEjQz569+N4ADnayMsS94tEnUUdu/E4l
 ZmWDi/91OYoV9bM0+nn0MhY4D5hvGqVpfwJKerkMqYNC0/za0xe8RFENebs77UgT
 etcEazGBiB1VqKurVvc2eR+aG1U4n33FP8pAt72XZ0968PZcEv8UE9ll7okbxSI7
 p4xD79sp+2/a202ffXxpZUe/F1nzlrDphbI/mjzFVAz/1A7Fs3SiHev4fz8w0zLs
 N0eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661780879; x=1661867279; bh=RBN8wvNkGXXWp
 A5NSb3ISMxUFiqyLWKa2TlSyoSllxQ=; b=vCSD9wKZ+S1tk6bIoDLWYoY8b6BnU
 fqfcWcvL6i8RNy5lLvylgEjS98RT/0kusKhudplx/EfAL6VqzRnmWO0R2cqOSaC1
 +uTw9UtVBPo/hJLAKHO7UJvDGHm7k8MQycMjpo2Y5YWEp3rSbW8uR3ZL2UsnNKed
 N2sAsOtnx+xY9KdG51XLYmjiXofMhV8zkM128/dqIN8KRlaLVV2/7WLgwJ7C7yGK
 xeR7O1u+dzMBJ1VF0vxlAlikWF7Lu0Li71OFLSRQSga043xo3tBo+TwWrDR5N7j/
 5BzHTHTmN/prwKp+5aVdBLNZ4KDX3fS6WKVk0fncA+JTUIxjvZXeP8D3Q==
X-ME-Sender: <xms:j8MMY5J6B3la1Im-fhHPgNsSHZuldKci5qwJ6Ktg5Xs28hx-jl09AQ>
 <xme:j8MMY1J43CJvknN_vVhamoekte5zpry0K0SblhfexDH2nB_meyA3328tebWLK7H2i
 u-z1-tLXw7RBKjL8dk>
X-ME-Received: <xmr:j8MMYxs_8erF9ygNnlNl899rvMNgsTIAnC4d24oNJXAN3cg6RMM7hZp87ui3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:j8MMY6aMMaOda9dyCyX_V7Pbuaf9_w_7Fsiz98yVRgvIBRzWpPNaIQ>
 <xmx:j8MMYwbLwdlpX3ZKi9UB4WLkwyld_5NV4uJ9uj8tCEQ2NSPVjhdJqQ>
 <xmx:j8MMY-BxWbJJitPB0mz8GpjV2pPY8VOFfIXvszDMRM-9OF6uYY6fUg>
 <xmx:j8MMY-ki--qJmKee5TD0AGDS38mJk9Wan_weU9V_X8Us9yGa_OuisQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:47:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 3/8] drm/vc4: hdmi: Remove mutex in detect
Date: Mon, 29 Aug 2022 15:47:26 +0200
Message-Id: <20220829134731.213478-4-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 88 +++++++++++++---------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 10 +---
 2 files changed, 34 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index faf52c20b95b..b786645eaeb7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -279,7 +279,16 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
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
 
@@ -304,13 +313,11 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
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
 
@@ -320,14 +327,21 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
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
@@ -345,9 +359,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		}
 	}
 
-out:
-	mutex_unlock(&vc4_hdmi->mutex);
-
 	return ret;
 }
 
@@ -2663,17 +2674,6 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	int ret;
 	int idx;
 
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
 	if (!drm_dev_enter(drm, &idx))
 		/*
 		 * We can't return an error code, because the CEC
@@ -2688,6 +2688,8 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 		return ret;
 	}
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	val = HDMI_READ(HDMI_CEC_CNTRL_5);
@@ -2722,6 +2724,7 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
 	drm_dev_exit(idx);
 
 	return 0;
@@ -2742,16 +2745,7 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 		 */
 		return 0;
 
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
 
@@ -2763,6 +2757,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	drm_dev_exit(idx);
@@ -2785,17 +2781,6 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	unsigned long flags;
 	int idx;
 
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
 	if (!drm_dev_enter(drm, &idx))
 		/*
 		 * We can't return an error code, because the CEC
@@ -2804,11 +2789,13 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 		 */
 		return 0;
 
+	mutex_lock(&vc4_hdmi->mutex);
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
 		   (log_addr & 0xf) << VC4_HDMI_CEC_ADDR_SHIFT);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+	mutex_unlock(&vc4_hdmi->mutex);
 
 	drm_dev_exit(idx);
 
@@ -2825,17 +2812,6 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	unsigned int i;
 	int idx;
 
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
 	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
@@ -2845,6 +2821,8 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 		return -ENOMEM;
 	}
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	for (i = 0; i < msg->len; i += 4)
@@ -2864,7 +2842,7 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, val);
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
-
+	mutex_unlock(&vc4_hdmi->mutex);
 	drm_dev_exit(idx);
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 79495ef79f09..db823efb2563 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -195,15 +195,7 @@ struct vc4_hdmi {
 
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
2.37.1

