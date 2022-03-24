Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E434E65A3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E78010E8C4;
	Thu, 24 Mar 2022 14:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEE510E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:47:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 075893201DD7;
 Thu, 24 Mar 2022 10:47:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 24 Mar 2022 10:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=gvYqQ1GIf4EeaGquGvkV2d0JYPb5V3
 napMbPEyLVYBs=; b=gOYcRNJ9Qsx6DFEUekrrW4zHAPh/qDBfbCVT5KCJiyssJu
 zQ0sM9is4+NMGFHdQfa7jW327ov3Bye+vilst0usZiHiMc9/kTVTGM6jDOdBSUQd
 A7ZlVNdBSo+zFnnGmHboMDzfQWpEX092X43uoJ5pP1vcPdIaTDXsAxXwxwm++33Q
 uUqHnSs33hinr6HrMvxEyD2SN2PT7ilyCCBUL4aD88HrOOW0aOLvfXGLxgCk4EMB
 af3ftmNgpZR+I5TZb+Ori2VV5dasu1PYqxe0t5dbt5vOjhPQ1aknNHxXBGWw21uN
 jUv2TOzM31V0U4gCMfT0g05hUy8B55ZZcK9Fvy3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gvYqQ1
 GIf4EeaGquGvkV2d0JYPb5V3napMbPEyLVYBs=; b=gyndsXJhKPJ7BhyFE4sxIS
 JZuCx8wOcLi4HNCgAvwrBM7rsncwa+a9pjIU5HPD7pSd+m8KShxxEBQv2FxtAk8y
 307WE+bi/q7byf5W4yNMEs/WGbvVqCDqrsimt48asP2JzJPI/qBh2U/zNoibxG7M
 0L95FffrGpi2yg6su4CElFFNevQa4fPrLvmJEloxnJNmrGbKcwUfqF6T4ursRJRh
 rpTYx5w7tSdpApH2M85pLDUz9rxOcNprxRtEVCX1WGQGCKfdApOL7TbTpegm+e63
 OaZz3l1iJNCiUVRQCG3mz/8pUWOa4O9CPZnbaIn96JIIwShcBsG7OKH4LVm7kroQ
 ==
X-ME-Sender: <xms:iIQ8YrK63VD6rwajyBOUHWW8Y25HHVh3eI2_H630Sc63EQq4efAT6g>
 <xme:iIQ8YvKFMmRp4Eo2LTNl1zz_t5tENcZIkAyiux7VtPSIPkc_AE5ZM-ecpMvDylGVh
 Gspb-XQ7gzLtHFdchk>
X-ME-Received: <xmr:iIQ8YjvMUlwqbvfdyESJTz2LVq6mCDqP8bkXqvlgHtzxRmFp6L6UebaGkBgRcOhGFiHy7NQ5dCM85hLWXQvcYKkmTsohRiISZ2TuiCY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iIQ8YkZjBWjMSmJCnkftjGgTmSuQ35mg0cNdXV7Xt6mOiouddUw3WA>
 <xmx:iIQ8YibtR5ZbEnXFChjJ_i-Yy42FDYa_dzNtws72_k-c3CrTV9wmvA>
 <xmx:iIQ8YoC5nq-sCOM7cPILEdJkNCEljI8rSUGFmMwuH-574XvpP-uHGQ>
 <xmx:iIQ8YpV2s14UeJZaYAOV1y8-uA5pmT1rOSU8FmR82icBjlJ-eBwTpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 10:47:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/vc4: Constify private state accessors
Date: Thu, 24 Mar 2022 15:47:23 +0100
Message-Id: <20220324144724.1306133-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324144724.1306133-1-maxime@cerno.tech>
References: <20220324144724.1306133-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of those helpers modify the pointed data, let's make them const.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 24de29bc1cda..26b771c919b1 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -32,7 +32,8 @@ struct vc4_ctm_state {
 	int fifo;
 };
 
-static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
+static struct vc4_ctm_state *
+to_vc4_ctm_state(const struct drm_private_state *priv)
 {
 	return container_of(priv, struct vc4_ctm_state, base);
 }
@@ -49,7 +50,7 @@ struct vc4_hvs_state {
 };
 
 static struct vc4_hvs_state *
-to_vc4_hvs_state(struct drm_private_state *priv)
+to_vc4_hvs_state(const struct drm_private_state *priv)
 {
 	return container_of(priv, struct vc4_hvs_state, base);
 }
@@ -61,7 +62,7 @@ struct vc4_load_tracker_state {
 };
 
 static struct vc4_load_tracker_state *
-to_vc4_load_tracker_state(struct drm_private_state *priv)
+to_vc4_load_tracker_state(const struct drm_private_state *priv)
 {
 	return container_of(priv, struct vc4_load_tracker_state, base);
 }
-- 
2.35.1

