Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7016629C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 17:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A0C6EDC2;
	Thu, 20 Feb 2020 16:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B2E6EDC2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 16:28:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so2733540wmi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4siHNiUQCFqX95yS1MjDYBH29ZOfGjDcY811fsF1lQ=;
 b=hUcv84nVgsJ3vp8Wn9xxaPUwSALsdcNkdFh/h89t/aV6g9hwU70NICdzTZ9qzGiU85
 NLNkxtKLQT0+Fe5YKcmrHzDTQ/ZjpkxJH2aPrF7UooK1q+4gte0eZb8pm9lJKgiZUd73
 Y1tzJjOkMIINcv0qS4xTXH2xibQh4647jDJTGaXZeUszyn7Lw+MjAFXz7SMVqDImWwEJ
 7KYrSncFiF37t/a/dQKQL3yopFr3kSEAzacS7WERjheWPcblKomLVNYRIUHTS/FyUbEA
 wBpsdhCBTrXITUcadU6E2NhVltC9WN/IsxRwxPIJQ2wfWvR7JeQOZPBUuUnxTS2M01Ey
 dvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4siHNiUQCFqX95yS1MjDYBH29ZOfGjDcY811fsF1lQ=;
 b=E5MX/6sxIRPU2sO6dD2x8xQ2d8paX9qqcOKi/a+flfbr1P3uAR8E7GVUuoQRlieUbP
 YT+mJY/G5CzwvlHABEnMcsAz4quXBqITpGrsbvKPAe/PT/MayTba9EcC29Rh/3xCjsLd
 1d0Md08BBsSK9Zjd1rwzl1E33sg6D+iRJm2TDLtceBnGo6ggNYVA5N9aJjxzzB0o/9QV
 2ZIQMvu7XSnJMJi5T6DhdITWv2yB/xh+hofrTUhC0GbprwuiCKSiuzi0TzWyWR8pcZ0A
 8Da7fPAaAd+Grw1IiPxoXMjuFN2PN+JZByL1duy75l+4FG5lDsxLb1OMhXtjpPfdGBjA
 MqrA==
X-Gm-Message-State: APjAAAWkOuOc+t/npnNsmXeoMZTLXgd0W173pw7/w/YZadEqLSrNOkBc
 nHVYl4a9BkJskgsp9c+sWeDJKZnl7cKvJg==
X-Google-Smtp-Source: APXvYqzjES84VpVHbHHVDQwPUgzyAD5t5aYtupKfIUxVXKkR1YNk6DgQbFJzqaiL326UcPNo4Y044Q==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr5506842wmh.131.1582216081787; 
 Thu, 20 Feb 2020 08:28:01 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c15sm104164wrt.1.2020.02.20.08.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 08:28:00 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Thu, 20 Feb 2020 17:27:55 +0100
Message-Id: <20200220162758.13524-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200220162758.13524-1-narmstrong@baylibre.com>
References: <20200220162758.13524-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Amlogic uses a proprietary lossless image compression protocol and format
for their hardware video codec accelerators, either video decoders or
video input encoders.

It considerably reduces memory bandwidth while writing and reading
frames in memory.

The underlying storage is considered to be 3 components, 8bit or 10-bit
per component, YCbCr 420, single plane :
- DRM_FORMAT_YUV420_8BIT
- DRM_FORMAT_YUV420_10BIT

This modifier will be notably added to DMA-BUF frames imported from the V4L2
Amlogic VDEC decoder.

At least two options are supported :
- Scatter mode: the buffer is filled with a IOMMU scatter table referring
  to the encoder current memory layout. This mode if more efficient in terms
  of memory allocation but frames are not dumpable and only valid during until
  the buffer is freed and back in control of the encoder
- Memory saving: when the pixel bpp is 8b, the size of the superblock can
  be reduced, thus saving memory.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 5ba481f49931..ad58f2a92669 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -309,6 +309,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -791,6 +792,61 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
 
+/*
+ * Amlogic Video Framebuffer Compression modifiers
+ *
+ * Amlogic uses a proprietary lossless image compression protocol and format
+ * for their hardware video codec accelerators, either video decoders or
+ * video input encoders.
+ *
+ * It considerably reduces memory bandwidth while writing and reading
+ * frames in memory.
+ * Implementation details may be platform and SoC specific, and shared
+ * between the producer and the decoder on the same platform.
+ *
+ * The underlying storage is considered to be 3 components, 8bit or 10-bit
+ * per component YCbCr 420, single plane :
+ * - DRM_FORMAT_YUV420_8BIT
+ * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The classic memory storage is composed of:
+ * - a body content organized in 64x32 superblocks with 4096 bytes per
+ *   superblock in default mode.
+ * - a 32 bytes per 128x64 header block
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_DEFAULT fourcc_mod_code(AMLOGIC, 0)
+
+/*
+ * Amlogic Video Framebuffer Compression Options
+ *
+ * Two optional features are available which may not supported/used on every
+ * SoCs and Compressed Framebuffer producers.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
+
+/*
+ * Amlogic FBC Scatter Memory layout
+ *
+ * Indicates the header contains IOMMU references to the compressed
+ * frames content to optimize memory access and layout.
+ * In this mode, only the header memory address is needed, thus the
+ * content memory organization is tied to the current producer
+ * execution and cannot be saved/dumped.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER	(1ULL << 0)
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock and
+ * 3200 bytes per 64x32 superblock combined with scatter mode.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 1)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
