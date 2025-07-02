Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638AAF0FE6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3E310E645;
	Wed,  2 Jul 2025 09:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TgSHoguv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F5710E645
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 09:26:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4530921461aso43438835e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751448366; x=1752053166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r2NUWZQo4rEi0elBJOEbc1HR3dKemWrO4/Vi3XFgMFE=;
 b=TgSHoguv5EdV5vS3Vcw0EKrCCExpbY/55zyCvC6VNbrpzedwO6dFENi4MaSdoBXXbA
 cHvs3gk/Jwjphf0cXy6ANO2C5faHRNYGvqEmtSlmqPvP8eK7EP2GgkngYredKQ50X35U
 wjwiG8E4ukSqmTM8y7b4rc29UQkIDxdXs+1iRaHxrku9h+yXd3DCqbt3ybbdWJ0a1cUF
 8QdugC0DcrOmaNPX/vzkhqfCNjHbRj9MpxcLfQIvRxRtQ1hmXQeBCYdhNj+iFvrBw5tk
 wN9r2a/21+9W0RP5v477s4pMn1PKi5rpsgC+CVkMLbLeovvypMBCyJd6YRudn2GDo7pK
 P9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751448366; x=1752053166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2NUWZQo4rEi0elBJOEbc1HR3dKemWrO4/Vi3XFgMFE=;
 b=UKQpwMX1H0MuzjWl7f1gEtAVGokZOPw/FxKgwhvib92s54MxGejshTjxOhBgx0J5+T
 cMWXLW2CdaZsS2SgFcmj+L7W2OUGTwgbg4W3KFJJ5P0gs102cxlBt/4U8ee+RL7mLx0t
 Sqd5Qevx2ugnIhXMTQzBuIJIPkkziLB6TcBlfQ1wMZx2nCYDuA4+8Q7x6+xtV2SKYM98
 LQFoEIXFaeVM9Y0zYJqvI5iu+zFV1Fk0x0fjAKUuyLrJlditGN8NDTrBT/Ou1e9dv7uL
 h41heXR/GS/+paRMLyHhRa57O+jMM3IzWvVQXGr7978zemkwVo/jhZQA3lfEZwh4LdAh
 ZdKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBI4MVKgTTgJcDlsF/JPU22sr1YDbKJi7AlHqWHNQzFYtevALjQC0hYhhrTauzQVeBcOZjuStc3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmL8MDmGtz46tnTmDEoYWD7tLb+uxBA5gAafrJHMhOvk3jv461
 vfFVCKm6qJlStabXMb6eHY7VWCqYYYLzirlxuKe/PSHxOMpyrrvNOfe3
X-Gm-Gg: ASbGncui9xLjd93Gql2Rx5ONUnac7O4gatwBqbltLXLZlehw47IsNjHcpcxnkmHA31F
 raShUwH5ORvaWdkUnCA7EyYShiuA2XDsyG6wTXxS4cvfFLnpO0dqsQPk+BWqTcBNGLZfu7VGEBA
 66oZDgX2VRFsXA2R5HT1woxkZ0j73+Q8HP50+Q6tCkDXj7LsuPfqfFn+tzr4Lg/uMbXdf15lSJt
 TqdczvyODEIYgRrh/d6q/vcmv9k++LjL6NBTNZD2rppsZRaIe737MHiNFPvoYqR8pbGA0zzFfgz
 Ry3F6NWWpUuBXv9YuTzyNO7ZcUPeA7VfudAwVjC5m/tp1zIJV4ndhPMCL0EUm7sjAmvXHk4=
X-Google-Smtp-Source: AGHT+IG07cQ+CwOEqMsx1VHMq868M5t6QnC5WQEr47cn1qXuSoJcWBD6jVc9AGetWcgUNe/GbL8M+w==
X-Received: by 2002:a05:600c:538e:b0:453:697:6f08 with SMTP id
 5b1f17b1804b1-454a3728b85mr20537325e9.26.1751448366227; 
 Wed, 02 Jul 2025 02:26:06 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4538234b1b9sm218566675e9.11.2025.07.02.02.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 02:26:05 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/ttm: remove redundant ternaray operation on ret
Date: Wed,  2 Jul 2025 10:25:41 +0100
Message-ID: <20250702092541.968932-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
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

Currently the only exit path to the end of the function
__ttm_bo_lru_cursor_next is when pointer res is NULL. The
ternary operation at the end of the function that checks on
the value of res is redundant as res can never be non-null
and hence the expression referencing pointer bo is never
executed. Clean up the code by replacing the ternary operator
with just a simple return of NULL

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index cdee664d2e8b..fb8bef50c744 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -1016,7 +1016,7 @@ __ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
 	}
 
 	spin_unlock(lru_lock);
-	return res ? bo : NULL;
+	return NULL;
 }
 
 /**
-- 
2.50.0

