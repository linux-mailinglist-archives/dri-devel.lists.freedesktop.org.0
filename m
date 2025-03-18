Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C82A66D65
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0747D10E350;
	Tue, 18 Mar 2025 08:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gFRSa9Fu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9EA10E350
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:07:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ce4e47a85so1520735e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742285262; x=1742890062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sNXHg+fYs2vYclPphu41jtGXveshr859Ah2cwXoi544=;
 b=gFRSa9FuBTnMUrM/2yRN+MNwSPc106SFeNlVuL6sSEaMgv0fALCbIskN6w2vKC5B1Z
 5C0RXS2IXyDNIaG0S21BC5yCB/J8c7HvOkl41xF7ErikOmWIedz8WUhD6KQ3gOVf2hF5
 yIAhR8jiQb+YaDktJW4RZRTg7fQqukvRTaVspSj0sqkyPO4YqyTgHjJEA+bt9CsE2Hlu
 ITS2gG+zWNlFKEM+bFBwkfkSlaAY77jupzmEOWLhB6yUaHYdYEzzlxQHkIyN7I9ief/z
 lgOQq01vufQDtfvUVbY8C3DmxEhSVKbz+/N8ztvpvvIg536saCyZdzlMhOa3qin/MlTW
 zFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742285262; x=1742890062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sNXHg+fYs2vYclPphu41jtGXveshr859Ah2cwXoi544=;
 b=oGEbERcuOe3o/dIJ4oWMRGMVva2YPh2TXn4fKWY5M/IUiZ4wAfAo6RcCu86H/iV84Z
 twElUhEYd6TMf6eJFmIxTOx+KOoSLsFAdUof32CvDXiYEiiug+AyRy1poshP1IJirLvA
 flgYpNc/6N1UsEIRYsoI7HbikaGx+Ced026MMDlEYLQv8lMSGHuIkqhCBIa6xTXRBWLq
 NdgMwxGre42UxM91/5QTnA6iNcPLnQywdmt8uYdfAtzX8m210BK/PpG/HwzvH/v2qxZ5
 CbGUf45oiB5fSIcm6Da7pUKUQzcaBiZLaa4kJukvZBKoASdd4q/eiBkcqc2dwDGW/b6N
 tanQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgBYXHyfDW0+U3r3VvIaGWKwgpSV2AMYqinTpQBEbu4UMvmbZk5Bc+fJSF7AdWia/cVutXANhuMAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX8e/EBpXQky24upCV711lJLDqIcUPdteUNuA09NYLFOri8gmB
 TZmJs8aWQTfjSk3Xf7hxi+31j0Q9mS5nIVFMw24owZwlLRC8wMfIAyLjr1OXryc=
X-Gm-Gg: ASbGnctDCcrlj0UVwpHd2N02G+selQDU7tcRltl9Y2wWND11MOjG8GrO/nfnLwfAklp
 Mcy0suTj7HrWGF1rATIE4LZ9d760HV/5ZFbUp99VPLnNlY4XEWnSCK0mnLFYRCV8+m3VoQ+Y+/N
 ZoHftodoxdHQIB3bzlY1slPZjgbLPOf2Y8i27bjOKoKYo4VISRXuU0KtnsR/wr5g0gdW6P4Lv4G
 za/LkGRC4Ok7ffsiT87zXadyqzzJUGMfiVxQXmy4XvOABGIhNfUuCHPQTatIufrwh5pIFes8HC5
 FTk3C7y6M0LadqOXIIXV2hS22Oc7xHQOImwcABoPY2t0OiVEGtxJCowGCQ==
X-Google-Smtp-Source: AGHT+IFwlyR0auz4mcdACDhys146VQDwS7zQVk+tqjA/y7Na6v0bxrpeypR8IICKSK0Vi8hm17Mb1w==
X-Received: by 2002:a05:600c:871b:b0:43b:c962:ad29 with SMTP id
 5b1f17b1804b1-43d1ec6544fmr65619435e9.1.1742285261948; 
 Tue, 18 Mar 2025 01:07:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c4f9d59dsm17389527f8f.0.2025.03.18.01.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 01:07:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct decon_data
Date: Tue, 18 Mar 2025 09:07:38 +0100
Message-ID: <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

static 'struct decon_data' is only read, so it can be const for code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 5170f72b0830..f91daefa9d2b 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -43,13 +43,13 @@ struct decon_data {
 	unsigned int wincon_burstlen_shift;
 };
 
-static struct decon_data exynos7_decon_data = {
+static const struct decon_data exynos7_decon_data = {
 	.vidw_buf_start_base = 0x80,
 	.shadowcon_win_protect_shift = 10,
 	.wincon_burstlen_shift = 11,
 };
 
-static struct decon_data exynos7870_decon_data = {
+static const struct decon_data exynos7870_decon_data = {
 	.vidw_buf_start_base = 0x880,
 	.shadowcon_win_protect_shift = 8,
 	.wincon_burstlen_shift = 10,
-- 
2.43.0

