Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A787C154
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 17:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0402810E7F8;
	Thu, 14 Mar 2024 16:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y0/MlUMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B51A10E7F8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 16:35:14 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-413f7a5bf11so4833835e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710434112; x=1711038912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3febcg30MUvzziLDV9p5DhB+HO5C8w1a7PC8hf/KTOA=;
 b=Y0/MlUMekiP7v78ecC3oTbi++um/xOOjc1rGnNUc58yFlOG8Gs21qkazmTQ882zd2S
 zPPqvP7ZqxaLN/j/Lm0AQQoiIXGpuC2EGMB59BSpW4/qeSDkKqIhzJ27olYFvZAiQTrr
 nHza/9XFUWLuoRqBeN+bMspJ37ccBRe4c3e/VSjG+CQ0WefwefupBZS3sxune0q6Cdkr
 0CcwQ6lMLOTOYdfE3EYGgMCdb8TVbaQA25K/GT11MuIkCZy7BhfROdv0J+a3nNUd+6Pv
 eNAqi/WxsQugLiQsmGHret/Q+3f5JP7DMTjdqOJWVr4Y/Xvnuk23UfuXfVvNVZL29/JG
 fvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710434112; x=1711038912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3febcg30MUvzziLDV9p5DhB+HO5C8w1a7PC8hf/KTOA=;
 b=I/X3I/7+ceDEe4MG4/1aCr7em/G5cKy+3e3m54VM/OvLOJmP08PnNAPZjiLRnAxiFh
 /dDjrRdA8w1gSo7UMvhoyVQ6kYQnq+ecwXhbr6AliJK/1o+PoV9fPmcONSQTYKLgdO5F
 EaHpSAPU1iMGuiGoIfrMp0Xtcv97u0jD98F9e8ZxfBv1Yy+vTdgYJZqQKchuEv7nmjye
 oEI71+Pg6s4dZWzdgpBb59DBLZe8+ikRrLPpSCLIYyAnuxaRaPQKxundABw0ENREhzaK
 PXtG7xp7l0Yn6WtltT4JQySBZ6+vwTwL/TNILks02CvRg7iHIubzGUrHHN3QOOQgtffE
 SZeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVOO9lVUrCMWIfzxsPbCw/la3drHy6RVl3Zk8cJawMvqbw1WWuXviF65GRbSSVHAbgvVZFGBQI4PJWeObuWKg4Y2TUegU0dVTj3RtdSP0m
X-Gm-Message-State: AOJu0YyME4CJK4PJkADr4jYBJloK5CWGpfQ0NxGOAEybO9JfINbjiwiu
 f7zz/FrL/oUhDIPyEluGmP7V5n7wUCLhuWUmpI9TX5Wtcw7mU0RA
X-Google-Smtp-Source: AGHT+IE7wio3dnoMGVtXz8wtABUS0fpDn3g6mBSI8Z6/SWNg9HZmBIqQ1Zp7CyQqZNKiMCi/VKBiZA==
X-Received: by 2002:a5d:5750:0:b0:33e:34aa:d78a with SMTP id
 q16-20020a5d5750000000b0033e34aad78amr1707480wrw.8.1710434112289; 
 Thu, 14 Mar 2024 09:35:12 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff78f000000b0033e192a5852sm1126824wrp.30.2024.03.14.09.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 09:35:11 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/gma500: Fix spelling mistake "patter" -> "pattern"
Date: Thu, 14 Mar 2024 16:35:11 +0000
Message-Id: <20240314163511.2372458-1-colin.i.king@gmail.com>
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

There is a spelling mistake in a DRM_DEBUG_KMS message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index dd1eb7e9877d..cc2ed9b3fd2d 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1547,7 +1547,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 	}
 
 	if (!clock_recovery) {
-		DRM_DEBUG_KMS("failure in DP patter 1 training, train set %x\n", intel_dp->train_set[0]);
+		DRM_DEBUG_KMS("failure in DP pattern 1 training, train set %x\n", intel_dp->train_set[0]);
 	}
 
 	intel_dp->DP = DP;
-- 
2.39.2

