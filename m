Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C3F4BD8CA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6554B10E30F;
	Mon, 21 Feb 2022 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D275610E306
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3C0B0580259;
 Mon, 21 Feb 2022 04:59:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 04:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=e9llmULFBZir3x1yh/t3kAZB5vKeMJ
 hBlkDfaXXh7+g=; b=tZJaMQ5IqqG9VHFIwSmSgtTPd9Efbhejg9lvbZZChsqToU
 PrK787pX3H3t/nFyQSt1lIHU1q39qxEV338ESTfSSHV5PpCBn9ikti2LM3CzmZTR
 KRecNfpadlRimbm9V9ivlZupVbeEQP6tgtNiRhOgR5neQh2Qy0JTNFDmMSwnPzmb
 Yv+YitxXpm8ZbQOGHctbNsgMhYDx0Y1Amh4bJYr7rQcf5Zqe+xxhJGEi2OSEcgJ7
 9ROY7CmCOvoguyAzkXqpqDJapjxKmHC0+5lzFP37r59MCZ3x/I1Uha8y2J3xBAmO
 3hlYs3569K6QM0ipqnwCFMJNRXVqpYwFjJtGM3TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e9llmU
 LFBZir3x1yh/t3kAZB5vKeMJhBlkDfaXXh7+g=; b=dJ/uW5aCkbx7uFYdHl1tjq
 9nf16ekfnzSKRbTof6oKPpWLqnrXeoYg6RZEPZAYT/HDgFyZYGIArWpx9/x/sDgr
 xwvDPdxf78gI8I2j3a/IbtOkVpf/gpMjZwcRCXBjXVRr9VvR/Y6MP5M5NhZ65WB2
 HWjyIJ23QdF/kvL43h7/woUXfmDYhbX9yawG0rMhZz6gF39vGYKhE2ec1O70rumy
 XMyadIUXQ1tkisYt6YBsbuAZFOoOe73qsh0xjqr4r+42pmN2zwCacWeqZD3rF17o
 BA10r5sDUF07zRNfiOnqssxLXAXFcBza2JD64UQSVkOC2Hd5kkNn3T8LIEfdyOYg
 ==
X-ME-Sender: <xms:fWITYu7hmE8u7aAgO1tuAMdLpTEPxMyCtOuhyqPFAwOfiPzMXcNgAw>
 <xme:fWITYn4icjLh7Yl7J1hY6RXOslgJh0ja_DKDY3_OGWaSh_UDdrPB8HhZk_HtYkLgD
 fZ4iDYNSXYzcdjkq4Y>
X-ME-Received: <xmr:fWITYtc7Hg1hTQ4CrjxeY2qh8EqZmYUaQ3V0DdEZ0LVzCVj61dct-rIvVKkinMW1bCHKWH789aD-MTwPpzB02QrLV4s0KZuUOHf2SPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fWITYrIQuqA0WzaRpfAq8k-dxG1-QmzDtihj18iaEGhbvLsJDtqa7w>
 <xmx:fWITYiLMlJZl9ZFYcnyB5Cr4wDbMSQWTjTsf-wZAEargIrVkJUrkeg>
 <xmx:fWITYswSAPlaOPepykxDKLlnyPCFzMX-Z10-TCfhAVKg1XLP-2TNSQ>
 <xmx:fmITYoxwMHwYw4f58lPSy6NiVR44h0B7NxcP969evTzQs3qe_IztSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 02/22] drm/tegra: plane: switch to plane reset helper
Date: Mon, 21 Feb 2022 10:58:58 +0100
Message-Id: <20220221095918.18763-3-maxime@cerno.tech>
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
2.35.1

