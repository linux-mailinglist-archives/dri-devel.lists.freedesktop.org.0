Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF34129156
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 05:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09C36E12B;
	Mon, 23 Dec 2019 04:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424E86E119
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 04:40:59 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20191223044056epoutp04b8caab11dac142cc2d50a934fcec63b8~i5lFef7E61050310503epoutp04L
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 04:40:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20191223044056epoutp04b8caab11dac142cc2d50a934fcec63b8~i5lFef7E61050310503epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577076056;
 bh=JWZol/8nntnLTVgTQoSD0BY0RDkDKtGKIB8qaoY6nhA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=tBqvFHTm2Dl3PzU0b0HalEXAaEEY+nN6nAUbcoXyPqPErOn3bK/sL9uBADXigOB4i
 W+8sK6hLBoscDXwVN8LFS6nPlXPC2Im3xjv+oj5KWouu2xRhW7Yc3kATG1eM/+7sZ7
 tB0lt9wQZMpB+XLqJ7pEw+P9d8K6EYhoTSlViL7E=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191223044056epcas1p1f5b15266039a55aae77a2f28aa4822a2~i5lFGuBPZ1328713287epcas1p1e;
 Mon, 23 Dec 2019 04:40:56 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 47h69d6VcCzMqYkh; Mon, 23 Dec
 2019 04:40:53 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 55.50.52419.255400E5; Mon, 23 Dec 2019 13:40:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20191223044050epcas1p3822bf563d7503dd38fe313caa7bf2993~i5k-oRMpk0872808728epcas1p3t;
 Mon, 23 Dec 2019 04:40:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191223044050epsmtrp10a4fd0309dc26cdc671e03947582e85c~i5k-nj9iN2979929799epsmtrp1L;
 Mon, 23 Dec 2019 04:40:50 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-e1-5e0045526d33
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CD.FE.10238.255400E5; Mon, 23 Dec 2019 13:40:50 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191223044050epsmtip205c3062934fa3e887f8bb3b720548f5f~i5k-b7Tdg1900019000epsmtip2f;
 Mon, 23 Dec 2019 04:40:50 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/exynos: change callback names
Date: Mon, 23 Dec 2019 13:44:23 +0900
Message-Id: <1577076263-7363-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKKsWRmVeSWpSXmKPExsWy7bCmvm6QK0OcwZF2U4vecyeZLK58fc9m
 Men+BBaLGef3MTmweGz/9oDV4373cSaPvi2rGD0+b5ILYInKtslITUxJLVJIzUvOT8nMS7dV
 8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBWqmkUJaYUwoUCkgsLlbSt7Mpyi8tSVXI
 yC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM7Y9OAWW8FJ34qV+7ezNjDOdupi
 5OSQEDCRmN3wkbWLkYtDSGAHo8TleyvZIJxPjBJ9P1cxQzjfGCXavs1ihGm58mAuVMteoJbz
 x1lAEkICX4CcEx4gNpuAqsTEFffZQGwRAWWJvxNXgTUzC0RJXLg0AcwWFjCSaL57jhnEZgGq
 3/e5kx3E5hVwltjY3MgEsUxO4ua5TrArJAResko0X/3HBpFwkZiz8wyULSzx6vgWdghbSuJl
 fxuUXS7x7N0zoOM4gOwaiW9zKyBMY4mLK1JATGYBTYn1u/QhihUldv6eC3Uln8S7rz2sENW8
 Eh1tQhAlShLHLt6AhoKExIUlE9kgSjwkzp7OhYRBrMTDY02MExhlZyHMX8DIuIpRLLWgODc9
 tdiwwBg5hjYxgpOQlvkOxg3nfA4xCnAwKvHwJsz5HyvEmlhWXJl7iFGCg1lJhHd37d9YId6U
 xMqq1KL8+KLSnNTiQ4ymwJCbyCwlmpwPTJB5JfGGpkbGxsYWJoZmpoaGSuK8HD8uxgoJpCeW
 pGanphakFsH0MXFwSjUwNs5I+GOwPbT3iA/LdL3UP5O+PeJ58OMmT1kr58zNO/T5F6sqLiq+
 s+jB01Wzpm+Mc+NaW3FQsHhvgLvKkkXczWyJoX/ahJfu7Hff6CO75slG4QydaZw//Wc+8jUz
 DFuhssfi8r0q2ft9v++ICs+XeDT7ZqhkkVBaXcVy46hKwTo7torsZpNMJZbijERDLeai4kQA
 kOA2B1gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGJMWRmVeSWpSXmKPExsWy7bCSvG6QK0OcweZ5Qha9504yWVz5+p7N
 YtL9CSwWM87vY3Jg8dj+7QGrx/3u40wefVtWMXp83iQXwBLFZZOSmpNZllqkb5fAlbHpwS22
 gpO+FSv3b2dtYJzt1MXIySEhYCJx5cFc1i5GLg4hgd2MElNe/mPqYuQASkhIbNnKAWEKSxw+
 XAxR8olR4saU5cwgvWwCqhITV9xnA7FFBJQl/k5cxQhiMwvESBy5ugmsRljASKL57jkwmwWo
 ft/nTnYQm1fAWWJjcyMTxA1yEjfPdTJPYORZwMiwilEytaA4Nz232LDAMC+1XK84Mbe4NC9d
 Lzk/dxMjODS0NHcwXl4Sf4hRgINRiYeXY9b/WCHWxLLiytxDjBIczEoivLtr/8YK8aYkVlal
 FuXHF5XmpBYfYpTmYFES532adyxSSCA9sSQ1OzW1ILUIJsvEwSnVwFgaMetk/1RDXtPVm44y
 MVx6983kWxvThqlTjWrfHLvlxpb4LoddS4dP6O6lm0/mpZ9uWvVzzrzHOpo7Nvj2rM/aIH12
 N6NTzuNrfLuUYjt/12XMZmH4w/7qm4vjPBafbsUimyfyq+d+sjnzSm/bqmuqO42y1jMcMWru
 WChw/Eqa2sujzDl/FvQosRRnJBpqMRcVJwIA+kPPHQkCAAA=
X-CMS-MailID: 20191223044050epcas1p3822bf563d7503dd38fe313caa7bf2993
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191223044050epcas1p3822bf563d7503dd38fe313caa7bf2993
References: <CGME20191223044050epcas1p3822bf563d7503dd38fe313caa7bf2993@epcas1p3.samsung.com>
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch changes Exynos specific 'disable' and 'enable'
callback names to 'atomic_disable/enable' for the consistency.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 10 +++++-----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  8 ++++----
 drivers/gpu/drm/exynos/exynos_mixer.c         |  8 ++++----
 7 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 2d5cbfd..8428ae1 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -510,7 +510,7 @@ static void decon_swreset(struct decon_context *ctx)
 	       ctx->addr + DECON_CRCCTRL);
 }
 
-static void decon_enable(struct exynos_drm_crtc *crtc)
+static void decon_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
@@ -523,7 +523,7 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 	decon_commit(ctx->crtc);
 }
 
-static void decon_disable(struct exynos_drm_crtc *crtc)
+static void decon_atomic_disable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 	int i;
@@ -599,8 +599,8 @@ static enum drm_mode_status decon_mode_valid(struct exynos_drm_crtc *crtc,
 }
 
 static const struct exynos_drm_crtc_ops decon_crtc_ops = {
-	.enable			= decon_enable,
-	.disable		= decon_disable,
+	.atomic_enable		= decon_atomic_enable,
+	.atomic_disable		= decon_atomic_disable,
 	.enable_vblank		= decon_enable_vblank,
 	.disable_vblank		= decon_disable_vblank,
 	.atomic_begin		= decon_atomic_begin,
@@ -651,7 +651,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct decon_context *ctx = dev_get_drvdata(dev);
 
-	decon_disable(ctx->crtc);
+	decon_atomic_disable(ctx->crtc);
 
 	/* detach this sub driver from iommu mapping if supported. */
 	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f064095..ff59c64 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -526,7 +526,7 @@ static void decon_init(struct decon_context *ctx)
 		writel(VIDCON1_VCLK_HOLD, ctx->regs + VIDCON1(0));
 }
 
-static void decon_enable(struct exynos_drm_crtc *crtc)
+static void decon_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 
@@ -546,7 +546,7 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 	ctx->suspended = false;
 }
 
-static void decon_disable(struct exynos_drm_crtc *crtc)
+static void decon_atomic_disable(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 	int i;
@@ -568,8 +568,8 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 }
 
 static const struct exynos_drm_crtc_ops decon_crtc_ops = {
-	.enable = decon_enable,
-	.disable = decon_disable,
+	.atomic_enable = decon_atomic_enable,
+	.atomic_disable = decon_atomic_disable,
 	.enable_vblank = decon_enable_vblank,
 	.disable_vblank = decon_disable_vblank,
 	.atomic_begin = decon_atomic_begin,
@@ -653,7 +653,7 @@ static void decon_unbind(struct device *dev, struct device *master,
 {
 	struct decon_context *ctx = dev_get_drvdata(dev);
 
-	decon_disable(ctx->crtc);
+	decon_atomic_disable(ctx->crtc);
 
 	if (ctx->encoder)
 		exynos_dpi_remove(ctx->encoder);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 77ce789..1c03485 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -23,8 +23,8 @@ static void exynos_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	if (exynos_crtc->ops->enable)
-		exynos_crtc->ops->enable(exynos_crtc);
+	if (exynos_crtc->ops->atomic_enable)
+		exynos_crtc->ops->atomic_enable(exynos_crtc);
 
 	drm_crtc_vblank_on(crtc);
 }
@@ -36,8 +36,8 @@ static void exynos_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	if (exynos_crtc->ops->disable)
-		exynos_crtc->ops->disable(exynos_crtc);
+	if (exynos_crtc->ops->atomic_disable)
+		exynos_crtc->ops->atomic_disable(exynos_crtc);
 
 	if (crtc->state->event && !crtc->state->active) {
 		spin_lock_irq(&crtc->dev->event_lock);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index d4014ba..d4d21d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -118,8 +118,8 @@ struct exynos_drm_plane_config {
 /*
  * Exynos drm crtc ops
  *
- * @enable: enable the device
- * @disable: disable the device
+ * @atomic_enable: enable the device
+ * @atomic_disable: disable the device
  * @enable_vblank: specific driver callback for enabling vblank interrupt.
  * @disable_vblank: specific driver callback for disabling vblank interrupt.
  * @mode_valid: specific driver callback for mode validation
@@ -133,8 +133,8 @@ struct exynos_drm_plane_config {
  */
 struct exynos_drm_crtc;
 struct exynos_drm_crtc_ops {
-	void (*enable)(struct exynos_drm_crtc *crtc);
-	void (*disable)(struct exynos_drm_crtc *crtc);
+	void (*atomic_enable)(struct exynos_drm_crtc *crtc);
+	void (*atomic_disable)(struct exynos_drm_crtc *crtc);
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	enum drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 8d0a929..21aec38 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -894,7 +894,7 @@ static void fimd_disable_plane(struct exynos_drm_crtc *crtc,
 		fimd_enable_shadow_channel_path(ctx, win, false);
 }
 
-static void fimd_enable(struct exynos_drm_crtc *crtc)
+static void fimd_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
 
@@ -912,7 +912,7 @@ static void fimd_enable(struct exynos_drm_crtc *crtc)
 	fimd_commit(ctx->crtc);
 }
 
-static void fimd_disable(struct exynos_drm_crtc *crtc)
+static void fimd_atomic_disable(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
 	int i;
@@ -1006,8 +1006,8 @@ static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
 }
 
 static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
-	.enable = fimd_enable,
-	.disable = fimd_disable,
+	.atomic_enable = fimd_atomic_enable,
+	.atomic_disable = fimd_atomic_disable,
 	.enable_vblank = fimd_enable_vblank,
 	.disable_vblank = fimd_disable_vblank,
 	.atomic_begin = fimd_atomic_begin,
@@ -1098,7 +1098,7 @@ static void fimd_unbind(struct device *dev, struct device *master,
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 
-	fimd_disable(ctx->crtc);
+	fimd_atomic_disable(ctx->crtc);
 
 	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 65b891c..b320b3a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -120,7 +120,7 @@ static void vidi_update_plane(struct exynos_drm_crtc *crtc,
 	DRM_DEV_DEBUG_KMS(ctx->dev, "dma_addr = %pad\n", &addr);
 }
 
-static void vidi_enable(struct exynos_drm_crtc *crtc)
+static void vidi_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct vidi_context *ctx = crtc->ctx;
 
@@ -133,7 +133,7 @@ static void vidi_enable(struct exynos_drm_crtc *crtc)
 	drm_crtc_vblank_on(&crtc->base);
 }
 
-static void vidi_disable(struct exynos_drm_crtc *crtc)
+static void vidi_atomic_disable(struct exynos_drm_crtc *crtc)
 {
 	struct vidi_context *ctx = crtc->ctx;
 
@@ -147,8 +147,8 @@ static void vidi_disable(struct exynos_drm_crtc *crtc)
 }
 
 static const struct exynos_drm_crtc_ops vidi_crtc_ops = {
-	.enable = vidi_enable,
-	.disable = vidi_disable,
+	.atomic_enable = vidi_atomic_enable,
+	.atomic_disable = vidi_atomic_disable,
 	.enable_vblank = vidi_enable_vblank,
 	.disable_vblank = vidi_disable_vblank,
 	.update_plane = vidi_update_plane,
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6cfdb95..38ae9c3 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -986,7 +986,7 @@ static void mixer_atomic_flush(struct exynos_drm_crtc *crtc)
 	exynos_crtc_handle_event(crtc);
 }
 
-static void mixer_enable(struct exynos_drm_crtc *crtc)
+static void mixer_atomic_enable(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
 
@@ -1015,7 +1015,7 @@ static void mixer_enable(struct exynos_drm_crtc *crtc)
 	set_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
-static void mixer_disable(struct exynos_drm_crtc *crtc)
+static void mixer_atomic_disable(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
 	int i;
@@ -1109,8 +1109,8 @@ static bool mixer_mode_fixup(struct exynos_drm_crtc *crtc,
 }
 
 static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
-	.enable			= mixer_enable,
-	.disable		= mixer_disable,
+	.atomic_enable		= mixer_atomic_enable,
+	.atomic_disable		= mixer_atomic_disable,
 	.enable_vblank		= mixer_enable_vblank,
 	.disable_vblank		= mixer_disable_vblank,
 	.atomic_begin		= mixer_atomic_begin,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
