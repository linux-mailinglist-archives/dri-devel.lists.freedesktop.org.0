Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5721211D47
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88516EA64;
	Thu,  2 Jul 2020 07:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6FE6EA64
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:48:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f18so18881043wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 00:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9kCjM+6QrTHv7fUnkI7aYUuMrMpslbeaG3Hz81d6AE=;
 b=1U4lE05Y3vyNPtgNQVX+dp/ivW6pTGrSQD/RAQVvIrmK4JDU89uZLwvvO25ZMzMT72
 n0+sUDjmJpmCu8VX+GP2hYyx5xxyJx7o7jCX28FXVgQLsQWb2jcHgWLugoHSpuHfsA1K
 BYRib8ha5Oh/KtMw2SOGa7t9jma/N4uunMCKCEL/LCyJ11Q5bCLc7TOF4RqXv6DTg3EI
 kvB1YeRio01YFOvAs3K1rKYVqlaq7HpYN3tp1s6ml2fxRSa9d9Wrzo46MiTitWjuJ/h+
 gYedqdDkHOARhtr70PXl9kr2nc7boQxXl6114+EdNUd+PJEKt1C1SJnTfwcvGKgIZW+b
 nL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h9kCjM+6QrTHv7fUnkI7aYUuMrMpslbeaG3Hz81d6AE=;
 b=OzKbsdSfiuRVNNxA5VYbtF3KEH1UZn7t7d94JlxOzX1JCwzUAna6Zaau0xWPmMfv8H
 QM+DXKysibreQZv/JA5iDDGpXyyJONPBoTAqxjdgkdYxqhVr+GfahDc912I0NJm52XN4
 8tlulV4bO9IW10PIm1fuI5LmpUyaPugg1Y+dB8hUb4CFlte2fRvWwGLh6ZxZSse7uBAH
 CsJDVrng50gLD2TPFxtj9sEQ16vut2TEx/dGsiduGb25O5pLjFhyDPMIUr0Bo4LujEzp
 k3RS4lGLrFaQ87wMlvxxeDppOZAEOykSfKMojRUIMvuYn8AJnl4t/FjQYn9x4zkrsXeg
 75UA==
X-Gm-Message-State: AOAM531dnqBCvy1FvsQ49Xj83IuUH1+JqjbFA+i187KOaQvNzS1ARZu9
 NNDSUZkyyZdNSBqwZG0rxyjppw==
X-Google-Smtp-Source: ABdhPJxNYXxDastx1a+NHFrr5BrIWsw3wAa9P08Dg7/f2fyH1chJQr38knm1sbPEMr3WTPT7rTmHww==
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr30336145wrc.344.1593676084142; 
 Thu, 02 Jul 2020 00:48:04 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7023:727a:c688:cf9b])
 by smtp.gmail.com with ESMTPSA id z1sm10001882wru.30.2020.07.02.00.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Thu,  2 Jul 2020 09:47:54 +0200
Message-Id: <20200702074759.32356-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200702074759.32356-1-narmstrong@baylibre.com>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
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
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

This introduces the basic layout composed of:
- a body content organized in 64x32 superblocks with 4096 bytes per
  superblock in default mode.
- a 32 bytes per 128x64 header block

This layout is tranferrable between Amlogic SoCs supporting this modifier.

The Memory Saving option exist changing the layout superblock size to save memory when
using 8bit components pixels size.

Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
references to the compressed frames content to optimize memory access
and layout.

In this mode, only the header memory address is needed, thus the content
memory organization is tied to the current producer execution and cannot
be saved/dumped neither transferrable between Amlogic SoCs supporting this
modifier.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 74 +++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 993c1b342315..54e8935f0e4a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -331,6 +331,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -950,6 +951,79 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
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
+ *
+ * The underlying storage is considered to be 3 components, 8bit or 10-bit
+ * per component YCbCr 420, single plane :
+ * - DRM_FORMAT_YUV420_8BIT
+ * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The first 8 bits of the mode defines the layout, then the following 8 bits
+ * defines the options changing the layout.
+ *
+ * Not all combinations are valid, and different SoCs may support different
+ * combinations of layout and options.
+ */
+#define __fourcc_mod_amlogic_layout_mask 0xf
+#define __fourcc_mod_amlogic_options_shift 8
+#define __fourcc_mod_amlogic_options_mask 0xf
+
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
+	fourcc_mod_code(AMLOGIC, \
+			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
+			((__options) & __fourcc_mod_amlogic_options_mask \
+			 << __fourcc_mod_amlogic_options_shift))
+
+/* Amlogic FBC Layouts */
+
+/*
+ * Amlogic FBC Basic Layout
+ *
+ * The basic layout is composed of:
+ * - a body content organized in 64x32 superblocks with 4096 bytes per
+ *   superblock in default mode.
+ * - a 32 bytes per 128x64 header block
+ *
+ * This layout is transferrable between Amlogic SoCs supporting this modifier.
+ */
+#define AMLOGIC_FBC_LAYOUT_BASIC		(1ULL)
+
+/*
+ * Amlogic FBC Scatter Memory layout
+ *
+ * Indicates the header contains IOMMU references to the compressed
+ * frames content to optimize memory access and layout.
+ *
+ * In this mode, only the header memory address is needed, thus the
+ * content memory organization is tied to the current producer
+ * execution and cannot be saved/dumped neither transferrable between
+ * Amlogic SoCs supporting this modifier.
+ */
+#define AMLOGIC_FBC_LAYOUT_SCATTER		(2ULL)
+
+/* Amlogic FBC Layout Options Bit Mask */
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock with
+ * the basic layout and 3200 bytes per 64x32 superblock combined with
+ * the scatter layout.
+ */
+#define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
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
