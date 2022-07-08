Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4F56B6A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A42113872;
	Fri,  8 Jul 2022 09:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDE4113872
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3234D32009AA;
 Fri,  8 Jul 2022 05:58:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274307; x=1657360707; bh=VV
 zN8GUcIi5x5hNxX27v4fp48lV/0zBgBiNlCnzTGaA=; b=B+lkDIKe8yMSdxbpD0
 9ewSSeI/6l6iHjK3aEn9wgT1QDuT9xSONDD5yLjYShajt3hzVF26ecUmvk/8fQ2d
 pjL7cDvbjBye0SOfZLLniu+0+qpS5BxzNPGeXRMQF81DzRsR8Fum7LUxUzmfVVwG
 2Y/hLxdP48J56LFB0+TxYk35aC7RXABy9+VFf/T9JkayzzwVOPlqXDF3RJWbx4/2
 1m+GjN5N+lWPczmEtf+TUJe9N8/LW5OJedsaG5b+sb8BAD+qTHPqHrcGWOIaR1sz
 +FWhHraj+IgWDP6/Jr9LoXLZOtysdvNEU51v3q2/U5wRjzK++mYNEPn7Xm5WTwEp
 HliQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274307; x=1657360707; bh=VVzN8GUcIi5x5
 hNxX27v4fp48lV/0zBgBiNlCnzTGaA=; b=U7BeSAucyHXiGuWrVXO1T2gbzKAXN
 gY4sFd9VGc223NYW46gZ1FkLyv4ZSegrC8KmDu27uLUABr+P5Xho0vilrE/VyNCz
 PF4BYeVMQoxUXkmluvOVNklV6N2qubVZPLg7G39Dv56ZB3fOipBsBWop9BmAWM7r
 D4pM5+aMrqcEAymjyOBQLJ82WHEkKUNiOdTcUa498+r7WUIm+oqDPKsrrcRqRSaX
 ptUpFgCkj1P6u+GrBufzKXAbAR/9oRz5DKBYPcvNuXOo3x+bu7nSpa7kvnK3z92C
 PdIOkiXMFjWs5PSs7er/C713xJrbkaIVb0+DiRjUesK7FOV5wnVl7pJ9A==
X-ME-Sender: <xms:w__HYoqnsN2PNN7SJlmLbnhSEWT4inku_Dnv8A2OaLZD14pMeGHomg>
 <xme:w__HYupt64H1T7nKHCYKTidH2QS8wyIg366VBfrJwHPeNkigHWN-InXCgzFUn0gAY
 rgMr0WITKNJtxb76Vk>
X-ME-Received: <xmr:w__HYtNgFg0Z9R5mGf_4cwYYhzSFc9ZzwCKI7e-M6w2VqpmVq7IN2duOL4_KYW0X0W6lvZkga-K_60UpYvqK1cZDYmAc5ax9JGil3vM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:w__HYv437C5BsBxHMFdIxEiaiGINKkakoqBG16AmL489X4CDn8dLhw>
 <xmx:w__HYn7PTVMkpBOGvsmO0LX0sLsBMa0tRP8LYfVI2bwTGXQHNvxGnw>
 <xmx:w__HYvgom20TtZNdDfq_6Pqb9wanopKImldBxSWvFIRLQuY6ndR7ZQ>
 <xmx:w__HYtSI3LGv_cpUNKygssqItNFUmpiHhoOSWQ-opn3Ee0lKxNrjVg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 26/69] drm/vc4: dpi: Return an error if we can't enable our
 clock
Date: Fri,  8 Jul 2022 11:56:24 +0200
Message-Id: <20220708095707.257937-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we fail to enable the DPI clock, we just ignore the error and moves
forward. Let's return an error instead.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7a1112c12be4..7028a789919d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -290,6 +290,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 			DRM_ERROR("Failed to get core clock: %d\n", ret);
 		return ret;
 	}
+
 	dpi->pixel_clock = devm_clk_get(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clock)) {
 		ret = PTR_ERR(dpi->pixel_clock);
@@ -299,8 +300,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = clk_prepare_enable(dpi->core_clock);
-	if (ret)
+	if (ret) {
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
+		return ret;
+	}
 
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
-- 
2.36.1

