Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0651AC9A1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB746E303;
	Thu, 16 Apr 2020 15:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B446E316
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:25:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so5340285wrp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x74ZNY2Ii0Wq7WqU8UNzlM4qIe5Anz5MtvDWgXAqJ8U=;
 b=Q9sFCx/QxugMEbo/HrWaN7/l9wYvrDBzi+BaORQLde30NDU+pchUv6x2xo4yNFqJcW
 C7a7bKJTD9UtwfKR/BnAmmVHoYgycsF/kf1jx7CZXLkJJdvmLuZwyV4JBs3AXkqFod0M
 xv6XoDI8LhXY2WeJ6sQ+JyFUoxrljmxSmAK74DPbUQ0DNDoRYoxPB78f+pOGzlALSGKa
 psP4tH29K6BIye15yiigPWJW5F9yOpvQC36gvol17c1syMD22b8bMVf3nd0ZnIXa+KhO
 VSUkeR03lEnZd5cj7EsuDZjzUFWToJYoGX7UjSOD+EOpIijnNMkc1r3zIYrPXd3oKar8
 /9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x74ZNY2Ii0Wq7WqU8UNzlM4qIe5Anz5MtvDWgXAqJ8U=;
 b=hO60A9wPD3XFS00aX6Pfnsb90aO8v5IOFYlDH1XchXshjftxJQH5BPqj51x+kJS290
 ql+zkXQy3cWw7PjXki2MNFsUbK5VDKfnZeBEAkUYu2T34rQmYwaku3nvj1dIdw759pjd
 +D3XgHoXxWT4QcOeEaotlThLAQFxFsJj1+GZAbfCBFBPpTLlk/isLHNp5lQPbrOrDeuh
 dhMFrift5WcrKnebFMs5PhKS5GsjJgVaWoyUKxvOxk9Q0fAOq76DRiO4RXYk0wsJO6qq
 EnMXpk/84TAZvf7HIvbMH9jOhkkAW8x/pCtbYWlBO2WgdjR3emOqFVGikqE5tp484mEH
 Aefg==
X-Gm-Message-State: AGi0PuZM5Dwmw1ps+FYIpTGCfY1GLoMOA9pvc97W083Bd/Emd6Unc0yq
 bDIIvpdk+QIs8qdaRPj8PRZwZA==
X-Google-Smtp-Source: APiQypJD88ybgaDtDKq1U3lq0cPR53Jd+LyWH4BTyYS5P/piMZdjIcsHLVxv0kGThgLlWqtQbsiCcQ==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr35893659wrp.409.1587050718352; 
 Thu, 16 Apr 2020 08:25:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 7/8] drm/fourcc: amlogic: Add modifier definitions for the
 Scatter layout
Date: Thu, 16 Apr 2020 17:24:59 +0200
Message-Id: <20200416152500.29429-8-narmstrong@baylibre.com>
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

This introduces the Scatter Memory layout, means the header contains IOMMU
references to the compressed frames content to optimize memory access
and layout.

In this mode, only the header memory address is needed, thus the content
memory organization is tied to the current producer execution and cannot
be saved/dumped neither transferrable between Amlogic SoCs supporting this
modifier.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 664dd238574a..ac2d4753eb6d 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -843,6 +843,19 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
 
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
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER	(2ULL << 0)
+
 /* Amlogic FBC Layout Options */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_OPTIONS_MASK		(0xf << 8)
 
@@ -854,7 +867,8 @@ extern "C" {
  * memory.
  *
  * This mode reduces body layout to 3072 bytes per 64x32 superblock with
- * the basic layout.
+ * the basic layout and 3200 bytes per 64x32 superblock combined with
+ * the scatter layout.
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 8)
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
