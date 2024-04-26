Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C098B3471
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 11:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E4010F539;
	Fri, 26 Apr 2024 09:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VPT8nu8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2110F537;
 Fri, 26 Apr 2024 09:49:08 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41b847a81d1so2751695e9.1; 
 Fri, 26 Apr 2024 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714124946; x=1714729746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OTqofDDyhWS27DTBkyA9Wn/ozYeD7cxzwbx1fLDfXq4=;
 b=VPT8nu8hpLGymNdgSu8Vq3xBp/T10GoZ4jEBMcl49QJlIK5Kk6fV7ilLuV6+gMjJSw
 Tpd9UeVz4aDiYv+KoaupKu7+UBHafuuFl2BfhDCmGOIU7hP6mr+MvZmA4MFOcIRLlISO
 JJK+Uy9iGamwODAgSKiUIYEyKidMxgA7Kjmy32Gh9yWO4m1pjPcAjc6i0Ja6WyslYEEm
 Z7I2vx6Qp1l2uirfvRJsXnt0cmJh0Vit107HjGXgC2Uh+rXAx0B5pkzFiRQ7ZknTwtdL
 0IWaaUT3dk0hUxy38O89GlKxuVbMeu18JWUeLFGGZlklpcXH+5JZ6q8iTm0AmNn0Twek
 fqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714124946; x=1714729746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OTqofDDyhWS27DTBkyA9Wn/ozYeD7cxzwbx1fLDfXq4=;
 b=i0PC7HUaDBv34oxctJDZOW3SpN4Ehb15y+i2UO3vNd3S+lqglhjO7Em5FaEwJ/0R3B
 kjv3sdL7rOUzbteNcVu/LKznmjJmIl6O424j10nQ3Q6u9D759v/AylTlcVXImaVhXSRo
 6TqdN2u0CETBpXiXx65eCj8nre6UyQ/BvYAfTwKocYUyR/8JXNdOGQjy2vUDq1R/gSor
 StAGIFgouVJavjRsjuwXyvyD39XEzKfWSufkGZO7vDYLcvg96X2zCWN/JRYV+PyAveM6
 t4STsxqn0fRxIPIcesjqiuAHm1duvxEFBXQZWnCCIowE/bhKa2YQwgOEV5fuQSGd06sk
 FOrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKShrwrgfByZUVcLD4wb3+A0cN4hWIyBPlL9XG+wbfBje+ii5h4MgHbiN5kVdBUPfXlz2JTd9ljGqhp/zTV8NpYnVuneSJ/R3XbY9J+G6F2/PWYrE1CVmfNqqsAZAqFnmkDwz95oMpzk7tv4rkBwY=
X-Gm-Message-State: AOJu0Yx/A1YuYKjhZegWWOb71FhtGzmdduPdRyOkG+9thnZDEFVtySk4
 uSNpxoFG/P0q6U1rrbbrpgtX03JpjFcm7uE83IxFk564c8JTYuxx
X-Google-Smtp-Source: AGHT+IEnEbGzWwb5BtL05FOeJSjU5tiXoKG2o7C40aXQG1lwfb02NqLf7df70RE0rq1MKonJ92sK/A==
X-Received: by 2002:a05:600c:3509:b0:418:de31:7148 with SMTP id
 h9-20020a05600c350900b00418de317148mr1930550wmq.3.1714124946253; 
 Fri, 26 Apr 2024 02:49:06 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfe2c4000000b0034a3a0a753asm20338400wrj.100.2024.04.26.02.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 02:49:05 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe: Fix spelling mistake "forcebly" -> "forcibly"
Date: Fri, 26 Apr 2024 10:49:04 +0100
Message-Id: <20240426094904.816033-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a drm_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bb4fbae5edb6..b61f8356e23e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -788,7 +788,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 void xe_device_declare_wedged(struct xe_device *xe)
 {
 	if (xe->wedged.mode == 0) {
-		drm_dbg(&xe->drm, "Wedged mode is forcebly disabled\n");
+		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
 	}
 
-- 
2.39.2

