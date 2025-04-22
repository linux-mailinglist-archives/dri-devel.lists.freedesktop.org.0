Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6008A97552
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 21:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C8410E39D;
	Tue, 22 Apr 2025 19:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G7PODMa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993E710E39D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745349590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFnYA+dIxtEPuPQn/ih3spX47Xz49Ahvw2hkrVXiNR8=;
 b=G7PODMa4A+K8j4IRsvEcXpLpcONMsSiZrGza7qMn54ckffoRa6QKeKSslkM9Lg/l0gDd6N
 RGnwj3zuDBXsgF+DtpDbMWRrF7hAY9DcfS5+bVjFQDtvBbbqzhr98fZNtEqje2RKvnwuIW
 sh5ghI5Nvq3Di9xyd0HAQiPKiz/0QJc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-6_pUTiGwOfKTbyxmlmjDhQ-1; Tue, 22 Apr 2025 15:19:49 -0400
X-MC-Unique: 6_pUTiGwOfKTbyxmlmjDhQ-1
X-Mimecast-MFC-AGG-ID: 6_pUTiGwOfKTbyxmlmjDhQ_1745349589
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-47685de2945so97973701cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 12:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745349589; x=1745954389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFnYA+dIxtEPuPQn/ih3spX47Xz49Ahvw2hkrVXiNR8=;
 b=DhI7xb52olssM0vy8r955+cidwdRsm5w4QusoEopLbxl00mMUEaBKnfC3JBXgl+/9a
 rv7d/kOQBXbDmmrpDSiKUrOyWyxR2lNkXFBtV940SJMDyizuemSwa0ff9U73EzCPnSbf
 IdkjOgQAbmRxi5nHuYClJsHG0F6QpcsYI+151ma1JgumXTJ8SssPIBvUYxSBFUyiAb0X
 Omy0qjW2Uz27JUujCtDDCMnfXt5er+YU60oD02q4slBbbgYbkXrnBuOIwHhZAGsQ9t20
 9ucEfwCER9PyKkxt59+vf8g3nTuM81kYkAOhncL5VTkpDr2yvrQOFbJiUFylEmJ2wDeB
 nSNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh9JArs9HPjxQB2ylUFTREjNqhr1ByX9FaYYt6oghbSazkrnDt1p6zLlyDxeN+0vjfOL1pnzZ1sWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfDU3T2DJnZ2cNar5NIQ/jW/tffOAVn27TJ9L4J+7sxGlAnzXo
 OJW7+XWZhOJ9Gwm5Du5gCxT6xk5sHGx5LiaDnRdLN9qEbO16eiy4RHzcLjDaX97bzUu9GOlXnjm
 kCEGeRfxAmk5EyO7P2ld8FKmP3idWCVt027s5UUIhuG9S40F6DJK5/OMuY+cu+5pSNrOkJ/Kihw
 ==
X-Gm-Gg: ASbGncuj5owraVXKX4MlR0wEEprwJEjOv0wtJBARxuYlnfWrOgwu+cv1VEiG9TS8mG+
 65eY0Q5FMYggkxDDtiBUr2m7xunn8CeCBFb1s9AiDEoXi+daTuUHo0hyn4rFZuJG7D3t+yrBlJC
 KbKEJBdhpgFd+NGwUUOl29Unopmx6vX+vR7aAyEgstvR0QJ62ofdZrC6a2ohl/87Jc2eLGSNqan
 a0/V00ef1mezDFcoXdMy9x/4fTEP1cpmO+aWOrCLrLOJTuy40X18lZ62iVjxlWhPYjrE4sWW233
 0Z9HFjKxNtehWUrYDoC3awCtfru1bN8K6zufZwQjZg8=
X-Received: by 2002:a05:622a:1388:b0:474:fc9b:d2a7 with SMTP id
 d75a77b69052e-47aec39a3a6mr260841491cf.6.1745349589060; 
 Tue, 22 Apr 2025 12:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrsCIWzV36zFufAhZm9wW5P3gFY7s9s6X7f7vuJ7WpFXp1y42n/eSX7UrEzezKD5JlUheTtg==
X-Received: by 2002:a05:622a:1388:b0:474:fc9b:d2a7 with SMTP id
 d75a77b69052e-47aec39a3a6mr260841241cf.6.1745349588771; 
 Tue, 22 Apr 2025 12:19:48 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 12:19:48 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 22 Apr 2025 12:19:39 -0700
Message-ID: <20250422191939.555963-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422191939.555963-1-jkangas@redhat.com>
References: <20250422191939.555963-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OThv89M5TyLaMXIE4ydZaZ6A_k48ej3MjMvafvHlIaU_1745349589
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

The CMA heap's name in devtmpfs can vary depending on how the heap is
defined. Its name defaults to "reserved", but if a CMA area is defined
in the devicetree, the heap takes on the devicetree node's name, such as
"default-pool" or "linux,cma". To simplify naming, just name it
"default_cma", and keep a legacy node in place backed by the same
underlying structure for backwards compatibility.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++++++----
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 14 +++++++++++++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..577de813ba461 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,10 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..83f3770fa820a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..cd742c961190d 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
+	const char *legacy_cma_name;
 	int ret;
 
 	if (!default_cma)
 		return 0;
 
-	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
 	if (ret)
 		return ret;
 
+	legacy_cma_name = cma_get_name(default_cma);
+
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
+	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
+				ERR_PTR(-ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0

