Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA9A5FB05
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C2610E33F;
	Thu, 13 Mar 2025 16:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jOhDKNWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C752310E33F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:14:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso10722615e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741882485; x=1742487285; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/7iciAKS3QF0Rjid5oBOozUpBYB/1kUNlh/Uit+k5yc=;
 b=jOhDKNWXFQl0wkwMHdQwHdM+mPscUFyFapC7dFs/BQfBiJ9gIWNcHB1z5/262/arKB
 fqpcXFf14Gp/2I873A45Xzw4qV4IBj9vpCrvw2gZKCOkpgwTjDTigXs9LpSwqtbHQkoH
 2LEtE0or50EKSxja5Mg5naQD7WezCqUw5slz5Yuua0TyArACeAs24W2WrV5E5I/AbUcE
 rw+7GoZ638R/BmGcHsPp4j1f+V488AvZPuyZWQEyTFCcCQrof21FQloWT/1dpOrIt9l0
 UE94vXuJSluZeP95tp3QMwRf8faBCeu8Fq6lA8R1AcO1nlvLY627CwoDBqhK1ccOboyB
 R9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741882485; x=1742487285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/7iciAKS3QF0Rjid5oBOozUpBYB/1kUNlh/Uit+k5yc=;
 b=cXdfZjbI/KwqHfIEUfjH9m2QRF4SL/fEt0wmIBM8zNQn9s+aKhcrOC0inNAjKcJYVJ
 eddKMlpnFMYzXHY1bzslPGghkOuNmTlmCCLLENN8t3eFlYbCNpkOifcdjKPSOFypJLV+
 WMJrxlmGHEog/f35/T2Drcr+zlLuWI9H+1rZwMgxX8EFW80JC9+8L3N7SOdnSE28ipn3
 mqVd+mLiTOfnZZ4egO9vhXsmdxRV1dJlTadrUA14XiVGb+ifzvTPU9x4/mE+iOxAL6uU
 pdjYdh0+frwNhPbD0ccdY2xlLZ+v/uy1Vqr/B4D5LxBXx8WnJ45fvhuUm3Za9LWb23MZ
 /Bng==
X-Gm-Message-State: AOJu0YyXqH8QzNRrWaUvUebb3X3b9YsFquf9RoXqioKfB0HW6bk2imco
 qUkVcNyfR+JVxQL5MLMK1d5e22J7NVwWGZv2tExW+XyZsjxOc+LFuUR1Qg==
X-Gm-Gg: ASbGncutedhBWPTJ7VwpneylpdS71bfg6gsHE0dhkLLv4iiwAPMPBGZT4gCj5nQfzkp
 sofiuiaLPU3KNONtdRFkwvcRkMA5/VuKXdMa8l8i82kTu4SZcLZvrMnLziyzJs3HsZLZ0Emevyq
 ogRXG3OuimwZdrV/c1xUA9GFBy2GYqVU+k7h0hvA/vLcg/vqfxD8QshHg6pPnSVwIrwHb4miRgF
 XA/D0SWVqC5vrx09aiMXAKkuDq2gS2in7HqEosZDJDOp4x+PxtKnRgdNkKVcstmdtguAp4GGHrF
 HWVfs3lQP8hMFJ8I7Uzn427TwqjPeWeDkU+APekoW/W+Ow==
X-Google-Smtp-Source: AGHT+IHXAw3BfWqOXz0Wo0hoZ6qISw2lxtxABE9KJ5Emvwop5XDdhFITpSqR7vJSKMaMzhuVEZocjg==
X-Received: by 2002:a5d:6c63:0:b0:390:f6aa:4e7c with SMTP id
 ffacd0b85a97d-396c210606fmr178125f8f.28.1741882485043; 
 Thu, 13 Mar 2025 09:14:45 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:41ee:4f4e:e8e9:935f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b83sm2664465f8f.52.2025.03.13.09.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:14:44 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: christian.koenig@amd.com, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 Arunpravin.PaneerSelvam@amd.com, karolina.stolarek@intel.com,
 jeff.johnson@oss.qualcomm.com, bigeasy@linutronix.de
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ttm/tests: fix incorrect assert in ttm_bo_unreserve_bulk()
Date: Thu, 13 Mar 2025 16:14:24 +0000
Message-Id: <20250313161424.10688-1-qasdev00@gmail.com>
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

In the ttm_bo_unreserve_bulk() test function, resv is allocated using
kunit_kzalloc(), but the subsequent assertion mistakenly verifies the
ttm_dev pointer instead of the resv pointer.

Fix the assertion to properly verify the resv pointer.

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

