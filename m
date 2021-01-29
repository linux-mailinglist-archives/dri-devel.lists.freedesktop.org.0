Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D533094C4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BECD6ECA6;
	Sat, 30 Jan 2021 11:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE7F6EB54
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 16:07:03 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id F09E558081A;
 Fri, 29 Jan 2021 11:07:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 29 Jan 2021 11:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=fGZ6k8Ygrz3T2ZFbJBm07q9VXV
 RNVs+TQHDXj5gvHyc=; b=KRpgZ14qmdLEEwQovzQJFxGxeVm2B7odBDM4C+EIYL
 gbafpun5rJ5Mtobz46c8Vsw6or3lkNG3mDilHUvvQoQT0sa+kduS8qo+rl2v8Qsu
 baRxPD739OPruUraTJ7wCN8dbD42rPqiTA9+v39cb5kz5uawuZQE24vEORi+LbGz
 XelI+VJq/l1KMbRM/Lxvb8xuGaDU+tWw9qdp+pT17Ai4LHCaqKSdh1+bAXbiXJDp
 63MYlPMujgRfpsE6n9q8KRPte9a+NQ41hI4S/dxUc1L3lLTIrNw/jP1nmyDIjT9N
 PZepTBsYo64delAyeCVpMrSw34yyUc3jFKw6YxU5ko4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fGZ6k8Ygrz3T2ZFbJ
 Bm07q9VXVRNVs+TQHDXj5gvHyc=; b=LOmtaBAQms7jADK1peQ/TNt71V6Oo2gfW
 tfnP2MTRf4PDIAXi6sdjT0HM6BLy7y9cK67ofkBSplcLts5nj3VmlYCsuSo7IyIS
 ycMx2/WBV2N8z54B6oaIOR8R7LaZrxJ4efFInHT3wEPC1uo2Ee3y7KGoVCiF8Zp5
 nLM1CZn5lM+AF9GwOIDZsa5PaUpdJ656xDqsKOPRYm+g/qKTWd7eQBLKVYVN9XGB
 EJoF0poxMvEvNSZYx8CtSzzmO/lPzU/jEjzstfRS0cFIvj+lzvl/kmbhfkZG68QZ
 RKsFDeaZCEFNXzVCSjmNotgEjiV0DPE3LYKsDkKQ1s1j46r+68MEQ==
X-ME-Sender: <xms:ozIUYFj-InlS4camERJvlPeLD0kOBspwMrpIqEKyz1DRFLkKDpCzJw>
 <xme:ozIUYLlXkJaTUA9uu77S0a6VuH2JLixlwxjj-h1ebURmgO4mf26GwPRadej-TmRLU
 q7LbPQAktoLOPRqaR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ozIUYLZ2nY6OWY2BLrWvV-5YrpQzXa1tQ4hxlwxv7AmwKp5iT7fCxg>
 <xmx:ozIUYGFIIelBdeTOBpJJ2IOsxYbsVAjN27MraAdsr6URolAupe0Lcw>
 <xmx:ozIUYKb4EzJgGL85kXuxVBmGwaBwcaTSXEpZ8brS8ujo3egghslZkA>
 <xmx:pDIUYCiSWZ7tbMFYHl1EpVl47CwQyC1zuJJq8W7ik1qEPhUiVtoMkQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB654240057;
 Fri, 29 Jan 2021 11:06:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: hvs: Fix buffer overflow with the dlist handling
Date: Fri, 29 Jan 2021 17:06:47 +0100
Message-Id: <20210129160647.128373-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 0a038c1c29a7 ("drm/vc4: Move LBM creation out of
vc4_plane_mode_set()") changed the LBM allocation logic from first
allocating the LBM memory for the plane to running mode_set,
adding a gap in the LBM, and then running the dlist allocation filling
that gap.

The gap was introduced by incrementing the dlist array index, but was
never checking whether or not we were over the array length, leading
eventually to memory corruptions if we ever crossed this limit.

vc4_dlist_write had that logic though, and was reallocating a larger
dlist array when reaching the end of the buffer. Let's share the logic
between both functions.

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Eric Anholt <eric@anholt.net>
Fixes: 0a038c1c29a7 ("drm/vc4: Move LBM creation out of vc4_plane_mode_set()")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index b5586c92bfe5..3d33fe3dacea 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -227,7 +227,7 @@ static void vc4_plane_reset(struct drm_plane *plane)
 	__drm_atomic_helper_plane_reset(plane, &vc4_state->base);
 }
 
-static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val)
+static void vc4_dlist_counter_increment(struct vc4_plane_state *vc4_state)
 {
 	if (vc4_state->dlist_count == vc4_state->dlist_size) {
 		u32 new_size = max(4u, vc4_state->dlist_count * 2);
@@ -242,7 +242,15 @@ static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val)
 		vc4_state->dlist_size = new_size;
 	}
 
-	vc4_state->dlist[vc4_state->dlist_count++] = val;
+	vc4_state->dlist_count++;
+}
+
+static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val)
+{
+	unsigned int idx = vc4_state->dlist_count;
+
+	vc4_dlist_counter_increment(vc4_state);
+	vc4_state->dlist[idx] = val;
 }
 
 /* Returns the scl0/scl1 field based on whether the dimensions need to
@@ -1057,8 +1065,10 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		 * be set when calling vc4_plane_allocate_lbm().
 		 */
 		if (vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
-		    vc4_state->y_scaling[1] != VC4_SCALING_NONE)
-			vc4_state->lbm_offset = vc4_state->dlist_count++;
+		    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
+			vc4_state->lbm_offset = vc4_state->dlist_count;
+			vc4_dlist_counter_increment(vc4_state);
+		}
 
 		if (num_planes > 1) {
 			/* Emit Cb/Cr as channel 0 and Y as channel
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
