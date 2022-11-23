Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA156363A7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B055810E58D;
	Wed, 23 Nov 2022 15:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3851510E590
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 15D402B069BF;
 Wed, 23 Nov 2022 10:29:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 23 Nov 2022 10:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217385; x=
 1669224585; bh=Dzvf2e2t3b+Fta3pbhuPZojmvdbKi1+FhykEBF7Qb3A=; b=F
 IlLToB9gpNbeUlQWVCfkWraMHef9p8ycXhSY8nc3iJq+Uhsdt6TSZyhFXXIRBkwe
 x5mCftjCWC7sx8SROHlr8T6Isw0iZ2DkCkZkHQ7A7062Wo1aoZibb98w1Mp/ZW6U
 sEHNXyANec4ZSC+cJsPEX35zQv5mVIlpN3X6q7Z8FXUsBGkCI/BCh6H/syCToR5w
 aLE59XYtLf5PQDcyqqZ4yC8BPK4lDqHmrUw+9WZOW+Bg/mv+SR65M1SApTx9lVTh
 hd9hMXU/xLb9OnjUmbBRpxhi/RNjjwW9ccptJ7Xg/LpZyNcYbPHGaPjLsQw9Dwmu
 g0vBfK5eoX95e/16hW79g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217385; x=
 1669224585; bh=Dzvf2e2t3b+Fta3pbhuPZojmvdbKi1+FhykEBF7Qb3A=; b=R
 9TSqkfrMqzj6GWV+e5lor0hTjZPWJd4R8jRb7S19vTZG6vzrDcBeQ52e7Y8jZppH
 6fvIMIhycNtpqKhlP80eDMt0xrKK5z5SNAQnA8fraZEG2Gcjgb5B8PNI5Uwqi6cY
 HRUoB+QQnbpUxTTmJpZUmdko8GPLLJDXmkwAte7CnHieGWO709mK9PFEcn5GJmrl
 m/Wm0XxXC8NYXj7C6/aVBYJ5MF2hCT0UhWgfCjHyO+Tkc83cAw75R65NM4cbZgx+
 jMOtV6BMwSooEmWrRXyReKNapqkO1fUsWh8roH+wV3vWjblMDr+iLsjvg7TBG4bL
 TZM/47Y/9T2Sw8gE0T4zg==
X-ME-Sender: <xms:aTx-Y-yDBWeFaXbB5xgssB_xFxvj1MYH_xWj-iFyazksBQG2XRMv7A>
 <xme:aTx-Y6RPZV-QyNoSsE-J1FvxIUxDjNaYGDEfd8oXR6Bp-oJJv4rCJRGFPLnW8vPUF
 j8qI9ia6qTxVAEqriM>
X-ME-Received: <xmr:aTx-YwWZQD5ZgXAv8I0__oBF1fmV0apWhvqAj3o6GDJR9l_14eiyjDAeoEyiVqyLyMqMBe4cwiw0vVgvxsmeilcK85voRfSTAl3Kr3jCCKxeog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aTx-Y0gRezbgcx6d3OCX2qbOgkP-i3jIVjbJBFPQHp_i98_T0D41kg>
 <xmx:aTx-YwDQkF7hIhlK7iXk4EOgrb0oAgWN6l_2HqFzhYjpIf3o5Nhwng>
 <xmx:aTx-Y1Isb59-_eoIvlRixqbyC6uqv_P3TTdtxPuWYkaUJC3jGeeqmA>
 <xmx:aTx-Y4iIH3jpmczQ4-esa9a6qVpzmACfQLM5JcEBpVsU6hNeJWmS6YBqoZE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:56 +0100
Subject: [PATCH 14/24] drm/vc4: txp: Reorder the variable assignments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-14-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eQTGHiaDzFDVJK7tMOdy666qnj3QVGckWUHDPGP3pU8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tXSzYfdT8d3iN+b+pJxm6nV/91GX3UTs/wMO39aLo+v
 SwvqKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERkrjAyrBVRaDz/Oi8mrGObpu1brb
 Uen1pveC6+svmQ8JWge87HuxkZHjwq83qygf2qysyODDOtwjNRh2QM4led05Wp0tY7/yuJEQA=
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

The current order of variable assignments is unneccessarily complex,
let's make it simpler.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index bd181b5a7b52..b00c6fae972f 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -490,7 +490,6 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_crtc *vc4_crtc;
 	struct vc4_txp *txp;
-	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
 	int ret, irq;
 
@@ -501,18 +500,16 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	txp = drmm_kzalloc(drm, sizeof(*txp), GFP_KERNEL);
 	if (!txp)
 		return -ENOMEM;
-	vc4_crtc = &txp->base;
-	crtc = &vc4_crtc->base;
-
-	vc4_crtc->pdev = pdev;
-	vc4_crtc->data = &vc4_txp_crtc_data;
-	vc4_crtc->feeds_txp = true;
 
 	txp->pdev = pdev;
-
 	txp->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(txp->regs))
 		return PTR_ERR(txp->regs);
+
+	vc4_crtc = &txp->base;
+	vc4_crtc->pdev = pdev;
+	vc4_crtc->data = &vc4_txp_crtc_data;
+	vc4_crtc->feeds_txp = true;
 	vc4_crtc->regset.base = txp->regs;
 	vc4_crtc->regset.regs = txp_regs;
 	vc4_crtc->regset.nregs = ARRAY_SIZE(txp_regs);
@@ -533,7 +530,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	encoder = &txp->connector.encoder;
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	encoder->possible_crtcs = drm_crtc_mask(&vc4_crtc->base);
 
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
 			       dev_name(dev), txp);

-- 
2.38.1-b4-0.11.0-dev-d416f
