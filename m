Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGJ7KR1El2kiwQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:10:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A5160F84
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49FE10E05E;
	Thu, 19 Feb 2026 17:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G9KyqO9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BFD10E05E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771521047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ufSHZcVh+Dpk6NOIfY9tkcU2Fx29sq1FQcHOa9iMf4=;
 b=G9KyqO9wZI9mJQAYXngkcgCqisUEXwiaUb2tRvtxb0Co0OFqTXe9Fd39wfQzEic9G8B+AD
 QoJvD4qDQTlqhCBBnqQnkZRQTAzfsIFJDwHp0Kbdn5GrmXswC9OGG28YNjSd48ms6q4Y/F
 Iux/9fwqKbyKFIHVDKukDcpUgpQwItc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-VV6uy6UMOW-Kg41FIDb1Hw-1; Thu, 19 Feb 2026 12:10:44 -0500
X-MC-Unique: VV6uy6UMOW-Kg41FIDb1Hw-1
X-Mimecast-MFC-AGG-ID: VV6uy6UMOW-Kg41FIDb1Hw_1771521043
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c71655aa11so1166428585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 09:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521043; x=1772125843;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ufSHZcVh+Dpk6NOIfY9tkcU2Fx29sq1FQcHOa9iMf4=;
 b=FP3C2EfookMjTs5RD/B+sYjPaB429kTScbtCmRH5phrSr2pReQAva8gkQzAHfstzBV
 bYjm7gvHgcwPI+L0NWDnuUbyMZo62uxaY7kvLQalrNCl9KvSRvKjuK0rs7d+zNbFj+Es
 3sokKF77XlDhC3jd4q8kMfzqIvsvcBeTfepfolB8nV3NlvHk29OmAok0UqitLaQKFQBa
 iTLZqpJmxMA/EIP1rVSUtTqKIAa5avM9e8CY0ng/UtGdqSixCfwUp4M/7uAaDXdcAhgO
 O6hxdkXXeut7mfidpzo6M/Y//wRDsvYejTHVJBtQyjn+Hds7St2wH81uf0UkOgSigo+O
 RJdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCV9UrT++zGhJseNfFbvZxrxiDtZk6gmBjeSCRt8zjLPmMEudkGFRDyurf+6qnVQpCrwG7b2iunAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLwjpcPbKm36cA9m9UR3YnllyaEmsMWab+PGWOoXKt2uw+9AI7
 GmjB8/51JrES+LT3NKcK7b4MNP6NH+idv9f/TVP2dPHN9ObybMaYOgQA+nt+jXC/7kpEVnv8qzE
 yhDO23FX8tmfRs1DRZrE/qjUDIKqRJUn59j/8ko5nRtDZ4mkhiYpV+ZvS1ZvCXRGvTr3TJA==
X-Gm-Gg: AZuq6aJRJnoIPkyDSsk33QdVptSacOZcHHisjeuAQotLLt6EtiUFXR7mgBnRDCWU+ku
 r7swixqPrR8ZZELsPdbOn56UgCSTkA/psmXZCtcc6O2xSrc4C4biL6dK4znFQjlrPwEGxiZUJsR
 LSWq3WZ5mVemssYtZCNIlYCzn6Jp8eGp3T49mUUa5AXrhXaSs10EwIaUmKrmA4QLIgeC/tEeqP3
 a7/BgZ6+fcQbutzSOT9VwnKmZFt6PrI2U6TPeMeiOG6omwda34XZ4iiyzS/p6rLRNfXoULKECmS
 d+f6OZetAinUATqBVqoO6W6nPaxKnIGarOhsVt5DodAiZ4mqEZIvgRJGHhFwjSgpnw9dgx6UsbA
 iH77qdI3cTe3zEhr1H4cF0npFefAHS6gyarCCnFbO2U05KbpeO6Dp4OJrVXofvL8=
X-Received: by 2002:a05:620a:44c2:b0:8c7:fdc:e877 with SMTP id
 af79cd13be357-8cb740b5c53mr703611385a.41.1771521043251; 
 Thu, 19 Feb 2026 09:10:43 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c7:fdc:e877 with SMTP id
 af79cd13be357-8cb740b5c53mr703604885a.41.1771521042525; 
 Thu, 19 Feb 2026 09:10:42 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb2b0e12eesm2128955585a.15.2026.02.19.09.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:10:42 -0800 (PST)
Date: Thu, 19 Feb 2026 12:10:41 -0500
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
Message-ID: <aZdAOMBRdRw59fa0@fedora>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
 <435330fd-ecdd-43c7-8527-f285c03c6421@amd.com>
MIME-Version: 1.0
In-Reply-To: <435330fd-ecdd-43c7-8527-f285c03c6421@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OUO-UFq6IoB6FtN1lZ1K6BjqZZNdEzRQpXXHCLhepzQ_1771521043
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 099A5160F84
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 08:17:28AM +0100, Christian König wrote:
> 
> 
> On 2/18/26 18:14, Eric Chanudet wrote:
> > The cma dma-buf heaps let userspace allocate buffers in CMA regions
> > without enforcing limits. Since each cma region registers in dmem,
> > charge against it when allocating a buffer in a cma heap.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6a4dca3e1b0a30a0 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> > +#include <linux/cgroup_dmem.h>
> >  
> >  #define DEFAULT_CMA_NAME "default_cma_region"
> >  
> > @@ -58,6 +59,7 @@ struct cma_heap_buffer {
> >  	pgoff_t pagecount;
> >  	int vmap_cnt;
> >  	void *vaddr;
> > +	struct dmem_cgroup_pool_state *pool;
> >  };
> >  
> >  struct dma_heap_attachment {
> > @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
> >  	kfree(buffer->pages);
> >  	/* release memory */
> >  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> > +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> >  	kfree(buffer);
> >  }
> >  
> > @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	if (align > CONFIG_CMA_ALIGNMENT)
> >  		align = CONFIG_CMA_ALIGNMENT;
> >  
> > +	if (mem_accounting) {
> 
> Since mem_accounting is a module parameter it is possible to make it changeable during runtime.
> 
> IIRC it currently is read only, but maybe add a one line comment that the cma heap now depends on that.
> 

Agreed, while read-only it is easily missed without at least a comment.
Alternatively, should that value be captured in the init callback to
guaranty it is set once and make this requirement clearer?

Thanks,

> Apart from that the series looks totally sane to me.
> 
> Regards,
> Christian.
> 
> > +		ret = dmem_cgroup_try_charge(
> > +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> > +			&buffer->pool, NULL);
> > +		if (ret)
> > +			goto free_buffer;
> > +	}
> > +
> >  	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> >  	if (!cma_pages)
> > -		goto free_buffer;
> > +		goto uncharge_cgroup;
> >  
> >  	/* Clear the cma pages */
> >  	if (PageHighMem(cma_pages)) {
> > @@ -376,6 +387,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	kfree(buffer->pages);
> >  free_cma:
> >  	cma_release(cma_heap->cma, cma_pages, pagecount);
> > +uncharge_cgroup:
> > +	dmem_cgroup_uncharge(buffer->pool, size);
> >  free_buffer:
> >  	kfree(buffer);
> >  
> > 
> 

-- 
Eric Chanudet

