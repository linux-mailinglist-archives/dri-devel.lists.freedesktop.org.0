Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C8C45441B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EFE6E9C1;
	Wed, 17 Nov 2021 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCBF6E9CC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 09:45:39 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C7E8C58082C;
 Wed, 17 Nov 2021 04:45:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 17 Nov 2021 04:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=rAjeSvERe2N/W
 YLJ9YeTPfCxmvB30dSdBrVz26BBJpM=; b=N/Ueqr+8dDghxj4F1tnOGm04w08T/
 opawbkj6eJghl7at89mgt/wc2z1R5BN95jCZUK6zH1rqnQ/+0Jx3sXlyQfXmSKU1
 fFKpkLFTZv+i7UFE57niMP82hbHCI7Cw1XCgIYuMzeuB04zyT0+IaAzg79n0t7mk
 oP/z4MgTXEe16Lyn1JYp1Tqvi06uFfSIL9d6TiikrGTD6nxSG+k6mieDCydxDr8A
 8Y5cLcf69GAzbpQjbkrln878Q+MnpoqHCPHkVUdqX3cjlJgapdz36A+Y9Jg1HMmm
 pIJnD8zhgFR8rswFXtjK3iZy2CMZ9pJOgB6x8iclHm+ea0emDYyNgd2Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=rAjeSvERe2N/WYLJ9YeTPfCxmvB30dSdBrVz26BBJpM=; b=dbw6jSbV
 6WzFWoM94q4nmYViN9RPCbBcFbCXqCxpTclBqrIn2WZq+mAd0Wqn6beDqf8q0T/F
 bdF1hsIt50qKmbE4rNsbfcj9SJZ/j+3CATKVZ4WHAEdVkBfWqqcXmt4iIo9giwb3
 xIilDjXAMBpIuKTvFBc8RFugYLbr4FVHwe003dSTWSBCUKMyQOSLJ/s5ESUrz4KW
 XOfXgy1vy88L/n5vJ8q2DEZX4y4pUPsvEIvodjAOQCWArPTfL0A3cx5IJz9furfI
 xYj8j4ID/F2nW1rmkWlXFSHBXweUz+Dk4RNvrq16bf2tUpyI2QvY6sKhrowgPfNG
 EXR20RDJI9QPDg==
X-ME-Sender: <xms:Qs-UYbWcNqpdHH48VvQC4F4P2HlyvY5F90bgXWj831cLbgbsCrBaAw>
 <xme:Qs-UYTlz3T6CZcUfkTioTgQhj5ITe50D61ANOlDB3peDuASNW8t3p0FCQmAnXCokk
 RYH48YfFXo3Xh42IBg>
X-ME-Received: <xmr:Qs-UYXadu1fYmlRPK3zzW8ZJz_46yswOjwdITKrxJ3DdH51anO5aCKuQLr_q4TGPPetrLwxmQKokgvjtLNpc3oPVO6JVZcfSyAYqJxh32xs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Qs-UYWV7BaxMUlb_7Bmxaw7yWw1PAzJjziiRi86SVy0hNzSNFsA5zw>
 <xmx:Qs-UYVkMkr7M3iiYr-AYXal97DWQqfNr7GqbcNhF4BLP0UPSGDqgfQ>
 <xmx:Qs-UYTfUOWzVXqo_bXiTnm4SnEJcbnY_6L3wtyw0g04t09bv2hXz2A>
 <xmx:Qs-UYWg_NJ-ps0k63IsE-NUyJuaDtyT0Jn8uFBmAj2KRkQ57yr5ORA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 04:45:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 3/6] drm/vc4: kms: Add missing drm_crtc_commit_put
Date: Wed, 17 Nov 2021 10:45:24 +0100
Message-Id: <20211117094527.146275-4-maxime@cerno.tech>
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

Commit 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a
commit") introduced a global state for the HVS, with each FIFO storing
the current CRTC commit so that we can properly synchronize commits.

However, the refcounting was off and we thus ended up leaking the
drm_crtc_commit structure every commit. Add a drm_crtc_commit_put to
prevent the leakage.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 3f780c195749..7c1d0c3beba2 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -361,6 +361,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		struct vc4_crtc_state *vc4_crtc_state =
 			to_vc4_crtc_state(old_crtc_state);
 		unsigned int channel = vc4_crtc_state->assigned_channel;
+		struct drm_crtc_commit *commit;
 		int ret;
 
 		if (channel == VC4_HVS_CHANNEL_DISABLED)
@@ -369,9 +370,15 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		if (!old_hvs_state->fifo_state[channel].in_use)
 			continue;
 
-		ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[channel].pending_commit);
+		commit = old_hvs_state->fifo_state[channel].pending_commit;
+		if (!commit)
+			continue;
+
+		ret = drm_crtc_commit_wait(commit);
 		if (ret)
 			drm_err(dev, "Timed out waiting for commit\n");
+
+		drm_crtc_commit_put(commit);
 	}
 
 	if (vc4->hvs->hvs5)
-- 
2.33.1

