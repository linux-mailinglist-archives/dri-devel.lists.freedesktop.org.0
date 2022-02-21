Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1C94BD8DD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4408F10EC7D;
	Mon, 21 Feb 2022 10:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFCC10E5E0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BB64B580259;
 Mon, 21 Feb 2022 04:59:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 21 Feb 2022 04:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=jDhy4CYzuRPBn5G2/LN4bhhWD2ZBPb
 y3Wl9O4JFXXb4=; b=Kyup048qdEbJ/mqwSwhK+dvO0R2SkrZTf8PKt2SyTUb9nD
 zBgpEKBlwrp2VlTMrl4llO1TxkqrBecg/E45eA3EamiWA+csIFCEOVOR1c3Rx5YG
 8zD6ikqZaKaYwBeTi6hW9tphUgnzWWSNE6q5MeyZc13HF9U7gB7gtT7STu0YUqZx
 AosPgCcaCDrjxF3bmA806JymX7ePFQWpqYyyoAKm6nZUpqJbjwIG5IMjPyxjAmCD
 4HjN+1eacUXrcKKdLqMTnEa3gnTW/aVagRqnS6Qaf7vqoJzHFPKH9O36LneAv1UQ
 jflBI5rs9W7dj9mDjJwoLUSngTnDqeIt+FOKOAMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jDhy4C
 YzuRPBn5G2/LN4bhhWD2ZBPby3Wl9O4JFXXb4=; b=PBzcfqF9LzuEptfTYh8LBm
 1iZDYlxnN1WNfZwpnIedMnqfK9ZdIhlps27fmNZ8APcrstfhYVvy7wDLviZUKZKf
 Ch4zG+wLjDgzJ4wrozcuLz/39Kk0yhCpKeMaMlPMFf/+RfY83lhwrrogyR/iSgQs
 J0FSGoYiCD8tYwynmTwlnHfMjRAt+OADMH+bL+KF02156UZJLpRjR6Inf91vmOsE
 VpvSnnC3jM1t4h98AId3/80/zJIWsMmOVezEoftch8rJbYiVbFmeyQUwrEjEv2LK
 xYnUjG1pFJWLT6rhds2uoY7g63EPC2Dy9HBrqEeJq+Kjl5NBYKw4tjmji3cR781g
 ==
X-ME-Sender: <xms:l2ITYmxEZsQzQmdJmuMXPTVx5mU2_OfVx3a31RAPy_1c1BVl6dD1pg>
 <xme:l2ITYiRGioSCOBPaqJY9zhRQX9fLoqTiaQqKtDIsibvopwgLRCSVZ0Uwjc94wGv51
 Ssrrt2LU-k5cAeREy0>
X-ME-Received: <xmr:l2ITYoWNdIKdigwDZI2ILjdvgWGTQZvNjXpiQBHoxInRtW-4xC_Iw_53S7c1ZVG-iWFcHdObsB_OV5TfnhCgS6NZRj_896saES39RNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:l2ITYsgrRVQvUPRIGYeh8zN-SFONvQNHlpkLR3S3Qfgk5zRBEnarxw>
 <xmx:l2ITYoAYbQ8i0defcJA8nBT4AGydWj1XDG2_x4uWZsY03wg4rupIJg>
 <xmx:l2ITYtIKXax7zougAZ_iz2PKTxm5aiBbAQdnmNTOZTVzCa-tImW-TA>
 <xmx:l2ITYk71n3FJDvsZMcMitN64xAg3-IAVuFwQETsNP4nbHcUURpj9_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 13/22] drm/nouveau/kms: Remove redundant zpos initialisation
Date: Mon, 21 Feb 2022 10:59:09 +0100
Message-Id: <20220221095918.18763-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nouveau KMS driver will call drm_plane_create_zpos_property() with
an init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in nv50_wndw_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 133c8736426a..0c1a2ea0ed04 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -635,8 +635,6 @@ nv50_wndw_reset(struct drm_plane *plane)
 		plane->funcs->atomic_destroy_state(plane, plane->state);
 
 	__drm_atomic_helper_plane_reset(plane, &asyw->state);
-	plane->state->zpos = nv50_wndw_zpos_default(plane);
-	plane->state->normalized_zpos = nv50_wndw_zpos_default(plane);
 }
 
 static void
-- 
2.35.1

