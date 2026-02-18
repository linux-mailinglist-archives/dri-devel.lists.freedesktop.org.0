Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P1xNaDzlWlTWwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825D31582A8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35B210E60E;
	Wed, 18 Feb 2026 17:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LVoseGwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0B210E60E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771434909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWROfJdWhlgxA5rcp8Pj9VJ7m2fa4/nREAlFrPf4oa8=;
 b=LVoseGwjGSUFoTo+psWxjBXrerlEpDnrpun6ZHv9M+ui5Z+MWfRysODzPxag7AoE6aUP+3
 4aG3Ctwq81t4war0uYmnz+9lIrQfPn+Wy/wR1yuvICgIoKVGMsTbIURMS4/4LLw+OekH1u
 WWLbhvhtg18Zqwm4ufeTUClTuppWbmI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-5D3suLDYP9W71KRG0SLWnw-1; Wed, 18 Feb 2026 12:15:05 -0500
X-MC-Unique: 5D3suLDYP9W71KRG0SLWnw-1
X-Mimecast-MFC-AGG-ID: 5D3suLDYP9W71KRG0SLWnw_1771434905
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-896fb2fb9d5so2778676d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 09:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771434905; x=1772039705;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RWROfJdWhlgxA5rcp8Pj9VJ7m2fa4/nREAlFrPf4oa8=;
 b=M4siIt0A2xZSsTGoQ0Eiz1sl/c+phmJ6d4Q52DH+YzHQDCSqDJV7dJpbXq0PbVqJ38
 8lTdqxeMQPZG1r2geOTtpLV3+nuAPsCOsBUNbWL4L/THBWqNzxR5YJtRw3pKIgEROjLo
 iVV0DeEbxdzihs6VIrdxKX1PKtRhej4nSiINP4RvEZPC7Q03F8B4ZI9a5LqIrAtin8ul
 RKYoK1brCSJwbGWcEWCE8OUh7kXg1ro9ELGclKZ0hfmkUXC5oRlLaff2YEx0F+TOSrg1
 tK1HnHO4qJESpPFMCCu4hR1YDwdMxM/fK62Qwvhp24wxiDDfsnTWKMbIZsR3QUj1jMXD
 0g9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtTEsTcVYfZ5fsFsiD6MPToIf+oZSSnosjgOY4Gi8OuFFX7C46A04G7NSvSJi82M+O0BdRl2OArb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWaRQmR1emSrZWm6CZlkTz4MLofAf2KsDni74Any4ZhbV1Jy/v
 OoQNPuj2CLvquGyOso5s5w8a+QS99o8ostJ3SYvF32LybY5VUjJ6RDgsF8SfVQfeZcnWcSXP9uD
 kXlisxI6MLySTO/cyUHK/7g+Hb9wFGinCW8Powa5VfgRKUWKqSN3oS7SF+RMy8aX0thpw0w==
X-Gm-Gg: AZuq6aJ1FnQzg/3XDsO3DMTxPrC81abNO75coFnkd+ic0oLkLUbUafX6GFGdVO6E/BL
 OmAHHJlEGUk5lFqebvHiNpUKd5QX/i+kgMlFKkjW3yB/PXYdnbY8/AN+nZCiawhhHXKG1IqpLp+
 D1B84AJe21TZyCRMnt6wsgsLim0CcxI4dBsAuq+GwWT9+c/0OocfNleBJbFXaGNkM9A896ljwjK
 7mu8YlCz779MwgyNdu9C+kV967S8Q3GGzSAtjJ8cs3XoZBWUByiYLRnk3kjk9EwvTHtLk9hU0WW
 W4jOroK8CW9QpVa7uGh7rNn3AOPSFFhdvTFGezf7UI05TRE2sYs874/QhW4AOUI8vXP94NGKv9h
 xe8l2BYVUHiDjqhTrdemoBVfwPDs1DNCEixBoKnGMpnr+YborjYTOeezJ3jDh/BE=
X-Received: by 2002:a05:6214:5194:b0:895:d652:e3a5 with SMTP id
 6a1803df08f44-89957fd539fmr37373516d6.23.1771434904524; 
 Wed, 18 Feb 2026 09:15:04 -0800 (PST)
X-Received: by 2002:a05:6214:5194:b0:895:d652:e3a5 with SMTP id
 6a1803df08f44-89957fd539fmr37372786d6.23.1771434904004; 
 Wed, 18 Feb 2026 09:15:04 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971cc7f82csm195307856d6.4.2026.02.18.09.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 09:15:02 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Wed, 18 Feb 2026 12:14:12 -0500
Subject: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
MIME-Version: 1.0
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vkjx2lrclLoiAaKimIG65h5Tgsx9j9rtZSXcH9lB4ms_1771434905
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 825D31582A8
X-Rspamd-Action: no action

The cma dma-buf heaps let userspace allocate buffers in CMA regions
without enforcing limits. Since each cma region registers in dmem,
charge against it when allocating a buffer in a cma heap.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -27,6 +27,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/cgroup_dmem.h>
 
 #define DEFAULT_CMA_NAME "default_cma_region"
 
@@ -58,6 +59,7 @@ struct cma_heap_buffer {
 	pgoff_t pagecount;
 	int vmap_cnt;
 	void *vaddr;
+	struct dmem_cgroup_pool_state *pool;
 };
 
 struct dma_heap_attachment {
@@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
 	kfree(buffer->pages);
 	/* release memory */
 	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
+	dmem_cgroup_uncharge(buffer->pool, buffer->len);
 	kfree(buffer);
 }
 
@@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	if (align > CONFIG_CMA_ALIGNMENT)
 		align = CONFIG_CMA_ALIGNMENT;
 
+	if (mem_accounting) {
+		ret = dmem_cgroup_try_charge(
+			cma_get_dmem_cgroup_region(cma_heap->cma), size,
+			&buffer->pool, NULL);
+		if (ret)
+			goto free_buffer;
+	}
+
 	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
 	if (!cma_pages)
-		goto free_buffer;
+		goto uncharge_cgroup;
 
 	/* Clear the cma pages */
 	if (PageHighMem(cma_pages)) {
@@ -376,6 +387,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	kfree(buffer->pages);
 free_cma:
 	cma_release(cma_heap->cma, cma_pages, pagecount);
+uncharge_cgroup:
+	dmem_cgroup_uncharge(buffer->pool, size);
 free_buffer:
 	kfree(buffer);
 

-- 
2.52.0

