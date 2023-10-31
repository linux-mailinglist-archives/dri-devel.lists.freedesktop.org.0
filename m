Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6D7DCE0D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53B410E4D3;
	Tue, 31 Oct 2023 13:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694910E4D3;
 Tue, 31 Oct 2023 13:41:23 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6bbfb8f7ac4so1736310b3a.0; 
 Tue, 31 Oct 2023 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698759682; x=1699364482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLY3DfRw2y/RKAr/iJks119OQB+JfG13EdCTLNSU2Qg=;
 b=jr1KL2j+vZ796Vz4GPPm59Pud93Cj8ZPLd2mzbHTVv8uFQ6gN4+C/ducAEE4WpNL/M
 afJKC2znId6OQF4veGscxF7a6ukBz7gSUxa7IMdAn9jI9qZauzpkx8XtuQG6qU6tCl+V
 l/PEnyvCkHM7hFyAKebxK09vnoEgKCL5BTdVIka9XPobpJork3tzq/IxOvQOjDSgYom5
 uwe//F5kPimnbmac+w/k+aKsFGa/vmqzJh6PaOndOSsmsTlk0laCsdjqE1gOrPZiNk1z
 G16U8FRYRps0JOfneMQwze2Ib2Dkoy+9R1mvPVMLJjKskcSj1nUhc/3Dl0CJrFXpuYwH
 Ot1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759682; x=1699364482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jLY3DfRw2y/RKAr/iJks119OQB+JfG13EdCTLNSU2Qg=;
 b=MeJhDJvSi2HYsO/VltgAEWfmWAilQhQbElhAU5EvYIDZd/m95DPO1LdfZ4o3Z3n3GL
 m50PDwp2URQ47kRXESvWAGZdzdYzb3tQikOD9hkqsEkYrwOkqtNf8Zu+ZfGLVQjinWI1
 R5NpzGQ+binpi7w4jkAOcAp6BJmD/9fbAg932/sA2aDoiEAWloluSyyZg1cDVbQMJTPf
 MD/4fJSGLXbrzdS//s3rTLSl/hHTAf/tW7foaZAvrgA1SWqUk8FDrvAnv8c8O39rCxXX
 0mOud+41BaEsvD2yyzjmP7u3IXSFUyz33l55wj/WfYB1pkHBULRZv7+ET7X1M0qxRaqw
 D9Qg==
X-Gm-Message-State: AOJu0YxdP5txCp0eu7xr/Bgio8eSY5N03QdiDcOTRQaR4NBUMzeCNUB5
 8eBo7n84w3VwX9ql+0qS8uxC8H9CTQYx0t2L
X-Google-Smtp-Source: AGHT+IEMSr4k+h6zJ4PjgVM9J89g/YeoNcd17WODfkF+nY7a/j81/1rt1K7p2g1HYg0/vl+bhX2C8g==
X-Received: by 2002:a05:6a00:4a14:b0:68e:2fd4:288a with SMTP id
 do20-20020a056a004a1400b0068e2fd4288amr13471046pfb.3.1698759682302; 
 Tue, 31 Oct 2023 06:41:22 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 d14-20020a056a00198e00b006c06804cd39sm1257366pfl.153.2023.10.31.06.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:41:21 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu: Bump amdgpu driver version.
Date: Tue, 31 Oct 2023 22:40:59 +0900
Message-ID: <20231031134059.171277-7-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
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

