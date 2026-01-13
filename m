Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B20D178D0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5305E10E487;
	Tue, 13 Jan 2026 09:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UjvFhl4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C7510E487
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:15:12 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-81f46b5e2ccso1229654b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768295711; x=1768900511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TeV4zYwioQYFbopOPsj4J7uWHWJWFLRD3srlD9O0MDI=;
 b=UjvFhl4VMhnuaxjw1DU8+pNlQFRtEiqQpTsw/lMZE7D8XeZhD/TUTn+uD3iM+03G9B
 04vht/yBGKalioYQad01qLTmBb/hDV3LXH+AcqEIm+L4k3P9sFv3l5Cm/c93k/v9Rnui
 m8FpAj9nW/I+3PuNxiqcA0u9gvXFYKPXvnq1vfwIhiKIypFZb95LjI+VGItkoM8nMoPl
 L50wwQHpyNpNp9/kyoP7++VkVtXwyAp87eHy0hcB3hsWBvQl+9anrTM3jJaX7rKoIVmg
 Tabj8BvBkkcckGKbaE7YgYMt1zI62b4sQDX3dkxScUyjzPLTNwbJMvUwpc0GR2LxXAU5
 zgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295711; x=1768900511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TeV4zYwioQYFbopOPsj4J7uWHWJWFLRD3srlD9O0MDI=;
 b=BYg17wwzBdaYRSiDB97h2hum0oxX2lyD4z38tAwvQ3/j8zLThBkoVTUtIG2zz+QN/h
 yU5HlNOpsS1P/9XaBZSpuWB+YxLKrNpN1APkdW80qVFXJ4chuKzBuECqNaniEZSb2F4Z
 r80EP/NmaqQ2LrrcbtxJQ0pBRUywOqeoA/PC/pjsfVtC8Mm3YqGJnQRb8Ji/QuHfDQk3
 jccoDlfYG5SFH5BE6nkTy8Wii8ht0kVLhUViRPtIm7ukg6JiW4YSJ1rk+2KUmhwSiGv0
 d2oxlkRZCBrsu7t/z0y7xjw72iUpjIJRYuIHsZW5BPsgSJ1WvSSWsO3USDrk5z4lg+Zj
 rs+A==
X-Gm-Message-State: AOJu0Yz2H6wxCsORVntcRygTmzOFPidGYWxxR6v0D1MneaJtTEvKq7Bu
 x/lyXUQY4+TSGFda1n7W15bhn20my70aPuBPybUbMYvU+kFn8xhdtF/mu4VaXsgO
X-Gm-Gg: AY/fxX5EVOfytXHORnEJTyXhoKbY3dVaQVhr+lNH7y1rjVJvDT5QxZoyO8JYVLM6k09
 on94K0/w+q5M8DdPbo50CrGmH6FRiOWDfvauQ76d+PXMmkqQDjczRKUMpwRo8FiMIfo+e1CDwYN
 5l0kV9gmVR40DpNfCsSmCPoxIBuN34/7F6dAQ0Ve6JGaYYIZFUTYHP0mc0119ei5bzHZvcvXniy
 V2KMZl/CBj3cEKaXNC8say7mK762muVRwzOyct5DBOgiOLQThd2KM1pVnoM+33MsQbxmUJPCHWT
 5E0uvX3wGam7W7kmn3Try9EwLKmeiwTU4xRfuziJ0/l5gpJBe4aRkgNxmTTqirXtmksIuHPL8zg
 o4iclivTOLpIuDvlXWZSpCmbC1m/yJgWJy3ImLu3YsG+uWIGBKuhio14bw05uyv2Ta832gTHb4E
 9Ww/dzkLtCQWai+MYXvmbmI3VCQrJwLU2U+zhHOelRprs=
X-Google-Smtp-Source: AGHT+IGOjyQTw0Ih7Qb69hqLQCSbnk63LdAPgggsqgRJYk8OjoQG7vB2vucKmHyYogNfcf6mNNfpWA==
X-Received: by 2002:a05:6a00:3306:b0:81f:41c8:765d with SMTP id
 d2e1a72fcca58-81f41c87ee6mr7014615b3a.14.1768295711212; 
 Tue, 13 Jan 2026 01:15:11 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:df08:2b25:2f22:316a:eb93])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819baa1936dsm19832778b3a.12.2026.01.13.01.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:15:10 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH v3 1/2] drm/mipi-dsi: add mipi_dsi_shutdown_peripheral_multi
Date: Tue, 13 Jan 2026 14:44:39 +0530
Message-ID: <20260113091440.43735-2-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113091440.43735-1-avinal.xlvii@gmail.com>
References: <20260113091440.43735-1-avinal.xlvii@gmail.com>
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

Add mipi_dsi_shutdown_peripheral_multi function and mark
mipi_dsi_shutdown_peripheral function as deprecated.

Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 28 ++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a712e177b350..2fed50172a44 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -587,6 +587,9 @@ EXPORT_SYMBOL(mipi_dsi_create_packet);
  * mipi_dsi_shutdown_peripheral() - sends a Shutdown Peripheral command
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_shutdown_peripheral_multi()
+ * instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi)
@@ -1980,6 +1983,31 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline_multi);
 
+/**
+ * mipi_dsi_shutdown_peripheral_multi() - sends a Shutdown Peripheral command
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_shutdown_peripheral() but deals with errors in a way that
+ * makes it convenient to make several calls in a row.
+ */
+void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_shutdown_peripheral(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to shutdown peripheral: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_shutdown_peripheral_multi);
+
 static int mipi_dsi_drv_probe(struct device *dev)
 {
 	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..19ccdf5eeb5f 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -389,6 +389,7 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
 void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
 void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx);
 
 /**
  * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
-- 
2.52.0

