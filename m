Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD56E450375
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342186E845;
	Mon, 15 Nov 2021 11:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB2F6E899
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:31:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id C532E2B0117B;
 Mon, 15 Nov 2021 06:31:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 15 Nov 2021 06:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=4KqHumH46V3y9
 Ldx/fQJNDCqznvX4/6f7a4KOTZ/dzQ=; b=dCWcTpcVJ+8xh7O8dsI1vpsf7eii6
 SIpJFTu56VbOVOU9MZtoESUy4EJY3c9awLlPB/m4FcSlG9fQ9asEn1acApxHjpk8
 opzTZlzObqwjRs7e2wErQgow+RcNyxf68dITYwCbAfw/ViXiG6wav2DkfmvIv1Kz
 rn5PAZS3FeD0dvj88dAzkrKauYCewk5EcXiYMn2GWYVT0UaGiIycQ6DjOrj9lZVP
 w+IXXODLT1DqRO2lvblBpiUboVk0GDh608j8xU8HrcQ4jqxIc5/ZUp4FMwOdogbJ
 MB+OqMHdJ2ClZCFaHSMWYx6tbdeoIs/qytMhGJABWkLhKvNwp3II8x0bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4KqHumH46V3y9Ldx/fQJNDCqznvX4/6f7a4KOTZ/dzQ=; b=OpdfWjB9
 11aBlx0D5nWLPbNZbkOKCCkA1VjYfALxaGjumrBXU1+4Lm/hNOWS6Z2tZKspp/wI
 614cUp8P66UUOG9seVmh51bW4w4jODuD8pcexMSy7u2w+eQh4blzBZ7VVjgDTa0F
 2gWeOwFddK5wHZZMxyq8Gg71DwzpqNTHg7gkK7wpwDqt2+aE/AZBA6BwZprtg0Dx
 EXwcmNHM6xHEK6L+x3sRAgmFs+vVjBBJ1DOxo6T7gkLo1RzfCCC01PRlAM2P6rge
 UiPV204Z2WIGvBfxc4UksL0shbBP73ReUWpAL2vtByc3ZskQgxzUE27O/uXE2p9W
 gyk4mIVBOnNoyA==
X-ME-Sender: <xms:BEWSYZATlkqyQS_J1TlQJVE_OvlwOgB1v0H2fe61KSWypQT4EpOwkQ>
 <xme:BEWSYXjQL8g1foipFoO_AV1HoP3Y8H9KSKUFgz5RHjE1jXaIHKhwWhnExT9v-krQx
 GqVgBsVw534anZYbow>
X-ME-Received: <xmr:BEWSYUnrp2ek9LEL9TxPd1whLMcMJQMXKlSvvgVOBK50FzUDobQIft9DiCpeKEIJKqjsTxctm58DabcnIDJHXXYDYAcuH8LgDmF3gwue>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BEWSYTwwEnohL_Jo47anEr-llXbf3Zn691ilrxSOYpAsebA0UIV7uQ>
 <xmx:BEWSYeQ1qAz4nIos2Xl9S-yIf28FkgddQuLvLvh5_1eG2WZT78xbUQ>
 <xmx:BEWSYWZmIGuBGCiNhDZkzBeB8z3mxPS4Yybx3Qe8hVQLXWIq7P4eZw>
 <xmx:BEWSYf_XQ5vxEiNl19en6K7U-twoF5p7Gr6Z4jAltTfpahj1YhsFZUq1CiI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:31:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 2/6] drm/vc4: kms: Fix return code check
Date: Mon, 15 Nov 2021 12:31:01 +0100
Message-Id: <20211115113105.103275-3-maxime@cerno.tech>
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

The HVS global state functions return an error pointer, but in most
cases we check if it's NULL, possibly resulting in an invalid pointer
dereference.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 764ddb41a4ce..3f780c195749 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -354,7 +354,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	old_hvs_state = vc4_hvs_get_old_global_state(state);
-	if (!old_hvs_state)
+	if (IS_ERR(old_hvs_state))
 		return;
 
 	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
@@ -410,8 +410,8 @@ static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
 	unsigned int i;
 
 	hvs_state = vc4_hvs_get_new_global_state(state);
-	if (!hvs_state)
-		return -EINVAL;
+	if (WARN_ON(IS_ERR(hvs_state)))
+		return PTR_ERR(hvs_state);
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_crtc_state =
@@ -762,8 +762,8 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 	unsigned int i;
 
 	hvs_new_state = vc4_hvs_get_global_state(state);
-	if (!hvs_new_state)
-		return -EINVAL;
+	if (IS_ERR(hvs_new_state))
+		return PTR_ERR(hvs_new_state);
 
 	for (i = 0; i < ARRAY_SIZE(hvs_new_state->fifo_state); i++)
 		if (!hvs_new_state->fifo_state[i].in_use)
-- 
2.33.1

