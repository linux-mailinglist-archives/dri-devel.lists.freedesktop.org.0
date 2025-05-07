Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD9AADD2B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 13:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518A410E390;
	Wed,  7 May 2025 11:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D710E788;
 Wed,  7 May 2025 11:22:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso45904275e9.2; 
 Wed, 07 May 2025 04:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746616925; x=1747221725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZWC9bs3J+fotQKN+Pvu1nWrnqjUtpAFHf8gyq7Cydsg=;
 b=k8VRgzetAcXnZQRrxvQeSTEpNyWNaXzPwcxXLKLMR79zNKe7BQOsdRyok1ZRgnOKKo
 4r8tq97rqLCtyNdeHImw+drN4BxGlmxq0WIB0axK3j/EL7q0+wq8xsVHnoFQndNrxTmK
 Os32lqZIx7DCbqy9ZWPzzMPn4/oSJv9XhrduJKjFqHxryRYENISJ9uZMa/ekUt+Hvxo+
 WI886z5Hvutu+XURVQgB0HT5KKiKR0Telk29FJvyueORIr1QVWTNQqnOiGDgr2g+gwnq
 FyFqwpbwAoR+uH4+i0FiqmKAndj96rsAlshqfOiCAXBZA+7XTjYwsmppqKhXHHnsJ5Jt
 0jZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHP4eypqr2QvdweVrbYjWkT9tUpD29reYMo+NtJbIxH6E4BrSCDwuVdgAS8ehPmXyjxZVGiwK8sg==@lists.freedesktop.org,
 AJvYcCW0Ki3MW/eEJ5SxTIBJcWw8kmxhVVEM6Gx93tnUs3gTydhApN4OWgQtuW6pVCf5P98m7yCe/rwH7Co=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmD7I+/ANlDu7X7di87Xpy8e+TQ7Dlv3cUN7lL8mPlkx/e4fMo
 OjxxhmUgou1ZX4BIZEVi0O1+9p5DdjYIDOIdTgw1/HOdrY06VEkujjxnXA==
X-Gm-Gg: ASbGncsk+M8SwOO7ujcQhUuDIRmHakKvxNAQGOzTYjpCWIAdmWyK+2ny8suqp+wbrG3
 krqVfr86yI0iCcAQcqL35UGZxP9cCZiYv0w2Kn4SbqKNkFFFaJMo9mFrM+yUzyZf4Avq7cUsCd6
 eWsULY6MBzquj3LV48dR8KnuRhxLwbFFtMH+NdsbFxyIi4HDzss1h3p+T03/YY0tEVJaHietInp
 0+zfIT0TWXFw8OFyU1nkvoJwdR7edAxuXFDOerEGelF84LjyWoqz72PpyrOZ6u3FgMHflPg9XM6
 8JvpczQD67xwLFF1R7pprNmF/DsaLKD7VaOMXecx2fAh35sIkcyDdSx0weDFLzloDGFXnAXYDwu
 3wQ==
X-Google-Smtp-Source: AGHT+IGRWvY8rXW6dhn155ZAXsXvmGuf7LheNdjj6dzmGatIJg0UzjRGoVu2EsyA9CH4JuUihSF83g==
X-Received: by 2002:a05:600c:35cf:b0:43b:cc42:c54f with SMTP id
 5b1f17b1804b1-441d44c4642mr21809675e9.14.1746616924512; 
 Wed, 07 May 2025 04:22:04 -0700 (PDT)
Received: from ramallet.home (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d43a802csm28373955e9.39.2025.05.07.04.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 04:22:04 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: Fix flush sequence logic
Date: Wed,  7 May 2025 13:21:30 +0200
Message-ID: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.49.0
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

We should be comparing the last submitted sequence number with that of
the address space we may be switching to.

And we should be using the latter as the last submitted sequence number
afterwards.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..865b07b14b38 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -347,7 +347,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 	u32 link_target, link_dwords;
 	bool switch_context = gpu->exec_state != exec_state;
 	bool switch_mmu_context = gpu->mmu_context != mmu_context;
-	unsigned int new_flush_seq = READ_ONCE(gpu->mmu_context->flush_seq);
+	unsigned int new_flush_seq = READ_ONCE(mmu_context->flush_seq);
 	bool need_flush = switch_mmu_context || gpu->flush_seq != new_flush_seq;
 	bool has_blt = !!(gpu->identity.minor_features5 &
 			  chipMinorFeatures5_BLT_ENGINE);
@@ -399,6 +399,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 			struct etnaviv_iommu_context *old_context = gpu->mmu_context;
 
 			gpu->mmu_context = etnaviv_iommu_context_get(mmu_context);
+			gpu->flush_seq = new_flush_seq;
 			etnaviv_iommu_context_put(old_context);
 		}
 
-- 
2.49.0

