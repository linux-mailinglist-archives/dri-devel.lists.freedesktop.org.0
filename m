Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A29A31E2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 03:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC6A10E340;
	Fri, 18 Oct 2024 01:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J0DaNpR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFC710E231
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 01:16:44 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-7b1363c7977so155816185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 18:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729214203; x=1729819003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L+jeEzvzeBO0CSepYbmjdJpmL4Dx0CLgyilp0Lr7mac=;
 b=J0DaNpR/Wv1RSPsA5ilT8UAMPE8J+BJcZd+cFkLp9QqymSf4plnyhezIZTFMva9ifF
 3xMUmvUuFahRCRg2DyOoQBjgS+4Oebs252kBqxm6BVM5Y0WIgaYGMEZAvbeq9lahEae4
 KjHy2h9A4Af5luLqAf1u+LmWm+Oc2YiQ+kgFxhVgxkfjo2SAORB1CLfCuen7woyr44P4
 1QVL/LMYlnv4JmT90/nxzFvWqQ1UlfiqluicBoeCLeryDSZUbkTSji/QUTZwAyttGC5p
 A9FNCNxLp2wYdTlvBpmyKF9Wz1h3+pjJvFDxNysDKtJAjnZCg1XyMY2q2ad1vUh2xd2N
 blrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729214203; x=1729819003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L+jeEzvzeBO0CSepYbmjdJpmL4Dx0CLgyilp0Lr7mac=;
 b=Hy511sYHUUKUNEv5P+B7BPzxP0PKAbBWCIERgzraoo6tCFqD8pQsJIrU/oq+Bbz2IB
 VLP5BxO9yTlMZbm+tM/oeEnAkEXsFGgOgfXRAPg8YjZm0pQk7SzhSn9cDtcdIVexOAym
 ytBuvA+tzoh2pELwtpk0QKcE2Mkx/EjqQRLvWeElHdtOIFL9RMRjMHAyWBkm85jrBumL
 bmoBtU4me5nFLGMuVE7NFANc0lEghnuAsKeQqni2Ukjnk6BQi8ZkSmakGTt6kk/MpjM1
 JbqfLMc4Gc8Ps498T+/NC36+fi6IRTWLRyTKKum2XqzrK+Zrf8Z87mHJ6bJ1Y6DS3/cr
 crQA==
X-Gm-Message-State: AOJu0YyTadV+9AtXPVb14418jizEri9MCiVQ7/sJoXe34m/v3OD4Tw9N
 UWYcJPN4zGyhBd/vjtEctGo4Ohl6WZAT2OFefoiMAMzablmAT7ba
X-Google-Smtp-Source: AGHT+IHHFnNKX+aO1kFP+z5fdwNhVe0jV7E5UYmQLhZyHyGqgaPqopnARtqKFCzaWvPE4BOI1xJEnw==
X-Received: by 2002:a05:620a:1995:b0:7b1:50a8:3394 with SMTP id
 af79cd13be357-7b157b7d45dmr85250685a.36.1729214203021; 
 Thu, 17 Oct 2024 18:16:43 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b156f9858esm24367585a.40.2024.10.17.18.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 18:16:42 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, simona@ffwll.ch, alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, zzjas98@gmail.com, chenyuan0y@gmail.com,
 Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/exynos: fix potential integer overflow in
 exynos_drm_gem_dumb_create()
Date: Thu, 17 Oct 2024 20:16:05 -0500
Message-Id: <20241018011604.24875-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Zichen Xie <zichenxie0106@gmail.com>

This was found by a static analyzer.
There may be potential integer overflow issue in
exynos_drm_gem_dumb_create(). args->size is defined
as "__u64" while args->pitch and args->height are
both defined as "__u32". The result of
"args->pitch * args->height" will be limited to
"__u32" without correct casting.
Even if the overflow is quite difficult to
happen, we still recommand adding an extra cast.

Fixes: 7da5907c84f8 ("drm/exynos: fixed page align bug.")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 638ca96830e9..de2126853d2c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -337,7 +337,7 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	 */
 
 	args->pitch = args->width * ((args->bpp + 7) / 8);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	if (is_drm_iommu_supported(dev))
 		flags = EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
-- 
2.34.1

