Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4A41912B4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EC46E49D;
	Tue, 24 Mar 2020 14:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284E89CDB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:20:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b2so21631147wrj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/WyG+n8djNvIo3nOPxwWbAPG6RneB4WAm9wKQe+zHsY=;
 b=kgvsjSTRISrTA5t190/L3CdCx53KraHUPzxQJAdGOT+B+wo7Q++j7C4esQEoaZ7m9h
 lqxHe1yA3pKLxXcTcp1PZBy/RGQYypcaCqsD1do5Q5HE503nZClU6tjyBP2B+2+A3Bbl
 YrqdoRemrNhhrEP+Iwf/fd4QFc35y00KP3OxbGbUnMZVN+odWo1UrlH+wGIuxv1F2NSy
 30Fjn/Y8zBVVMHsDHd/L2UiwFCuDo34GQCisSPQ6D3S9iPjaF45260jNChtx78S0RlM4
 8jNTxmBnzt2nbGrv3cFc2u33hMfxJkXl2hz+cYC9bumk9LkB7atxovFX3Y6A6lxGneHw
 b3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/WyG+n8djNvIo3nOPxwWbAPG6RneB4WAm9wKQe+zHsY=;
 b=Rw8pJEwz5IIoC95KKgmkNAUDJKUVai14TPQLk/jqOPXltV9fuaF5eF+FnsANFqRaZo
 +kBNgSYFJEixPCwr35QTsCglbATj6UZD1ZQ6Bmv0fRh0FY8VU3kC+ny1n3HUXhPQ86om
 xyW/0MY+ODYw/V+E/zwtxqIrbN2loSQtZYB0TaqZ6XFEaUdf8kurthoXX0a5FxLAlfg6
 di5rI+630NQB2IfN/iWghGMTdboffmp6byKZHbtlTmADd2+2ZneQA+j+aCCTsDxghc51
 O7yC1QoVirDSECY/QkBSFVKG53Ym2sllHq8bX1K4yLHC2hMxGx9MYYeelT9arybBXkb9
 SC5A==
X-Gm-Message-State: ANhLgQ0qEN7h6+5A9iBYf6gqtXzOLhokjm/KYoPRJgekF7uJiCUdv+qb
 OJvYDu1HknkKC0tSwqQlloWF1Q==
X-Google-Smtp-Source: ADFU+vu2pPTHrxXiQqwlVpbFf/IYZjooPuR+f8p2vHH2AMc5SvS3CVLEsI6qLMJRtysQLUQ01BwuVA==
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr36580657wrx.130.1585059630058; 
 Tue, 24 Mar 2020 07:20:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/fourcc: amlogic: Add modifier definitions for
 Memory Saving option
Date: Tue, 24 Mar 2020 15:20:14 +0100
Message-Id: <20200324142016.31824-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324142016.31824-1-narmstrong@baylibre.com>
References: <20200324142016.31824-1-narmstrong@baylibre.com>
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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
