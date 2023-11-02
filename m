Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8647DF48E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F3710E12A;
	Thu,  2 Nov 2023 14:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455E710E0DE;
 Thu,  2 Nov 2023 14:05:25 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so89706a12.0; 
 Thu, 02 Nov 2023 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698933924; x=1699538724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLY3DfRw2y/RKAr/iJks119OQB+JfG13EdCTLNSU2Qg=;
 b=a4GhO2Q1VcHyCC3hKzsufAmBK+Tc5fECnIyMLwmy624hJwRhbyxklyHiKTwIujzn+9
 p6MbN8I97ve/ufpmGvLB/MrXQXvA5/CXsu+OUsSOUd70fkIhFIAjOaxFMkQg3UAy+RpO
 hokkvjz/90axzMvgTTQyloPmembAxAezvkRcuNn7u2csjlCjRACeXydKWSmHvtAR18Fp
 pkJfYTQs5bMKoC+6E+aatlLxCvPSTpd0U23iDrs721YPqIZKFfntwVNXLlP1xNlsGPim
 8Xw+59RZRejf9ikkbQxfdFri0vtMCY6pPCdqHhuVxEtS9byv1sXnJWYNjLrRvNP722wq
 k3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698933924; x=1699538724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jLY3DfRw2y/RKAr/iJks119OQB+JfG13EdCTLNSU2Qg=;
 b=U4EvlRYIEDV6wscNXhmRoER84zjMCdy3/eNcIYLSLtCLw46Ik0pewUS0I4gAuuKLMj
 /cuWfOtl2M1XtHgnQP9Wuwf6Y0+5lPuv8u9gTHAsUSdFCK7E550as/gp0bS6dKam9zS6
 kUoatsdTs6jORWfinrUcMnU2+FET7yiFwZg6UV1kpBR8qFrtcNN+HsSUvaCv5/2dVah1
 vzdxhbdOspg2Ee8Ca9BKQvrGEF82KNpnBBKYX/TU9EH/89T4r5cGJthe0Hf0kUoXR25u
 OPwgMifZ4GbMFHc2pOCcjnOYTLWa0glH5OTzjzwxFffYe93/BD0yF1CGXjmAjmmQp+aM
 MJiA==
X-Gm-Message-State: AOJu0YxSUvQXi4UuRaIooaqF0bRQeo+odxiYjxMJfJo2xCbTave2ROSG
 6glJs/7R/UuGV6ZK56pDESXguSZ94Rx8Ke/D
X-Google-Smtp-Source: AGHT+IE7beoU5OgUwTN/WR3zQK0u2rQUldmtcWX00j2YBMIxdZYaexMQiTS4wUIbVUbMNAqY/D38gw==
X-Received: by 2002:a05:6a20:4281:b0:163:d382:ba99 with SMTP id
 o1-20020a056a20428100b00163d382ba99mr24823772pzj.5.1698933924344; 
 Thu, 02 Nov 2023 07:05:24 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 n21-20020a62e515000000b006be22fde07dsm2890596pff.106.2023.11.02.07.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 07:05:23 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/amdgpu: Bump amdgpu driver version.
Date: Thu,  2 Nov 2023 23:04:36 +0900
Message-ID: <20231102140436.180989-4-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102140436.180989-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For detection of the new explicit sync functionality without having to try
the ioctl.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 81edf66dbea8..2aa406dee192 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -113,9 +113,10 @@
  *            gl1c_cache_size, gl2c_cache_size, mall_size, enabled_rb_pipes_mask_hi
  *   3.53.0 - Support for GFX11 CP GFX shadowing
  *   3.54.0 - Add AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS support
+ * - 3.55.0 - Add AMDGPU_VM_EXPLICIT_SYNC flag for GEM operations.
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	54
+#define KMS_DRIVER_MINOR	55
 #define KMS_DRIVER_PATCHLEVEL	0
 
 unsigned int amdgpu_vram_limit = UINT_MAX;
-- 
2.42.0

