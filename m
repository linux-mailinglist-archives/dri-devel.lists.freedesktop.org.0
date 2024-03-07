Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE81874B05
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30918113737;
	Thu,  7 Mar 2024 09:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W5DRq2VP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E66B113737;
 Thu,  7 Mar 2024 09:37:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-412f55695d1so6147095e9.0; 
 Thu, 07 Mar 2024 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709804248; x=1710409048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fCGSUBoz7hkTWog5vBebF9UgG8HPCPhDFefPQRO1q34=;
 b=W5DRq2VPSuZw2O6/3IaVntN7hC6DUwzB1MOqeVn+LOjm6M1Yb70K0xLV1omqNDj9gb
 gM1CiEZC0DcMkahHeAJHA7cij7R9ZadL5MR+ruNFxwqKkjT8OFy3iLO1dM39nwQGr4/8
 2CG6v/ok2FRtNAQDBg/9y5jBqoPjCOKibnmmOlAJZZNyynvzAvwZsB2UP9gUr3MwJZHL
 IrPfnPcVEuCHc3WTPwJwyqsaMZN7uJm67Ft7uM2UR7Qurlria1ZofUQHqBNWX65LkTGf
 MTBahmr2TD9O0x/gzP5i1wOscASRO6i8pMUDkM+bh4CSoUoUk1Vpk/1bdU3W7TKjrShG
 Id+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709804248; x=1710409048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fCGSUBoz7hkTWog5vBebF9UgG8HPCPhDFefPQRO1q34=;
 b=jR8u8ZeNQLKAmcmBi6S5ougcsnlieu70H4XR+QLN2gbpLS3ofhj5RG4sJhrbvNSaXS
 JGbktwDvqr8/0ulRuJTnJKzsmDDVYN0X1aHwLXNIqohvpvRqNCJJ03bgm+7YR/87V5GX
 2UYxl+SV5bdYiM5wKU0g3G4jCha6Uu5D81p7rLYs3cbBFvwCFMSk8npGAeIt5G52oPbC
 Ic7x/ILvO3S/5WX9TjdUB/vHMGG6Mk0Cjf4yfiWEJMQtLvEYYaoPXAYR9+gkGmCmvCJz
 TryrjsR38rog5qX52uxGwp5bCznXIqsXZjldeVKppvxGjk38gJ03XBq9PSejuU2rYXTZ
 KiXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI+j+F1bMcAhTOcdtU0jcH6/Dv4T/7oAjB4qV4ppPe6Xgv1t+GyakpvdQeqtiMvS06Yu7pfRhQs+qgEMfndQUGy6rL3LXn+jeL9+EwT9Uuo0aMtPLltjCKUX2Dj7j9Rw4MwaoMOERDEeQB5QB3uMKr
X-Gm-Message-State: AOJu0YzRVfxU9oT+vF1liDTta3JlUXlV7BmhkPXfp/kpAeEBWYNA/OR2
 /m8uuhx6t4TJD8dJpXWODzvibYisb8M7TLuQcaLuBBxBPrNLdF/SodeuUbB35t8=
X-Google-Smtp-Source: AGHT+IE8RizOzmSDjEf4PsBNhWryLujYdRAkPfhGtCn7+tuTX8NXpG2EQMCqSC/G4cmzXNtq0f6k3g==
X-Received: by 2002:a05:600c:3b26:b0:412:e3aa:8f69 with SMTP id
 m38-20020a05600c3b2600b00412e3aa8f69mr8126669wms.30.1709804248388; 
 Thu, 07 Mar 2024 01:37:28 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b00413074ea471sm2073513wmq.31.2024.03.07.01.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 01:37:27 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm: remove unused variable 'out'
Date: Thu,  7 Mar 2024 09:37:27 +0000
Message-Id: <20240307093727.1978126-1-colin.i.king@gmail.com>
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

The variable out is being initialized and incremented but it is never
actually referenced in any other way. The variable is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable
'out' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 1f5245fc2cdc..d4e1ebfcb021 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -840,7 +840,6 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
 		struct a6xx_crashdumper *dumper)
 {
 	u64 *in = dumper->ptr;
-	u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
 	size_t datasize = block->size * A6XX_NUM_SHADER_BANKS * sizeof(u32);
 	int i;
 
@@ -853,8 +852,6 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
 
 		in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
 			block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
-
-		out += block->size * sizeof(u32);
 	}
 
 	CRASHDUMP_FINI(in);
-- 
2.39.2

