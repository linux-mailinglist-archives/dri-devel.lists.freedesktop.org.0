Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA7CF8058
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36A410E211;
	Tue,  6 Jan 2026 11:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ntEWZq51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC72B10E211
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:23:30 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-bbf2c3eccc9so932607a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 03:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767698610; x=1768303410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CdeNxRmOazgFecyP2yX9UiIoy/wJtLsxRt5Z3FieZCI=;
 b=ntEWZq51xQRZGmmIO7u5lAuzuc8NRex5zlzwmdfzL6dXad0lZTPXpQRZGJn41mRtyG
 wOrflScK5742BUtUMKZlTazqswCg8I4qXHQk4LZh8l8QQ0URjIqf4/dh1ImlQDv+Rwgp
 bbjYBLOBZDBBQKSjpVS6ycFnLQWABLrkKhXyE8xrzdNp5Lq5ux3Xz96vlna616xXTLy7
 DzctiJL+1HTY2dw+dDl8aTfNZEavlBl4dp1qQWt4QDxOk+rrUqezdZzD9eIEjKA6e1bd
 AspjpqpT9MKCLEhg+xF4RwN2ZdjrHI5ZbrRDOuRhRjmUOjIkQ8uSo13N+5EDtzuAT1Tl
 nFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767698610; x=1768303410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdeNxRmOazgFecyP2yX9UiIoy/wJtLsxRt5Z3FieZCI=;
 b=iMffxi3I1ADxWWbbJGejMazWH/WYlvPBZ77UDHAM6Tk//UD8eNow6rqZAOav83D5e4
 DHc0SiLNRbvxuKtX1ZbqMX3wqU8cNvtmUzhVhqn10FaH2GN7CEEKM5cXW+7LJblNDaHs
 vzCFOBtD3IzzGcO1z+0jTadujX+vena+zpzG4Dip9GAZSiK0E2mKin2SQ6R87JH7djSU
 YxnRnOgOM0iiX/2dNuCtHe5+duUfXP5mBWVxb0pakxqZwrB/pTIcY58nI2s8lIrY5ElN
 kXUINt39Nr9IzZVgp2SrQRYqFHRJpSUA/gsjGBIESGFfn+RAaEZNMfbicaR/UUL6Wh3t
 Jx/w==
X-Gm-Message-State: AOJu0Yzkmrhep27IZxQFaso17XhLNqBB01cPkltNiPSCfnQIcD7usoTo
 h0hebXPGKtf8lfTE9u6kPM3G0Kcb29XRiqt/PxSqhyDd1gFFnAIC5gOxsSeMjuUZ
X-Gm-Gg: AY/fxX7C+AYueTowudRvQ5AUefccRStmyvOYSyyAd6szk6+PEdGe6+WKlvTtzMl1sX/
 dn9VAqBFoHtn0FdI11G6rIIo2bOQaUWXxXVyFpkcXa3Q7M0tm1U+CH8c/lN2AtwusVEFad1TRpJ
 QHGD0XY5h2WwQK27vXCVwvydZM9/gvKqcdHKJPfB/p1d2aiG9XcycC2KhNFTSw2KHk1lyAqwzKc
 AFBzgzUTjZqCxOXr3Bgar8+5R2cyunuQa8BipxHq3jLM+rBIxxGcesRR4wzZdO++Mf4SKsh2xjQ
 cNPsyPCxfKdMfjfngTA+qGeNRJVtaa7agQeTu3IdNCotEW+hZi9Glqv4y10Wb3Y8RERcVWtZJTn
 XVeUl7oXoNlwlDhZh2RQkubEjsjIWbfOaSC4kVoEdMW7myXv3S97/Pi0OFARJND4OY+XdMTMcqN
 7cPT5B6l43jIQpJeKgpJ1vtHbCSK8r9KxEGjRdfqZqPPo=
X-Google-Smtp-Source: AGHT+IG/w96HXTUBou/egRTJSncABmhVcvqE3lBhRyJ+OwDJM3mguaIa2ewuMRttfEROTp30zmMaLw==
X-Received: by 2002:a17:90b:568c:b0:34c:9cec:3898 with SMTP id
 98e67ed59e1d1-34f5f928c3dmr2048134a91.13.1767698609848; 
 Tue, 06 Jan 2026 03:23:29 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:8d1e:2efc:b0bd:c261:aa04])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5fa78ebdsm2044534a91.4.2026.01.06.03.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 03:23:29 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH] drm/mipi-dsi: add mipi_dsi_shutdown_peripheral_multi
Date: Tue,  6 Jan 2026 16:51:58 +0530
Message-ID: <20260106112302.204635-1-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
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
Please refer: https://patchwork.kernel.org/project/dri-devel/patch/20251127161337.396531-1-avinal.xlvii@gmail.com/#26719778
Build and boot tested with QEMU.

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
+ * makes it convienient to make seeral calls in a row.
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

