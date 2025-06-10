Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0EAD386E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694E010E548;
	Tue, 10 Jun 2025 13:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YCknIPAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A553C10E553
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749561169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PECxVyikQ9zU3hJ7MtiQUOf3zC4eClOuuMti35ulFIo=;
 b=YCknIPATYGcDCupirDj9gZR4XOtXHsWh71ewJJZBP84dBhNeYIlkdpL48IohV2+1i7n5N3
 OX77WvTqQBAw+ao7R4o3n8RkDKRPdM65SZFvYk2aSPISkQU1C7MGunNXJs0sWVU9xAF3MB
 mv89LwiMc6QivUM6jzWz2NssR1k/C2A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-XbBe8EHTORmh8RSpNxPaHA-1; Tue, 10 Jun 2025 09:12:48 -0400
X-MC-Unique: XbBe8EHTORmh8RSpNxPaHA-1
X-Mimecast-MFC-AGG-ID: XbBe8EHTORmh8RSpNxPaHA_1749561168
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d097fd7b32so1314291785a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561168; x=1750165968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PECxVyikQ9zU3hJ7MtiQUOf3zC4eClOuuMti35ulFIo=;
 b=mM8t8ef1Itav8tT+8pEtcuELUNPFSEDMzqQdKoNKwh49iE4IMG+3e/8UStlFC45Pcw
 VAtB8A2Yzotfc0fxbcAABzegsb6KeiyW40Ysu/Zt5WC4LmMl0ja9u6s1JeQOSKjzK+7v
 nWcPdyZEzZDd0i2C2URPHKdd37o2ryZ5vKOXyYhwDhArt28O941dWdN03ta85TvmyIb8
 ZYGgfBZSjMuLlESDH4lOGrvKGxwdnNdJZoWYo+McuOsjzr9/Uni/Mrias6XoQl3DVyyz
 vIIIYL9DdYu9FQJogod8TDo9K6trDNMRkgCjZgSVlntlS6ffKBk8thyPlN9Y6P+mLP7l
 JbrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAtba34LyrofzQRT3Bvqy5/tm2Sm3CIU8FD1NAJRSvev4AY5pyCpdWyjt++IzGl4OT5lhqHBxe2hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8PfOtu45wLpd9jnq3qULXPjjdwXulENQ/ABnMuCmlZT354Duv
 aGcrVU9IszLFT9IE8S6Yp3lYuaQIJavD1hZcL4zs0u11si0Dxp9C24QCi2ZaKODPDHaAiThZdym
 2solBWXoKCbWaKufBblXDDkA39tu/tXuvTHSF83aOGqqbO5dCeC3pE9k0Kp8b6rpUrDlEIFa6rt
 mwIA==
X-Gm-Gg: ASbGncv44tKvPxIa/FWyK9E5mNLZcxwBHyie3U/pFu+jqq1x7NJe+ke1pfdzl9VSxur
 DVkyYbH24c+nKX6BXus6Cm4DNZkjINkSIS2HVWj41D/XhZ1daaUwOItuBo5dwd8vM9H1LSHdRzT
 /JFxLEiej6475fjCJOvx6eiDh1vMsdFrSe/vCQ21ThA98yvfjyBowJo42Y9iv8TBASuCi1wUALc
 iREcaVQ+hWIFpJmN+d3lvgne4bf+f02Wy7MCCRK1G/sTNihi9occMfkQIt2rGu+4C+HlfiRzeSi
 aBFBvlayGD7h+sHG12/32kPE7ZjimR4JY//WYQPHMjlE+2swm0wD+Q==
X-Received: by 2002:a05:620a:454b:b0:7cc:fef2:51b9 with SMTP id
 af79cd13be357-7d2298ec18fmr2737089585a.52.1749561167964; 
 Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5bCzCA/Bb8gTxULZZifA/R0afXX8wGKlcmbzwfFYe6YdDUcmddGY0FzDv8nfqETa2Ner9Hg==
X-Received: by 2002:a05:620a:454b:b0:7cc:fef2:51b9 with SMTP id
 af79cd13be357-7d2298ec18fmr2737085985a.52.1749561167617; 
 Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 1/3] Documentation: dma-buf: heaps: Fix code markup
Date: Tue, 10 Jun 2025 06:12:29 -0700
Message-ID: <20250610131231.1724627-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wpu_8wRKg2V1cmrl9j4rbgcfo6ZHvhdzSV7Y9fCgo1w_1749561168
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

Code snippets should be wrapped in double backticks to follow
reStructuredText semantics; the use of single backticks uses the
:title-reference: role by default, which isn't quite what we want.
Add double backticks to code snippets to fix this.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..23bd0bd7b0654 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,7 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
    might be called ``reserved``, ``linux,cma``, or ``default-pool``.
-- 
2.49.0

