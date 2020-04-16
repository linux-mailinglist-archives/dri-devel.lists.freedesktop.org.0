Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896571AC99D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4924D6E31E;
	Thu, 16 Apr 2020 15:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D70B6E303
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:25:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a81so5320810wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DzaSKn4cSSk3k+NN0i6pGCPn8vqE61m//mTImjLqruU=;
 b=WhOJRALYh24x37/GjVj9Zd9bfz3f/KUeQQrju/ctwcoa/3SdbeZoJf5HHRF+xv8u8I
 CBScgJnoMMs+kI3bS5XlCxMaqGGLVaQgjyqxYNqQ27vLL2/h1/XlWP6212Y5/3+4/YeH
 qu53cPfcioCAb2Z772lwuoyf16sGAxRYn+QRFcbkdfSsocBM7izk25GEFRTVKKdCX0CZ
 0wWoLh8MZTN4Euk3OPB5hHS5NsFRSEufZvhXKucOistUQdMennsoN6PuLN4uzCl/8MxV
 6X3KOXwVmVoTKmbf+WCJKhcgKcTbzjNovBgTGWUkOeOFbG4j9B/K2/0p9Ez2QROiy1w4
 i/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DzaSKn4cSSk3k+NN0i6pGCPn8vqE61m//mTImjLqruU=;
 b=gZS/zt1EQ82zp9crCxR8WHtAB/6gsIVS0MyyjYsNP1WLg15gm6zaUrt4vfS/EVxfnX
 f7j0PbFHeRbukaXOJAoeS+OQ4BzAwPrGtLKLxD6Fqj1vAG/1ob7PWvMuy6DiagN8Fn6q
 y2XDj/6bcEuWwytjvOJKVM+tohEETaFB6h/HQ+s/t6unqe8uZRmvBHWRfpVqmum7xSsO
 3rF0iD22PYy6EHyO5j84HjPWbhjbIxE6VSCRCgNYoBnvxR3bNfs6M2/0B4MtzBs7RAqn
 iTyYSa8P3qt+l8W+olMjRXUzn+Hlb9ckEBQVVpL9HnxtBjvZwdH3JU42c5JMBbM4PUBp
 HzZg==
X-Gm-Message-State: AGi0PuYEJFUTeo4gmGNcP2hJxsE7Ys/UDBvKywXE5TKcnu2mzkL4QX5Z
 dRgrnr8DtAr437QYod1UsjMyTg==
X-Google-Smtp-Source: APiQypLaZFDZc8S5mgnDvOeQEVBVo+Ns/ShJ+crrWMRHJL15JEjj44C7VXY4PkyqeskL3CNTJD4UKQ==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr5340614wmh.107.1587050715289; 
 Thu, 16 Apr 2020 08:25:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/8] drm/fourcc: amlogic: Add modifier definitions for
 Memory Saving option
Date: Thu, 16 Apr 2020 17:24:57 +0200
Message-Id: <20200416152500.29429-6-narmstrong@baylibre.com>
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

An option exist changing the layout superblock size to save memory when
using 8bit components pixels size.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a1b163a5641f..664dd238574a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -843,6 +843,21 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
 
+/* Amlogic FBC Layout Options */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_OPTIONS_MASK		(0xf << 8)
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
