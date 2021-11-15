Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726C45037B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0A6E8EE;
	Mon, 15 Nov 2021 11:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D244B6E8EE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:31:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DADCA2B0117B;
 Mon, 15 Nov 2021 06:31:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Nov 2021 06:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JXMq+KOcAD2Xx
 JHW+HvbuJoR3Z58HDi14qr1psOWzi0=; b=HEs9XIrKeEeUsAAMY+ezvOnRhVBuA
 OXmgJWWFLxyzJAPToVKQxbxlzl8qolx1C3s5xRE7RxnTxna+pUaRaCbQWm/vv5yy
 jSYJsg6yDdULOLSfmbnx4650rJlmFAiJwey3YH8UEixqmQl7wXVXvoNVL2x1HOz9
 yS8MIcwK6qbg4AGR96MWRRTwNzmKre7Pr2nWMyck3aKetNfu1Nsw+724wWoK60md
 AoWhkRNeQAh+yv8Jt93RXUFHyDOQUMqN5nX+NwCXaCu6rUwtDIlJwXNLLCO1R89N
 TznyysSRoo+PU9f4XblsKf556hKdhnCfmos6V0CmpCatyDafzAPmodRWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JXMq+KOcAD2XxJHW+HvbuJoR3Z58HDi14qr1psOWzi0=; b=nP7f9d/L
 GAI39lM0NB1hJA8W6H2AOdsEVXImUxUYgJ/EtS6ecV/Ek4cjR2d1maibERIytCDM
 25DWcMCuSfs6mEXGjNxGOH5evyDSaTBli21dGE9WEv/yXBkDhlb/kloQiMF6XrfM
 V5JJI9P+fJ8oiIab9ESygbzCtGqtNkltdRhKYbENJTX9vcipXAbr7IxVJqW6/o6t
 L339DVnvldDAs+jiYWGdXC73I/ywEHcQ8VGbaNX60+60yl984NRz+blNoPzLJlst
 e1IZWz9//O8sdu5qRO+etV6tZ+1+YXFrfG7XaCPYSNtAGdKYsZYTkVMuuwgAKMV0
 n17SRrSK8qQfwQ==
X-ME-Sender: <xms:EUWSYTmNNVLVAePmrXFo_ZToih12Q2eDhjQ5ygCB4eMuV6xa3KHWhw>
 <xme:EUWSYW1zMAQkcTy0nRfuT5IhCaavk4HWVbF7RM3EIjwLxbS__TqlI9mue7YNvJqYi
 kARrcY0aKs54RX2bzQ>
X-ME-Received: <xmr:EUWSYZprMTYaTC5O91iNcaaGU8njcqSncmHGV2D2Q0WHJ6FzFFByHaLj7jho20vRHjRURsWyAv6AVB15qQ5C1Jjvd3iCc1vAimTp6DCN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EUWSYbmYknxNcsCx372r9gEhQQ06AeM-_RqcnEjvP4J50ifT9A0erA>
 <xmx:EUWSYR0BcTSHfYe0L9OV4d3kgT0BXC657ikyEtQ-Y1wjQFvPxOeCfQ>
 <xmx:EUWSYasjwIj8SmzoUfm3T6yqHJyyLH69CQgGXSXZvZ2BQ8kyoJjf0Q>
 <xmx:EUWSYbxZU3e1Ed7nquklU_-XNNhY1kWLFrYxzpfi99kWZl93fz870LfteTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:31:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 6/6] drm/vc4: kms: Fix previous HVS commit wait
Date: Mon, 15 Nov 2021 12:31:05 +0100
Message-Id: <20211115113105.103275-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115113105.103275-1-maxime@cerno.tech>
References: <20211115113105.103275-1-maxime@cerno.tech>
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
 Jian-Hong Pan <jhp@endlessos.org>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our current code is supposed to serialise the commits by waiting for all
the drm_crtc_commits associated to the previous HVS state.

However, assuming we have two CRTCs running and being configured and we
configure each one alternatively, we end up in a situation where we're
not waiting at all.

Indeed, starting with a state (state 0) where both CRTCs are running,
and doing a commit (state 1) on the first CRTC (CRTC 0), we'll associate
its commit to its assigned FIFO in vc4_hvs_state.

If we get a new commit (state 2), this time affecting the second CRTC
(CRTC 1), the DRM core will allow both commits to execute in parallel
(assuming they don't have any share resources).

Our code in vc4_atomic_commit_tail is supposed to make sure we only get
one commit at a time and serialised by order of submission. It does so
by using for_each_old_crtc_in_state, making sure that the CRTC has a
FIFO assigned, is used, and has a commit pending. If it does, then we'll
wait for the commit before going forward.

During the transition from state 0 to state 1, as our old CRTC state we
get the CRTC 0 state 0, its commit, we wait for it, everything works fine.

During the transition from state 1 to state 2 though, the use of
for_each_old_crtc_in_state is wrong. Indeed, while the code assumes it's
returning the state of the CRTC in the old state (so CRTC 0 state 1), it
actually returns the old state of the CRTC affected by the current
commit, so CRTC 0 state 0 since it wasn't part of state 1.

Due to this, if we alternate between the configuration of CRTC 0 and
CRTC 1, we never actually wait for anything since we should be waiting
on the other every time, but it never is affected by the previous
commit.

Change the logic to, at every commit, look at every FIFO in the previous
HVS state, and if it's in use and has a commit associated to it, wait
for that commit.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 6533f3360e75..d7a2bcb7d723 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -337,10 +337,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
-	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	struct vc4_hvs_state *old_hvs_state;
+	unsigned int channel;
 	int i;
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
@@ -357,15 +357,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	if (IS_ERR(old_hvs_state))
 		return;
 
-	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
-		struct vc4_crtc_state *vc4_crtc_state =
-			to_vc4_crtc_state(old_crtc_state);
-		unsigned int channel = vc4_crtc_state->assigned_channel;
+	for (channel = 0; channel < HVS_NUM_CHANNELS; channel++) {
+		struct drm_crtc_commit *commit;
 		int ret;
 
-		if (channel == VC4_HVS_CHANNEL_DISABLED)
-			continue;
-
 		if (!old_hvs_state->fifo_state[channel].in_use)
 			continue;
 
-- 
2.33.1

