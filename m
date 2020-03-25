Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F8B19232A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10166E5C3;
	Wed, 25 Mar 2020 08:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4007A6E5C0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:50:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 26so4378563wmk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q9l8X4L1wYo/Bu0UrNNDh9XednyRebzGgXHXi0wzQ5Y=;
 b=noxHwO+a8RZLmm/H8YM/X17fO+M9jPDojcTFnZOiHMbgM/KRXHq1P8x5uREIDIg+SF
 FJyG78kJ4A5V4zmcF+8XgOwEhYXMObeC4vPtnUF7+ljYjlpl95BLgqYwdnKo7LCZ8362
 fMrAcLF/+AhFLB+9Ql5EHtE/GKDJZXntL3Cm0Fgxi3F+SNCgAiwDGW5z4M1CYEjP9Uxi
 Z8jEBZkhvqnKXX4DDLrzBKiiOwzJT1EtV4rC3gHx55rli4aHT1xZ+pElPKaPXE9NCBYU
 BFaWMwcEO9q3+pth4qAcHgPBkcBnhbSgfQwOqFk6y6PBvVj8rSNNH0OVsNx727FxypaK
 3njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q9l8X4L1wYo/Bu0UrNNDh9XednyRebzGgXHXi0wzQ5Y=;
 b=N+NkJDwAhUNybRVFYRAuyc5b8hzWg3up0gr5I+H2TXT6/TVpckXMLf32rqG/1dedSN
 X7mkQ4tjKar+9yal9/XVr7ST/88Nfxtyx3gaTZbm2uFvI05JeX9b5mWzMJ7TNbZ/SD/3
 M3KO6ipffOoh+zhDHjpu+OekZan7L67YD4bEmxVBrUW0+LHFVPyokyPiYiE1Kthf+fbV
 imxM93rVh4MXIvP94Pw+fbONPAubphSmo1womvD0GFXFZpaeengJJ43QJaTgUa90AQrZ
 OLAeSR1myj4geUz9QDjgE+aCzPAJ6+Mz48OQjKS0aCNLjxV3MpOhOo0KmU1t7nQxxSsI
 16qQ==
X-Gm-Message-State: ANhLgQ3O9PK6HRLDa4EbkJBPJQClzZSixF74+L1yNLQzMyMiv/2uuRYR
 gD6d/XcYhf2TDkjdIjJ5ltKDew==
X-Google-Smtp-Source: ADFU+vt+uw4hhT5gVLqrLThJ7Bn9/HL7QfI6wZ3InIgG/WW9t5QAx3AdZg1AILOEFxruKjtvkGDmDw==
X-Received: by 2002:a1c:1fc9:: with SMTP id f192mr2427074wmf.4.1585126238688; 
 Wed, 25 Mar 2020 01:50:38 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 7/8] drm/fourcc: amlogic: Add modifier definitions for the
 Scatter layout
Date: Wed, 25 Mar 2020 09:50:24 +0100
Message-Id: <20200325085025.30631-8-narmstrong@baylibre.com>
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
index 84edc5d69613..b49f1d45e1b4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -840,6 +840,19 @@ extern "C" {
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
 /*
  * Amlogic FBC Layout Options
  */
@@ -852,7 +865,8 @@ extern "C" {
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
