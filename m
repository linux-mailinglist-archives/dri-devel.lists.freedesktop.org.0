Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFC8CBD71
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 11:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F1210E362;
	Wed, 22 May 2024 09:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SajTCd1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F22F10E3CC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 09:02:47 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1ee954e0aa6so8869985ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716368566; x=1716973366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nLNtBYttVOortE4drZbAdtdQ+c5yWCs8A7f+Kl7W60c=;
 b=SajTCd1jiXEwllBpSMUSkPcDMqVQRnYecH5qu7wfVOyXux+TKrvuBqZzqwaQZZZZh0
 J+yw/D6sWbd3Lqagux9zQr6jIwaJZ6qsbaEdl8qzXksCK/umN/k+g+uJIy/W7s2fN6ww
 kLwtaaw2pe5HOMSYVqZoprQQcqf0xkpeqBWWMLNP2NQL8PxEcesn8T6rZGr+xVCiy5TB
 2q/UGJf7wBUZvW36pRpz2CuUJfZsuoeTc8O+5MYIEbsfwTzKMhDFm+1gBpbgzL0pFtSO
 C/sGy1gsv2vWDXRtv02WnNdLT4mUk61sA5FJXW1xQEbJsSI0hf67f3ayOoFpD3iqthET
 eQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716368566; x=1716973366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLNtBYttVOortE4drZbAdtdQ+c5yWCs8A7f+Kl7W60c=;
 b=GL0WCa1epCTQ/WSDKsSOJ6oVi4m6b0oBQOlb2fdOtILWQN15GHo+saI2DUpaWvQY+5
 chRGP6rlvqawPTWf/Wc4AGKDg934h51jzJGIiWBogUYQI1WeZj2koSmzuabEbM4DThXE
 8l0KUI2CdU6kqOcBSu6fkTs9YGc/4ZSHiDzuC2iV/NXiGZ7r3rIPIfJ7jsYl1kuXoMDF
 eUf3aKmVCICbW3spzUaYKGTdVAWt0ISbZfmDkHm3qTlVv4DaAMTMztKsCRIr/K+iNHFc
 YUl1d0bqK2+2ysOLZJYDbfKBa44WMS0Rpe2/yjlL5bEHTpb02Z/EdUY5NonniTplF9Gm
 /sBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOLDwPM0kYb6X3LQ7+HJSfVSzBYUx96lF+1tbxdyf+kDNyzoEUYgcGgtkgsSryIZrncpRF0JyQKcgYxjneLPZ76HMyoPGMMiyhMVNuClZW
X-Gm-Message-State: AOJu0YyB/GQOCy3KlfMimk92dlXu+VTYJ/NZY5AqYH75joHK2ZApgrQo
 zufiEqqonz1TBYJ4trfH+KwlTQ/r/FjvOo8FyZvbMlgYfwE94GZhvoIG/g==
X-Google-Smtp-Source: AGHT+IF29gJJxooGTt+9X3IuC3RscusZu+sJgvCtr+mjChH43A1gvSfHGvV2d3z6054ZVRbSW9iN0Q==
X-Received: by 2002:a17:902:ecc7:b0:1f3:53c:32be with SMTP id
 d9443c01a7336-1f31c95c225mr15349755ad.2.1716368566546; 
 Wed, 22 May 2024 02:02:46 -0700 (PDT)
Received: from localhost.localdomain
 ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bad819csm235033875ad.84.2024.05.22.02.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 02:02:46 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, Barry Song <v-songbaohua@oppo.com>
Subject: [RFC PATCH] dma-buf: align fd_flags and heap_flags with
 dma_heap_allocation_data
Date: Wed, 22 May 2024 21:01:58 +1200
Message-Id: <20240522090158.121797-1-21cnbao@gmail.com>
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

However, dma_heap_buffer_alloc() casts them into unsigned int. It's unclear
whether this is intentional or what the purpose is, but it can be quite
confusing for users.

Adding to the confusion, dma_heap_ops.allocate defines both of these as
unsigned long. Fortunately, since dma_heap_ops is not part of the UAPI,
it is less of a concern.

struct dma_heap_ops {
        struct dma_buf *(*allocate)(struct dma_heap *heap,
                                    unsigned long len,
                                    unsigned long fd_flags,
                                    unsigned long heap_flags);
};

I am sending this RFC in hopes of clarifying these confusions.

If the goal is to constrain both flags to 32 bits while ensuring the struct
is aligned to 64 bits, it would have been more suitable to define
dma_heap_allocation_data accordingly from the beginning, like so:

 struct dma_heap_allocation_data {
         __u64 len;
         __u32 fd;
         __u32 fd_flags;
         __u32 heap_flags;
	 __u32 padding;
 };

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
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

