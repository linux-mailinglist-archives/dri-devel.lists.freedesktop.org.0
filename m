Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1502A972F0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D7410E2B7;
	Tue, 22 Apr 2025 16:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FXTWhlre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6568410E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745340138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
 b=FXTWhlreQXU1PuuV5DKtt8pxF7PG4uDCR1H3RbyG6Q4+kKKR5EAoeUWT6y0WOXPg7AViad
 7jMbJ7jVmXqGgCd0SUs735G6RCXHR0kNxYM9fEmDbEfFWwDp/laz05hNsgc1Imr85vXlbq
 Jb/bsXi2TF9DDnh/bo+FXOiZlY3BFTo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-Q26R_ISHNXm9gJ04w7HmgQ-1; Tue, 22 Apr 2025 12:42:17 -0400
X-MC-Unique: Q26R_ISHNXm9gJ04w7HmgQ-1
X-Mimecast-MFC-AGG-ID: Q26R_ISHNXm9gJ04w7HmgQ_1745340136
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso98306216d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745340136; x=1745944936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
 b=vo2WDRuE52/8+B2ClQM0UvstIV5lxL4HeA+GQQbROOHHi+uE6fNGbHVugR/vFO4Apn
 yKAtQvHUBQC+EMipBIcYPEwzzGntnWA+WiLZnxl5hA9XybUgxGzMn5cKZRUtztW+j6pU
 NxqgpWkmdfu8nVvCI+Ptasc1Pl8zQACGhG23morlOIOns2aKfaChgxgPxB7qi+Mdo/Ih
 FrQB/QUR9Imz+rFzVJ5wka9RvSc/KhlxkaVpbI5LrH2atTXWxS70a4ijyPjk8hRs/qs/
 RHUWJGChQroVU0yEK/Tc6WFBIU/wPzFeqB3eUrUubQFmGrilEVy2hxnJK7i4eV2AbwHC
 seeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAPN635qGMmZnnocZyuKr4uSZDCx0R6FM7ojVyp0EsBRFrdLIeCXguGiy2jq6dJl1iNvvHlR+rZL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4kZ0dR8dIArfml4xBSY674LUPqfrGG7TvTAYWxMlzzrYiPU13
 jrJFBk+BO9qHzejrAiWrm0yCGozSzNRv2rVJnB8nxr8P7X62ZLuY6RCBWE07B97StxR9Mmn/Z8r
 VLzl+jnmhD/POY9QOOi6/arS5hghtzVFlCANNxRqCM1I4HuQnN/dVpkY++mcbgkXi2wTZucLAdA
 ==
X-Gm-Gg: ASbGncvzjYQK09UcP2xzUbQOCoNtb24fAhKFp3woh6zsuXi6aL6f+YNrKo+e8eRieR0
 nNNpPnZKGbZkuAhRFMdKIeaEXPyu68xB2AISgVh2LzMZn9mOY1L/qgq1gxuPDBqk8apQl8Q0iaU
 fqAEtjLFbklZGVGSofLMT1rexPfz3xCDU+c6Fe+5NFGmuZVUeChBLKdKMXT928rhh7/Ffo7g7FT
 Z3WMnAchiz1oQMFRhEB/fJSPnf8oQc3CeDYyuWuGFYps6vGx8qnMIdIIT4alCHVIiCxBXHIkwXj
 xev8+lf01wlpY0XVFSGEJ+Ph8aB1oEirQvK/TVyQGc8=
X-Received: by 2002:ad4:5b83:0:b0:6e6:5f28:9874 with SMTP id
 6a1803df08f44-6f2c45020bbmr281212046d6.2.1745340136428; 
 Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhkxVwuhOpuvq8AHrvgiI5QWqG6hL6givDMi15YOYCGirBK6AgyVMwswxh5i/TmbGi6XhlcQ==
X-Received: by 2002:ad4:5b83:0:b0:6e6:5f28:9874 with SMTP id
 6a1803df08f44-6f2c45020bbmr281211806d6.2.1745340136156; 
 Tue, 22 Apr 2025 09:42:16 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 09:42:15 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH 1/2] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Tue, 22 Apr 2025 09:41:47 -0700
Message-ID: <20250422164148.547798-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422164148.547798-1-jkangas@redhat.com>
References: <20250422164148.547798-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I2PjLCiuN7J6467GMEQ8RXyKgNft7g08lv-BBM0pXVo_1745340136
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9..e998d8ccd1dc6 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,17 +366,17 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -394,12 +394,16 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
+	int ret;
 
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+	if (!default_cma)
+		return 0;
 
-	return ret;
+	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	if (ret)
+		return ret;
+
+	return 0;
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.49.0

