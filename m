Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB4QDDF8qWkh8wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:50:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1D2121B1
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48AF10EB21;
	Thu,  5 Mar 2026 12:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hAk8h0LN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A21D10E299
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772715052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGQD+cOc++KkO42kzws1oQJrJ/tIu6r6dd9H8Ca4j6g=;
 b=hAk8h0LN1V0U9yxkzJ64iijEr3Vw7dbSm9mD5x6VgyaR5GJecl2OQRp46BTHUmHMLhtHup
 MGQ36vBmlTDnTWlmhImYdOfoGri6MB8+Oa5iVBFgIRgmZ7X1iapVuQU2lCuVJ3aMctWr38
 63aNhNxUoYbpIsooUPszFdzBvwY3alU=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-Z_XIJ-VtOOGpgCyELiL3vA-1; Thu, 05 Mar 2026 07:50:51 -0500
X-MC-Unique: Z_XIJ-VtOOGpgCyELiL3vA-1
X-Mimecast-MFC-AGG-ID: Z_XIJ-VtOOGpgCyELiL3vA_1772715051
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-649f0d26e5eso10658123d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772715051; x=1773319851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mGQD+cOc++KkO42kzws1oQJrJ/tIu6r6dd9H8Ca4j6g=;
 b=OwfRi2bzt9D5yWl13Z70ZqqQfi58HlI6WfV6RbMYCIeu7UxssHTZFGWNRTx6RF6wV6
 I6hyW2a5FK86I9dbN7e3dJ3oQAviLAj0h71O3BOnls9llr0qULPZLJafteRoEdRGNt2E
 AcUOQj+/yXtXJ011ntdFVXcZKTu1OJthmwVOuT9SGCCOZz6UVNj+orro/44hjIikWtf0
 Ybz9EtLPCxu4mQ8Mz5NQ0ehiXrg2OCwssk+L66+Egq4SVfHjicSE1xAsaf3Vg5rKb+I9
 S9L24SqbM/Gtd/TzQe4ExKdUHbqj9drQhhbH8zUZ8v3WtkmV4VMHrTdX/UauSBSZQ4GR
 JzVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3l9jCcCrJfcFgPWpwokgKeES5CAtGjK5o5OxcIj5mIwjbZfJrpqIm0is2qH6faWNn3GvG27Jl+kw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtlNoo6+Ilr+BvGMfZXGZofl+lqbdxO6F4NffTP3QiffbqedaW
 CJ8zAxb+Dy5K/JIT6xO1WsEpNwS95CNg/Vkj7W1Y9w//9tMP5EtY9j3ymTYHexzJVaAGS21/0A4
 5vB/0h++erma0BQEceCB0CD4t837ihAoOTDOIo5LWuC8C0zbkG/aNp3uUoX6kkLOI9F1STQ6+pz
 lc2iN7LGZUxxYNaeiVdV9JAehu6ilk/a1wZHBv6gOx4X//
X-Gm-Gg: ATEYQzzTyh0na5Cp4JsHdtV6bmqEOeLzE17QWoX3IhLc+WiN7zq6+2ugbH4JSxwl7Qn
 YuHJq8f8Dt2CWYfuuLRln4V0Za0pxICzrx80PFfrsHEbozNxagiHpyokJG8OqHQ/7zw6XZ+BDl3
 wtZW54BR8UrfPipvNhnmuzHuHKMF/NGZYuigUUwCyLfS5oYgY/ns7X/PHkjhdjsgAM5V8IFFjyc
 g==
X-Received: by 2002:a05:690e:b4d:b0:64c:e7a0:7eb8 with SMTP id
 956f58d0204a3-64cf9b4e46dmr4272168d50.24.1772715050884; 
 Thu, 05 Mar 2026 04:50:50 -0800 (PST)
X-Received: by 2002:a05:690e:b4d:b0:64c:e7a0:7eb8 with SMTP id
 956f58d0204a3-64cf9b4e46dmr4272126d50.24.1772715050349; Thu, 05 Mar 2026
 04:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
 <20260303-rigorous-cow-of-saturation-23f87b@houat>
 <CADSE00+jCZSHi=OLbmOebBwnue5tjG7AFPKN76CbYDWYBcP+AA@mail.gmail.com>
 <20260305-antique-flying-gopher-4cbe34@houat>
In-Reply-To: <20260305-antique-flying-gopher-4cbe34@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 5 Mar 2026 13:50:39 +0100
X-Gm-Features: AaiRm520Qsz-JqgW5810FPhKu21ZofkmrOtPWlvIEAnCY9wjM-bxXO9YQ-thsLs
Message-ID: <CADSE00K2PnP-AwS3Ad3UCrQd_ZG7a1L70i1+6EdQsrg0QM3OSA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, echanude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _XsSjsYiOL2knb0lwfI_q_movK7Zvv9D-MUvU2mMAxA_1772715051
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
X-Rspamd-Queue-Id: 9EE1D2121B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 1:30=E2=80=AFPM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> On Tue, Mar 03, 2026 at 03:47:14PM +0100, Albert Esteve wrote:
> > On Tue, Mar 3, 2026 at 2:20=E2=80=AFPM Maxime Ripard <mripard@redhat.co=
m> wrote:
> > > On Tue, Mar 03, 2026 at 01:33:47PM +0100, Albert Esteve wrote:
> > > > Add a dma-buf heap for DT coherent reserved-memory
> > > > (i.e., 'shared-dma-pool' without 'reusable' property),
> > > > exposing one heap per region for userspace buffers.
> > > >
> > > > The heap binds the heap device to each memory region so
> > > > coherent allocations use the correct dev->dma_mem, and
> > > > it defers registration until module_init when normal
> > > > allocators are available.
> > > >
> > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > ---
> > > >  drivers/dma-buf/dma-heap.c            |   4 +-
> > > >  drivers/dma-buf/heaps/Kconfig         |   9 +
> > > >  drivers/dma-buf/heaps/Makefile        |   1 +
> > > >  drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++=
++++++++++++
> > > >  include/linux/dma-heap.h              |  11 +
> > > >  include/linux/dma-map-ops.h           |   7 +
> > > >  6 files changed, 456 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.=
c
> > > > index 88189d4e48561..ba87e5ac16ae2 100644
> > > > --- a/drivers/dma-buf/dma-heap.c
> > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > @@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_=
heap_export_info *exp_info)
> > > >
> > > >       heap =3D dma_heap_create(exp_info);
> > > >       if (IS_ERR(heap)) {
> > > > -             pr_err("dma_heap: failed to create heap (%d)\n", PTR_=
ERR(heap));
> > > > -             return PTR_ERR(heap);
> > > > +             pr_err("dma_heap: failed to create heap (%ld)\n", PTR=
_ERR(heap));
> > > > +             return ERR_CAST(heap);
> > >
> > > This looks unrelated and should possibly be squashed into the previou=
s
> > > patch that introduces dma_heap_create()?
> > >
> > > > +static int coherent_heap_init_dma_mask(struct device *dev)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > > > +     if (!ret)
> > > > +             return 0;
> > > > +
> > > > +     /* Fallback to 32-bit DMA mask */
> > > > +     return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > > > +}
> > >
> > > Why do you need to mess with the DMA mask? I'd expect that device to =
be
> > > able to access everything.
> >
> > When I tested I was getting: "reserved memory is beyond device's set
> > DMA address range", so I tested if it was fixed with
> > dma_coerce_mask_and_coherent() and/or dma_set_mask_coherent(). I did
> > not debug the value of coherent_dma_mask, but given the error I assume
> > it was not set properly? Ultimately, using the 64 bit mask fixed it,
> > and I added a 32-bit fallback to ensure support for 32-bit systems.
>
> So you don't need to handle the fallback because
> dma_coerce_mask_and_coherent will truncate the generated mask to
> dma_addr_t, which is 64bits on 64 bits platforms, and 32 bits on 32 bits
> platforms.
>
> https://elixir.bootlin.com/linux/v6.19.3/source/kernel/dma/mapping.c#L908

Good! I didn't realise that. I will remove it for the next revision.

>
> But I think my point was more than there's nothing specific to the
> coherent heap itself: the device allocated for the heap should have the
> right mask for any heap, so it's something I'd rather put in
> dma_heap_add.

That was my first take too. But when I checked, I did not see
dma_heap_add() doing anything to dev->coherent_dma_mask. So I assumed
the problem relates to the rmem being bound, which triggers the check
to ensure the memory pool is within boundaries. That's a specific
issue with the coherent heap, so it sounds like it would be better
handled here in the heap-specific code rather than in
`dma_heap_add()`, which would affect all the dmabuf heaps.

That being said, setting the mask is probably(?) harmless for the
other heaps anyway, so I would be fine with moving it -- to
dma_heap_create() to be more specific.

BR,
Albert.

>
> > > > +static int __coherent_heap_register(struct reserved_mem *rmem)
> > > > +{
> > > > +     struct dma_heap_export_info exp_info;
> > > > +     struct coherent_heap *coh_heap;
> > > > +     struct device *heap_dev;
> > > > +     int ret;
> > > > +
> > > > +     if (!rmem || !rmem->name)
> > > > +             return -EINVAL;
> > > > +
> > > > +     coh_heap =3D kzalloc_obj(*coh_heap);
> > > > +     if (!coh_heap)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     coh_heap->rmem =3D rmem;
> > > > +     coh_heap->name =3D kstrdup(rmem->name, GFP_KERNEL);
> > > > +     if (!coh_heap->name) {
> > > > +             ret =3D -ENOMEM;
> > > > +             goto free_coherent_heap;
> > > > +     }
> > > > +
> > > > +     exp_info.name =3D coh_heap->name;
> > > > +     exp_info.ops =3D &coherent_heap_ops;
> > > > +     exp_info.priv =3D coh_heap;
> > > > +
> > > > +     coh_heap->heap =3D dma_heap_create(&exp_info);
> > > > +     if (IS_ERR(coh_heap->heap)) {
> > > > +             ret =3D PTR_ERR(coh_heap->heap);
> > > > +             goto free_name;
> > > > +     }
> > > > +
> > > > +     heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > > > +     ret =3D coherent_heap_init_dma_mask(heap_dev);
> > > > +     if (ret) {
> > > > +             pr_err("coherent_heap: failed to set DMA mask (%d)\n"=
, ret);
> > > > +             goto destroy_heap;
> > > > +     }
> > > > +
> > > > +     ret =3D of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> > > > +     if (ret) {
> > > > +             pr_err("coherent_heap: failed to initialize memory (%=
d)\n", ret);
> > > > +             goto destroy_heap;
> > > > +     }
> > > > +
> > > > +     ret =3D dma_heap_register(coh_heap->heap);
> > > > +     if (ret) {
> > > > +             pr_err("coherent_heap: failed to register heap (%d)\n=
", ret);
> > > > +             goto destroy_heap;
> > > > +     }
> > >
> > > I guess it's more of a comment about your previous patch, but it's no=
t
> > > clear to me why you needed to split dma_heap_add into dma_heap_create=
 /
> > > _register. Can you expand a bit?
> >
> > So first I tried to just use dma_heap_add() and then use the heap_dev
> > afterward to call of_reserved_mem_device_init_with_mem(), but if that
> > call failed, the error path required some kind dma_heap_remove()
> > function as the heap was already registered by then.
> >
> > In the CMA heap for example, dma_heap_add() is invoked at the end of
> > the `init` function. Therefore, you do not have this issue, if it
> > failed it means the heap was not added and you just need to clean
> > everything else.
> >
> > However, performing a remove() does not sound like something that can
> > be done safely. I've spent some time thinking on alternatives, but
> > splitting felt the best pattern.
> >
> > This way I can:
> > 1. Create the device
> > 2. Call of_reserved_mem_device_init_with_mem
> > 3. Register the heap
> >
> > This places registration at the end, making every error path and
> > cleanup easy to handle.
> >
> > Also, the `dma_heap_add()` code already seemed to handle these two
> > parts/phases implicitly with device_create(), so splitting felt
> > architecturally sound.
>
> That makes sense, thanks!
>
> Maxime

