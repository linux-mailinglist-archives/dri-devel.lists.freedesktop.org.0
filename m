Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A876CAC1487
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686410E706;
	Thu, 22 May 2025 19:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mz75HEvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6F310E706
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747941305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6N8riCiMdEu0kVFdl/5VBbDqLppN8ZtAWlw8HDr1aA=;
 b=Mz75HEvX96Nh4C6RFZHhtn4Y0gk4ey7tUJ6glMzv2Y2QlP+fmkbB4Hk/7UpPnqzGr+e2Nh
 Ca8QNXvxusgbT8wXlAXCGsiShUbYzTj7ZIXpypaPOBBN8d/xfE3jKE5CRkweM1ZDDiMhNF
 s70Ax4O/Bh8kMD9duLH9KyMxQB4dMbQ=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-ixJ-9__RNNmqDwRK-JObIA-1; Thu, 22 May 2025 15:15:04 -0400
X-MC-Unique: ixJ-9__RNNmqDwRK-JObIA-1
X-Mimecast-MFC-AGG-ID: ixJ-9__RNNmqDwRK-JObIA_1747941304
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-87be36b096dso5264399241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747941303; x=1748546103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z6N8riCiMdEu0kVFdl/5VBbDqLppN8ZtAWlw8HDr1aA=;
 b=mR9heAo7NtW9WrYKndpI2upEaKxRvuDPGuo3+pXpMheUIF/ITYz/Y2eJznkxJ+hUvC
 MrMYhUGIE9jCPtkR4kLpKWwswBAQQt3Sq5zAF97RRRnunZGgkE3rz6EIsImtWy8BRX/z
 2851fni5PoNcmEMKHubGE93UzsmN2GaBSGRg8byjr8qLHw/73FrAxkD3xrRFe6rbzJZf
 19wysH/spgIGm5RneYKeCd6HEin0p7CgHREJLWUNpPQyLFYNIMoM4zftf3nh0T8zobHl
 ovoD19CuKqHr9kCgFtZ0eXJlth1fhYOyEr2dM+WIGEiquj31nGIemqe6/FbadCjrIe/e
 wdlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI8E+EHuoTJQN7OWSJJZAUkq8KGK5Q94WAxAZb0e/cPJoJ3eRk8iBcZKm0J/8ay6BRtgQF+7jp/YY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGL2KpvnSSEaQ2AVGefTeKVAIidcwcj6P27vURhsxYDI0BscbT
 eo8gbJ0iZkuNO6MZ/WWqWVk6g0JSeZdxNFxLCkXokYnn3ssOOh3PpeUe7VZPVkyuPZ+ulbmdnRx
 uENAnsAaEufJLk20lNRBvN3B9+kFyj9ACYnV8hlVoQ6yoAUcP7bWVF1BY01KzIc6z/qwlwfl77O
 pbyA==
X-Gm-Gg: ASbGncuD4vWtHV6Yzp+Z8b8T39rI4pHQd/7h5Uj6Mg8X3umfPEKCl/R7jlPkrZ1htFK
 YOoTG025a6OCBeDqiWtf8C+GYYo7LasrDBWsQ4N2ShY592H8UIwCdW7w4F+WB6fkVZ/HS0+tpNr
 l/potysliVEw9+iDJN8G4O2FMg7KDnEr4mQWwgN7XhfOxw3h9xF4ZF+SHqIckAwJOvYeFyAFIKz
 jTmiqsl0WIbY5tmzOd4OuPWGhB3xYC11y0nHoBlWyPPebrTaOIyzaoU/SaWCvC05ZACrm7uw4mM
 kTHmjOBu7Fg579Wcxq6G8IQ9hthHcvnC01/Zj8OzGC4=
X-Received: by 2002:a05:6102:10:b0:4e2:82b1:eef0 with SMTP id
 ada2fe7eead31-4e282b1ef7bmr14484999137.12.1747941302746; 
 Thu, 22 May 2025 12:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRddDlFxPUUR5F2gsJMHMOPx29VyzJ81B7uxRO7njSdbC+pQOzmu4VMwEnxIQSDZLDU8b5hA==
X-Received: by 2002:a05:6214:1c09:b0:6e8:97d2:9999 with SMTP id
 6a1803df08f44-6f8b08ab1f9mr447262536d6.28.1747941291701; 
 Thu, 22 May 2025 12:14:51 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:14:51 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 3/3] dma-buf: heaps: Give default CMA heap a fixed name
Date: Thu, 22 May 2025 12:14:18 -0700
Message-ID: <20250522191418.442390-4-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522191418.442390-1-jkangas@redhat.com>
References: <20250522191418.442390-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k1QRcQT5ir2oEddSaj8JHKPYHrXiECNtDUQpAGhUfNk_1747941304
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
"default-pool" or "linux,cma". To simplify naming, unconditionally name
it "default_cma_region", but keep a legacy node in place backed by the
same underlying allocator for backwards compatibility.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst |  7 +++++--
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 20 ++++++++++++++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 23bd0bd7b0654..1dfe5e7acd5a3 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -21,5 +21,8 @@ following heaps:
    usually created either through the kernel commandline through the
    ``cma`` parameter, a memory region Device-Tree node with the
    ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
-   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma_region``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..bb369b38b001a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "Legacy DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..dfeccafc6ae3c 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -9,6 +9,9 @@
  * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  */
+
+#define pr_fmt(fmt) "cma_heap: " fmt
+
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
@@ -22,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma_region"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +398,29 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
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
 
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY)) {
+		legacy_cma_name = cma_get_name(default_cma);
+		if (!strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+			pr_warn("legacy name and default name are the same, skipping legacy heap\n");
+			return 0;
+		}
+
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("failed to add legacy heap: %pe\n",
+				ERR_PTR(-ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0

