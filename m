Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA1D0B0CF
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66B10E273;
	Fri,  9 Jan 2026 15:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QwARWkRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E74A10E273
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:52:15 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a09a3bd9c5so30319275ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767973934; x=1768578734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XrlduJZJPMbIa1RfsQnFtGNBelRs3n9wJNobxuDPXfM=;
 b=QwARWkRcrYuyuGLYZmBpE9LVGxAID3itKGvldGThqjIGiG+OC7Oy3iHv+vSx4w8Yqo
 jp5aUhKd9quQWhPSFsv2Dsg+pPo+JxhbbY0CR/XMSyHPs30aY+5ozQ3uKCPfY94tHCg0
 CC0reODH6nUTPvkpyljE5HVkjabGPznHbVx2YZQQrA8HW3fcZ0TGqrYAGt+MLEcqZXSy
 CDNRKT0UkePbrzwVW7RWU/MoJQxCp/EaAZTXIuEoOgpxI/6wRzvvJm3T7OFfD1mcnF4s
 lCfCFq/tLD+tUvRP7D0dtQ+Iyw5/RgzWeqCq4k6nDMausLlqHFU3dzeO7Bo9mJQB1+Lf
 kwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973934; x=1768578734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrlduJZJPMbIa1RfsQnFtGNBelRs3n9wJNobxuDPXfM=;
 b=Kyk0a9SaMwEQBhax1zpfcb/6M/3yVjlknypAtsaq34IUcCAXktyx9oCix/COwy9LMa
 fXM8lj03MuSVsbTvd3a/RxLPJWv7CHxkyrvR5l7aXxzFs7gwISW5RLU+UGdV+WxyDNO8
 07KtjlNCMb57WxJsja7KA/WIl5YS0qaKseAagzzbVHSpBQsvNzCGkIyQJ80CuxYPB1af
 u5GIKlnyWHoea+mft3oWT6ZpgnR2p8JgRzt9xM1T4+yJJe9rbJ+j4luaEdKuLfL43EF8
 4pKFyoANau5e6WNWtAlaQfE9i78YQZcdNSjKN3cEvQx30ahPOc6lHzrPLdMVMR4HOjdw
 lb6w==
X-Gm-Message-State: AOJu0YxftOGtFXhAOsw+f+i5QPqAWchWChZxF7nVCoDoGsK/bGmvJ4PS
 JuLUTuF/zlbAlhSFpevIiu3u/LAAmoBoAeAMETzY5O8/8i3IocmBsErYBnPtKElQ
X-Gm-Gg: AY/fxX5VRfEwd9S3yoEdzl8ZAN+mI+hgLnoZxWlS7PVQ3A0lVum7EWyodpFFadvuAus
 +aQljt99TSbFwJm7UyWRBzhIsw5X1c9JTb0K3J/08idfbFLHOeEvfj16J58oxIkkcBLwYzqpxVc
 o+UAF8GBTTLvw3ZRxqTQH/VJV3ctU0puEAFdiPPUAFOir5O2hq9IH7gZaW1tvcUOhNdPMkOxkcq
 peaxZiUDjIcsDmeocgMaCJtQkznaPhvXSJe7yEK6EJn3q2ijwqkxcn5hCsv+Ea2j3Z62rRBXEpZ
 FjOTkuGWf7HWXgz0sMNPjgjmy8x4KEWc8dlCwhTUmg9MxU3Q5CwkJDK8qV7FmvKGzMNaGB0ISDn
 ovFqUtMnHMJ5yU9TYbMPFVblrnhtpOQ84DQ+X5MCaKiXiBioHnjHVwNCVuf07av+snvuqFPjPAH
 Ld3puC/u+LCJdOO9ypm7F9IwvtIH5+SLMVt3EPVGei1B4=
X-Google-Smtp-Source: AGHT+IFIH81GCZVymyVjhEEPzWp2FMic73Pt0leqM4AriPEjr1nxoaSr4ogDtTYjeZ1QHstoFsbm/g==
X-Received: by 2002:a17:903:9ce:b0:2a2:f1d4:3b64 with SMTP id
 d9443c01a7336-2a3ee4447e1mr102257355ad.21.1767973934086; 
 Fri, 09 Jan 2026 07:52:14 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:8d1e:1613:9777:a803:43fd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cd4654sm110278455ad.97.2026.01.09.07.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:52:13 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH v2 1/2] drm/mipi-dsi: add mipi_dsi_shutdown_peripheral_multi
Date: Fri,  9 Jan 2026 21:22:02 +0530
Message-ID: <20260109155203.34886-1-avinal.xlvii@gmail.com>
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
mipi_dsi_shutdown_peripheral fucntion as deprecated.

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

