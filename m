Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A236A4BD8DF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093A110EDF6;
	Mon, 21 Feb 2022 10:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302C310EADC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:00:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8C00C58025B;
 Mon, 21 Feb 2022 05:00:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 21 Feb 2022 05:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=FTFKvgV2OHoBu/E5AiuTWzVmTJjhQz
 qREeJDAWc3oMs=; b=oPUgrHb3dTqCihPkvqhw+ybvc/AQCnfgVryXYVJmIc52U7
 U3x2eiLqt8Nz8t2GztR+furUdjgVotO0JwsqijNkP3lUsa23E7URQguJqx31id3x
 XvlDNQ9OcZzZVaQbjRs3OS7ATdaBp/QYShJ9vt/3wm5sy3BdA0vGz43EmidyPZEv
 Irdz60bJVezDEbaaz3gQ1Li1fulITq0R2PnOM7i6SKl0HbGk0gBqURSmgbrkcfX0
 EDD2mKeOWUmgH/nY9mpivD4e/VGbTvj89Eh/FGOGGnit97TlyIYTeYPjsO/rTTS3
 rU4G3PXqpH8qKAYyCmYbh4sP3UGEw26RQara77Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FTFKvg
 V2OHoBu/E5AiuTWzVmTJjhQzqREeJDAWc3oMs=; b=G+oj6x0/wafshFUsu/rLDs
 7nIMYqZd8e1ePc4WtmS9qPq2bnt5+njJPgOH1AAhcJZ9xJ9WqKXU6fLFNnwxGl0f
 D8qOOIkn5VmScHoBk5rr+heZ6BtVK8AQyl0JPJ9bmhZmOK82zAqMe8CX2qsPOaHn
 X3JH5baTho/yJW6g7vjOtGTvs2Jh708ROAug7Nx36hcA0vi8WoBPSzu9+/IOW/Ro
 bKMn0tdCCy0tycz5Y8wkWGzRozezkQ90XZSZeyKt+aMfGr7bTUrmf4trIAJ/+DH8
 oG7iMs9kQ22PPTxO0oiLyuuqE1npCzvhVx1K0yOhF5A2OtsdjuY9qtwbbmqueuLA
 ==
X-ME-Sender: <xms:p2ITYrVlo_0rDHtL-JJgdT6jE1jZn8S95aOBEPcqHpOVf3spmxylKA>
 <xme:p2ITYjkIxcx6N_GQccJ7MS_Vcvta4y_SelRDa6RfPMk2WxVRRQxGOX6D7ALRgl0dT
 fSTOADpSv5ULGzj9aw>
X-ME-Received: <xmr:p2ITYnYONC9QZSeQNvnqzFg9h8lqDWou3lRQDH2WpOyxmb7I41YNagJ0CQM26Lb7KyTER_EW3dh3iVCb1zCWCfXeJrZlF0LFkf6NLuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:p2ITYmWY08sUAMiC80gPS7mv0Pl5cD-MaM2qsykQsfdqdfx-d7DY4g>
 <xmx:p2ITYlllYjMbOo_KKHYcKFdiUVDgeucgk8XuffZiRTUkXK4ktloIXw>
 <xmx:p2ITYje55WRgnSc6unOqvixwLei5bm0jNnIE_uq2qbhkX_4SzsRpng>
 <xmx:p2ITYo-2TpFsdE6hUcvvJtxrWo_CruvKdDZi_7KAxMIeHzXT76O_bA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 05:00:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 19/22] drm/komeda: plane: Remove redundant color encoding
 and range initialisation
Date: Mon, 21 Feb 2022 10:59:15 +0100
Message-Id: <20220221095918.18763-20-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The komeda KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Limited Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in komeda_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: Brian Starkey <brian.starkey@arm.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 383bb2039bd4..541949f2d44a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -143,11 +143,8 @@ static void komeda_plane_reset(struct drm_plane *plane)
 	plane->state = NULL;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state) {
+	if (state)
 		__drm_atomic_helper_plane_reset(plane, &state->base);
-		state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
-		state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
-	}
 }
 
 static struct drm_plane_state *
-- 
2.35.1

