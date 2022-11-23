Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807766363A6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E827C10E58C;
	Wed, 23 Nov 2022 15:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C44510E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 087A22B069B4;
 Wed, 23 Nov 2022 10:29:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 23 Nov 2022 10:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217380; x=
 1669224580; bh=gc0BXwb5bluI/zyuR6CU1vX2ec6LXqibyP1pyi/zGq0=; b=D
 XxMrOoV7TODmraRB9LmHr8ntAWzbOyjbqFre3MxxNmj+YsWXCEwEylVJZAPI+V+5
 cTYm+xsit7JMCPKfojqA9B4nmYHbHE9DdetLAh1T4BXVHyMpquRBpP+SWI/IuIyL
 5bBedoaPcjhtC8a+GTFeRa0Q1h3K10+HUUhActkIzt7BM7ZAq5MnH6YnwQfSN0hh
 qzHr2TKfpT29PpMO2S+1BTEXu4YMQJDySkLHSkwflxljanF5B0aPR58fQjvcOIlE
 DImMj6Wuxd7ADA2ET/fp5TUl/H1n2COGe3D2cQN1PykaVodo/em5Z2gOPsE+lEJv
 me3blGxr0VVipVfWpEUDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217380; x=
 1669224580; bh=gc0BXwb5bluI/zyuR6CU1vX2ec6LXqibyP1pyi/zGq0=; b=N
 3Y6HGfdSGJwAD7/lWkhOy80/tah0Ci3FVqFj1mBa4/rLCsnmPSns1OR2iOWNNCuw
 ebxPqQB/4usP7rZMjwziZO6n/Z9AAATnw8snaAgCC3T1iXmTJXUSb3WjqMatDSZi
 qVLsZ5MxJK6CXUsivOfvsQvydiWtKbIIm/eNOQ4P1d6tPbmqe63ast0lovofInJB
 XpfcoJ98Up4ZIkr8knRTZWwu4InRnNduS/fbFoP+8WZir1vnOX1dSpCsXTCOP1DR
 3sWOhLJmVEwbTR9F+/Nb45X3kT12Y+6IHoifHWsGQrITt8Fmh45heljw+sfYdfdv
 7jPgVw6CIdlZrm/0H6mIA==
X-ME-Sender: <xms:ZDx-Y2GOnaYAprMrbTwj1r5MNCJWKJl40Ee-cLe8k1OWFhDnyjomXg>
 <xme:ZDx-Y3XhYiYUWQooM5wApf6ij6XrAhqStgE_zBkUAfdigjz09k9b_FLvIL5kbNnjK
 EN8q4X2PCdN6R7sVpo>
X-ME-Received: <xmr:ZDx-YwJ15XNdIHFvYUUbbgUS62o8g9--5PZTy0fUuujsVylz4Kz1xo3-t30SF2d8lq1EM2yjvLtFFFI5Dw3UfCkGtlMJKqLVVivYrHUw51SWCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZDx-YwEKjl6MpchoptOCNQSDy6SKqobCwZJIO-6ZGSibNWRG0aDnfA>
 <xmx:ZDx-Y8XspjLa_ks6VQYWhLx8v03-ONx8FlcH3GbjHBefPJAPrp7kUA>
 <xmx:ZDx-YzNqTibnwXvVyyQwEognQmA0qC-MziMviy70ewtGLSZNJW1ZJg>
 <xmx:ZDx-Y22vodsEPzyko5exhEz0WD-hLk2Rf4XmeHcwzAtlUcifFBhQgwiSmC0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:39 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:55 +0100
Subject: [PATCH 13/24] drm/vc4: kms: Constify the HVS old/new state helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-13-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3WI7m8nK+3ntxOkh1NnakmIwQNYzUzGhoRCBBnqFJAc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tXvyqc6Xtyz8qvXgUdLE9jkZx/Y7hGa8dl+ovJvgXXm
 a9i2dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiT68w/OFhOPRyyzLJ63+Nz/HYtc
 /pv3/VbcbrVfErVriq75vafEeQkaFXKCX/f6u/l3w5P3f8/iRtxgfPo9Pkbt37GnSxlk9wHTsA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_hvs_get_(old|new)_global_state functions don't modify the
drm_atomic_state passed as an argument, so let's make it const.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 4 ++--
 drivers/gpu/drm/vc4/vc4_kms.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 6ff63036915c..855207c07e2e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -375,8 +375,8 @@ to_vc4_hvs_state(const struct drm_private_state *priv)
 }
 
 struct vc4_hvs_state *vc4_hvs_get_global_state(struct drm_atomic_state *state);
-struct vc4_hvs_state *vc4_hvs_get_old_global_state(struct drm_atomic_state *state);
-struct vc4_hvs_state *vc4_hvs_get_new_global_state(struct drm_atomic_state *state);
+struct vc4_hvs_state *vc4_hvs_get_old_global_state(const struct drm_atomic_state *state);
+struct vc4_hvs_state *vc4_hvs_get_new_global_state(const struct drm_atomic_state *state);
 
 struct vc4_plane {
 	struct drm_plane base;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index cb2197622b2b..6c9949399310 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -173,7 +173,7 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 }
 
 struct vc4_hvs_state *
-vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
+vc4_hvs_get_new_global_state(const struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
 	struct drm_private_state *priv_state;
@@ -186,7 +186,7 @@ vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
 }
 
 struct vc4_hvs_state *
-vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
+vc4_hvs_get_old_global_state(const struct drm_atomic_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
 	struct drm_private_state *priv_state;

-- 
2.38.1-b4-0.11.0-dev-d416f
