Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JVeDxucpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:30:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946081EACC8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD9710E14F;
	Tue,  3 Mar 2026 08:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JW8JpHeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE76810E14F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772526614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=viUy7hzMU4+O4xdoDCnRaeiIoPG6PXt0vSgDJ4O3NVU=;
 b=JW8JpHeFJN1ImXt4APtdRJNU19DGK2bLkcsh2wCroz3ig0WDPAO5HLnKWOx/qlpwQxlpKF
 egm/JytVMdYWQ0znez7PE8anIe8zLgPssJipQam6B0jvk9S0q+J736CL+PIVGeJckiYVvN
 9TQPg+yI9Ss2X/jsCveuCXWK5/ZKiE0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-nWr2ruFKNwaDglGWF6bobQ-1; Tue, 03 Mar 2026 03:30:13 -0500
X-MC-Unique: nWr2ruFKNwaDglGWF6bobQ-1
X-Mimecast-MFC-AGG-ID: nWr2ruFKNwaDglGWF6bobQ_1772526613
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-79874ae3e49so85643327b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772526613; x=1773131413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=viUy7hzMU4+O4xdoDCnRaeiIoPG6PXt0vSgDJ4O3NVU=;
 b=QRkEHo0AkQ2pGOdgP9fKJHrw5yEg6T6fyfookmoNejgG/23tU+rXTeHmbmpNNVM1WE
 z/pNlnha9rn0JOaHWDEFp3I7B3DvWGCYsZ0JiNteQq5JfBu2bDVVn8vp9TYr/g8WavVt
 En13anKlbrGC6baCvGJt65FhTXXgTS8vQPCpRWb2u/g6a9ue/ARJMBjd2+xgSI13FeYF
 5bencm0qjfjLzVQwgDULVHpR+Tusm6fbDTYcTlN8SBF+j2whMyXU9G9KeJis3rvx+uPs
 XmxxvAOayMJjfMzcqGu2Y1pQeCwi4P6XE29TiG42NWLlwNxiTGXdLnoIHSwxAhaJ5P5A
 Hz5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBC7vZte1aDUg6D/aYyxgjRmJUQWOETUOZpBvNeuzgVJzUWPAWjgLA0H9/3gmLB/FvnopB1X2XqZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYv748208b2KmPo2dwjbxFgD+fdxV+a5hh0/ZcyZU19YIlSkQQ
 5WuZF6ddSyD6qw5XXzEiMxJHWEY15Ii9CsE2qJTbcFfaOSFtVFs5L+Gy4MG1b7VcGSrVtoJixun
 4TylzIBntV/wGQMXhB4FBxABfs70fvLMqFRF4MFP28xEZgATCthlhVLU8ImMDIX1SrMhuxSuJJL
 SgfnOvCmV+dk2TWMxPDVirNNmX4bruUyfnwRXP+uBX0GfY
X-Gm-Gg: ATEYQzysI312mxjwKOvoz606+/t5SyIYXvoRhDKhmYWdA7CVgIpEUH3S8+f2EQAhGS+
 0gvhVagArGUMSLc9Np6CPWIpnjW0cxD0ukQNFOAyQGhUZ8iBop1ETRFnWcjhm3eetUKx5bp7lDg
 fTu0wLxwaCygOGkYmtBC3jnocaFut9vPbMsWecPM1eD1+2ye7UQ+qypJWF/6oEV/HRqFQ5BNmKI
 w==
X-Received: by 2002:a05:690e:2026:b0:64c:e819:1b63 with SMTP id
 956f58d0204a3-64ce8191c0fmr2298994d50.23.1772526612877; 
 Tue, 03 Mar 2026 00:30:12 -0800 (PST)
X-Received: by 2002:a05:690e:2026:b0:64c:e819:1b63 with SMTP id
 956f58d0204a3-64ce8191c0fmr2298965d50.23.1772526612385; Tue, 03 Mar 2026
 00:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org>
 <20260227-dma-buf-heaps-as-modules-v2-1-454aee7e06cc@kernel.org>
In-Reply-To: <20260227-dma-buf-heaps-as-modules-v2-1-454aee7e06cc@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 3 Mar 2026 09:30:01 +0100
X-Gm-Features: AaiRm51O-7HLXl5WqAQFt8ndmggiU93wYFS2Jxqx5wmhO0yrhCBFx8LCXAa_vkY
Message-ID: <CADSE00KTKhzuB1vDj=hkBVE+5dq+=q3xRsj6dK_96Jhqi49OwQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dma: contiguous: Turn heap registration logic
 around
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4DVQP43iKDGtSYo7rpgQPt8QYRfZvdwcpMjXK-DxAFQ_1772526613
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 946081EACC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 2:23=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA heap instantiation was initially developed by having the
> contiguous DMA code call into the CMA heap to create a new instance
> every time a reserved memory area is probed.
>
> Turning the CMA heap into a module would create a dependency of the
> kernel on a module, which doesn't work.
>
> Let's turn the logic around and do the opposite: store all the reserved
> memory CMA regions into the contiguous DMA code, and provide an iterator
> for the heap to use when it probes.
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Albert Esteve <aesteve@redhat.com>

> ---
>  drivers/dma-buf/heaps/cma_heap.c | 18 ++----------------
>  include/linux/dma-map-ops.h      |  5 +++++
>  kernel/dma/contiguous.c          | 26 ++++++++++++++++++++++++--
>  3 files changed, 31 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index bd3370b9a3f6d4e18885a1d0e8ba3f659b85ef47..f8a3d87f3ccee9630383ba285=
02eb40b10671cc2 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -28,23 +28,10 @@
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>
>  #define DEFAULT_CMA_NAME "default_cma_region"
>
> -static struct cma *dma_areas[MAX_CMA_AREAS] __initdata;
> -static unsigned int dma_areas_num __initdata;
> -
> -int __init dma_heap_cma_register_heap(struct cma *cma)
> -{
> -       if (dma_areas_num >=3D ARRAY_SIZE(dma_areas))
> -               return -EINVAL;
> -
> -       dma_areas[dma_areas_num++] =3D cma;
> -
> -       return 0;
> -}
> -
>  struct cma_heap {
>         struct dma_heap *heap;
>         struct cma *cma;
>  };
>
> @@ -412,22 +399,21 @@ static int __init __add_cma_heap(struct cma *cma, c=
onst char *name)
>  }
>
>  static int __init add_cma_heaps(void)
>  {
>         struct cma *default_cma =3D dev_get_cma_area(NULL);
> +       struct cma *cma;
>         unsigned int i;
>         int ret;
>
>         if (default_cma) {
>                 ret =3D __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
>                 if (ret)
>                         return ret;
>         }
>
> -       for (i =3D 0; i < dma_areas_num; i++) {
> -               struct cma *cma =3D dma_areas[i];
> -
> +       for (i =3D 0; (cma =3D dma_contiguous_get_reserved_region(i)) !=
=3D NULL; i++) {
>                 ret =3D __add_cma_heap(cma, cma_get_name(cma));
>                 if (ret) {
>                         pr_warn("Failed to add CMA heap %s", cma_get_name=
(cma));
>                         continue;
>                 }
> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 60b63756df821d839436618f1fca2bfa3eabe075..3007c68a8ec5b85990d1938d0=
4a2f05c1a71acdb 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -110,10 +110,11 @@ bool dma_release_from_contiguous(struct device *dev=
, struct page *pages,
>                                  int count);
>  struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t=
 gfp);
>  void dma_free_contiguous(struct device *dev, struct page *page, size_t s=
ize);
>
>  void dma_contiguous_early_fixup(phys_addr_t base, unsigned long size);
> +struct cma *dma_contiguous_get_reserved_region(unsigned int idx);
>  #else /* CONFIG_DMA_CMA */
>  static inline struct cma *dev_get_cma_area(struct device *dev)
>  {
>         return NULL;
>  }
> @@ -148,10 +149,14 @@ static inline void dma_free_contiguous(struct devic=
e *dev, struct page *page,
>         __free_pages(page, get_order(size));
>  }
>  static inline void dma_contiguous_early_fixup(phys_addr_t base, unsigned=
 long size)
>  {
>  }
> +static inline struct cma *dma_contiguous_get_reserved_region(unsigned in=
t idx)
> +{
> +       return NULL;
> +}
>  #endif /* CONFIG_DMA_CMA*/
>
>  #ifdef CONFIG_DMA_DECLARE_COHERENT
>  int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_add=
r,
>                 dma_addr_t device_addr, size_t size);
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index c56004d314dc2e436cddf3b20a4ee6ce8178bee4..14bd54fb758537f01a6fe2731=
8e7b683964e20b1 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -456,10 +456,32 @@ void dma_free_contiguous(struct device *dev, struct=
 page *page, size_t size)
>  #include <linux/of_reserved_mem.h>
>
>  #undef pr_fmt
>  #define pr_fmt(fmt) fmt
>
> +static struct cma *rmem_cma_areas[MAX_CMA_AREAS];
> +static unsigned int rmem_cma_areas_num;
> +
> +static int rmem_cma_insert_area(struct cma *cma)
> +{
> +       if (rmem_cma_areas_num >=3D ARRAY_SIZE(rmem_cma_areas))
> +               return -EINVAL;
> +
> +       rmem_cma_areas[rmem_cma_areas_num++] =3D cma;
> +
> +       return 0;
> +}
> +
> +struct cma *dma_contiguous_get_reserved_region(unsigned int idx)
> +{
> +       if (idx >=3D rmem_cma_areas_num)
> +               return NULL;
> +
> +       return rmem_cma_areas[idx];
> +}
> +EXPORT_SYMBOL_GPL(dma_contiguous_get_reserved_region);
> +
>  static int rmem_cma_device_init(struct reserved_mem *rmem, struct device=
 *dev)
>  {
>         dev->cma_area =3D rmem->priv;
>         return 0;
>  }
> @@ -504,13 +526,13 @@ static int __init rmem_cma_setup(struct reserved_me=
m *rmem)
>         rmem->priv =3D cma;
>
>         pr_info("Reserved memory: created CMA memory pool at %pa, size %l=
d MiB\n",
>                 &rmem->base, (unsigned long)rmem->size / SZ_1M);
>
> -       err =3D dma_heap_cma_register_heap(cma);
> +       err =3D rmem_cma_insert_area(cma);
>         if (err)
> -               pr_warn("Couldn't register CMA heap.");
> +               pr_warn("Couldn't store CMA reserved area.");
>
>         return 0;
>  }
>  RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
>  #endif
>
> --
> 2.53.0
>
>

