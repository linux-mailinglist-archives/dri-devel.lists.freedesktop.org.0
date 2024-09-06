Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1596E69B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 02:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA0A10E7EA;
	Fri,  6 Sep 2024 00:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FTLK/QUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E77C89453
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 00:03:33 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2058456b864so23229535ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 17:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725581013; x=1726185813;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lb94RnSDbmLGLcyEx39Gw1x8H5QxDPdWSPxan+FyvB0=;
 b=FTLK/QUd4xXqQX4MGihBbC0QqiXc678okeGIHyZkKHz0YI19WHMlaAXUFuf20hNIdc
 wzhM7Rtv4Q44Rdlkt+wnfcn6R2rHUAAARPPjAQeW+iXSDtbXxrBBHMGV4wKwkY83kx76
 Zp3akfxmrY6LuST/J7mRBQ8g77vgWZ/h7QPc18UaYcYj2RM9tOw3AtYJfWFMkvbBhT6u
 HGM1mldSIXTFSlPqACJiJQYkYw+o+9trrLIVxx23HhDRqDZAglPovgfm7JtVtGItdyYu
 9QWb3GyCYfWyBmGa69oYnAC7jmvsF+0GhA3IY5nFaTqKeqk1PkTjtebfnxIzaLBdh9ao
 Vo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725581013; x=1726185813;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lb94RnSDbmLGLcyEx39Gw1x8H5QxDPdWSPxan+FyvB0=;
 b=tC4bgxMt2iH3Yt9odf9IRyhRx7uv24AOu+KhHwxOt7x5UC6HSAAAKRpLcBzvQ+RSdl
 WKhUw6SQJKN0zICX0oUSKABG9IhAD5cNqwsOxbEZ4vKbtyXC60xbgFSDAvN/WU14sUdT
 +SyXmh55rOgeanX/a8tcpE+ubEVMu1X5CJKlWby3UTOKd3n5UMsyB54aWAVMS0DAr9ty
 6iJ4I+W1pOHhVmZC2QrBc8VxiGgBgMCXK3dBN8LQAhYmSODtzJDo8jcAZDnvbA4/Ixa6
 VZZVKcFOHis4XatoNNMh+yJJzJmo1fkrAr/vwpTR5jDBQQNxHPRCTVj/NFB8x9pTRB8G
 lZzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi0HwlQhU1BvGoI4RxPXkWyypRn8kuojGk/bSnA/lloCFcWG024vJztw8AfAO54krAwzRbYQd24bw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweAnk7+eKP635N/4paCCBSrBz/4zfG9UGyk2+4e893z7UeBsAr
 K6V/kj8CdM9Yyz0hphkrL7pkAUKGzUE5ANtIcThvwh/7RBhj0wtevK66t+RuzaunIJS5iK2A+Du
 wCSM7isP7eiB1Jg==
X-Google-Smtp-Source: AGHT+IGRECBEERbLSskRzYgPKP8c+xQVePlIpPB7xS8H6FIHSZLW2hXff4BteDxNIf99GTAFfJ41K18bV+IfaxY=
X-Received: from tj-virt.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:902:d2ce:b0:205:799f:125e with SMTP
 id d9443c01a7336-206f0622e71mr203235ad.10.1725581012511; Thu, 05 Sep 2024
 17:03:32 -0700 (PDT)
Date: Fri,  6 Sep 2024 00:03:12 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240906000314.2368749-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: heaps: Add __init to CMA and system heap module_init
 functions
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Shrink the kernel .text a bit after successful initialization of the
heaps.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 4 ++--
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index c384004b918e..39c1e533a2f2 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,7 +366,7 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, void *data)
 {
 	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
@@ -391,7 +391,7 @@ static int __add_cma_heap(struct cma *cma, void *data)
 	return 0;
 }
 
-static int add_default_cma_heap(void)
+static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
 	int ret = 0;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index d78cdb9d01e5..26d5dc89ea16 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -421,7 +421,7 @@ static const struct dma_heap_ops system_heap_ops = {
 	.allocate = system_heap_allocate,
 };
 
-static int system_heap_create(void)
+static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
 
-- 
2.46.0.598.g6f2099f65c-goog

