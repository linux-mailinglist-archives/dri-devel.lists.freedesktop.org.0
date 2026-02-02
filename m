Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAp2OGrAgGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:19:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F9CE164
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B2910E41A;
	Mon,  2 Feb 2026 15:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="In84fMgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF3C10E513
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770045541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IAa9rUiFokLsL02HcrzVefKkv/ss8oRA4iFHEcIfETc=;
 b=In84fMgEKGKSCjQJ/LP/ecXFZEM9rdl3rBIee+UQCWj2OwOse2K7wC+8FtmovvY5zI4T2I
 CXZUe5HWdaAyV+oEOn1iwEGYjU8R1CCLbCjqSCKfgpBIIcwxdyVYA8EnHnXWBV3qaxtxKJ
 ehVXVMSZ7WNi0qCThxoOvhOP/YUPfDs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-5HVURX_-MUCoL9N31SIytA-1; Mon, 02 Feb 2026 10:18:57 -0500
X-MC-Unique: 5HVURX_-MUCoL9N31SIytA-1
X-Mimecast-MFC-AGG-ID: 5HVURX_-MUCoL9N31SIytA_1770045537
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a39993e5fso150277296d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 07:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770045536; x=1770650336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAa9rUiFokLsL02HcrzVefKkv/ss8oRA4iFHEcIfETc=;
 b=fcz6h8cLgyHSRAEfyEAcAbsnjY/Zld12DhRbXtdnpYrd/bE+4h1cwHGyWFqNN+/Rwe
 ToJNSi5H2ZkIVjslXdB087DINLzf1oINyiul4EJUJ3fNNa/cHEJzUGdGo9l0PL41ta43
 Gxg9iqnRPIGaswsW7rnZ0SnmwqGLSfW0RoTJ0xQqVPFIZ9F0iWugp+NbnwWDBOm5m28f
 g70f+qmf9TUK5WxSYi5ddRxHPyaC1yv0C0GzaoJO5K4LvdOa2DcDeU+f+pShE6JrGt2C
 4gBFM9FFUqoYQVpLkSd0FKr+buEJZs15WzwXDrOfRSe1NRc0WbF75aONvd0FGKUOWRmp
 iq5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjg8KcJw6oZtpBxRlQWtraBlH9R51k9zqK8RmSpPgC22q1xZY6l0eMFI7mhr8MAYD1xKsl/ZvpuJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb8XkcJhfCCeEZ3AyHohczSrFYMntiE/NyVbUBTVOlSiC0Pxpg
 nMy1CZwbIPoqQvfA805NlYqXaZi4rihPOFV+DqvXoH5gszsa8eJGPTGhUs71UEl4cxHG74GA9/4
 NDcg2t0G3+pYuAg7CeLWxeETWQqHW7xabFYJb+iQtWdfSUGnRSePicSQsBpnIrPaRpv2GGQ==
X-Gm-Gg: AZuq6aL1+739ArMnw82J8Csn8Oa9pDCMQyitf+KmmWGyipmyPjw5fSFlM6e6Y4off9X
 fzsQQkch1Bk0ywD9etb2ZBxl8V8ZPIRzx91eMT5zZbILZ/4gIuGtNy+mbCUyg01rllk0+wl77YJ
 Fc5QcdMwBXVcvDMI1WJDYNOYzUfCJ+z0RmW13TXDDGFdpLVrPdo4qsIBOhDEve2TIH7pt2sQvjX
 AKilpANDqt9tZwm03sYLzOSfdiGDy15qaSNu6f5SVK4MaDKV5s+p7/vbAAIN0BcR9ko2SNfaPT4
 fBqN1V3UWreFSTiW8V15cnriUkknWbkGw8SLuCwJbAvDbqMNVbLGxJLUeTJBRsO+pO2v9eV286B
 ts13FUSOAR16UUxAdwUbOUCvEJIVlMl9eR5OHYctcK7S9rz6Ssh0=
X-Received: by 2002:a05:6214:764:b0:894:2cf7:7171 with SMTP id
 6a1803df08f44-894e9f79920mr169707546d6.28.1770045536369; 
 Mon, 02 Feb 2026 07:18:56 -0800 (PST)
X-Received: by 2002:a05:6214:764:b0:894:2cf7:7171 with SMTP id
 6a1803df08f44-894e9f79920mr169706896d6.28.1770045535786; 
 Mon, 02 Feb 2026 07:18:55 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711b7c7besm1249530285a.2.2026.02.02.07.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 07:18:55 -0800 (PST)
Date: Mon, 2 Feb 2026 10:18:54 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH] dma-buf: heaps: cma: register a dmem region for each cma
 heap
Message-ID: <aYC1rNKBTpxE-Llm@fedora>
References: <20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com>
 <20260202-wealthy-quick-cow-8c5421@houat>
MIME-Version: 1.0
In-Reply-To: <20260202-wealthy-quick-cow-8c5421@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4-Xof0jI8-ymXfOAlt-y6Q_nByry35uRda9Ja8Vf4lY_1770045537
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2E0F9CE164
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:12:37AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Jan 30, 2026 at 05:55:30PM -0500, Eric Chanudet wrote:
> > The cma dma-buf heaps let userspace allocate buffers in CMA regions
> > without enforcing limits. Register a dmem region per cma heap and charge
> > against it when allocating a buffer in a cma heap.
> > 
> > For the default cma region, two heaps may be created for the same cma
> > range:
> > commit 854acbe75ff4 ("dma-buf: heaps: Give default CMA heap a fixed name")
> >   Introduced /dev/dma_heap/default_cma_region
> > commit 4f5f8baf7341 ("dma-buf: heaps: cma: Create CMA heap for each CMA
> >                       reserved region")
> >   Created a CMA heap for each CMA region, which might create a duplicate
> >   heap to the default one, e.g:
> >     /dev/dma_heap/default_cma_region
> >     /dev/dma_heap/reserved
> > 
> > Removing the legacy heap would break user API. So handle the special
> > case by using one dmem between the two heaps to account charges
> > correctly.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> > In continuation with introducing cgroup for the system heap[1], this
> > behavior is enabled based on dma_heap.mem_accounting, disabled by
> > default.
> > 
> > dmem is chosen for CMA heaps as it allows limits to be set for each
> > region backing each heap. There is one caveat for the default cma range
> > that may accessible through two different cma heaps, which is treated as
> > a special case.
> > 
> > [1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com/
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 51 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 46 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..608af8ad6bce7fe0321da6d8f1b65a69f5d8d950 100644
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
> > @@ -46,7 +47,9 @@ int __init dma_heap_cma_register_heap(struct cma *cma)
> >  struct cma_heap {
> >  	struct dma_heap *heap;
> >  	struct cma *cma;
> > +	struct dmem_cgroup_region *cg;
> >  };
> > +static struct dmem_cgroup_region *default_cma_cg;
> >  
> >  struct cma_heap_buffer {
> >  	struct cma_heap *heap;
> > @@ -58,6 +61,7 @@ struct cma_heap_buffer {
> >  	pgoff_t pagecount;
> >  	int vmap_cnt;
> >  	void *vaddr;
> > +	struct dmem_cgroup_pool_state *pool;
> >  };
> >  
> >  struct dma_heap_attachment {
> > @@ -276,6 +280,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
> >  	kfree(buffer->pages);
> >  	/* release memory */
> >  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> > +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> >  	kfree(buffer);
> >  }
> >  
> > @@ -319,9 +324,16 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	if (align > CONFIG_CMA_ALIGNMENT)
> >  		align = CONFIG_CMA_ALIGNMENT;
> >  
> > +	if (mem_accounting) {
> > +		ret = dmem_cgroup_try_charge(cma_heap->cg, size,
> > +					     &buffer->pool, NULL);
> > +		if (ret)
> > +			goto free_buffer;
> > +	}
> >
> >  	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> >  	if (!cma_pages)
> > -		goto free_buffer;
> > +		goto uncharge_cgroup;
> >  
> >  	/* Clear the cma pages */
> >  	if (PageHighMem(cma_pages)) {
> > @@ -376,6 +388,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	kfree(buffer->pages);
> >  free_cma:
> >  	cma_release(cma_heap->cma, cma_pages, pagecount);
> > +uncharge_cgroup:
> > +	dmem_cgroup_uncharge(buffer->pool, size);
> 
> Should we make that conditional on mem_accounting == true ?
> 
> >  free_buffer:
> >  	kfree(buffer);
> >  
> > @@ -390,25 +404,52 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
> >  {
> >  	struct dma_heap_export_info exp_info;
> >  	struct cma_heap *cma_heap;
> > +	struct dmem_cgroup_region *region;
> > +	int ret;
> >  
> >  	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
> >  	if (!cma_heap)
> >  		return -ENOMEM;
> >  	cma_heap->cma = cma;
> >  
> > +	/*
> > +	 * If two heaps are created for the default cma region, use the same
> > +	 * dmem for them. They both use the same memory pool.
> > +	 */
> > +	if (dev_get_cma_area(NULL) == cma && default_cma_cg)
> > +		region = default_cma_cg;
> > +	else {
> > +		region = dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", name);
> > +		if (IS_ERR(region)) {
> > +			ret = PTR_ERR(region);
> > +			goto free_cma_heap;
> > +		}
> > +	}
> > +	cma_heap->cg = region;
> > +
> 
> I'm not sure it's the best way to go with this. We want to track all
> relevant CMA allocations going forward, in the heaps and elsewhere.
> 
> If we were to do what you suggest, an allocation in, say, DRM or v4l2
> wouldn't be tracked in the same region than one in the heaps, while we
> want to have it cumulated.
> 
> I think we'd be better off if we created a dmem region for each CMA
> region in the system, but we would charge from the heap so we don't
> account for every allocation.

That makes more sense. I will do that in a v2.

> I don't think we can register the dmem region when the CMA area is
> initialized though, since it will probably be too early in the kernel
> boot and SLAB isn't around yet.
> 
> But since we would need an accessor to get a dmem region from a cma
> region, we could do something like check if a dmem eregion already
> exists for that cma region, and allocate one otherwise. Or have a
> secondary initcall to allocate all dmem regions.

In an earlier series[1], you did this during cma_activate_area(),
core_initcall is late enough, so I can start from this in your series.

[1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-1-2984c1bc9312@kernel.org/

> 
> Maxime



-- 
Eric Chanudet

