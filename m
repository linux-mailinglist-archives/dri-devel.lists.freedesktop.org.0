Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051F43983C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DADB6E096;
	Mon, 25 Oct 2021 14:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D026E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id F18105805DA;
 Mon, 25 Oct 2021 10:11:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 25 Oct 2021 10:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Swq6WN1LWhtTO
 KKPspdCoTPg4VAAoZS892HWwv2gRsM=; b=CgG21jyMsGOtCPOCwdmWvF+ZyiNeo
 qaDfdyzT2ATbtW7N/tSfUFcLNAOdZKqrFxCC0lTAaIKpIdRCVjvZvGVL5Bnms8e3
 e7KRtOxpukAZdZNEJjSJiDYaIKwSTZQWbvyaad5p8XrrtChpr4fNPmU0TfHkr3lz
 fuEvi3wUQ4eFp6tJFCLzIhH3JfxOf1HVZtcwxXgcBxfE0/FiK4cbwMId/YSQ13Hl
 MQtJl57jfn3Gvj1zQESNc2strFsZXRtgTwBvPZH4b/gwYJmdJuoIZRz4ARkE61q5
 J/2+EykmnnqZpfRdyO2e/uimJ+wC+w+VKl6iZkSckQbeZSgqTSFou0rYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Swq6WN1LWhtTOKKPspdCoTPg4VAAoZS892HWwv2gRsM=; b=SjrSEoqg
 l5mXu0y2oU9JZxM/h8KGFtd7esdhIKY322gbxrwDjBCscXVssjDURECqDKTA5CSV
 zIK8Yf6hvPhI4EdGm4vB9UDCOKhioFRb1tsQOT+hcc8E0daE1QkwMjVOyPicOd11
 VBao13T6h2DgW05F9r+NYzLyt0d94KtNQRux1fHY78OTcDR8+QK5kqVWtuKmDfv3
 cBpuOv8TymtnP/vZWj1I9F+q1c9Fzn3e8hRRkyCj3D3CAQwPS3Wt3JM4VJ2DF24k
 ZcW7Vlcgjt5FwmsrpFHbs9mOEwxA01KJhNY5t4MFKorODTu9qOEF5vTsmNhYI0d+
 79VeGenq33X1dw==
X-ME-Sender: <xms:DLt2YeWBCWYuNF6luSfpPNmW0EHWbZz0AHCDKtH1M95lg37enE7f5w>
 <xme:DLt2Yako0pn24XaWQYYDd8bhDPqkAJfqwRU9hXWU4PxITmwtBEj31C5P2Pf2ZasNb
 oZoPOKpVAA1cmzo_o0>
X-ME-Received: <xmr:DLt2YSZ-L1CcJXxtmcZXJuKeo60quL_NGI_kRXBP3jjnmyKgm5jkW8sGkmjdJ8e2YvBssTR4xzskf2UJHfafYmot9nstGlObo-2Aobfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeetueeludeikefgheethfefgfektdfgheefleetheffuddvleegffekvdfh
 vdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DLt2YVVGelPetTW1xE0CM1-W2xwSGj_JSPW6cuZ6zIQ2vwQxnomgcg>
 <xmx:DLt2YYkU4C6dYWkZoVbnGZPMKaB4fsL5S3Z5sHhEFusuLhnMY60hyg>
 <xmx:DLt2YadwDoVIhmxtuBXRy5m8D_WTkLUW5g-ZW78Puq8t0Ee7L_Ehkw>
 <xmx:DLt2YVimMQKjPykCdMnl9dELLSB4qfkN1z2EqFsnQSyYbEJQi9lDjw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 3/9] drm/vc4: crtc: Copy assigned channel to the CRTC
Date: Mon, 25 Oct 2021 16:11:07 +0200
Message-Id: <20211025141113.702757-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accessing the crtc->state pointer from outside the modesetting context
is not allowed. We thus need to copy whatever we need from the KMS state
to our structure in order to access it.

In VC4, a number of users of that pointers have crept in over the years,
and the previous commits removed them all but the HVS channel a CRTC has
been assigned.

Let's move this channel in struct vc4_crtc at atomic_begin() time, drop
it from our private state structure, and remove our use of crtc->state
from our vblank handler entirely.

Link: https://lore.kernel.org/all/YWgteNaNeaS9uWDe@phenom.ffwll.local/
Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  4 ++--
 drivers/gpu/drm/vc4/vc4_drv.h  |  9 +++++++++
 drivers/gpu/drm/vc4/vc4_hvs.c  | 12 ++++++++++++
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 98de8b265220..e3ed52d96f42 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -708,8 +708,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-	u32 chan = vc4_state->assigned_channel;
+	u32 chan = vc4_crtc->current_hvs_channel;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -955,6 +954,7 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
 static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.mode_valid = vc4_crtc_mode_valid,
 	.atomic_check = vc4_crtc_atomic_check,
+	.atomic_begin = vc4_hvs_atomic_begin,
 	.atomic_flush = vc4_hvs_atomic_flush,
 	.atomic_enable = vc4_crtc_atomic_enable,
 	.atomic_disable = vc4_crtc_atomic_disable,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6d2480abcf08..4b550ebd9572 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -514,6 +514,14 @@ struct vc4_crtc {
 	 * handler to have access to that value.
 	 */
 	unsigned int current_dlist;
+
+	/**
+	 * @current_hvs_channel: HVS channel currently assigned to the
+	 * CRTC. Protected by @irq_lock, and copied in
+	 * vc4_hvs_atomic_begin() for the CRTC interrupt handler to have
+	 * access to that value.
+	 */
+	unsigned int current_hvs_channel;
 };
 
 static inline struct vc4_crtc *
@@ -926,6 +934,7 @@ extern struct platform_driver vc4_hvs_driver;
 void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
+void vc4_hvs_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index f8ed0f6a57e0..604933e20e6a 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -393,6 +393,18 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
 }
 
+void vc4_hvs_atomic_begin(struct drm_crtc *crtc,
+			  struct drm_atomic_state *state)
+{
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
+	vc4_crtc->current_hvs_channel = vc4_state->assigned_channel;
+	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
+}
+
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 			   struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 26eda7542f74..9809ca3e2945 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -435,6 +435,7 @@ static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs vc4_txp_crtc_helper_funcs = {
 	.atomic_check	= vc4_txp_atomic_check,
+	.atomic_begin	= vc4_hvs_atomic_begin,
 	.atomic_flush	= vc4_hvs_atomic_flush,
 	.atomic_enable	= vc4_txp_atomic_enable,
 	.atomic_disable	= vc4_txp_atomic_disable,
-- 
2.31.1

