Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D798FC143
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 03:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9CA10E669;
	Wed,  5 Jun 2024 01:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CqW6hx6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887AC10E669
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 01:26:29 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2c1a5913777so5040005a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 18:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717550789; x=1718155589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RUIjL2bB2TqpHtA3OGdQJrt/bxd1bdS7vuCMFqU7/Ts=;
 b=CqW6hx6S7GbVHJudmWFCOMyououqUerudeUeeeyhtxMSSMJHZiZezrJ0bP4J4GXVpj
 cXlWdZjJi0Fz4Z5Nz2lfTn+XYG2QmPF43RuHD4ewKWjnK+JY77bgHgA+xr1vox1k04jC
 3lJFcfO7PFcEhR7PURModtY4LwgrSn+HACUFT1q34+dffQEnWYYPn5esVbkZSMSpLlJ2
 PfYvkH5amdnq7ztuXCZrLZycvw++BUIxnmdc+Lll7Aryh0iX4sJWmIJWG+BsJlw46anW
 vIUOBN/PachTFz5tnSvXovN7R3PXVMZkdOqQg2lECZosM72hEaIFAiHZ4co/PUe1Py6U
 eOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717550789; x=1718155589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUIjL2bB2TqpHtA3OGdQJrt/bxd1bdS7vuCMFqU7/Ts=;
 b=R9ynbSOQkSdmXvVjZHOHCDmg6DaIDL3va35wdNpqCM8+dK31sw/4tuSWee/BIhgZ8E
 tyTASgZAJqH0I3jGcN5mz8b/DJdLQgd0bhkMumATmH+m3i6irJ53fkmaX9L374VeZYqO
 JJ0WibI/I1IYFHePjBCShn4P6jxtASkZvRn377vorr82VLBEDdTk72yZxArcHD29NNX7
 JDq/gHgPk2TqIpwjT9XmeFTc6jNB8corPD+peiErQ3VQT84zTWGpSu+4uPU6OeydU8SA
 yibsJRu+LlP4vfzhKHUEdEktHUSVCzH4h8ochYmuPaJ2eec2YH/Sk4ld/OxOBaAgBV0N
 KWfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyXTXUwaSv61A14+KVIXCBFC6nj7ndpQ1bEiEQ5pgZJGsTOwc+DeTcefkVBZ44WhbzJk0JsZwPbtPfHSebwRA64JAjuLdm8+kT9/1J/6eA
X-Gm-Message-State: AOJu0YwNymnfCqJwljuwgdifgQVN3pgDZrs8yNW7Czm/0wZb1JGB9sLB
 o2qpmHiUYWmh3u+23KVeF/vRZ2S8BaKcojhjQPJIH+zEyYCxtxoE
X-Google-Smtp-Source: AGHT+IGuTZCyKrper2d0FzGSQcG256xnePEMwZfbyz58T1ZcrICBdGuafuNDPsQyZ8zq1/vaVlDFFA==
X-Received: by 2002:a17:90a:ac0d:b0:2c1:c648:1c50 with SMTP id
 98e67ed59e1d1-2c27db16442mr1073954a91.17.1717550788575; 
 Tue, 04 Jun 2024 18:26:28 -0700 (PDT)
Received: from barry-desktop.hub ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c2806bd8adsm174203a91.39.2024.06.04.18.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 18:26:28 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jstultz@google.com, linux-kernel@vger.kernel.org, tjmercier@google.com,
 v-songbaohua@oppo.com, hailong.liu@oppo.com
Subject: [PATCH v2] dma-buf: align fd_flags and heap_flags with
 dma_heap_allocation_data
Date: Wed,  5 Jun 2024 13:26:05 +1200
Message-Id: <20240605012605.5341-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Barry Song <v-songbaohua@oppo.com>

dma_heap_allocation_data defines the UAPI as follows:

 struct dma_heap_allocation_data {
 	__u64 len;
 	__u32 fd;
 	__u32 fd_flags;
 	__u64 heap_flags;
 };

However, dma_heap_buffer_alloc() casts both fd_flags and heap_flags
into unsigned int. We're inconsistent with types in the non UAPI
arguments. This patch fixes it.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Acked-by: John Stultz <jstultz@google.com>
---
 -v2:
 collect ack of John, thanks!
 refine commit message;

 drivers/dma-buf/dma-heap.c    | 4 ++--
 include/uapi/linux/dma-heap.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..2298ca5e112e 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -50,8 +50,8 @@ static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
-				 unsigned int fd_flags,
-				 unsigned int heap_flags)
+				 u32 fd_flags,
+				 u64 heap_flags)
 {
 	struct dma_buf *dmabuf;
 	int fd;
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index 6f84fa08e074..a4cf716a49fa 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -19,7 +19,7 @@
 #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
 
 /* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0)
+#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
 
 /**
  * struct dma_heap_allocation_data - metadata passed from userspace for
-- 
2.34.1

