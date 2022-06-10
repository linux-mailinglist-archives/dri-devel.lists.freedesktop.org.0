Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A84546261
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4A12B4EF;
	Fri, 10 Jun 2022 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1281011BA7D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D1535C011B;
 Fri, 10 Jun 2022 05:31:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853461; x=1654939861; bh=W1
 ROJRXcSVEHMNPw1PEjutD8ZRjULkh5BHJZgJO0uIY=; b=YdfCe+p3FZ79sRS2qZ
 XhMe7GONaJuwTsBB56qkrWZGMQePqys+RosCzW6tH5cNr9BT2hzJuRVck0x+xfq3
 HBlh1tnKgfS3p/vQzEtrBmpQV21l1LkDmnqxm7HLTSwkV9RdXgXvt2BrEjXPw6+z
 8f61eyYCF9QB6fSkjADpp4EUOOZ7dhOXnW362OaGA5/2EK7Drhgj6wvmV9ouuyEh
 cahOWEYnSpKwRIpiy9qYQcKniy981RSZS85xFoEXTaLRK/g168lSoajC5gfAzmMM
 FQSYzqrpx6cjMf7CVRpVdFYNhm9eUYKtvx7O0VWBu0DuKkhF5GI7rIcc5CVec/F/
 U8XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853461; x=1654939861; bh=W1ROJRXcSVEHM
 NPw1PEjutD8ZRjULkh5BHJZgJO0uIY=; b=PmoiNG1h7k8z68sNuBcNrVM9cJQ/V
 PI6Zl96jl/XY0R5Rx6kPsXS99UVCAhBoILwNj3muYKIAHOFLi46AB9uLLJAcS4wG
 mC0+aQQ5E7iqT7r8IcV46vCAeIN6++22bm9JkyhlKvsfQQeQUtV8wuQqKMot9QWO
 ea3kWOzs1H6/kuEtF/gmLEK9n5lfnZvOk4B/snGqjWfwx5h7eHYBGkVXRj8ctChm
 x+61QtnPBYM+No1dR2+uBVqCZ+J8yZf6WAYKjd9Df9aeNlKc5VdrnntCqPt9N2zO
 re+Q9+VBJ7hxZ415Pyf4rzDSp9tQRa+NiXR/jxD5Ba87cexD94MjcPQNg==
X-ME-Sender: <xms:VQ-jYgAahMQs5wKG4f8-gQ2YuxpMUes30pzIJa9FGkaVUTQRu5SBuA>
 <xme:VQ-jYigukZvxM21RCnovYrMNoLUyG4kAc8C6twblg7S8wozRi1xDKv3_za1BBv4VS
 Lx8dxz9i_PddqD0Rtk>
X-ME-Received: <xmr:VQ-jYjnviOD2vtV8CUbropjgIblS4metvpbMpmvlc33uVX5APQEiA3Pwl_AVK1shPvR9s2mTzjuXP3h9_xl8Wj_-MOTFgYQ1pnHqjUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VQ-jYmx9qtyo2Fhib5txdiu-NJG8ONnSpZgEzFTEhJp0NttKxVA94w>
 <xmx:VQ-jYlQzGqULFDaGNIDiDZjby0ftcQLiEEZ-UE5y4LBqhSYBagQqgQ>
 <xmx:VQ-jYhbvm4C3DVZ6Ha0LtZsEPuFhDas9IScqyV0MyKH96qWWqH7bCg>
 <xmx:VQ-jYjOJDuG2d0cIVaEHqLwLeGpORb7uZieTjU7veV_9kjZwKUJEZw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 53/64] drm/vc4: vec: Switch to DRM-managed encoder
 initialization
Date: Fri, 10 Jun 2022 11:29:13 +0200
Message-Id: <20220610092924.754942-54-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a051b25337c0..3ccbe34b22ea 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -534,12 +534,15 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	ret = drmm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	dev_set_drvdata(dev, vec);
 
@@ -547,8 +550,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_destroy_encoder:
-	drm_encoder_cleanup(&vec->encoder.base);
+err_put_runtime_pm:
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -560,7 +562,6 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	vc4_vec_connector_destroy(&vec->connector);
-	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

