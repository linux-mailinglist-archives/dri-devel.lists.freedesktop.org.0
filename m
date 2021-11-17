Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F2D45441D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 10:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826B36E9CC;
	Wed, 17 Nov 2021 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975C56E9AE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 09:45:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id F148558082C;
 Wed, 17 Nov 2021 04:45:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Nov 2021 04:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Rn2cBDalU27XR
 TGqFcdHSb2S/DgTdkQSCNY7WmbqCjE=; b=cc2Bc2V9kngRQi3zj/iACk4NzzdMt
 nXb/Ojt0OCXZDsVN7bmggNvbmRBrM7DICakPBUTFZC4UokBmhcb3ZtGTHFRLXDpN
 zH4tQ4rHUWi3ppLUfUWqqT0JBx9amQI4sAUrwo0Wqx3yFQd6IRCCgjlmDOKuUjx+
 IP+Vsb+xUpwouIXY7J2kFYBPw7v9LcnV/Za6EKNzn6jxG52Jx2KN0E58iSK7iBBP
 dy7qwZcjyqF9rp+yXGkVwMOUplxCMZHZ20Y4D/P+TZ+Jjhj/RETS205mCuAv4wr5
 sJxj0mQ9bGjramrkJlRxHviiYQDL4ib1p6r8ySrvCdoo6Ykzz/b5b0D8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Rn2cBDalU27XRTGqFcdHSb2S/DgTdkQSCNY7WmbqCjE=; b=XipXw3HD
 q9a+gk9Nbw8hwvh//NB+rpA/dTih4y34l31aiQ4nmNjUvZSOUHiGkk1p4qmyucxs
 AvAybiWkDJjLbbu4PzDG67u5tD2eNta8zbNNXwwWc0qqfZy46OPdlAOBHUVvZmGZ
 fdptREQqeqfLfHyFgrhtrmOAq/EzUfeS4WkWVr5vEkwo8lspmD/Lr+uNjivJAt3l
 oE6WbCdWtBSZ4x8A9KcHQe4wzEAfGu1oCzRH33yTPfQ81qWfvMpadfwRCwehH9kO
 9NVFII5LE9X+b2SgW8uKn66ccYi6AQOZiM53uOJEMe71eDH/rhvTJHcsfMsLmu7C
 7rvUrq+mUAkCKg==
X-ME-Sender: <xms:SM-UYQ8p0q7PSgWhxIvsurlh4RHx182PWhSGiUYZuczCaoG6rRjqBw>
 <xme:SM-UYYsRKWT3iuxIqtN_-cuvGeNpYJIiHW1ohW9eyYIownCwz0I3Ai5yFiqQ0fW8B
 dejlEfdpjQWuBld9FI>
X-ME-Received: <xmr:SM-UYWCywzicrfIc_9J7mMF6y2HloUVDSjXY4_kXvHgJiyRwWLrwm3n0MvcyQI5t0W6PLSzqGahFly1obGezlSqSBfWiZutKpKAs35Pb7PM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SM-UYQef-PJRIKuFUKmpZnp89IQzNPRtL3023eLwejyG-5cgGUSh3Q>
 <xmx:SM-UYVPEc7u55QPAk9IeqDKr01Bk3nvVg802POzjXwHjhvD2bzX4pw>
 <xmx:SM-UYanFF0oHZuPAGfsNuAFEg-NN3QpUBcInBRJtWhvE-nZ1GwJNiw>
 <xmx:SM-UYYqPn26A8sRROz_pwoXs_wN4FCh84gxSToo3AIuKISYcfzQL6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 04:45:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 6/6] drm/vc4: kms: Fix previous HVS commit wait
Date: Wed, 17 Nov 2021 10:45:27 +0100
Message-Id: <20211117094527.146275-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117094527.146275-1-maxime@cerno.tech>
References: <20211117094527.146275-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_kms.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index d9b3e3ad71ea..b61792d2aa65 100644
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
@@ -357,16 +357,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	if (IS_ERR(old_hvs_state))
 		return;
 
-	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
-		struct vc4_crtc_state *vc4_crtc_state =
-			to_vc4_crtc_state(old_crtc_state);
-		unsigned int channel = vc4_crtc_state->assigned_channel;
+	for (channel = 0; channel < HVS_NUM_CHANNELS; channel++) {
 		struct drm_crtc_commit *commit;
 		int ret;
 
-		if (channel == VC4_HVS_CHANNEL_DISABLED)
-			continue;
-
 		if (!old_hvs_state->fifo_state[channel].in_use)
 			continue;
 
-- 
2.33.1

