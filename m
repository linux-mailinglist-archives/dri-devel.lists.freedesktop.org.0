Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A49EAFCF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8B610E87C;
	Tue, 10 Dec 2024 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RoQuCx/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C59D10E69E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 09:49:35 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-46769b34cbfso5489291cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 01:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733737774; x=1734342574;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3Tsa9g564W559Vpb/AnoUfrIQ3XajXQIt2s3wRsgwk=;
 b=RoQuCx/ZFzuASbO4RRxOgvf1ps2173hhP5Km/Je8864BcopRc6tFDDY0HY9l7QxUYR
 AYSXt4QS9Momgf1bP9iJNUzT8AEOa8k4UyDMqnQ4yyxY0BGv0DQ21zvWS/g5JzKtI5gE
 rhonUehKYxklp3MwuC1Dwak0K6SvZAlafujl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733737774; x=1734342574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3Tsa9g564W559Vpb/AnoUfrIQ3XajXQIt2s3wRsgwk=;
 b=qf/dgm/mALxA24wqNwtHoIFF5sI9N6vVw7EV7GqZ1AD8G/qVXmRKLUJvcA3iy7ETd1
 tgb05+xVSOGhzpY+10dQaX8UH0wmoAhpbzPlRZxUAA81EPvCEOoF9TEZF0IY2qgOXO+S
 ZS4no9QW3AuqT56Uso7cOAr425Npqd6CPn74Iyj11R3/PFu0Qsd80zK+tVMdX4I19T+J
 RAp/0sLsLZe3W634/Kau0eU3b2BsQzQrbZwH4oJx3Tq/CdKMsHdvLS0vDdzyPwh0Q/pO
 sE5VvSsfpdU4lHnT7rGqyQXlfgCPLFPKasQfdtK+1SgYyx0QiON/7MslUwtB9zNacY/k
 wEVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPKHsMqvR2AY9/SVh6fMmOKcXLfEGiEp3Irhxjs4ebVm+UkniOP9lWoiqax4yq/FydXA5utVc8ZEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/OA9u1UlAPzDCzq22iis5GcgXZ7XodetCPSriJoRghLLvQA7w
 +dKgyl6zWn3mf6xbVnj/JYzxNPPKWjDfgM8M7BjC75ihT040Jnn9ZDKrkhaHMA==
X-Gm-Gg: ASbGnctsO8dE1BiOxs3u5US+oKgV4/SXISwltq2a//TRGTKacJ4XBMBlBLv/Iux3EkG
 GmZ9oGjtmEUojYpU/5mokqx9d91JTtnzptUBY9OGGHeBftYWt7P5zfMZ2KKqRiec4SOI67y0Bxk
 I348CF0RUndeIISyJ9Or5DkiDq6s1f8EnHNuUZ0vadwfK/T3AZGqpG3YR1+GhNKZOxFKdEw2K+C
 do4Cf82lwFvQw+qvyIpfjs3sG3noFCnvs05BPnWgmGv3x2ZGupwzf5shfVKiQpW4ygIu0WnR4FK
 mZs=
X-Google-Smtp-Source: AGHT+IGmY9glarrXNarZaAo9mWvdbYU7LPRt4v3eMj8NpeG7c1QvpqnB5GcbMm9FjHW0BzZ2wvAZkA==
X-Received: by 2002:a05:622a:15c9:b0:466:9938:91f3 with SMTP id
 d75a77b69052e-46734ee9e07mr201445901cf.49.1733737774204; 
 Mon, 09 Dec 2024 01:49:34 -0800 (PST)
Received: from photon-dev.. ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6d2147ff2sm128409085a.70.2024.12.09.01.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 01:49:33 -0800 (PST)
From: Ajay Kaher <ajay.kaher@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com,
 christian.koenig@amd.com, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com,
 Ye Li <ye.li@broadcom.com>
Subject: [PATCH v6.1.y 2/2] drm/ttm: Print the memory decryption status just
 once
Date: Mon,  9 Dec 2024 09:49:04 +0000
Message-Id: <20241209094904.2547579-3-ajay.kaher@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20241209094904.2547579-1-ajay.kaher@broadcom.com>
References: <20241209094904.2547579-1-ajay.kaher@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

From: Zack Rusin <zack.rusin@broadcom.com>

commit 27906e5d78248b19bcdfdae72049338c828897bb upstream.

Stop printing the TT memory decryption status info each time tt is created
and instead print it just once.

Reduces the spam in the system logs when running guests with SEV enabled.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 71ce046327cf ("drm/ttm: Make sure the mapped tt pages are decrypted when needed")
Reviewed-by: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # v5.14+
Link: https://patchwork.freedesktop.org/patch/msgid/20240408155605.1398631-1-zack.rusin@broadcom.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ye Li <ye.li@broadcom.com>
Signed-off-by: Ajay Kaher <ajay.kaher@broadcom.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 91e1797..d3190aa 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -90,7 +90,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 	 */
 	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		page_flags |= TTM_TT_FLAG_DECRYPTED;
-		drm_info(ddev, "TT memory decryption enabled.");
+		drm_info_once(ddev, "TT memory decryption enabled.");
 	}
 
 	bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);
-- 
2.39.4

