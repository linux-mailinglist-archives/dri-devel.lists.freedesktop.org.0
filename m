Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095382B3B00
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C200089E8C;
	Mon, 16 Nov 2020 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB796E53C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:32:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 04638580333;
 Fri, 13 Nov 2020 10:32:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=j8EkEGHe/t92f
 2Hvnx5xgl097ZjSfSkOfuxxQC4z7yE=; b=kb5uh5PPd6/cFdwmFtXP5We89y+op
 7oPsGGtCEwvV5UrzlprBw5qrL/LEk6a3oNvnXNJ+0nVbUqewDkf/w5t2Vj4hMZ1t
 gad3VQTStZq+q43ZixQBzfJdN56astrMm9ILH135zyi3NODh++xyV76b7xbR1sub
 qSGsTo/M5o0IgjAf4e1hYdaoV6y4R/9soOwRd2u91vgKBb+WvWA/N/+z9cg5EM0K
 8RLcYpqCLJH7B/dsa65inSg16fviOGywhqU1f98GK5geVCk3fLHXdKBoZHhQWqcE
 WTJz6xMj4mION7c6mFJI8EQIwVspyCKxns6e8S2cMNz49qYLTGGW2hpDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=j8EkEGHe/t92f2Hvnx5xgl097ZjSfSkOfuxxQC4z7yE=; b=lmq0WPN3
 KbfYGSBaJ30B/6SF6FXk/dpAdBe+zvncVlXn6qIKnXrTspQWtyos4lN4bO23S37s
 zGp9YQkfLwWOra4BOM9LRRGpD2yYtbiAGLAFAWbxJYvDpdk3u8A3Z35ZRMAOmP4p
 W/nRms9Mw/3uEcKlCbGY+IyRUk7apCxrWUyGhU9LWKhe30Yi3l0dgOSYcRQj30N/
 sKAA2CkyMCP/i7zzzJdhTyL2Afsn+XB5V2HY+GF7Fh9O4hC8GAq1lZRHHFD81TjM
 tFjJf5VE7uue4u/nE5QzpcpDKkZotB0wg+ilyRbGRcZQsuZVnsIdWOE9Ven8psAJ
 kIW0pdJl71irew==
X-ME-Sender: <xms:CKeuX13h-5VcEZAKC-UIp1X50SldeXbG39aV4AtzbF5QUgsMOJX7rw>
 <xme:CKeuX8GeatjTAWwQXE6RrHRUh-3Af8mkGiok6T0c5ChAiXIPaKyCsc5zqCFDyjdQf
 RnVZhqQi9oJLtbpwNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CKeuX15WU5_mQkdu-MMY-US_2Dad3PYbIo7psRWU5yGYlJNL7U3EIg>
 <xmx:CKeuXy2mnx0AoSxIojU6wad80dnFSvOE4WSRbvHwpmNPzhAd1FqJCQ>
 <xmx:CKeuX4HzBYDRkP6WyoLkPd3xQnhHadqr7t-LzrLXmrOf4UWI263Ikg>
 <xmx:CKeuX-GxMpYYx727ip4WdMUAYvUUhpWeObOOcm46nfzn-XZqC2Qy_g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FFFC3064AB5;
 Fri, 13 Nov 2020 10:32:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/8] drm: Introduce an atomic_commit_setup function
Date: Fri, 13 Nov 2020 16:29:49 +0100
Message-Id: <20201113152956.139663-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113152956.139663-1-maxime@cerno.tech>
References: <20201113152956.139663-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Private objects storing a state shared across all CRTCs need to be
carefully handled to avoid a use-after-free issue.

The proper way to do this to track all the commits using that shared
state and wait for the previous commits to be done before going on with
the current one to avoid the reordering of commits that could occur.

However, this commit setup needs to be done after
drm_atomic_helper_setup_commit(), because before the CRTC commit
structure hasn't been allocated before, and before the workqueue is
scheduled, because we would be potentially reordered already otherwise.

That means that drivers currently have to roll their own
drm_atomic_helper_commit() function, even though it would be identical
if not for the commit setup.

Let's introduce a hook to do so that would be called as part of
drm_atomic_helper_commit, allowing us to reuse the atomic helpers.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_atomic_helper.c      |  6 ++++++
 include/drm/drm_modeset_helper_vtables.h | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ddd0e3239150..7d69c7844dfc 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2083,8 +2083,11 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	struct drm_crtc_commit *commit;
+	const struct drm_mode_config_helper_funcs *funcs;
 	int i, ret;
 
+	funcs = state->dev->mode_config.helper_private;
+
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		commit = kzalloc(sizeof(*commit), GFP_KERNEL);
 		if (!commit)
@@ -2169,6 +2172,9 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		new_plane_state->commit = drm_crtc_commit_get(commit);
 	}
 
+	if (funcs && funcs->atomic_commit_setup)
+		return funcs->atomic_commit_setup(state);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index f2de050085be..56470baf0513 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1396,6 +1396,24 @@ struct drm_mode_config_helper_funcs {
 	 * drm_atomic_helper_commit_tail().
 	 */
 	void (*atomic_commit_tail)(struct drm_atomic_state *state);
+
+	/**
+	 * @atomic_commit_setup:
+	 *
+	 * This hook is used by the default atomic_commit() hook implemented in
+	 * drm_atomic_helper_commit() together with the nonblocking helpers (see
+	 * drm_atomic_helper_setup_commit()) to extend the DRM commit setup. It
+	 * is not used by the atomic helpers.
+	 *
+	 * This function is called at the end of
+	 * drm_atomic_helper_setup_commit(), so once the commit has been
+	 * properly setup across the generic DRM object states. It allows
+	 * drivers to do some additional commit tracking that isn't related to a
+	 * CRTC, plane or connector, typically a private object.
+	 *
+	 * This hook is optional.
+	 */
+	int (*atomic_commit_setup)(struct drm_atomic_state *state);
 };
 
 #endif
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
