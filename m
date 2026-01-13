Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0AD1B677
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE00410E54D;
	Tue, 13 Jan 2026 21:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AlF2aA3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB9710E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768339999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1tY2jOzHY+cvWTFhoRqTcHQY4mx0y53P502cs7Wi0g=;
 b=AlF2aA3ghj+Mfpyz1qTUl32W0qRDHTmz95c6OVPC6yrT6heMPhlKegZ5KNJYPVzB/KsO3j
 X4fBW0rEaU1W7b/Xzna/J+gcpCOcwNvFQ8Ed0v4v8abgTvTqIbJBwAEeSDNdmEN4INuLGt
 zsVWffOCcflwbMXR+8U5DQkq3ebYGG0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-PdorEvt0MFCI-v5LE97k4A-1; Tue, 13 Jan 2026 16:33:18 -0500
X-MC-Unique: PdorEvt0MFCI-v5LE97k4A-1
X-Mimecast-MFC-AGG-ID: PdorEvt0MFCI-v5LE97k4A_1768339997
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed7591799eso208649421cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768339997; x=1768944797;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K1tY2jOzHY+cvWTFhoRqTcHQY4mx0y53P502cs7Wi0g=;
 b=H21viPG3ZcBwbGqAsoSbiOIQ7HycyaiRh/ZnTAGlKTuUrkyN1WxFXsyvAqPKTpVAGM
 nZSnOFjFl5W0xXTydztneZxIWNCPNZkrxqsGzwKJw1Jizj3KleFdYex89bhSpAUbDfov
 WP+923AHgSs0NcNkvJMshRafW/qote8STnwUPAf7H5TijaOp6BGFOfwfJ9byKTnrEw+O
 PJdgCu6RcNye6j60ESziRQ5lCGyuEl55xSDDcGEohRCypltwcabyAoTsWaXLhDXiY73n
 5JdfuFja1f5qJUYtvJ60prsq/11h38nAkvtrXAuJmDUwSNQz6Qs4IDXxDvpkSVAnockk
 yu1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4MT6hj+rOfJffCXt/swN4k1V2buBgX/QcjQ6kowUUy98nifJDJxDBE/XWS/1LJbvlH0GwLY8gc64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztZMQ2NfWSiXMai+dWbJLJ0h75JznDPEthDSaDDndK0FlQvd14
 GR29OtDf/rzcxnvdQZgsnXzhVdKHWAW3gMW10mfTbQ34XW8xVsWC6dephcwSof1G4W7QZmQOGTq
 QJNuBWSBF+fEGv2/6jpVeyNq5MPj7ItS5pZiPFcMeW2Gz8HSjvoAX/bwgYcj3jMy+rFpQB4Ou2o
 BCTg==
X-Gm-Gg: AY/fxX7Pu8Sb8SXXZkKOGO5/5zk6EIVjQ64uWpita1cAX9mdY/b21NVG8sUwVR7wVWo
 xsQLqTSncwZPW41BxjPVs577LL47JmHQZrDp0DPvqtIE4PmRLT2vdeBQk14k8EsStd3yuEV2KjC
 A4qeXYz2wrqhB2HNneW62IgX5L9rA5eLOmNT6G6WlNjXHDuFmIk3Idq0H7oX6wf2bybgO7eEHMu
 SRMP7UZDnof1krg0ubeAu7Khi+3ZuHDdXw6CT/lf7Xgn/DdhFFcQXUEVFcgNDfSpyg+W3Oc4leS
 KVZCBGyAKenS5kdJgkeSTQU0bG2r4fTX0w+MBloTn/+GtjPjbuHrLsAY7q2AEtp4GvUCm30Zs2B
 KQUXdWQDAebrHDfNbDF09FOuO1/uF3vGJkP/nkcjZHVA6y2gJSTA=
X-Received: by 2002:ac8:58d4:0:b0:4ed:bb39:9a60 with SMTP id
 d75a77b69052e-5014846b14dmr8396811cf.40.1768339996907; 
 Tue, 13 Jan 2026 13:33:16 -0800 (PST)
X-Received: by 2002:ac8:58d4:0:b0:4ed:bb39:9a60 with SMTP id
 d75a77b69052e-5014846b14dmr8396511cf.40.1768339996449; 
 Tue, 13 Jan 2026 13:33:16 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net.
 [100.17.20.16]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50148df8305sm1253971cf.9.2026.01.13.13.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:33:15 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Tue, 13 Jan 2026 16:32:44 -0500
Subject: [PATCH v2 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
MIME-Version: 1.0
Message-Id: <20260113-dmabuf-heap-system-memcg-v2-1-e85722cc2f24@redhat.com>
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
In-Reply-To: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zvZNsirP2d26xijhXr13HbCRArQkjgxKjNB4f7N-d4c_1768339997
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

Add a parameter to enable dma-buf heaps allocation accounting using
cgroup for heaps that implement it. It is disabled by default as doing
so incurs caveats based on how memcg currently accounts for shared
buffers.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/dma-heap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8ab49924f8b71a0272dc89a609539a429feaf6c8..f72e93cb8367fa196e5b87e762a60463023887df 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -49,6 +49,11 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+bool mem_accounting;
+module_param(mem_accounting, bool, 0444);
+MODULE_PARM_DESC(mem_accounting,
+		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)

-- 
2.52.0

