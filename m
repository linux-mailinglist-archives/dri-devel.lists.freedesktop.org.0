Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFFCB5A399
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C161F10E7A9;
	Tue, 16 Sep 2025 21:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hjBfixiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6146B10E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:39 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-25d44908648so58272035ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056919; x=1758661719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zp429VwRoqZJz0QZhuNSn/00UhicVBQdf9d9yD1+m0A=;
 b=hjBfixiBrF8xQQ9rJjO3ykrlrDRwxgxGnwWqmHC7J5SbwjbVBBhGWOdsJrV+yvFrLC
 Lt8fJtAYYCi7Novc59xpVYDsbilYy2Oibk6oEC9PtmA9f7K6FTOMIsnEM3iiq+hzNhYU
 M9pFuMZNqsiIabxWyLE495k4nPsKHZ+t4ycSz6QifFhPI4xVAqK54TPLnwsD+yRl7/CL
 b5memwnmEYksw8E8pOIgIdOVTJ5KB6o0Y7X6HIXCvp7zeKAG/ydf60YT6bdVpkkt82+3
 /n71a0KGBNrwdDvabMdUe9CFKBSdz3RvcF5lbp+WzqT80plMPy50dC1nzpqRAJ2hrQG0
 QuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056919; x=1758661719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zp429VwRoqZJz0QZhuNSn/00UhicVBQdf9d9yD1+m0A=;
 b=SbnMgA0a4WXda22+Z3rmYTyuubJS+bAtzx9oIx23wgcjbWxMSOcSXuQ8F7V+3npLgv
 +35KOyP0Qs8gsG5/0SC+3sG5IdzezcxhBJoO/bdpjigMythNhKQ6apy0SJ2DRj1c8pKw
 6KoU42yARYX89LJL3MNKIcCsA++R3tRF0B2VhqgVqG15wzQxMFCT7d8HfjxsJo7jYuWz
 Iae+6csnsy5+yTPUiTYyKPBqUJV5T4/gzyr6BgPijmX0L7VSImmHmmxMaRwENw5vqArT
 yvWytgzQHkgTUs/HSzkv2ZdFfekr9gXA6/JWSxkkEu57pUBULE8BLd/+MOmUVWCKyn8l
 a/2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Hu0GFBF9/7Ai6VYPynNMVo5QOSV0iA5k7peHbHL5s0RmXid39kE/McPJ4BxurJekQviNK/6am20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9x6OMymYSB/+GVyK8kk/I54IdWQQB7EFO+xraCcJbmpfJ15zb
 OqtiO3H9zfcPeJqehLn0K+4hT/DFQhDWO3Qlk8INn46lmJu/P/4r4wXV
X-Gm-Gg: ASbGncvO4srjykO2AHdP3Mlqtj5CpSscMBUILovSxy3I2iHqy6ZOIhYVlsx/LUX9Y6/
 AxYxRXblg8eFr5UhI7QYsQrJVveoOrR/V3JGl2/FkTJXEaTujDHg7qtlZItVuUAq7wPXTQN2kOV
 FVmqJ3xzMrj0ZeY1oWRCWazymFiTZZmr0pCfvDcvd519VFPaN8com4g51ToA+PoWo/cnHwu8oXw
 Gt2uKf2TO7q6U1DRtdQUa92xSko/9WDlPzer85lu2kMbqDgNS3TUqd5OOFrvujSq7ktMWTxv/H7
 yv3NnY96gLwEKTAC3G8ToNTMUTYTZZmdRP2xeTfUNnQNeM5bWp4ZuLx1HjmJGB00NfR/KvTmuYo
 2bWnckkh8qDOPWd3L3Yz5MA494niZhilOXFfB1EjRDZ/JCnaS3xl7UB2lA0WPt5/rHauOGagMth
 ZpwjwQi8Rgng==
X-Google-Smtp-Source: AGHT+IHWb5vz3chJSBX2CcOdVpb74MMd2l9HAF0/B3oCFgO2DuURnS3/3+EQM2BpeXdo7mOMhcq0Yw==
X-Received: by 2002:a17:902:d4c1:b0:267:cdc8:b30b with SMTP id
 d9443c01a7336-267cdc8b588mr54724745ad.53.1758056918694; 
 Tue, 16 Sep 2025 14:08:38 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-265819a61b3sm78487955ad.42.2025.09.16.14.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:38 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] drm/panthor: remove unnecessary mmu_hw_wait_ready calls
Date: Tue, 16 Sep 2025 14:08:20 -0700
Message-ID: <20250916210823.4033529-8-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250916210823.4033529-1-olvaffe@gmail.com>
References: <20250916210823.4033529-1-olvaffe@gmail.com>
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

No need to call mmu_hw_wait_ready after panthor_gpu_flush_caches or
before returning from mmu_hw_flush_caches.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 373871aeea9f4..c223e3fadf92e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -669,12 +669,9 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
 	 * at the end of the GPU_CONTROL cache flush command, unlike
 	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
 	 */
-	ret = mmu_hw_wait_ready(ptdev, as_nr);
-	if (!ret)
-		mmu_hw_cmd_unlock(ptdev, as_nr);
+	mmu_hw_cmd_unlock(ptdev, as_nr);
 
-	/* Wait for the unlock command to complete */
-	return mmu_hw_wait_ready(ptdev, as_nr);
+	return 0;
 }
 
 static int mmu_hw_do_operation(struct panthor_vm *vm,
-- 
2.51.0.384.g4c02a37b29-goog

