Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMF1De58nGm6IQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:14:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9417981E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0568935C;
	Mon, 23 Feb 2026 16:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CfrqWhtw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592AC8935C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771863273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRIkg/BYhLPQ8g8f8DScTuB2QESp5uVFZC6HG+ckSTg=;
 b=CfrqWhtwHwsqlGb9RMyc0jTFj7btcUkY9xetR/GkwXIjksa1bO+iqXWtG3c6nI0mY5P9WM
 RqOICxu5YxO/KcOcoj8E9GYP81tSwbFHhwatpp5idYZcbfxa5OhYTUWiD7XACeuax8UvMH
 HwlY8QQQMw7siRpebRbLesqVEM8NxX0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-RyUO7BKYMZiv-5p4SMkHTA-1; Mon, 23 Feb 2026 11:14:31 -0500
X-MC-Unique: RyUO7BKYMZiv-5p4SMkHTA-1
X-Mimecast-MFC-AGG-ID: RyUO7BKYMZiv-5p4SMkHTA_1771863271
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50340e2b4dfso221474211cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771863271; x=1772468071;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRIkg/BYhLPQ8g8f8DScTuB2QESp5uVFZC6HG+ckSTg=;
 b=uRfDSVEwdz53N0PP6N6Sqerot4NBZvRr9Z6PZTMO56qbM/EyFeJ0zJ1Ci4EWb/OCXf
 fKLEHjOwLH66226hCt3qpFksMIAW0yzyRmtxcb6UXMDMkOSbFxP/rFd/weD270NbsYM/
 z3nO5GfQVOcoBWHuH7txr4uJK+v98HpypcbVJPHcgUjl4P6YrtbfhqFuYT45IK2kULaa
 tsI5sX2gXPjLrQdLqo6PxSxFQ9IpfGsbNGwGl6leJpx5AR1vkuSm7iujEGlduVM5L4vc
 14qs3qSBJn9K2yrHL5YEEpXHHnWUfxGbiGD0tYs3OyBNdVs3LRChJ/HyW9SjkMhTE5sf
 uDIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXok0vc2nT+rMPK/+WwH0fG2Ft7qwXx983P6GMvkWCFBpwUbiIK6JWhbR74EDLOc5mGjUwJn3Ok+Mc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYiqgalx3384k5m0uT83A1Mjx8Uunp2j0wUqlx0FIrk9g3UHf4
 +bP3kvc1l9vwRJYkzjZ98eYKChfNiZGchTL640A3P5SkS11LHqOxq0R1GaxlCh4TLHAkyB79FlS
 wb+BqNRYI/KgMWuS8cQwXtYu5+r8ytlqVRGsW/8QlDMkMKfd6XYMRBTMeM5VSwbjP+KjfXg==
X-Gm-Gg: AZuq6aJnY7YusojZTuiAXaUtuCPx+VRWFsVVZ7YSCbAYHQIPsaepibo66VdX/D9elCD
 5ohyadT7mPPPrrD5O0hVGUQyQmBEmqiPS3a7Q1vXb9/IU2XZxf88bWcxWfEWs84iuc6MJb9ghgH
 NVp27FkhzrmDihL6E26vk7ClIAJ9PcC6U7ztrafxQQHgLZdo8ichmKsvWijepR0CxJNYxfz3ekk
 pvlQrQQH0nmKCjM7zQu6fw5B9RMysmJIKFbtI8pj9niphV/H2BH9Bh7KKMJO60vfhJ6FsXCVN3t
 kGJeKaBzxCrD1JJo/rrUv6aYbCRQmncMHcS0RKBqn1p7fa05qFirwiX5L5URcAP6vBAw3IL1BTM
 A/1tNn9W9MCdZZcOSi3xlfHBafFpVgv6pAEihrU8Ahq3R/fZHg2bL0wuyhdpTI04=
X-Received: by 2002:a05:622a:1b9e:b0:501:17a9:5ff5 with SMTP id
 d75a77b69052e-5070bbd86aemr127615011cf.21.1771863270861; 
 Mon, 23 Feb 2026 08:14:30 -0800 (PST)
X-Received: by 2002:a05:622a:1b9e:b0:501:17a9:5ff5 with SMTP id
 d75a77b69052e-5070bbd86aemr127614251cf.21.1771863270296; 
 Mon, 23 Feb 2026 08:14:30 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5070d6a1ddasm71793581cf.21.2026.02.23.08.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 08:14:29 -0800 (PST)
Date: Mon, 23 Feb 2026 11:14:29 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>,
 linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
Message-ID: <aZxxGNRHvURLXU3E@x1nano>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
 <435330fd-ecdd-43c7-8527-f285c03c6421@amd.com>
 <aZdAOMBRdRw59fa0@fedora>
 <0ff02d77-13e8-4b2c-b714-38037595d535@amd.com>
MIME-Version: 1.0
In-Reply-To: <0ff02d77-13e8-4b2c-b714-38037595d535@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1fdxP3ccAwtQUpPAk8X6gHPItrFqe9_HBLnYQRCsGu0_1771863271
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8FB9417981E
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 09:16:15AM +0100, Christian König wrote:
> On 2/19/26 18:10, Eric Chanudet wrote:
> > On Thu, Feb 19, 2026 at 08:17:28AM +0100, Christian König wrote:
> >>
> >>
> >> On 2/18/26 18:14, Eric Chanudet wrote:
> >>> The cma dma-buf heaps let userspace allocate buffers in CMA regions
> >>> without enforcing limits. Since each cma region registers in dmem,
> >>> charge against it when allocating a buffer in a cma heap.
> >>>
> >>> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> >>> ---
> >>>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
> >>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> >>> index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
> >>> --- a/drivers/dma-buf/heaps/cma_heap.c
> >>> +++ b/drivers/dma-buf/heaps/cma_heap.c
> >>> @@ -27,6 +27,7 @@
> >>>  #include <linux/scatterlist.h>
> >>>  #include <linux/slab.h>
> >>>  #include <linux/vmalloc.h>
> >>> +#include <linux/cgroup_dmem.h>
> >>>  
> >>>  #define DEFAULT_CMA_NAME "default_cma_region"
> >>>  
> >>> @@ -58,6 +59,7 @@ struct cma_heap_buffer {
> >>>  	pgoff_t pagecount;
> >>>  	int vmap_cnt;
> >>>  	void *vaddr;
> >>> +	struct dmem_cgroup_pool_state *pool;
> >>>  };
> >>>  
> >>>  struct dma_heap_attachment {
> >>> @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
> >>>  	kfree(buffer->pages);
> >>>  	/* release memory */
> >>>  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> >>> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> >>>  	kfree(buffer);
> >>>  }
> >>>  
> >>> @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >>>  	if (align > CONFIG_CMA_ALIGNMENT)
> >>>  		align = CONFIG_CMA_ALIGNMENT;
> >>>  
> >>> +	if (mem_accounting) {
> >>
> >> Since mem_accounting is a module parameter it is possible to make it changeable during runtime.
> >>
> >> IIRC it currently is read only, but maybe add a one line comment that the cma heap now depends on that.
> >>
> > 
> > Agreed, while read-only it is easily missed without at least a comment.
> > Alternatively, should that value be captured in the init callback to
> > guaranty it is set once and make this requirement clearer?
> 
> It probably makes more sense to make nails with heads and make it runtime configurable.
> 
> I'm not sure how exactly dmem_cgroup_try_charge()/dmem_cgroup_uncharge() works, could be that it works correctly out of the box and you just need to initialize buffer->pool to NULL when mem_accounting is not enabled.
> 

dmem_cgroup_uncharge() is called unconditionally and checks for NULL
while buffer is kzalloc(), so buffer->pool is NULL from
cma_heap_allocate() if mem_accounting is not set.

Some buffers will be accounted for and some won't depending on when it's
toggled and when buffers are requested, which didn't seem to serve much
use and is why it's set read-only.

> Regards,
> Christian.
> 
> > 
> > Thanks,
> > 
> >> Apart from that the series looks totally sane to me.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> +		ret = dmem_cgroup_try_charge(
> >>> +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> >>> +			&buffer->pool, NULL);
> >>> +		if (ret)
> >>> +			goto free_buffer;
> >>> +	}
> >>> +
> >>>  	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> >>>  	if (!cma_pages)
> >>> -		goto free_buffer;
> >>> +		goto uncharge_cgroup;
> >>>  
> >>>  	/* Clear the cma pages */
> >>>  	if (PageHighMem(cma_pages)) {
> >>> @@ -376,6 +387,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >>>  	kfree(buffer->pages);
> >>>  free_cma:
> >>>  	cma_release(cma_heap->cma, cma_pages, pagecount);
> >>> +uncharge_cgroup:
> >>> +	dmem_cgroup_uncharge(buffer->pool, size);
> >>>  free_buffer:
> >>>  	kfree(buffer);
> >>>  
> >>>
> >>
> > 
> 

-- 
Eric Chanudet

