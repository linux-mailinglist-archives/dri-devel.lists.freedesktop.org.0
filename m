Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91793062C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 17:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2CC10E025;
	Sat, 13 Jul 2024 15:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="skrZZD4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B5410E025
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 15:35:36 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0747F874AC;
 Sat, 13 Jul 2024 17:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720884934;
 bh=R8x8SOnjSlig4/B74pItuN9fRZ0Xwlht5fPrjiL7tgM=;
 h=From:To:Cc:Subject:Date:From;
 b=skrZZD4L3XEQqgU+V4vyIzS7I+JCBpVZ5fxx5Cx4x/B9EK9E9hWjyruFvZHAhsCri
 7LcSPKnIZIvvvJZ/6XPdf2dRpXDSXvgOIMitIfFu7en6Z1gNTgGLmpbv6NGl+IKMl7
 x9i/uQicqbnNa5hdzW8w9fq6rOXUdOUj6vQNVaK3Nu8/istUP0khmd1mF3zMDQZDlB
 QA4w4mM0D3lZ3azOXK6m/jm54/kJT4otgiXRVj/oEHQdA/x4sjEjlYDNfSe3B7LY6N
 i+LOC5BXX0QoBVlXfz4kuxj/y7NL/YTi0g65Oa4bxsNZnFbKIPZ8HbZBRBxyopvlus
 uQCevR8gGXLbg==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] gpu: ipu-v3: image-convert: Drop unused single conversion
 request code
Date: Sat, 13 Jul 2024 17:35:00 +0200
Message-ID: <20240713153524.107019-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

Neither ipu_image_convert_sync() nor ipu_image_convert() is used or call
from anywhere. Remove this unused code.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 76 --------------------------
 include/video/imx-ipu-image-convert.h  | 46 ----------------
 2 files changed, 122 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 841316582ea9d..c87866253eee9 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -2395,82 +2395,6 @@ void ipu_image_convert_unprepare(struct ipu_image_convert_ctx *ctx)
 }
 EXPORT_SYMBOL_GPL(ipu_image_convert_unprepare);
 
-/*
- * "Canned" asynchronous single image conversion. Allocates and returns
- * a new conversion run.  On successful return the caller must free the
- * run and call ipu_image_convert_unprepare() after conversion completes.
- */
-struct ipu_image_convert_run *
-ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-		  struct ipu_image *in, struct ipu_image *out,
-		  enum ipu_rotate_mode rot_mode,
-		  ipu_image_convert_cb_t complete,
-		  void *complete_context)
-{
-	struct ipu_image_convert_ctx *ctx;
-	struct ipu_image_convert_run *run;
-	int ret;
-
-	ctx = ipu_image_convert_prepare(ipu, ic_task, in, out, rot_mode,
-					complete, complete_context);
-	if (IS_ERR(ctx))
-		return ERR_CAST(ctx);
-
-	run = kzalloc(sizeof(*run), GFP_KERNEL);
-	if (!run) {
-		ipu_image_convert_unprepare(ctx);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	run->ctx = ctx;
-	run->in_phys = in->phys0;
-	run->out_phys = out->phys0;
-
-	ret = ipu_image_convert_queue(run);
-	if (ret) {
-		ipu_image_convert_unprepare(ctx);
-		kfree(run);
-		return ERR_PTR(ret);
-	}
-
-	return run;
-}
-EXPORT_SYMBOL_GPL(ipu_image_convert);
-
-/* "Canned" synchronous single image conversion */
-static void image_convert_sync_complete(struct ipu_image_convert_run *run,
-					void *data)
-{
-	struct completion *comp = data;
-
-	complete(comp);
-}
-
-int ipu_image_convert_sync(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-			   struct ipu_image *in, struct ipu_image *out,
-			   enum ipu_rotate_mode rot_mode)
-{
-	struct ipu_image_convert_run *run;
-	struct completion comp;
-	int ret;
-
-	init_completion(&comp);
-
-	run = ipu_image_convert(ipu, ic_task, in, out, rot_mode,
-				image_convert_sync_complete, &comp);
-	if (IS_ERR(run))
-		return PTR_ERR(run);
-
-	ret = wait_for_completion_timeout(&comp, msecs_to_jiffies(10000));
-	ret = (ret == 0) ? -ETIMEDOUT : 0;
-
-	ipu_image_convert_unprepare(run->ctx);
-	kfree(run);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ipu_image_convert_sync);
-
 int ipu_image_convert_init(struct ipu_soc *ipu, struct device *dev)
 {
 	struct ipu_image_convert_priv *priv;
diff --git a/include/video/imx-ipu-image-convert.h b/include/video/imx-ipu-image-convert.h
index 3c71b8b94b33a..39906b0cbf2d8 100644
--- a/include/video/imx-ipu-image-convert.h
+++ b/include/video/imx-ipu-image-convert.h
@@ -149,50 +149,4 @@ int ipu_image_convert_queue(struct ipu_image_convert_run *run);
  */
 void ipu_image_convert_abort(struct ipu_image_convert_ctx *ctx);
 
-/**
- * ipu_image_convert() - asynchronous image conversion request
- *
- * @ipu:	the IPU handle to use for the conversion
- * @ic_task:	the IC task to use for the conversion
- * @in:		input image format
- * @out:	output image format
- * @rot_mode:	rotation mode
- * @complete:	run completion callback
- * @complete_context:	a context pointer for the completion callback
- *
- * Request a single image conversion. Returns the run that has been queued.
- * A conversion context is automatically created and is available in run->ctx.
- * As with ipu_image_convert_prepare(), the input/output formats and rotation
- * mode must already meet IPU retrictions.
- *
- * On successful return the caller can queue more run requests if needed, using
- * the prepared context in run->ctx. The caller is responsible for unpreparing
- * the context when no more conversion requests are needed.
- */
-struct ipu_image_convert_run *
-ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-		  struct ipu_image *in, struct ipu_image *out,
-		  enum ipu_rotate_mode rot_mode,
-		  ipu_image_convert_cb_t complete,
-		  void *complete_context);
-
-/**
- * ipu_image_convert_sync() - synchronous single image conversion request
- *
- * @ipu:	the IPU handle to use for the conversion
- * @ic_task:	the IC task to use for the conversion
- * @in:		input image format
- * @out:	output image format
- * @rot_mode:	rotation mode
- *
- * Carry out a single image conversion. Returns when the conversion
- * completes. The input/output formats and rotation mode must already
- * meet IPU retrictions. The created context is automatically unprepared
- * and the run freed on return.
- */
-int ipu_image_convert_sync(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-			   struct ipu_image *in, struct ipu_image *out,
-			   enum ipu_rotate_mode rot_mode);
-
-
 #endif /* __IMX_IPU_IMAGE_CONVERT_H__ */
-- 
2.43.0

