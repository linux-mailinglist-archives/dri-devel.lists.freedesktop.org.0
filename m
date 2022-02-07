Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657474AC5C7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F4F10E310;
	Mon,  7 Feb 2022 16:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47F510E2F6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 023CD5801DC;
 Mon,  7 Feb 2022 11:35:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Feb 2022 11:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=JXq4978RZHODPqVrUMOV4cMFQcwToP
 3PtgokXOpf0iM=; b=Ay5D9Kcj2pj5m59th2Z9naY0WEtwqFOOi0kryZZZV7HKI3
 gEY83DVD/EWM4PKcza/LVdt3m9Z2YPjaFroKIMycSQgsQm4Ew6pf9BtQCqWs9kYi
 9Od4mqhY4ESnyX0AO9v3ANNPbeB/SqhFtNq4+otpu+qevqjOnRMNzM77z5AtYl4U
 tKMKOnQzSiwzkcTI5cqkLr5PMuIEihw/tery9QebsMYnotqeOJoyyJ7qM0Sw44x/
 yapE36uof0XFmUcXMhAOql85tTkB7eBMZzAg/F6g5ElZOc1lxK3+06nqfP94R2TV
 1giVh7kpgWGGAR8lgmOhBj0jcA6Wjj1LeRQswppg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JXq497
 8RZHODPqVrUMOV4cMFQcwToP3PtgokXOpf0iM=; b=Uqtzi7b0avZclQCqwVt++F
 vA4FWdfDsZkSZrq7QSf6x/GE/lxfOFXRlw95H+QnXcFc0Nc50O3QEywqWMLrQ6WH
 RWMgDpYxOWwK1uD4kiC1de5vv7tG6suSLboxp7Ilan8sY7h509zNb5Txkdr+zNch
 ej5HrqoNIIrMS+998zdWdCVo8olOPlvPetdvuvS0ZCDXCQ8Ks6IVSNy9zM5cpvtb
 uk+C/gDaLsF2eeaty9DSqmUl+tne+kjzDXKUt+Jz6+MZdbVTycTcU0etMt77zyeX
 novlzJy8z5R95FHRIdr/vD6LUEcSfYX8IIxaj6/YIZpv8O/qvmz4Rnnp0TStcIVA
 ==
X-ME-Sender: <xms:TEoBYjfhC7eiJbwWWq2YR0d3vJBGgz892nr93enSQ_yvcMvxFuWAhw>
 <xme:TEoBYpNqEDXm4on6oI4Jo8KzbnIQcxTO229h0E8ls9qklnWrbZtTbkR6jyOWrxEMR
 9SwZz87locupEvDNE8>
X-ME-Received: <xmr:TEoBYsjKoQgVd9GnBzwE17Dz3Wc5htAOrdJpREOmF7S1APqdcbseFcisBmrt_Oc2BlGhgNAth6Ha6D3vPAKGoYJj5HW9VKrKtLYb0hk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TEoBYk9zVq4j6Pe4U7CwSdb3JW5KbjY1ZxFhFkeAyU0MNbhEWtjGrA>
 <xmx:TEoBYvvWf_H_kWusuEGXuLKI2KzaSFOw0nq4HUOCDi6DqUh6P2Pl4Q>
 <xmx:TEoBYjGn3ggd9vc96vl1A7E1WDtW2U-hkfBDGa-OfAm3JLBM4-ZgbA>
 <xmx:TEoBYjHooF7NrG0PELvNrrsftt64WCEeCLDIsdI48xbkc45g2_rjIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 02/23] drm/tegra: plane: switch to plane reset helper
Date: Mon,  7 Feb 2022 17:34:54 +0100
Message-Id: <20220207163515.1038648-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tegra_plane_reset() does the state initialisation by copying a lot of
the code found in the __drm_atomic_helper_plane_reset(). Let's switch to
that helper and reduce the boilerplate.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 321cb1f13da6..ec0822c86926 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -37,8 +37,7 @@ static void tegra_plane_reset(struct drm_plane *plane)
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state) {
-		plane->state = &state->base;
-		plane->state->plane = plane;
+		__drm_atomic_helper_plane_reset(plane, &state->base);
 		plane->state->zpos = p->index;
 		plane->state->normalized_zpos = p->index;
 
-- 
2.34.1

