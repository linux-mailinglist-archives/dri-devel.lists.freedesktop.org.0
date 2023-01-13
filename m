Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3F669CBC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B033A10E1F1;
	Fri, 13 Jan 2023 15:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B79210E1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:46:47 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4558E5C004B;
 Fri, 13 Jan 2023 10:46:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 13 Jan 2023 10:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1673624804; x=1673711204; bh=BmEzU8B3l7ysuQ653v/eP3ujc
 zYkvko7k4r6aAv+Bu0=; b=n0/pvADTSmYdLvidjbCdRpesez1xIqiaaeRCCwAKd
 5FS6mnNowLSpoKphMbFSkBE45dOGHFauBCaHRxxnWYXnqhHOsnWqIjZujCDVXX/1
 K1Q9HIYvOYP02pY6r3og+O3MqeGvf9ErI0lchnX6vT76BVdo2sRIl/Rj9IcC4Ded
 Bz2ffvAckffsl3bn94aiOC8SvWvCHXgFh206nNIM0hs8BlH6V6foFrxINPqJTGOK
 0T7ewkti3yyErM2DxRBYdGXIJ4m2+ZYUr5AyMkcV5dyZQDwYf62XYhsiVnwXvNvp
 s8Pr9e6saAHovC6DLFWu2jA/j72vP9U4c/rV0mt/zPiLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673624804; x=1673711204; bh=BmEzU8B3l7ysuQ653v/eP3ujczYkvko7k4r
 6aAv+Bu0=; b=T9u68ni+awP6b2afJTPIZcIq6qDSWp1PbpehcrssYilGZ6ew5tK
 NiF6TujygtQZhYP9gsw1ILn6ff5xrbzg3e/Z9IsW0LTVT6FWzU8Bci6g52gtKEJq
 NXNmz1ccwnj+JHJCk5WzN5tmr90QzOUgjsKYiinr3rntuAVynytynVKU9JhsK0uh
 gFJf5mtIMYwvPbb8fHNjg3GdbPvbtJz81Se4qxN/8wYrtqDa09FwQgzOCdifm5JH
 Pz+v/spz+GNoqoRC8wXcIBDKYFz5ia7+DzOaYt9/02ccIaAKVEe2YZYbByBej9B+
 5DkJXWpulW0EKBh3qs38OzvzKgTE1HR1EoA==
X-ME-Sender: <xms:4nzBY4Xp6Nr47ginI6EQLyR9UUKqD-3Z4dI4oG2FpZ1a7VZvPUzksg>
 <xme:4nzBY8kHi1u7BhOsBWv1gx6rU34W1SRo8CoOEHft-t7TFkAO-oGfYT5W4faN57ag4
 x5f6j5s89P9HgskqlA>
X-ME-Received: <xmr:4nzBY8Y-3VWYPJouFB3z3K8K426gWxzErlZ0MSIABJeKhwzp9zX38hQiDz_jQoUcdSae_F0OvMJBw65npMIJilHHjbCYSEK7ajbba9FumL1V_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepkeetudejieejfefhjeeutddugedtjeffffdvtedtieegkeffieelleegvefgvddv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4nzBY3UKBS22iAzIOMWwb4bq5gdYAKlp2So_w70E-3uR7IAZiRCKFQ>
 <xmx:4nzBYylWqgjaT5BVDW_WB8yuLYH6djHc5No2GwYLnH-FxfLi4saAqA>
 <xmx:4nzBY8chojbsCDnAPz4-1OHaLiOnI6zssV5usqxx8UirlioXA5kk8A>
 <xmx:5HzBY9-PvB8CErQ140KPd1IulHjRVd47Z8DTEORK1_kPOPW8rQ9cYw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 10:46:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: bo: Fix unused variable warning
Date: Fri, 13 Jan 2023 16:46:37 +0100
Message-Id: <20230113154637.1704116-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.39.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 07a2975c65f2 ("drm/vc4: bo: Fix drmm_mutex_init memory hog")
removed the only user of the ret variable, but didn't remove the
variable itself leading to a unused variable warning.

Remove that variable.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 07a2975c65f2 ("drm/vc4: bo: Fix drmm_mutex_init memory hog")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 29ce2fa72cc4..c5947ed8cc81 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -395,7 +395,6 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_bo *bo;
-	int ret;
 
 	if (WARN_ON_ONCE(vc4->is_vc5))
 		return ERR_PTR(-ENODEV);
-- 
2.39.0

