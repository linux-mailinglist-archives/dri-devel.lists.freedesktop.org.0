Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BF97823A0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461B810E1D6;
	Mon, 21 Aug 2023 06:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82EB10E1D4;
 Mon, 21 Aug 2023 06:21:05 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5657659a8a1so366623a12.1; 
 Sun, 20 Aug 2023 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692598864; x=1693203664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dDOLU6kJ41t5t8ozCL+w3W5m0GOmukGjx3DvN9f0Amc=;
 b=os0o4cQe5MrbarzFSib3Dvu/yGR3l0vXLtXulnmqmz0rOfiPPgV7PRiNdLE7Ju5p5V
 1vKH5KTvSKTy1tHHmaRt8rwiwn27h7IqhBf9Ls2ZRGth0eZqDfySklHhYACscu8tbq5N
 tAXUPT3XYUog1CzuyzJ4ckmc1HnFQC+K7GfAima44Ozyx3RKOQS5rYPsYyW0r/Kyt4i/
 X9c5HvLHR7P8MDMBzoeLCY26qWSJaLt6nCnBXI6Xmd6HKSxo4qqNcYGgC4xNwrIfcEXs
 ZpoNNvTjdueX4wIEl8ohilIn9UB6vQ7H/XYPzXGCpFv04m7F89w/rQvVua0dGukfHbMZ
 nOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692598864; x=1693203664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dDOLU6kJ41t5t8ozCL+w3W5m0GOmukGjx3DvN9f0Amc=;
 b=HZHCraP1r0LQmA67WaF2xu254qIl8HQK+4wVVNxBhrO2zDekYoKPSDDaym29ARvH6t
 mlgs0Mln/p/Wr0jYns0UEOwjHqixBaRsuJoTcQ3MXbMF8SNaldUENahnWVhFFDcDClrO
 wV7QRUzKkuosGDZju5bARvobvWkHC/USaT9Q5mUndWSrfYQR1Xbi+InDpQBrpBKw5SvY
 zdfyWlRljDhFmxqb035uFhkn8ERNrVBNIh6+vPu8Mvk89HMVY2dt5it2RiuMR2yYSna/
 LVYSw+lEMlHYlFHsi6VC2hjEE/ZL6ESsTAeXbURWhie5M3x1uiQuJeHpZMQV1Ygq4dHl
 vSfA==
X-Gm-Message-State: AOJu0Yw/Duvll+d9w1rh+huJftI85+2wMHFt02oC3jvqT5kZqu0ZGOoH
 CuYnbBuRl21JFXYbULAm2Xks7y77XGDi4QGb
X-Google-Smtp-Source: AGHT+IH/Y/UpkDbNE2uZ9xkJ3xV16TuXkdnHwPURacrQDtbeTGTqADM04P2tr+1ODhVZtze57gSTvw==
X-Received: by 2002:a17:90a:6e4b:b0:269:34a6:d4ca with SMTP id
 s11-20020a17090a6e4b00b0026934a6d4camr5315225pjm.0.1692598864598; 
 Sun, 20 Aug 2023 23:21:04 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 mv22-20020a17090b199600b00263987a50fcsm7127771pjb.22.2023.08.20.23.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 23:21:04 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/amdgpu: Bump amdgpu driver version.
Date: Mon, 21 Aug 2023 15:20:05 +0900
Message-ID: <20230821062005.109771-5-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
References: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
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

From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

For detection of the new explicit sync functionality without
having to try the ioctl.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e90f730eb715..d2eef46f0fcb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -113,9 +113,10 @@
  *            gl1c_cache_size, gl2c_cache_size, mall_size, enabled_rb_pipes_mask_hi
  *   3.53.0 - Support for GFX11 CP GFX shadowing
  *   3.54.0 - Add AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS support
+ * - 3.55.0 - Add AMDGPU_CTX_OP_SET_IMPLICIT_SYNC context operation.
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	54
+#define KMS_DRIVER_MINOR	55
 #define KMS_DRIVER_PATCHLEVEL	0
 
 unsigned int amdgpu_vram_limit = UINT_MAX;
-- 
2.41.0

