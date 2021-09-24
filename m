Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF1416C2C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DAB6EE12;
	Fri, 24 Sep 2021 06:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9293B6EDF2;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5BD60581075;
 Fri, 24 Sep 2021 02:44:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 Sep 2021 02:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wTeB+AcsPUqMT
 kq0tx5O/S28gFdBW8XNnb+QC7S+PpM=; b=QlZT4Uh2QAi43G9r1MwJXHAURmNz7
 stKwPMetOSzjIhXUcDNJHD1B8AndSEBDalf6GiPt1flVVrA9j/AAk+W7x996RZ+J
 tC7onfLqobCCuZXYBGHAxZCmugI9owsvAkbpXuTWfUHgxfz5Dcs+pc+RzD7Ciq56
 V5Kt6fTt7XwNKQnIdizRRvBxdtwpFScogNyCrOPyTSykKH0oCYAYien8PhQyRuf2
 EHSwA2WlLJH6nqVabkBp4xVON8qzPwvKmJ2XuVYXpFQHKPtxg+3fM3P7jIVIF1bm
 NIxkAozroKhuBFPdb7wdep7PG1Fn9JAOJE94D89b4ebhsxbqbjJaVJcAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wTeB+AcsPUqMTkq0tx5O/S28gFdBW8XNnb+QC7S+PpM=; b=NNNBAoIs
 s+iDhU4wSRff0Uavn0ZxWywNpUeNeZuyyf9o9Id665GY7U9KlGcnRZjCv+589fYb
 LZXu78iSLR4C0Zo0B5Ge0G2fUxQBRsYC/Szfaz/DQHRmf/bOgDgEFV6aa9eSqMsW
 Hpf7II1dd+/AwRSU+NSXDpxmnQtTP2WziueqF1HAvDwcFgQrAlozsry13nr1wveF
 jBKznJKUsOyf9TWdNkCKJms+1pQXFzuPmbpQD0TbOdtIoM77aFpH5MttRUKW5uiZ
 ABeqCUu5ZHK0igOlHHnzDDEbjuGy/11mvwyorez5lN9lgB2SsEH8gfiJIJF1kXwv
 DN8CwXXFAQEhSA==
X-ME-Sender: <xms:tXNNYR800t9YIH7BE9bltkQKG1xBR0xHNHdxaYfEnU9LeDqONZQqUg>
 <xme:tXNNYVsn3l1Mumcss4ckZutV1pBhxaBBYvNK-to29pYtlXRS0I1f9oolhtvNOUrRS
 Ej-PFAWe1yMLmGC0Q>
X-ME-Received: <xmr:tXNNYfDbNrjf-uQkkJN2H6QnQyLEZ7QaqgArPfpwFc9CN8QcEkE6oDa3qoku6v5xPUBl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:tXNNYVexGN_fEV80KBiglRGv3d3oMBsduOf9rRRo4a-0vIEQDeeL-Q>
 <xmx:tXNNYWNwT1fmdCxDIwZ6aMuqDdj7NYl_5T6yHEqowb0d_6L9oc5UAg>
 <xmx:tXNNYXlo9oEPNUDnAv12GN4Vlm5W08T6zBGciQfhPVD2HwWDnpvltw>
 <xmx:tXNNYdrVKO_GL3dev_4F5tYO_J9Obh6vHAZIfA20Byr3lO-XydMr1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:44:02 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 11/17] drm/msm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:18 +0200
Message-Id: <20210924064324.229457-12-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 768012243b44..b89687074890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -18,6 +18,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
@@ -1172,14 +1173,15 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
 	struct drm_plane_state *state;
+	struct drm_modeset_acquire_ctx ctx;
 	struct dpu_crtc_state *cstate;
 
-	int i, out_width;
+	int i, out_width, ret;
 
 	dpu_crtc = s->private;
 	crtc = &dpu_crtc->base;
 
-	drm_modeset_lock_all(crtc->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(crtc->dev, ctx, 0, ret);
 	cstate = to_dpu_crtc_state(crtc->state);
 
 	mode = &crtc->state->adjusted_mode;
@@ -1263,9 +1265,9 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
 	}
 
-	drm_modeset_unlock_all(crtc->dev);
+	DRM_MODESET_LOCK_ALL_END(crtc->dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 DEFINE_SHOW_ATTRIBUTE(_dpu_debugfs_status);
-- 
2.33.0

