Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1C992733
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D21210E31A;
	Mon,  7 Oct 2024 08:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JOHlrfxZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C2E10E31A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:39:26 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42cba6cdf32so41606985e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728290365; x=1728895165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kgqgUblZEOn6S4lzBI2hhbB7tsPXrcoYH8WdcFD/Ebw=;
 b=JOHlrfxZfT+KQkSQ86r2HezX4htHTUejwD6PEEQW+rWwcwaIjCzx0tL4w333xRhsX6
 NxaxNJcXlMpjMfU/CkTX8DXDrlCJbiZlNb3vbpmsTm0jEiEDsC7eEuPrJ/NT1NCgD5X1
 Y5lukx7pjhY0Zb+vwYrliNlsaUIBG0XS/9Jh9cWDZpfgvF72j1vE4chEPorwXS+Kk3td
 D+RxF4e3c3VCpnDG61rE2hHyLb7OLxU8fNSyTZA3hSrY3AdP3q5Tmo+ETYBmF7I14oXz
 uCCV8YYvdmdkSOx9AqDKwZinDR36xmft+OjKky6L+rmDm/xK5bdaP5cYmKqmitvUu9j7
 lFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728290365; x=1728895165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kgqgUblZEOn6S4lzBI2hhbB7tsPXrcoYH8WdcFD/Ebw=;
 b=nmgM5zj//w8LeXVVj2pO0fH06bcg/k4nRpJcOvNvy0P1aCl4B2JDoGGlCYuKu+LZX2
 05QBKvRFFVDDMp128CCUrGay8JqjOvTQyFyDDEb+RFljg+QW/yGG+0ougjJnPK3Hsa/h
 Q/dWXdD4QMOJnmXlT+eZxZC4ZNIDvLctvhk3tPUvhmRAp9jjIi0WTYRiZbCRG/9GhPmW
 IlJ0cB9oQwaPmkUdnM02VUMDFUdlX+ShQPvJIvFOt7xlNDiqI+0BsZYuUQwTiMVrJBCo
 pfKCp8t1q4UdjpGWg8ua8mjp8do0/dwv7DWR4Af4JmFNbYFtJMVzpEl1ciqWJdgF1HEq
 x0+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbspOYeYScXfap6+mok2qbS63Y5g6aYPQa9xJvbn9QRHth0b8hgKsTCpcTXvnM7vDEjB8vcbl015w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLDyrCaF2kJO6n7wD09cdsawyfRZsQpr1/Y2a0LffJnsXMH2uu
 iyd5OU6AHmhJc/9HBhm8hQiGnfFYn2E7flGd0NckthpYdX/tb8gx
X-Google-Smtp-Source: AGHT+IEsRghjNhCM57yu1Q8QL0Y7ELKIyN1xZmdPSv7iNm4czQBnmoO90GoyuU+ZJy4nV4A6UNbbxw==
X-Received: by 2002:a05:600c:468f:b0:42c:af06:718 with SMTP id
 5b1f17b1804b1-42f85aea086mr78623355e9.28.1728290364933; 
 Mon, 07 Oct 2024 01:39:24 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89e83356sm67968385e9.3.2024.10.07.01.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 01:39:24 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: Use atomic64_inc_return() in dma_buf_getfile()
Date: Mon,  7 Oct 2024 10:37:52 +0200
Message-ID: <20241007083921.47525-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use atomic64_inc_return(&ref) instead of atomic64_add_return(1, &ref)
to use optimized implementation and ease register pressure around
the primitive for targets that implement optimized variant.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8892bc701a66..a3649db76add 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -558,7 +558,7 @@ static struct file *dma_buf_getfile(size_t size, int flags)
 	 * Override ->i_ino with the unique and dmabuffs specific
 	 * value.
 	 */
-	inode->i_ino = atomic64_add_return(1, &dmabuf_inode);
+	inode->i_ino = atomic64_inc_return(&dmabuf_inode);
 	flags &= O_ACCMODE | O_NONBLOCK;
 	file = alloc_file_pseudo(inode, dma_buf_mnt, "dmabuf",
 				 flags, &dma_buf_fops);
-- 
2.46.2

