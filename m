Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6C9BE355
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 10:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1E810E1A7;
	Wed,  6 Nov 2024 09:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NitkrTeu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCDF10E1A7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 09:59:16 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-20c7edf2872so5519405ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 01:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730887156; x=1731491956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YanI8iRaFnbYDLIbwSAL7fPqo0KzjFa50XedZ+8YIHE=;
 b=NitkrTeulpW7vIgtIg+NZyn2pM8T3NyXRPXVNfyL7xrv7zj3T5TmRiDKeeeCSTqPP0
 kTXM7BqCLy2eYB2/guqMYVwfyoMc6c+dXbjF/Anru4fwwi547UrPO/YiwVQ+GaiJIVme
 x1GU0FjGBdGWhCYrit4uiO5pl7WR0VzF5iMoBHg7jQ+iTjPIgju2dEcHXHeMi8MexmBl
 ldzxgUgdyOnOh5eriRIEQqBoLKKTId+u310zYa/DRnr+Yv0R/lMybCshaSI58FuldY/6
 vQ9OBf73ANBx4LKfx32rfWt8GiX2QQPOhXX7SSY9NiKQfle3x8znnEP/mnP5tcdl+D4n
 CMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730887156; x=1731491956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YanI8iRaFnbYDLIbwSAL7fPqo0KzjFa50XedZ+8YIHE=;
 b=q8OyL3qk+RYcadY7u3pV0l6o7J2ER8ElXBsYhsyGAlnShKybcOjfpMbBUF6KQKFbrd
 6CbINRcAxk51wCIcWEwqWf4ZUxtLdTBqW6KsfIAoNJZFZ7w9/W/Xtwqh/L/xw8DHAeZr
 1GqOjjrgfG2dKSTY5d5vLrhuUZoMiPhIETf9HzNIrQx0IwWXzDVhg07z8MpWwuBaGFcn
 QzOix/Qr73QTeKlkoH3G3YYdvhkXGKq/wjWK8NVONdqOqY1ZXLB9BHeK5udYQZh5iwIB
 rCddVRI8bHI+RVsODEyvzIyvM1jD+NqDgNYHT7QlvLt0BNIlVYQJAKsXeov4J9k+GYCj
 dKYw==
X-Gm-Message-State: AOJu0Yx4Jg7KF/fa3jZ68Q7Z4+dnNlU0cFC+EJY5qGXcEMbYgeozHMDd
 3zQOEmSQ3lUtv27+or06Nbtoq9HijxxXv1dR1XD4W11bs0WsFdvf
X-Google-Smtp-Source: AGHT+IGjHbCdL9n1T25NiYqOv/Egm/PtLSzYQLrz+c1DLzL/71S3yO0qnkuzyroDHsVMSMplfp6p6A==
X-Received: by 2002:a17:902:f54d:b0:20c:76a1:604b with SMTP id
 d9443c01a7336-2116c88c016mr32877155ad.12.1730887156274; 
 Wed, 06 Nov 2024 01:59:16 -0800 (PST)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057087dasm92697005ad.85.2024.11.06.01.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 01:59:15 -0800 (PST)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] drm/tegra: fix a possible null pointer dereference
Date: Wed,  6 Nov 2024 17:59:06 +0800
Message-Id: <20241106095906.15247-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
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

In tegra_crtc_reset(), new memory is allocated with kzalloc(), but
no check is performed. Before calling __drm_atomic_helper_crtc_reset,
state should be checked to prevent possible null pointer dereference.

Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be61c9d1a4f0..1ed30853bd9e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1388,7 +1388,10 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
 	if (crtc->state)
 		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
 
-	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	if (state)
+		 __drm_atomic_helper_crtc_reset(crtc, &state->base);
+	else
+		 __drm_atomic_helper_crtc_reset(crtc, NULL);
 }
 
 static struct drm_crtc_state *
-- 
2.34.1

