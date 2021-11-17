Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7670B45441C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 10:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C896E9D4;
	Wed, 17 Nov 2021 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A946E9C1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 09:45:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E7CE458082C;
 Wed, 17 Nov 2021 04:45:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Nov 2021 04:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TbVHiqRBM6N46
 7+EZlXHb1qEJ31wpt8NzKax2+xEJzo=; b=ksuowM0crYAClXszZD61Cf4J2F14l
 V/CwwOZuGsUf7LeA1fjIRnxgTon1ie1aZy/07wQYiBLX8xaV3Rzez4J2dSIipjZf
 tLJwbfmbAJYME9svOZ461ODxYPP67hjY3XTgx8cDbiEaJR2ROIdG5XUG3tNDr8A7
 x+uscgUjggj6dAwu61olTRV8RYINlIqmVdHI+Rm/u0mkHZqYw8+Lfm0S0M2Uztov
 r/EB3NvZieO70Ar/av/sNGmoZ/gDN/9roVLwC3Si9s4AOT38rENXbPckUsr3N9C7
 B2Fl/Ij/w54v5bTe4ORGIcReduF/ZJG3CdVRv8ZX3Ko86dZl/uIs9p8Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TbVHiqRBM6N467+EZlXHb1qEJ31wpt8NzKax2+xEJzo=; b=GjXhWNDP
 CwflPyxXsv1fI6iPTEACTHUUJZazTxX/Akupl/cOvCUP0+fCe/3BK4ExWQqJsdhN
 JTmaadiL/8FIyGa7/F+W2LgDbUExmARXjHb2PHJUDOKgLQAMQUWfxLyt+3bVbvMv
 crRMZb+kW9+xPyjcfx+9h1scEHUyoL+G0rrzWloGSqMzgv0rk+dqDIDhDQAoJVHL
 rbTsvAUuyyYy8ByoqFkRaE3M28Q98nRSZWMh9j5JmoE83BFjuMPaHWwVdQeRkjQt
 OPf6RiwkTAxjsLG3WggGAOXv2FbQsz6ObnQNhfmoR6aLEXN19oPjUEeIATwR1mNF
 F2cqngYxcZV0MQ==
X-ME-Sender: <xms:Rs-UYVVGpRwTxsM-j7I8-IF4ClJXsA6MyDkAbQg0Gh_lZBidmA-sXA>
 <xme:Rs-UYVls4YPNJ_49XY4a7_kFVTnMYwkOILVT5qpDVGBiz6rBKazSoU4buFmrCLOOw
 LJxk6GrPdzCBH88r8c>
X-ME-Received: <xmr:Rs-UYRZwv7Xb9Bvz-ajslKI6haNuSbzilNPnVpRfDuQjg0uxspB4pdrm8xHsbpeE_aUrg1sUOkWzi89ekO16elitjwAXjp3EHNXyqzH_YOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Rs-UYYXpYQ6sfvTykJlVauFAHywVQTefA_-ZflOdYJy8SnyqNt2dGw>
 <xmx:Rs-UYfmvXfDdZXu-X7A2GAQJp2Aph3IFpfMATQ423rFx6h9AEMNlfg>
 <xmx:Rs-UYVc_cCwKmj5TUPZUJCEhV_dFlGBMBc5twfi_O2blPFSJCw152A>
 <xmx:Rs-UYYh1CDgz1FXkfnY68nvwFt0grUk_h9tp8smgPGlCuL3fUkHsOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 04:45:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 5/6] drm/vc4: kms: Don't duplicate pending commit
Date: Wed, 17 Nov 2021 10:45:26 +0100
Message-Id: <20211117094527.146275-6-maxime@cerno.tech>
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

Our HVS global state, when duplicated, will also copy the pointer to the
drm_crtc_commit (and increase the reference count) for each FIFO if the
pointer is not NULL.

However, our atomic_setup function will overwrite that pointer without
putting the reference back leading to a memory leak.

Since the commit is only relevant during the atomic commit process, it
doesn't make sense to duplicate the reference to the commit anyway.
Let's remove it.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f80370e87e98..d9b3e3ad71ea 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -676,12 +676,6 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 
 	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
 		state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
-
-		if (!old_state->fifo_state[i].pending_commit)
-			continue;
-
-		state->fifo_state[i].pending_commit =
-			drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
 	}
 
 	return &state->base;
-- 
2.33.1

