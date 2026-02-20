Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGlBE6PWl2lJ9QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:36:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A27164683
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F7D10E776;
	Fri, 20 Feb 2026 03:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IecU1A/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8857E10E776
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 03:35:59 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2aad1dc8856so10558905ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771558559; x=1772163359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nt6vgi/ugK6ilulMXdoJ0iyfQKJZUeMQJfjUYZUE7BU=;
 b=IecU1A/P7eHum88OWjsIqtHf8/pYUUyGTbjP72YBam8tO+C4Et7gtAWpymY6WR9S2l
 IN+jJYpmGOdrmGA7mO7AqTKxa8wHLxUy8x+1A6iWcLpsPe1D0f42PdlZzIQeBpBqsoj6
 dALHKVvCkNVT8mCEhdsl3pc/3Q5zrHiMVIOT7uQsMCdMwylL4vcjKVRoqJm4r89h63+s
 W0p+B8IsTmjSymKqOlwsm2RMFzof3joGHWCgqfNjAoaVj8PNhflHXAauMd35XyOJSeUc
 QjbN5tB/FanRjETvGXYde7Vebz1FN2uwELoureUhmcNSGZ0usBPT/yehkxFcHSDcYVqg
 91hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771558559; x=1772163359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nt6vgi/ugK6ilulMXdoJ0iyfQKJZUeMQJfjUYZUE7BU=;
 b=gNmRKFsk2peOLq5qS1M38qbOEmJmq5r9l8+N3+ZGImJAL9OtU6VnLJZjYQXVmQ53cZ
 fi4rv79JRDwj3Wv8WQODufiBDG0ilKrPS2kgcvnHw7B/YHABRh7r+ieU58VgrFnggyPu
 2NYdL2omHXAm8zcM7cHLmsnNiXMzaOjMmOb1gG/9x5mOOuPuvYhi6IPBd4aiZbZYEi8T
 wZ6F1YHaqo09wNMaU24JfevYoN8ajhl8Ae8aD3NbnsWsKAQIt/sA0OeJvr/NzHFYljwx
 aYyvwMpxY+uEtvFpSoX57vsJqcethIt9wI2ylaKRPA1DzUmAsL0Jzb3Hll9WHv4WemkO
 LiWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU54qNkIDRMtP1QvcDLhmt9XGOUVLEOLPr0o50VoZf/1Tjs/moSi0BgzoCru3zKIX4QY36PVR5KTyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSxT1wEfask+lD7G6YcO/g+tAnrzUutg89XHODlEea1nqrmPqw
 M8TopACWBZ8Z4oAvWkWmy3QvImyCKOk0S25UcTNV50+m1fLcfVE51Tsv
X-Gm-Gg: AZuq6aLlf+JetY3faRTO3x8Qrlw4PWPdZ0D/CyC2YZZqfcHyougJyCkHELdZ30Fvbqr
 vvVNHk0Jb5iVfLu36zCWpiWgOeNerkKXeqUtZ0yraL7QVHBzr3PTPhKliYEwzECkixjReC67P2N
 IEL/hG2vNcS+74lNRgVOJX64+CCQvDgDra4CKKDRLou9JNj74EN9WG+J0W8jHZqip/wI5OqQOel
 TSJFrqEpWXuRS0Cm/KCOICbBbZ4GE33kyOKPu/pqp8t5V/9PYclUg8oKlNQ5/q7KKVo+t6SWHfh
 LDlUs69BKOfvAP2F8/mnd+p2NUM3VQBaI/xC+u9hBX6cBXqwpJKBfYNyxGZc6qawi+Z3VJZ6SUM
 7zze7k4UPMb3y+NgBWZyRAytbx1pEii9MEbk9xGsyWBUOiGvlhrZy8GB2XtuHHrRFev7GfRo5jZ
 K0K+Cx1s74HyuxzW5P9lcxw7IwYNL4F+itdUa94A2BD3tJX1GoRg==
X-Received: by 2002:a17:903:1aa7:b0:2aa:e23c:2697 with SMTP id
 d9443c01a7336-2ad175b1491mr182585685ad.57.1771558558897; 
 Thu, 19 Feb 2026 19:35:58 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 19:35:58 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.19.y 6.18.y 1/2] drm/exynos: vidi: use priv->vidi_dev for
 ctx lookup in vidi_connection_ioctl()
Date: Fri, 20 Feb 2026 12:35:49 +0900
Message-Id: <20260220033550.124346-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220033550.124346-1-aha310510@gmail.com>
References: <20260220033550.124346-1-aha310510@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email]
X-Rspamd-Queue-Id: A1A27164683
X-Rspamd-Action: no action

[ Upstream commit d3968a0d85b211e197f2f4f06268a7031079e0d0 ]

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
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
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
