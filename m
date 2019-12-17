Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED4123567
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 20:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DB76E0D1;
	Tue, 17 Dec 2019 19:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E47B6E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 19:08:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x184so8084296pfb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 11:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=M6ODtAK/kSPelKWo8qlr9AI1paG4/5fDCdQdMGc8cow=;
 b=ZZTVTJg+L/PA6VmNqIt/3FCmTOg4djZsQiSvscUk3zZc5nQjBWomowCzIXvBlzUXNd
 mxj6r/CCoBn8hRs9dEO4PnnnM2thQdnOs2ev8XTLU9OTaRdpbbxn56TudNEblGV0SMyf
 5oaI2e6PKqeBpqrvW8nbu6yM3lY36oKKVE+VAGu4W6eAaoqAa+NnNVEHDE+jMgrysBL1
 L384H7mgWGRUH4ry94uE7pU1QHSEFMwP/vPmNGoFWLr7VuKTIBXjoTMMDoWdksJ7QKzZ
 etwMVRDuZDwlHtviWS2hmKY5uTqNt0BwulsdGwsWvZh8toG3F/rqoOGhedu4VQrZjq2f
 OnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=M6ODtAK/kSPelKWo8qlr9AI1paG4/5fDCdQdMGc8cow=;
 b=l1u0yXccFhgqUdzposNgD3kYL9b0HfYFPfgSg40sbZVUyxsdPpjUZuovDFotV2C3Nu
 L2TM8Qk15gVxbvQAMPpmyq0UM2ULbBIA4KoVKA96rfsi1TPQsEtT5YC/Wh9FmY9wZHDX
 E6uc11cWDm7Pda03bUPUTD6lucYTauW7R2SKGgV39CcvrNcckfUW16HYJ+JtR7fovnlz
 lVBM0iSL7Jh7lSyaIG+9jESx4ViQH4kHgPXnX2vIjWjLVu/uagjbkLAE+NHthUgZFxG5
 GDz9OizVWrXGY3uGnPTsb+DPMoMQnDdy7jxLm2YdUUb/RziabSfmOTRrKPg2yqQyXXlO
 oNTA==
X-Gm-Message-State: APjAAAVJMyb/BMn5LRu+TnSwxpt2wK8Dmt3VunB4AJa3tz8ZNi4ydMHH
 Rr8x6RsFDGBobm5cgOvwC4pXJA==
X-Google-Smtp-Source: APXvYqwwYwEW8UujHenDnM3HGny/IvVE2Z/yHHlmaPBn+WxMZ+NHOf6z5+i7m2NFWdAv96HkaHfebA==
X-Received: by 2002:a63:f743:: with SMTP id f3mr26884769pgk.28.1576609728600; 
 Tue, 17 Dec 2019 11:08:48 -0800 (PST)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id 12sm1697085pfn.177.2019.12.17.11.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 11:08:47 -0800 (PST)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: sumit.semwal@linaro.org
Subject: [PATCH] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
Date: Wed, 18 Dec 2019 00:38:22 +0530
Message-Id: <20191217190822.1969-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.18.0
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
Cc: linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 zhong jiang <zhongjiang@huawei.com>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhong jiang <zhongjiang@huawei.com>

Fix the following sparse warning.

drivers/dma-buf/dma-heap.c:109:14: warning: symbol 'dma_heap_ioctl_cmds'
was not declared. Should it be static?

Acked-by: Andrew F. Davis <afd@ti.com>
Acked-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: zhong jiang <zhongjiang@huawei.com>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
 [sumits: rebased over IOCTL rename patches]
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 1886aee46131..afd22c9dbdcf 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 	return 0;
 }
 
-unsigned int dma_heap_ioctl_cmds[] = {
+static unsigned int dma_heap_ioctl_cmds[] = {
 	DMA_HEAP_IOCTL_ALLOC,
 };
 
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
