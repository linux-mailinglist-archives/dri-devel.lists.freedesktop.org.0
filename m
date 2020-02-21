Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A51678F8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 10:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5FB6EF21;
	Fri, 21 Feb 2020 09:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4486EEC0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 09:08:51 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w15so1090297wru.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 01:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZPNY6eETpZNcp3QuqXzHqt5QrKJ6DQWjlcqya6MZlM=;
 b=bmtEkaEZQVDuBjGZWI82M+/IsDgVMHVVQjAzBDHWki9q2OsN0culoXtjRzi8Dz/XNh
 EogN5A1BN0w3+0KFBjUVnsF6korHn+5I2GEdvK9r0fhwRZl2hfOK9W5embpdYRKxQB9p
 twl7tMUmYXwIc2GF2v1KcITFU9GFjt4aYz6pp8GKs8CnmjZRDNvr6XM7K3CQpPp/Va6t
 LshrGPJ79xKiYRzVdHK/vreUPm6Ve55M4v4E8dPdBiWn6N7g/ld2kWYNt7TG6u9ZXQqz
 Qz/oX+weRZr6SkNwgeFsvj8SZVo3/OtQem9zhQa5BD55Aa8JS/CJW2jaiB50AF+k5aTW
 HPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZPNY6eETpZNcp3QuqXzHqt5QrKJ6DQWjlcqya6MZlM=;
 b=E6sJ+xKbNtxMrqoFwJtm5OunlIYbwFvy+jAdDxrnSbgjcEix6GOAfqJmz0/yPdBqoF
 VnoAyEHI2pUKFaP2KG0yTJlfJ2YM22JN2iZ0QGg2gWnhCp6Yn3jEWEr+L8SCrO9PLGma
 aXozXhbw8lB5I58upHAdHCdwqiGssETaf/+L57kCOWg/y4RL738adW/BdYPkXxhrI9gD
 ZzAw0phQJkeqvBfGTGjvZh7qS8Tk66V9XsaJvaaeZRos5LlrUCJNowrU7Pakqd0QwrxX
 keH3uA+6tRupRRuYSpNxDwUKv6xLSO2ck356QKuCJ3ZEeiU9Hd9ns45oalbj2C04OIht
 tY1w==
X-Gm-Message-State: APjAAAVSV/FNQqrLfCU4EhWG3RGzPriJLCrEv/x9WotSN/MjNihc6zhi
 MpOhCtv0kqd4vDI3/7F2+bKzTQ==
X-Google-Smtp-Source: APXvYqwrTul8MwamrflnqNdrhD9N5bYYaYFfP2VJ6rRFuo8i5A14iZUL5tCkRQmBlBfNjrWJApYCJA==
X-Received: by 2002:a05:6000:1012:: with SMTP id
 a18mr46758161wrx.113.1582276129963; 
 Fri, 21 Feb 2020 01:08:49 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 h5sm3173288wmf.8.2020.02.21.01.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 01:08:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Fri, 21 Feb 2020 10:08:42 +0100
Message-Id: <20200221090845.7397-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200221090845.7397-1-narmstrong@baylibre.com>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
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
index 8bc0b31597d8..8a6e87bacadb 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -309,6 +309,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -804,6 +805,61 @@ extern "C" {
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
