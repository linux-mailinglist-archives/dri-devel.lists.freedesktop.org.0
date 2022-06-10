Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A173C546260
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8883A12B5C9;
	Fri, 10 Jun 2022 09:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90E212B0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F6725C00C7;
 Fri, 10 Jun 2022 05:30:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853456; x=1654939856; bh=9d
 53uvdIJ3mP0baz9MErwSw/++fwRE15dNanrN4oxVM=; b=FN3qnUuNnR0gHVsIuM
 +MJWaPVjEvfO28HbI+LJyXZMfaXW3LgqA4b/5sGV4mRrP4/+3dCQCzMs88u4zJNQ
 EArjNkYQsExet6fkbNanFHG5R0/56FnPRJmK5JFbx8CQIpWTNBn2fZHN9roPf2Na
 mJlgraXzmZw3MHWJ9UO6xsLPo6HGvWMchEbIZWwZgn8VoUI9rL8Qry+epaU8zRZn
 JtOO3FyJXVrGTujWz4THOHrg3Gv0gIGogjb0vtB2NvRf7zAlYrcVLxxpHX8Zwmc6
 t8JKklHD5Tne+9Z9fiZ2UQ+VaaRfU5fRL4tpnrvJ/ZA1/A7AP6rSTgRANTcLYyw7
 /eaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853456; x=1654939856; bh=9d53uvdIJ3mP0
 baz9MErwSw/++fwRE15dNanrN4oxVM=; b=g9dJBBs17ex5na+8odbYcv23ytgqe
 ats5REAHHnZBI1kWBmezBSeJ+9LYpTJB8y/79thGnUQaDwla+Mk7DtiyXRgUd/I1
 DP8q6GGCugCGeBwOMqzylc2jwjoEEJBkV3Ydm6wAPWLK6PCfc1HMKPSTl54/IT2c
 SDgU2gAe3UPsqEcxP08beqO6MfvSevOoJubngsGhrktrRVTo98fc9UWRRn3pxVtz
 noCx0JOwMVhnKuy1NHFPCjZ7eSXAHVs20pLX3uzgAXpczcR7vdWlSoDaKTCNO3RJ
 WngYKazyh+w0GlBcg8KNH5Yk7nDzY56P1oq5z3wD6Pp3gE7xdCqHc8KIQ==
X-ME-Sender: <xms:UA-jYsaRv7Tn2w47NCTAqKVQRBTGrfG5XP9ugtSAisKcrrQ7a4AUug>
 <xme:UA-jYnYRB3Fu9iZpv0a8p5JjYlL96PZbQ45y2A0sBsJXRmFZK2YROpGi05--H2kMW
 5146ktcKqyFhz-Z99o>
X-ME-Received: <xmr:UA-jYm_L2t3_sgsKk-gYIZj2e2nLT_1a1H7TcJlZp_Bjbpqn5jSS9QEPlfs56L6avkBqWGuCVoq1mVhJu-GGbC-XlL1eHdIHmHyTv_Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UA-jYmrEJRq6P0ZPPm7mvAEbt7k6qwHuq3DIPnTNsQmgazb0VxutCQ>
 <xmx:UA-jYnqhh0pv12YvRPzUVQeouQE7uMIeR7YZt4yIdwP9oDmj3ZwsIg>
 <xmx:UA-jYkT5McBUAh9ZBrAAkKFig99OKC2Fu4IIuTgc2PBouwuwjixE_Q>
 <xmx:UA-jYomPddw7NuTFXMEPaAEV3Zfrl8_77ZMXeX7vxouaxRL5i56qpg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 50/64] drm/vc4: vec: Remove vc4_dev vec pointer
Date: Fri, 10 Jun 2022 11:29:10 +0200
Message-Id: <20220610092924.754942-51-maxime@cerno.tech>
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

There's no user for that pointer so let's just get rid of it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 drivers/gpu/drm/vc4/vc4_vec.c | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 5f2d7640a09d..12ab6df30629 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -79,7 +79,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_vec *vec;
 
 	struct vc4_hang_state *hang_state;
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 11fc3d6f66b1..99fe40c8cf81 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -532,7 +532,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec;
 	struct vc4_vec_encoder *vc4_vec_encoder;
 	int ret;
@@ -585,8 +584,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, vec);
 
-	vc4->vec = vec;
-
 	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
@@ -601,15 +598,11 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	vc4_vec_connector_destroy(vec->connector);
 	drm_encoder_cleanup(vec->encoder);
 	pm_runtime_disable(dev);
-
-	vc4->vec = NULL;
 }
 
 static const struct component_ops vc4_vec_ops = {
-- 
2.36.1

