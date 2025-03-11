Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8216A5CE6D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A0710E103;
	Tue, 11 Mar 2025 19:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UGbv/y1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AB310E103
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so14350295e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741719719; x=1742324519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZM/C0Y6KtCo6GXxz4sTkdCklkA06E/YKrVilZFUzRyI=;
 b=UGbv/y1YsVpKsVF3Pdh600oV3+T5ljaLlvXNnnX7dyIQMjlY5ISYbYN51pRel9+nf8
 BZs0BmYbXaweQesBPG8JdNMeYTZ+b6azhGsyAJjO5Ns/K6tNavR1rKIiEYXf2CuFL3+z
 P4vLgkEB1nXlnlKY5SabVSTIoEO9wFhSdQFD3MseELhAJdkXakdeixiugGidPfaCpdqN
 lYBRrCgZih+nzTxTl29e4M2yNRBXUTU8TtEnZbR18ovXFFNYkhqm7AHSydlRTe2UWhPf
 a0ezla5LqZN2Gq3ePvkcWHR21pz/B9x1pGK9CJymeYFeDl/RH4dn7v6vogbU4x4z3IET
 +tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719719; x=1742324519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZM/C0Y6KtCo6GXxz4sTkdCklkA06E/YKrVilZFUzRyI=;
 b=YOYR8AgXqwyRQwxFqCnGujIsgAUmLbeCNHlQshiizcv9kxU5fkQ8W8RkgxMoOELhXL
 1sEs6YJyhui42dNvzPFQLpJbUSy4bMiSz83boiwmFqRIGABhKSgajBIP3iF1V6VRg+Re
 KjkNW5dV6q+xZUOYOfKL05BJcFPpkdDJA5Q27MmfxXY1XN0+ccGx6ot/bOjWRLGBtpQs
 AgOwSMdeo1fmZ34n/8EUtI/J4oA8p/m6yl4+Xv5eMWvNsts6NZH3wVoQhQxheMwIno27
 0NZsh4hMRyIlLnsmTV1QZ9ZK8fryK4JoOJ0ZK8KBzQdbR6KS16Cl7a2X2ufKBV2sSQoQ
 n1JA==
X-Gm-Message-State: AOJu0YzP/3E4c5pRvXc7E4by2ljtTxmJRvIKLzT/6x2C3MKdB2IwcCeZ
 Sct+JJqjz2JZsTR2SHsAGwBVZKROznC74BZ0Plyho2SA/RCq9BJn
X-Gm-Gg: ASbGncsFEKpHEB+SLTtivuHcBTHY1FHjvRExDUUSIoQgtUOEGWYCq3vnruFoOg8fAiq
 b61FpXOjcWV1x6Yvww+SAb7ExphIh6jTyRQ9czpM/TNMTRB2oxCITe86/auGt1yY3YFkPF+MvMO
 Nc8gsb9gxieLHJlLLNZTG+h/XTGyn6QX+BfhNohM8h+Q8DUonwkHVL2Jyz78QZR/+MU+EjQiQtb
 Tnc7AceCSe8RsYnCrteRNUBgTEKN63/2vtTMPNvKkutU4isMgnNK7Y+KioDVom0scWITvePXv2h
 0hgQiX68j55KPzi5Pnjoq44fHgZELrheRJzcvcdRYGwWxA==
X-Google-Smtp-Source: AGHT+IF8L17vBaDo66fasMWl6iiHkxzIXdBOdv+IvwdgmD89ZI0aTDkON53jTbr9t1d4zfPaflVzqA==
X-Received: by 2002:a05:600c:4ecb:b0:43c:eeee:b70f with SMTP id
 5b1f17b1804b1-43ceeeeba17mr82834005e9.24.1741719718920; 
 Tue, 11 Mar 2025 12:01:58 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:e969:4b33:5aa2:11e7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cfcbdd0a7sm64617655e9.11.2025.03.11.12.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:01:58 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: christian.koenig@amd.com, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 Arunpravin.PaneerSelvam@amd.com, karolina.stolarek@intel.com,
 jeff.johnson@oss.qualcomm.com, bigeasy@linutronix.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/ttm/tests: fix potential null pointer dereference in
 ttm_bo_unreserve_bulk()
Date: Tue, 11 Mar 2025 19:01:38 +0000
Message-Id: <20250311190138.17276-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
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

In the ttm_bo_unreserve_bulk() test function, resv is allocated 
using kunit_kzalloc(), but the subsequent assertion mistakenly 
verifies the ttm_dev pointer instead of checking the resv pointer. 
This mistake means that if allocation for resv fails, the error will 
go undetected, resv will be NULL and a call to dma_resv_init(resv) 
will dereference a NULL pointer. 

Fix the assertion to properly verify the resv pointer.

Fixes: 588c4c8d58c4 ("drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index f8f20d2f6174..e08e5a138420 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -340,7 +340,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
 	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+	KUNIT_ASSERT_NOT_NULL(test, resv);
 
 	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
 	KUNIT_ASSERT_EQ(test, err, 0);
-- 
2.39.5

