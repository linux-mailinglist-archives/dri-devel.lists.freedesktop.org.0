Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE9CMF6LgGnO9wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B57CBAF4
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A8110E467;
	Mon,  2 Feb 2026 11:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dYy0J99X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4FE10E46E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:32:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-81c72659e6bso3834665b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 03:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770031963; x=1770636763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+souS7YaNTH8HrRQ+fNkEhlVU7efydlW/fF0+nylSc=;
 b=dYy0J99XwF1sBTZMowu+hOjRhhNHolRSY04yLpgaxl33gieDOAAWpQ/zp7w21Farzs
 D5S16ia+r5o3h0oiXOLirFUyOFFssEA1dqpe+CMU+ajdPxAIblFitm1Wa181Ct/ISgDq
 WtduvFgurmiIjCGIQPMvtSUNFRoUYV4J0qxtHgS5Yv5CCHwRA1Xp9vjw4nt+7dX3WS2r
 cajFTXW1F6iQFIqWbjph8yl4qMA9fYwsEyk6nloTYOENT6octxLtMCmxkVCUD3GjMx9N
 4z5n6I0KEHP+OlsSZPIgKmcxeVJafvwIAPKFYg6e1F88kZBZjynbkgC3TDqN4P2q8w8a
 75/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770031963; x=1770636763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l+souS7YaNTH8HrRQ+fNkEhlVU7efydlW/fF0+nylSc=;
 b=Vavz1P4UJ0Bx1P8aPMwfbNTqLLA1GK4qxWHxWbwW172loE4vqS31NcUMklUR3vOTUm
 qDVpuBJJwcIRoCjzsHbvYlR/mh4GOips3WIWmreJDIeCvmvRGeRO+X2Z058D7y7InxRm
 NBp46qexNuKYZ3hm7pw+Ph3rqRJt19r5egmDhTsTk5rGzux1p8rks76dz6KbF1/LL3P1
 53c2PmchLHwc1uTKveNt/Rw51wFFprCiur/EecVcNNo7MqSHSVHWvjudcZ2HbSt9QBD3
 b0CKRBukdet3mT5EuXVZlE7YKjOIyUBWuSlRYsI9+xtd0V32VLICi6vLQXqrUwfCG1H6
 hZIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsMyuhJ08coZA/ocRwB6CfLWFZ11g5shCcwaMgc7vhPi46Wik5kSBlwTFOlUSG/Vyl2m12HAfUO5g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbGHSdsNj7BwRC7kQpn133+VCOHQhbHj6Nk5WNqlYbP3PN9Fj4
 W/w5EaNRePFewMjZY9bzX/iDLJ4mrI27IRnXiUyHYTiDK4e2gEcrdNje
X-Gm-Gg: AZuq6aJzvTz5RITnlUjxNBnrf1pJTywnuYR8OSuOoU+akJipnDPClQnAjBEyJH0XRLf
 yVMyfFyKyQTg5j4dl13KnH59Xwh/PxSIERga9vjUOBajLppnL55tbadPsHsT36Qhd6eIWCZTPQS
 e2oRb0sZLmj9Oe880xfS3YMTMrxW9nSkaeL24cgZtzTK8ngX8ODIOi91SX1nw0qZWEckGDwaGCg
 wFPUKyYYaMtHSZeyagpyrG735NhYjNMw6mrjlhDBjLVUdFARQSdWeMT2g3yJNCQjvA/H+eiZAKi
 LLeGLyjAdwD7lPNr9ipvLqyuQFTKvgFWEXGEkTnl/rE0NQHUvv5to8KEgr+Qff52HCjC4Hgrxvu
 SZwV2ve+IwuHjnwSZfet7M3uMeuxHpraWK23U3KxpROYpp3Dr/9IobxoDbAE2o+C7pP4FlIJ4F7
 Mcguqac32hmQtEvHhPpatFNTaGJnRNRzXrVe73UQ==
X-Received: by 2002:a05:6a21:7804:b0:393:8fc:5284 with SMTP id
 adf61e73a8af0-39308fc8453mr4806502637.70.1770031963552; 
 Mon, 02 Feb 2026 03:32:43 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:32:43 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 1/3 v2] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in
 vidi_connection_ioctl()
Date: Mon,  2 Feb 2026 20:32:32 +0900
Message-Id: <20260202113234.183393-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113234.183393-1-aha310510@gmail.com>
References: <20260202113234.183393-1-aha310510@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,samsung.com,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 39B57CBAF4
X-Rspamd-Action: no action

vidi_connection_ioctl() retrieves the driver_data from drm_dev->dev to
obtain a struct vidi_context pointer. However, drm_dev->dev is the
exynos-drm master device, and the driver_data contained therein is not
the vidi component device, but a completely different device.

This can lead to various bugs, ranging from null pointer dereferences and
garbage value accesses to, in unlucky cases, out-of-bounds errors,
use-after-free errors, and more.

To resolve this issue, we need to store/delete the vidi device pointer in
exynos_drm_private->vidi_dev during bind/unbind, and then read this
exynos_drm_private->vidi_dev within ioctl() to obtain the correct
struct vidi_context pointer.

Cc: <stable@vger.kernel.org>
Fixes: cf67cc9a29ac ("drm/exynos: remove struct exynos_drm_display")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 23646e55f142..06c29ff2aac0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -199,6 +199,7 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct device *g2d_dev;
 	struct device *dma_dev;
+	struct device *vidi_dev;
 	void *mapping;
 
 	/* for atomic commit */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e094b8bbc0f1..1fe297d512e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -223,9 +223,14 @@ ATTRIBUTE_GROUPS(vidi);
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct vidi_context *ctx = dev_get_drvdata(drm_dev->dev);
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct device *dev = priv ? priv->vidi_dev : NULL;
+	struct vidi_context *ctx = dev ? dev_get_drvdata(dev) : NULL;
 	struct drm_exynos_vidi_connection *vidi = data;
 
+	if (!ctx)
+		return -ENODEV;
+
 	if (!vidi) {
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "user data for vidi is null.\n");
@@ -371,6 +376,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -378,6 +384,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -423,8 +431,12 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	timer_delete_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {
--
