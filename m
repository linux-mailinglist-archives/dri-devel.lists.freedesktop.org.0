Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90043288385
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C656EC35;
	Fri,  9 Oct 2020 07:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD606E3C4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:25:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AF696580314;
 Thu,  8 Oct 2020 07:25:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 07:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Zb15ltGpiJZp1
 2wFhpBRBUlaJhC/18C0bN04Lnu613k=; b=ATQJfsOYvHV1lk6/+4PkMGvJQa5St
 idM5qGm6WJnTvHABr9T1jmcJQrnGeAzsaTsePKymRcACZcfQmWG8gR/AHnmqMwfM
 uL7w6sbUSGRt1ZMDZuNSAodznqgz88JbY2iGF2/hYdlUa+K2vVBNb0TeMY3v5kPp
 cIIESt3fUDXiDPSCxKQyLFAbGW7jEZZsc/dO/t9gBu2VIK2BJuD55MWZD9rmtRHv
 zBj76ExSgCMJOLMISK2JXomUujE693adDEBRuCtvCrB3oxBf95Ue700QLEUMHlmR
 ZcyzcDrYh8Lf9D5E8clqyUNEHHwjWXTjA9Ed/OnCDkaQyBC+BsQL5sGFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Zb15ltGpiJZp12wFhpBRBUlaJhC/18C0bN04Lnu613k=; b=ZL3LJjja
 smZVoihJBxrZaSQHv9F+eHK4HEH7uHHbdHJCRWbrfH0NkNy/se+O5I8oONRbfge6
 Q9+WzY6VxZvitEMdM0idTc72Wx6MvQ3ePO5q7+dpds/ufIRrZQKd/2IZ1q9aMKq0
 cygFBRzWNIGgpCpRs7uajx8KySqZ2iVuU6wjtV9Mkn8TZuBv6Cfq8S83w0cTiIpG
 VZCQOxYuk401BdbLWThdTySHoVDDD3ACgmlYBJEn2hoDqOU3bdStjAwzCzovcXBZ
 zw02NHr9o/hkP1awSb3eOA6d097lcCVPPJhjEa2uT+GGYbNqWvfiF+tAoZCxTLxi
 azY26NEp08omPw==
X-ME-Sender: <xms:Jvd-X5HHdxjWDl6WiQQWs2Uiercxk3nbrDztaBPm3fAyQ--TGjwE3Q>
 <xme:Jvd-X-Va7gewb5uF-2Ohv0-gzR3YDbf1uC04Cy1_16GkDaM6w8cuJlzRD1Gd9QMeV
 Q3T3CyAJDjaQ5qO6qo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jvd-X7LJot4uj9htT6x5ElQ0wqqQZ1Nqmdh-KiiXEGoyKPJVWprUew>
 <xmx:Jvd-X_E4gZ0FQGdRjMR4PbtmFKbiJy5Kvq_mpf3ogEjV5q5-_9TZYw>
 <xmx:Jvd-X_WIneFYRm30ztOAvoSCCdCaFSACwS8_990Uit3FC3LiqQ1nrg>
 <xmx:Jvd-X4W_LGVL1U4nrqx0s-A8oprw1oyRVHC7b3RD_he8Gqobp5yS9w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27DC53064683;
 Thu,  8 Oct 2020 07:25:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 4/4] drm/vc4: kms: Fix VBLANK reporting on a disabled CRTC
Date: Thu,  8 Oct 2020 13:25:19 +0200
Message-Id: <20201008112519.43691-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201008112519.43691-1-maxime@cerno.tech>
References: <20201008112519.43691-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a CRTC is enabled but not active, and that we're then doing a page flip
on another CRTC, drm_atomic_get_crtc_state will bring the first CRTC state
into the global state, and will make us wait for its vblank as well, even
though that might never occur.

Fix this by considering all the enabled CRTCs by either using their new
state in the global state, or using their current state if they aren't part
of the new state being checked, to remove their assigned channel from the
pool before started to assign channels to CRTCs enabled by the state.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index c9dfd5535a7e..0751ce5c6467 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -645,6 +645,14 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
  *   need to consider all the running CRTCs in the DRM device to assign
  *   a FIFO, not just the one in the state.
  *
+ * - To fix the above, we can't use drm_atomic_get_crtc_state on all
+ *   enabled CRTCs to pull their CRTC state into the global state, since
+ *   a page flip would start considering their vblank to complete. Since
+ *   we don't have a guarantee that they are actually active, that
+ *   vblank might never happen, and shouldn't even be considered if we
+ *   want to do a page flip on a single CRTC. That can be tested by
+ *   doing a modetest -v first on HDMI1 and then on HDMI0.
+ *
  * - Since we need the pixelvalve to be disabled and enabled back when
  *   the FIFO is changed, we should keep the FIFO assigned for as long
  *   as the CRTC is enabled, only considering it free again once that
@@ -656,6 +664,7 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 {
 	unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
 
@@ -667,15 +676,14 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 	 * the same CRTCs, instead of evaluating only the CRTC being
 	 * modified.
 	 */
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		struct drm_crtc_state *crtc_state;
+	for_each_new_or_current_crtc_state(state, crtc, crtc_state) {
+		struct vc4_crtc_state *vc4_crtc_state;
 
-		if (!crtc->state->enable)
+		if (!crtc_state->enable)
 			continue;
 
-		crtc_state = drm_atomic_get_crtc_state(state, crtc);
-		if (IS_ERR(crtc_state))
-			return PTR_ERR(crtc_state);
+		vc4_crtc_state = to_vc4_crtc_state(crtc_state);
+		unassigned_channels &= ~BIT(vc4_crtc_state->assigned_channel);
 	}
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -690,10 +698,8 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		if (!new_crtc_state->enable)
 			continue;
 
-		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED) {
-			unassigned_channels &= ~BIT(new_vc4_crtc_state->assigned_channel);
+		if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED)
 			continue;
-		}
 
 		/*
 		 * The problem we have to solve here is that we have
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
