Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6101443121
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92672E7F;
	Tue,  2 Nov 2021 15:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD32C72E79
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0EC35580741;
 Tue,  2 Nov 2021 11:00:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 02 Nov 2021 11:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+b4aHRbMA1pyd
 a5KTq6/K0ejWCjS/tuM/zawpmnG4N0=; b=HlDLZkAscPQEzaHLwLCtG51u+2Gl/
 fT4noN9KE2dCdyb3A0ybki44ffPO458DQsDAspVba6FdgSE41fXTAyxsP8Oj7b+U
 OnQk/l0zdW6uonVXdXe9QmquIv6FDYmqL5ZkacOVHVC5CrY54ut5esURE7QfEHs3
 Q+G1f2afN7UZkope9RZ809DLWILnneEQIE98dBedog/993tAmq3cB6db7lEmMagR
 mqzAPVGjnYCuFrRmp1MgkHF99hwEknhA3Sfac0e5EoiO3ubsHYGvWxjIx9SWugee
 uHjY2gz9xDVDoCy1akJStMb1Zg14OJqwBH3GZXB18P4IqiLugPmY664NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+b4aHRbMA1pyda5KTq6/K0ejWCjS/tuM/zawpmnG4N0=; b=fez03cCf
 dMSW+7gW0eTnces4F2w1yapT8N4TqNcCqmpowohbdCeMQRgpkRgY6uXtQnP0L22l
 1shB8CjMcZ1BGwtrj+5QaqppDgR7/KyQz0KB537K54N66UcJL7lHwUejtEPi/oZz
 zkkDlqpzgT4BtGsoVh3PSxy/+XkAo1n/2JrBz83qmc6y4EdcLQfhtxtXi6W3UtKR
 h9oCRD6Vmm0UyHat3YoWp6aEcOYdjfo9fxKtwq4DUC1YFBhZ0Uo2j/8wzQY1HGo/
 mlrQ4slgeHg/pEem1KqWjee2h7Had272DAajP5hyK2nh32xojsQbLWoCljdEU8qp
 1gZdE2SeHywKAg==
X-ME-Sender: <xms:dlKBYc5HE3lFJS7oERORFED-m-rafDwBgBydv3NP5Il9tmZ6HRj2Ow>
 <xme:dlKBYd7Clv2nd7mLRInU7H22fzpWraJynoSIWS12uhvEFoUyazY9q6cK9QbVAiRWz
 lWUIxF4zEO4n_pr9b0>
X-ME-Received: <xmr:dlKBYbfETIyQqjy8Tj9MhtPrFKqswwiZ_BBoDdHswtrPhR9-skL0h0bTmbMvCP2yqW-JkvQitvi92GYi2hjB0ec6k6yEsnqXlXLwKZr2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dlKBYRKYAwUA-UFaL93JDvdNPGn0MVp-zMmEqGSHQmzvMqwxH_YlYw>
 <xmx:dlKBYQKwA2b-CzX6kWBnF5RVtOAReINJpZhaZ9dCsLK4pobcggaYGw>
 <xmx:dlKBYSxZcj77Q8cqLx2VgxRfwNEXC1MY-oqgauA34mb1FUgdumu0gA>
 <xmx:d1KBYVXhVhKfCz68ABQqtOx2tN0dojjqZvDeS5wDuSc4CHly39wOGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 07/13] drm/vc4: hdmi: Remove mutex in detect
Date: Tue,  2 Nov 2021 15:59:38 +0100
Message-Id: <20211102145944.259181-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
index 49bcb0342cc9..826ca7aaf8d7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -183,7 +183,16 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
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
 
@@ -215,13 +224,11 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
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
 
@@ -238,14 +245,21 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
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
 
@@ -265,9 +279,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		}
 	}
 
-out:
-	mutex_unlock(&vc4_hdmi->mutex);
-
 	return ret;
 }
 
@@ -1996,21 +2007,12 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
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
@@ -2045,6 +2047,8 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
@@ -2053,16 +2057,7 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
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
 
@@ -2074,6 +2069,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return 0;
@@ -2092,22 +2089,13 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
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
@@ -2121,22 +2109,13 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
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
@@ -2157,6 +2136,8 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 36c0b082a43b..32b0aa447717 100644
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
2.32.0

