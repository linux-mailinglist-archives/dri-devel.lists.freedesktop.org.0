Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674CB666DD5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7716410E8A9;
	Thu, 12 Jan 2023 09:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB4910E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:12:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DDD95C0105;
 Thu, 12 Jan 2023 04:12:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Jan 2023 04:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1673514767; x=1673601167; bh=Tri+DR+cVs/Auk8o+T2XwgOXI
 oNZqmidUJrivwOD7n0=; b=s2CbTOS/YBQFqx7/22J/Nmrvqq1JxowlxuwwJwUeU
 7+tSSz6BtkvBTkeA1e6eTHFgOI9uSYdOTIAm8gL7CuKOKt7sj9ASMKlxLZ3ujIWD
 2h994zEts+5riysq/fDZxfDX+KT95Bk62IsDWx34Ido3/DXTcINo6/j3jkaY59Q3
 gU2Q/IC9BZ8Vcq2sLuzg9Q8rNuuCbCujJlK1Nf2HwlxHCrZTixagCHKUWV69ib/f
 kjyOr7Jsej+jpwSf1hjQAkLVaRVv59Hyl8JvBX9H3u+7tmkb+A9R+OxigpYo50Sx
 KTcfdY06N6CgzBfD8QaBaNw34zandWyJ+ltTtxy+vZESw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673514767; x=1673601167; bh=Tri+DR+cVs/Auk8o+T2XwgOXIoNZqmidUJr
 ivwOD7n0=; b=r5EDYnfEL6TKUF8vYevqpjQYApT2TzIGvB5mVmo59lHODBrEfd6
 BpHSIOqR3LUkio9A4GPgOWDJoeij3k1AA+16wREc4h9yQ9s+RZixG2797AebAVdN
 r/QZi2QiD2b+d2YjdOIA0Dj5+/wWGF6gbERw9pQfL2ihPubYpCnXKGjf3b/Tj+cC
 Tt0SRs20XCELCPPfZw+5t+Wd3wrQgJzNu/kAc134YwUfn+5Ml2lfuyDJWcgGTkov
 tvyinSgA/9k+Oj/p4Eeg+fLTK7ZgWhMFIjsJsxeV7qqfe6imUGiAWtzyw2KdhdOy
 9Odx7VA2XJIshpSbifwiNrszG9FOBpmQd4g==
X-ME-Sender: <xms:D8-_Y1T10Pc91jdDJAsYOSRb_iJXu0rq8BC-A8eoQ4lZ2hABwKX1Ig>
 <xme:D8-_Y-wIyIkkGljRjSyfT4RaTvp_5TN10ElBnfeSZTRuziSMGJwThn7VHTe68Sj8r
 JFj29pKQRci4QVSDfM>
X-ME-Received: <xmr:D8-_Y60sIDu7YYPM1ied1VmwdPyQ4B0L-G9tRmB6NLsVvBNYzAFqAyWf-xPwOHR5JPbUe600iZar1WANcYTRgbSMm2sp0nmwYnTDBg5PklVS6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeiucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhp
 rghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpe
 ektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdvvdenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:D8-_Y9DfNY-cJx0P5ggMzPp4gLKQMTdA39Ylms5Y4dOdSSeQ4GbWYQ>
 <xmx:D8-_Y-jvCFFbeaIZ9dolEedSzHUPmy9v3uaJ-7qIzzrGSWuRIu7XXw>
 <xmx:D8-_YxoyH2M0zOFPGoEdtPV4cRd-QuqtnBZNXrJtqhbQFGBRfClZBQ>
 <xmx:D8-_YzZMq-pk5vBXm2gP4-X0Gf29caWvi2lqKqwFcxgITbB9BmxYog>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 04:12:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: bo: Fix drmm_mutex_init memory hog
Date: Thu, 12 Jan 2023 10:12:43 +0100
Message-Id: <20230112091243.490799-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 374146cad469 ("drm/vc4: Switch to drmm_mutex_init") converted,
among other functions, vc4_create_object() to use drmm_mutex_init().

However, that function is used to allocate a BO, and therefore the
mutex needs to be freed much sooner than when the DRM device is removed
from the system.

For each buffer allocation we thus end up allocating a small structure
as part of the DRM-managed mechanism that is never freed, eventually
leading us to no longer having any free memory anymore.

Let's switch back to mutex_init/mutex_destroy to deal with it properly.

Fixes: 374146cad469 ("drm/vc4: Switch to drmm_mutex_init")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index c2b7573bd92b..49320e4d595d 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -179,6 +179,7 @@ static void vc4_bo_destroy(struct vc4_bo *bo)
 		bo->validated_shader = NULL;
 	}
 
+	mutex_destroy(&bo->madv_lock);
 	drm_gem_dma_free(&bo->base);
 }
 
@@ -406,9 +407,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 	bo->madv = VC4_MADV_WILLNEED;
 	refcount_set(&bo->usecnt, 0);
 
-	ret = drmm_mutex_init(dev, &bo->madv_lock);
-	if (ret)
-		return ERR_PTR(ret);
+	mutex_init(&bo->madv_lock);
 
 	mutex_lock(&vc4->bo_lock);
 	bo->label = VC4_BO_TYPE_KERNEL;
-- 
2.39.0

