Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C201AC98B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6706E2F0;
	Thu, 16 Apr 2020 15:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E10D6E2F0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:25:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k11so5339323wrp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hlAyBA8CcMUXp85BDwBKC42D/qldDHdyj7qKWzB2WdM=;
 b=LWOSh6J4oHdRqocw6T+gupl4SfkmDILSRdedkw9pNCBnbVeVMJ3p1vQ1jCXYGKSc9P
 G0TA75egWRpZcSgxW5QXjT5T6mgsnueYjjSx9mGvHqaYdLtSaspzusSO94UPUN+DouSZ
 YL8ZnEfEjC2DLNwASGkAg6MFSdsEZDekgema+Db2EoTTBZcR/Nkbp/j9cVxdKpaNpBAA
 ygQy9iRIzRrLeevaU+aGRWNGMt9BbEtSSS7diKjj3kezmFZRztjSvWPX+/rpsxr2B+Ck
 xSWSrg8bO2kyHv7vtQ7cLw8FXu+gjR3cfceCa7AzvF08UuE+wX+dbOjizaaXH6DNugSE
 4rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlAyBA8CcMUXp85BDwBKC42D/qldDHdyj7qKWzB2WdM=;
 b=a4ojxHWR7eUw3zhg/772IerkMSweeDyYnQyjnjOfbiQLMpH2cxvtr4bI8aIjcmF15O
 vQmP+Zgewas/YNcBxhXo/Hv70KlAEjbPNgwWVch1xX5IkPQf1HEYi+s8X1oqDonrvZs2
 3Nc1gZj+5Ekal9ou6BrRVazgngCTeV8gD3GbDeEfJYGYOIl9vXkUbtLOeo1AUF12DOZo
 0ukXNrcrBXueAd/zVoI6Es6YZipXo5HrvihL9TM+1Mm6tlUsLl7h8MVS2rqz+IqqOCn9
 khf/DzdIFSN9oA+Q5rWWmOrWMTnrBYZC5HnVMyb+04uf+OVY3oe06jA9bdCnMOKdB7uZ
 kvFQ==
X-Gm-Message-State: AGi0PuaLpf0xIrmYMtlojNvU8xYtBzG+hIrDPRBle3ptBfc/ihhCoPud
 YRXgb37G3kKURRgziSSbgWsWrg==
X-Google-Smtp-Source: APiQypLqBg7kl4HJjT8KQzhJlt3fJAI3Rp5CAv4vKPEYnCZ6J+g5WvsII7utk6pPSMtnCGw9RSueSA==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr20565789wrj.320.1587050706682; 
 Thu, 16 Apr 2020 08:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Thu, 16 Apr 2020 17:24:53 +0200
Message-Id: <20200416152500.29429-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..a1b163a5641f 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -309,6 +309,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -804,6 +805,44 @@ extern "C" {
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
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
+
+/* Amlogic FBC Layouts */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK		(0xf << 0)
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
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
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
