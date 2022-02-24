Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46574C38EC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FF310E841;
	Thu, 24 Feb 2022 22:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89E010E841;
 Thu, 24 Feb 2022 22:43:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s13so1824707wrb.6;
 Thu, 24 Feb 2022 14:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWKLMT4aebSJWW8C7UiCQ3/EbG02GUUsHveIfrNn2xE=;
 b=hm/yI1Cy2Kc8mLeeLsOCHupF1kEHeji6XjXMjWyWbiitXdcqzotkVsqhN+bU7+hwc5
 t/Jct+cxOWL03KF/nmu3K5nzMPMgen47vrPBS0NpiuJd/X0wuYF5NXJZvIQIRiPt2m2w
 t2heHb5g/O+V72fy/UUlcjmfXgRF1p8E3GHQEcggq0h2lJaFK8l+BwBN9SYa65n/7a0w
 2C53p+XtaPhGaJgtIquK/MEhhm+6m50rt73HguwdIImHYO/TW5gJo2qec+hnLWvUZBh3
 2QRVv8+FfvYeIyvjXTU9Cn8tYpHjqa6RN24Eips/xUqhHgITJM9cj76iUEBh5xuAIJv1
 Izig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bWKLMT4aebSJWW8C7UiCQ3/EbG02GUUsHveIfrNn2xE=;
 b=cg0tBzl96ynCaQf0y8qEpzCalGCIkmWoqvTeEbW8nf2nVFq+GnETSJ9ty4cks/zTVV
 W7eS7BIktZfpB2jp6JQkBtYvHI4zn0mHQRjb0mCYGHoNWmJ+gQIRu5sGUIlaUl0v6hUv
 6c/pRkjsjJkZVBYrNqM3Ms2HxlPDSoFs35iGfkEuy/e1P0YEXCe4qt+ts0xm2S0MTOh6
 CPWmo1deK2SPsPKq3g16yUfvdxkn1N5gN0TpW0TT3ZcHVXru3JC7TOcqV73BKIcoKxma
 5fEJVBk9H3xDMjutajtyr3dsStQDCS5z0UMwOExAyj2oByNRmNBmhmOe2RT0pSUB5F3I
 suMQ==
X-Gm-Message-State: AOAM531J4Xj89zV4j+xTkpDEgygbuAq0zC+y2VgY9NYCAikqKRLbD5NL
 GLxW0FU7bRxaw9eiyW/5n4U=
X-Google-Smtp-Source: ABdhPJx+iF7F/adABVhKlAG8I0mrA22SnXPr653iA75eyj2+GDckFVmGWApaNaHjkGCuXsZThToCeQ==
X-Received: by 2002:a05:6000:2c4:b0:1ea:910c:151c with SMTP id
 o4-20020a05600002c400b001ea910c151cmr3801018wry.92.1645742597131; 
 Thu, 24 Feb 2022 14:43:17 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b001edb61b2687sm736421wrt.63.2022.02.24.14.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 14:43:16 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: Fix missing assignment to variable r
Date: Thu, 24 Feb 2022 22:43:16 +0000
Message-Id: <20220224224316.149704-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the call to function amdgpu_benchmark_move should be
assigning the return value to variable r as this is checked in
the next statement, however, this assignment is missing. Fix
this by adding in the missing assignment.

Addresses clang scan warning:
drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:168:7: warning:
variable 'r' is uninitialized when used here [-Wuninitialized]

Fixes: 9645c9c9fb15 ("drm/amdgpu: plumb error handling though amdgpu_benchmark()")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index 3136a9ad2d54..bb293a5c6fd5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -163,7 +163,7 @@ int amdgpu_benchmark(struct amdgpu_device *adev, int test_number)
 			 "benchmark test: %d (simple test, VRAM to VRAM)\n",
 			 test_number);
 		/* simple test, VRAM to VRAM */
-		amdgpu_benchmark_move(adev, 1024*1024, AMDGPU_GEM_DOMAIN_VRAM,
+		r = amdgpu_benchmark_move(adev, 1024*1024, AMDGPU_GEM_DOMAIN_VRAM,
 				      AMDGPU_GEM_DOMAIN_VRAM);
 		if (r)
 			goto done;
-- 
2.34.1

