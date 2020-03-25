Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A03192329
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755186E5C0;
	Wed, 25 Mar 2020 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8D089E8C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:50:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z5so1371401wml.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANDOlCT1ZqrnKgx/+UtkXPnR52K04rx8cZE8y2hTCQU=;
 b=pgsyudR/D2KpBB4/CqRb3vU07WoAY4c5vp9glayeMsrR3uDiTPhmtEDK+AWoQqkzHQ
 bvypr/WDimmRzKQ48OxtHMcKAjTT6iIXBdLTWhlFb+93oRxsvpeczFkVeg4aKq/wQ/Je
 rfl4bK1txMY3ppAZIm4afopOmNjNpExwGRpAeB14dZhpkQZNQb4VbGA0ALzAiWLVotmU
 +UiL8ZI9SrjEu3Uucu2dCRVRqDazHya8qIot8dJIp1DRUN6vEj9i3TURcaiYWPdGPb7v
 OTSR7GbpUra2bCrJH7EkC9JQfY3865RiKJi4lJo1XeMHh9yhUeU3NBZvxqC8MdfvsC0R
 pc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANDOlCT1ZqrnKgx/+UtkXPnR52K04rx8cZE8y2hTCQU=;
 b=hVgh13eOotZw1GOJCpLEi93nAtWBHnPqs1rtpH1jvM+SlsI+0lPk8CXi3uwy9auzpJ
 8xVWgKk3KGWe9y7z2a2F9Jrw20mAQfFScVY9PAhgXqj1NmUjpMtfFQDA+R9C2wz3b8ak
 hVtBo3DtvZ0JbmdXLIdUhEst18QSVS1doC7mCbh4HT3kcb2kAZqvxe2Lv9yxDZDKZtVD
 ++lgFZCuCFbrKfEf42cDLqqgMyKvcRglzY6Lnu2jr+TEgoGHJy0O13j6DOnRoEs4ZmPl
 J4fwuG4C8a0f2x15+kURgaLtkMv1ZnH/0h6pZzdAyZ+IwE02xs3XzH+t5lZztqZ0bDN2
 sOJA==
X-Gm-Message-State: ANhLgQ0jqsyd+84Q9IxKiXIGd0xi0fkqBrXds44ZLi/dqoEwc3l1TI+P
 bk8g6S1P4Vs2MsVc/NYy2yDnJg==
X-Google-Smtp-Source: ADFU+vur2MxTtHCjMfpHGxgRx4ZUbLJ6QSkqLw6sapP5tKS8pwjf38c2XDZiJmEAsfp/QTuirs7tBQ==
X-Received: by 2002:a1c:81:: with SMTP id 123mr2218819wma.97.1585126236258;
 Wed, 25 Mar 2020 01:50:36 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/8] drm/fourcc: amlogic: Add modifier definitions for
 Memory Saving option
Date: Wed, 25 Mar 2020 09:50:22 +0100
Message-Id: <20200325085025.30631-6-narmstrong@baylibre.com>
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

An option exist changing the layout superblock size to save memory when
using 8bit components pixels size.

The layout options starts at the 8th bit, keeping the first 8bits of the
modifiers bits to define the layout.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6564813d2f7a..84edc5d69613 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -819,6 +819,12 @@ extern "C" {
  * per component YCbCr 420, single plane :
  * - DRM_FORMAT_YUV420_8BIT
  * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The first 8 bits of the mode defines the layout, then the following 8 bits
+ * defined the options changing the layout.
+ *
+ * Not all combinations are valid, and different SoCs may support different
+ * combinations of layout and options.
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
 
@@ -834,6 +840,22 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
 
+/*
+ * Amlogic FBC Layout Options
+ */
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock with
+ * the basic layout.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 8)
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
