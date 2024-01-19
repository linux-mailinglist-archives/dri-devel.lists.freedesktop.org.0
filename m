Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68E83261F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F310E983;
	Fri, 19 Jan 2024 09:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8957810E959
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 03:34:11 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-6d9ab48faeaso84913b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 19:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705635191; x=1706239991;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wEILTqh/RXJMBB+YR36HUlkVGyOVde6YUHPbxwHA7iM=;
 b=mXkcQIlnPYmCh2Bffd8SwgPOsiKnZWBGA1FLHLX1p7VzIUOqCWm8Zae2TnYhSe+hAF
 DeyLtyZgzA7QUT+H07hS7S1nAqDunpI4kFe2clptNnC6YsG95Xb+7ktVd7CF5GBNsFKT
 8STp/NQ5p3o82t4oKQho2D2XSlKNhyU2PZPlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705635191; x=1706239991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wEILTqh/RXJMBB+YR36HUlkVGyOVde6YUHPbxwHA7iM=;
 b=vwAfTBk4EEiUSW921l3ZI27XRcLm4IGEn7QXD3jsTasKTDDHiWcmfKlAH90+ZOPl6S
 N85ou5/BjTI2IFbXVuHdV58ijm/c0wjC+KDCnGuGG7ix1w+R7HyCwsbhe21de1/jlFNf
 eC4j6uJu9qipRfh8ZUXN3JDcf1n9f9etINU5Hg095GP4Lu0DS0G1C19Y7vQH5GjlULSB
 lz6wbA5a/7qb5lEjVik2FE508yDz1+zJ0wz4d02uHUfxDe3Ji9bxLbgKbwAnwIi26bRo
 B1jXUii2AWlISablI/vS2dNBiR9Jdmb6WB5Zuhx3SGd1aWM4igzJ68faVB4WvGHewLMk
 W+8g==
X-Gm-Message-State: AOJu0YzAxQq6cJHkCN906s0+t8SSWGJ90llMayP5BHM0rfCYFykAfJQv
 +JZTgkgmHaQe/REIYtfhcfgaVtOkc+lpzcVCLJUmeVPHBYoXyNJu3OFtURE8u/koxaCymjxq24G
 6Trkp
X-Google-Smtp-Source: AGHT+IEFxeuO/fG6ld/BUBm6Yi4OVDK+ZMfI8nq9gNKpyVBzwG2r6sD51jIADODKtdwQtKWpJQbJlQ==
X-Received: by 2002:a05:6a00:db:b0:6db:936c:aabe with SMTP id
 e27-20020a056a0000db00b006db936caabemr1077205pfj.2.1705635190937; 
 Thu, 18 Jan 2024 19:33:10 -0800 (PST)
Received: from localhost (60.252.199.104.bc.googleusercontent.com.
 [104.199.252.60]) by smtp.gmail.com with UTF8SMTPSA id
 q16-20020a056a00085000b006d9aa04574csm3990493pfk.52.2024.01.18.19.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 19:33:10 -0800 (PST)
From: Tommy Chiang <ototot@chromium.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: Add syntax highlighting to code listings in the
 document
Date: Fri, 19 Jan 2024 03:31:26 +0000
Message-ID: <20240119033126.1802711-1-ototot@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Jan 2024 09:03:38 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Tommy Chiang <ototot@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch tries to improve the display of the code listing
on The Linux Kernel documentation website for dma-buf [1] .

Originally, it appears that it was attempting to escape
the '*' character, but looks like it's not necessary (now),
so we are seeing something like '\*' on the webite.

This patch removes these unnecessary backslashes and adds syntax
highlighting to improve the readability of the code listing.

[1] https://docs.kernel.org/driver-api/dma-buf.html

Signed-off-by: Tommy Chiang <ototot@chromium.org>
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..e083a0ab06d7 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1282,10 +1282,12 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
  *   vmap interface is introduced. Note that on very old 32-bit architectures
  *   vmalloc space might be limited and result in vmap calls failing.
  *
- *   Interfaces::
+ *   Interfaces:
  *
- *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct iosys_map \*map)
- *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct iosys_map \*map)
+ *   .. code-block:: c
+ *
+ *     void *dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+ *     void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
  *
  *   The vmap call can fail if there is no vmap support in the exporter, or if
  *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
@@ -1342,10 +1344,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
  *   enough, since adding interfaces to intercept pagefaults and allow pte
  *   shootdowns would increase the complexity quite a bit.
  *
- *   Interface::
+ *   Interface:
+ *
+ *   .. code-block:: c
  *
- *      int dma_buf_mmap(struct dma_buf \*, struct vm_area_struct \*,
- *		       unsigned long);
+ *     int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *, unsigned long);
  *
  *   If the importing subsystem simply provides a special-purpose mmap call to
  *   set up a mapping in userspace, calling do_mmap with &dma_buf.file will
-- 
2.43.0.381.gb435a96ce8-goog

