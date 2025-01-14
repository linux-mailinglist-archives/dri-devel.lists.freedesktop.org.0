Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D5A10A0F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F407F10E36A;
	Tue, 14 Jan 2025 14:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E10m6bVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE54510E36A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:58:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4363298fff2so4914255e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736866724; x=1737471524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QVej9YChPrkYOMBAkxAhAnFiPDP3uHtQtZknuxfsxD4=;
 b=E10m6bVuqimx4bATSgK6V3axVVVI+9Q/B0TeU99rP6fmGtSn/4nR6vjmSt/j8tIZoA
 wra7zeHFdsYYF3xAd2a4xbNO4M62NA4jyLkGEYgpmSDwpL+ivpx53pPUWH98DC2kQfF8
 XhT7Q2OQ65V7zfYVJeusrXT5BjAgnRcWJzFbVM+B4sJp+3Pc5x4Gd0s9bR4Ydhd0dRc1
 /cVGnb4KLmwiySAnwKACh7YDqyTgT/p2xyEVvDs8FPgZm0Fb1dQI4Owz/zFWK4+tao7o
 5621aOSop/gUXbhvzp5QGrVfA2Pm1hecqExzcioK1LNE9fteYeADe5Oi7Ltb/nSg+3x8
 LdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736866724; x=1737471524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVej9YChPrkYOMBAkxAhAnFiPDP3uHtQtZknuxfsxD4=;
 b=lxhi+SjPRD6luNZMnhYeBFeLZXDUvhdPNtHRNeT8f8MmB6kUun5Ltna1BFb0vW8/Li
 3GZoG0o7Cg8hN2zWamOckTVDwZ+C1Ev1HxQyZ5tP2ya3lB1VEBjPHL6RqUk2JD+H+uiP
 1TewW7wOpA5kLfnAFqGpJauE3r7JzxJLyym84/1UVbheZQL+oHOMA6P/vEiBwKakP3h3
 75xOxDDMOlJLMEA8yFdVKB8z8M5hfwHaHs6xyDErLaqRKI4r4YGauFHetTJGrYFLWqnk
 OwRXLAdwXc65FpwVRHoTuaa32G7yVE+yTTfJpltW8vEEfVPBNRyOBabLa6hxtKV5uFgF
 ytPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFrapXfRdumdn/M7oSkZmI/JbZrfoP2tSpbVu37IMhjoYKFHgNOpQF2mUVcvMQ1QZxIvQcFK7O0lM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq2Vdj8Ic2W8TWYHGun2PAqxxuFK3mSLqr750Cz6EpGacx6Xg3
 DXPRR1t2f5mj9trt0V7PjBVbRRlpV0fKM3FZVC1tUwCHtLOUME5btUFZ4EQm1to=
X-Gm-Gg: ASbGncsYh+JgmZpODZKFz6Q/6/KO9Mo1WmRheU0eMeA6D3lNMv9HWhF7/sd1AmL8F1n
 xz5hTnsgvacUbyabijNXquM7ojrzXNnYr5NRfKKzTMBck7jdzP3MdU/NShov3ZPNMJC3SvTufQl
 TmWC68ZuNyvSOks5FdY0JWftNEagK4eGwMzZrxEU4T4u5Cb1eo8HBS+lnHg7bYaT1/93mW2zPkP
 U4Z6/fJOAaI1nuP+wQV6cGanlpao5N4Bw4S21+ZWs2Sxcv09CpA9yKAQ9qYzfUUnBYDG0k=
X-Google-Smtp-Source: AGHT+IEs1UJqCvH74qTu6K6HcN3Jn9PInjiRQ0H/tqsCxueitRtvzv83ayZGDId63lv8+NPdYXNCoA==
X-Received: by 2002:a05:600c:4f03:b0:436:1ada:944d with SMTP id
 5b1f17b1804b1-436e26ff7famr92040435e9.4.1736866724196; 
 Tue, 14 Jan 2025 06:58:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm214937895e9.6.2025.01.14.06.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 06:58:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] drm/omap/dss: Use of_property_present() to test
 existence of DT property
Date: Tue, 14 Jan 2025 15:58:39 +0100
Message-ID: <20250114145840.505459-1-krzysztof.kozlowski@linaro.org>
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

of_property_read_bool() should be used only on boolean properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch - split from the next one.
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 7b2df3185de4..319f0a1d23a7 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1236,7 +1236,7 @@ static int dss_video_pll_probe(struct dss_device *dss)
 	if (!np)
 		return 0;
 
-	if (of_property_read_bool(np, "syscon-pll-ctrl")) {
+	if (of_property_present(np, "syscon-pll-ctrl")) {
 		dss->syscon_pll_ctrl = syscon_regmap_lookup_by_phandle(np,
 			"syscon-pll-ctrl");
 		if (IS_ERR(dss->syscon_pll_ctrl)) {
-- 
2.43.0

