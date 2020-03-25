Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02334192326
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2373789E8C;
	Wed, 25 Mar 2020 08:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F7D89B30
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:50:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 26so4378357wmk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 01:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNQXsVDevnlZb1LKGB3Ujzy43w3o9PSRXDwMVWOkBSw=;
 b=wWvVIPh6SDMtMbmcyPL+7DTO5b9bPC/1AiW8rKENoQunhsv0xqdP3US3/Wk/EC0JkP
 riB7Oi5CewnR6asT+DzI380C2FTSkdGaA9jfKMQMFS0uEt/pL53jeahTpHSZDEqgf4mQ
 Js59FtpnZBmynZRL1f/+S8ed45pyCJSMqaSnqSxaX5AmlTIafSajCfH2OaJR1BOn29s6
 h+WYi6w3ccoTkAta4dspSRgyLaRQq99BXMeuSddM4S3D1py5KQep31KwL+Ab6iotS6Oh
 OR+jc1Q0fCYX9V7ADzy7V6irNYRtlLMS0a6QlRyQD6qAlAmfPYlqTxqzdDyYq+kjTG3c
 akPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kNQXsVDevnlZb1LKGB3Ujzy43w3o9PSRXDwMVWOkBSw=;
 b=LpjFTKK7rBHi3SCPec6ZR5fx65QJEcJXKoaVh7hd2vAfqT4SHl4rZiiAdWAYPAdJiE
 BiyLx7HQmugKR3fXtRh0f6iVOY1HoEv6BZnfQL1SLNmZRp8wcCRFMbcxmzRss/b52AXM
 T4/UTGzSzcnSmeXdA0PBSSj39XXK3b9flByjS5l9puKstfLS24+wCfqaSwcwRSkJC0uF
 QnZBm/iUvflO6tT2EoJOC9e1YjRQdR8WQpSXeChgCssFZ1RfTpwS/lfCuZiVqAIwX02i
 GrBwQp/kp1n4860c36dpLh+1wzqU2auxC030nXNZzPW2u8N0KPjQRCve12K5ibNZnSgv
 XnrA==
X-Gm-Message-State: ANhLgQ0H4yhJ2LeQpznNQfLIz+OM+YtPobmuG9+lSeIEn2dqcMH0tUlo
 N8CUD1Wjw/HiorBH2ygy0TGTUg==
X-Google-Smtp-Source: ADFU+vutjR8yjcwJIWw7JDjncyKk41p3983bAe/W5fRN3MrpHabRbIq4Oh/Ad+2cQD1wZgWl/XnxJA==
X-Received: by 2002:a1c:5654:: with SMTP id k81mr2378424wmb.145.1585126230271; 
 Wed, 25 Mar 2020 01:50:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/8] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Date: Wed, 25 Mar 2020 09:50:18 +0100
Message-Id: <20200325085025.30631-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200325085025.30631-1-narmstrong@baylibre.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
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

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..6564813d2f7a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -309,6 +309,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -804,6 +805,35 @@ extern "C" {
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
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
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
