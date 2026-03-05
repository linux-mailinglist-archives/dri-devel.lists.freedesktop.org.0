Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDDaMll3qWlw8AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:30:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4878C211AC5
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FAB10E297;
	Thu,  5 Mar 2026 12:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MRtdBLdZ";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="qHyNRYWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE28310E297
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772713812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n4h7C/mVddSBf5SlRktQxYvLNWZ3n2LVuIMNQt34HFE=;
 b=MRtdBLdZrPQ6ff85JxhhjNOjsr5vBDjYsDLRdyewZCzjQJEHvuzoSa3/gVLAEXDaIlPDkn
 SxyEX8M63griRm+i0CgDo1JLPWPCtGtOvLfJBjXeJhJ0qooRp9Y8Z3r9urchd8vuhWFfos
 iYD4AMbfuW8F8Qy3rZtCkRpjdXsD9yI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-hxoesHNGPymyCzdy7HlCfQ-1; Thu, 05 Mar 2026 07:30:08 -0500
X-MC-Unique: hxoesHNGPymyCzdy7HlCfQ-1
X-Mimecast-MFC-AGG-ID: hxoesHNGPymyCzdy7HlCfQ_1772713807
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837c597cd5so46563675e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772713807; x=1773318607; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n4h7C/mVddSBf5SlRktQxYvLNWZ3n2LVuIMNQt34HFE=;
 b=qHyNRYWxu4yg1dWrpasRjujaDkmfgqe/N/OFQmMG+pKHfd+C59j76okX640j539hwQ
 IWNTMTg3z7tm9vnDho/vt8HkHVU6kLaXf2rN+SIV5clqw8U2vvQLhXxT/ORyTACak7tj
 3PET6W/64/LACWF9wclDPTsQ6PRMPd+gRQovDmU/ZlsxUEaHr3agZLyteHrFz5CMaAYV
 ZCFqXHzDyATLAzXxUpMYLX0Gh5i78YeAs0Jzqi3XKzh5wG6KnmR8s/SyaiiLs684U7OY
 fPhTlyPwwFSDVtpyWvF1lx8CbuFJa3QIEPybvIeJCnR3BDJHUYvRKlNkNny/mk7CMIU/
 FYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772713807; x=1773318607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4h7C/mVddSBf5SlRktQxYvLNWZ3n2LVuIMNQt34HFE=;
 b=DngErzg/Zw/pTRwku7VhIqBhFmN3O5vPWPkU0dnX9sAUYB/30mekEyciROOJEu8jb6
 3zLRlVWdrTgu2nxMVD+eWBUr12nL4w314xCp6US4VK4rgeNJGGs5xqeuGCx0wQf7wicM
 Tk8wuQtHtttFbgVNJm7bmQVz3LTnqYKV/1lvCYdZUHLMW2bGknk1GpYHHepDp/lO5ekD
 FWm2/+Xfz8NzkVKIdkWQ+SAptem6hU0TB9a03WLy9M6hwT3VL+JNrMOGbNViNhggykKs
 hYCHAlD7UybuRXNkAf/Fljvx8YKhgOSLnYC1uO5nEstSWe4KvIl8QxSMQXSMFzbXrmgw
 PdFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNcWpqAeTjQB+OZQ4eJrfQH06trL29HTpYYsZL07j9yJsUNxumPjZWfkz3KYzkcM57Z0r9KV54tBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz96LP4yNAzV9N9nzb1lpaf4ctu4C363+QSrMrH/97cM8ysQn45
 PHEbYouTinW9njXXwKCbGpvbtIOcSqd4E3HHUnA1cDJgPxfqZmx1iU+TtKUNG8FQuCDMXg6GXNd
 LHd6t7Bht8IAzPR13H+U7BJqMStUssDErIhMTDco/O5m4Tk6Q+l2a9bFdqv1hXJCUZYv9hQ==
X-Gm-Gg: ATEYQzxuHbUB+5pSJKGLLxhonMlIRRSaClgWQdtZI1iBviRK/r3ujXYX5vTJuhsCrBo
 6wIviay39Kcv1/enkPaN6VyY4dOQW40tKNGEt5jDwC1BbGmZqkCzlrVmA53fUgC0pGUkJgkld0S
 Bs+1JvDxk9Je1LuGV6eeiEc2LQwVmCzRzYjwporX/oiV8UNhtaLDdLIB5c58jegm+z0jYmj3X77
 tZDsk9la4Fk5YCbosLKAMi3KTOVWgoJnKM24lcVFZuDwOqAL3M0G1OhEeNrCFCBoCUwuv2wwvgb
 3UMKFIgE0qRT4iMUgC+0Z8ejw+Hp5srsruw+6aPWqip/uS9ETlyQYYg7wEEzc+UwjQpqQA/Pog=
 =
X-Received: by 2002:a05:600c:1e0d:b0:483:3380:ca11 with SMTP id
 5b1f17b1804b1-485198c81e4mr91451325e9.33.1772713807339; 
 Thu, 05 Mar 2026 04:30:07 -0800 (PST)
X-Received: by 2002:a05:600c:1e0d:b0:483:3380:ca11 with SMTP id
 5b1f17b1804b1-485198c81e4mr91450615e9.33.1772713806762; 
 Thu, 05 Mar 2026 04:30:06 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851ad1656bsm39645565e9.24.2026.03.05.04.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 04:30:05 -0800 (PST)
Date: Thu, 5 Mar 2026 13:30:05 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org, echanude@redhat.com
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
Message-ID: <20260305-antique-flying-gopher-4cbe34@houat>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
 <20260303-rigorous-cow-of-saturation-23f87b@houat>
 <CADSE00+jCZSHi=OLbmOebBwnue5tjG7AFPKN76CbYDWYBcP+AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hngdcoke4k7khock"
Content-Disposition: inline
In-Reply-To: <CADSE00+jCZSHi=OLbmOebBwnue5tjG7AFPKN76CbYDWYBcP+AA@mail.gmail.com>
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
X-Rspamd-Queue-Id: 4878C211AC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--hngdcoke4k7khock
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0

On Tue, Mar 03, 2026 at 03:47:14PM +0100, Albert Esteve wrote:
> On Tue, Mar 3, 2026 at 2:20=E2=80=AFPM Maxime Ripard <mripard@redhat.com>=
 wrote:
> > On Tue, Mar 03, 2026 at 01:33:47PM +0100, Albert Esteve wrote:
> > > Add a dma-buf heap for DT coherent reserved-memory
> > > (i.e., 'shared-dma-pool' without 'reusable' property),
> > > exposing one heap per region for userspace buffers.
> > >
> > > The heap binds the heap device to each memory region so
> > > coherent allocations use the correct dev->dma_mem, and
> > > it defers registration until module_init when normal
> > > allocators are available.
> > >
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > ---
> > >  drivers/dma-buf/dma-heap.c            |   4 +-
> > >  drivers/dma-buf/heaps/Kconfig         |   9 +
> > >  drivers/dma-buf/heaps/Makefile        |   1 +
> > >  drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++++=
++++++++++
> > >  include/linux/dma-heap.h              |  11 +
> > >  include/linux/dma-map-ops.h           |   7 +
> > >  6 files changed, 456 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 88189d4e48561..ba87e5ac16ae2 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >
> > >       heap =3D dma_heap_create(exp_info);
> > >       if (IS_ERR(heap)) {
> > > -             pr_err("dma_heap: failed to create heap (%d)\n", PTR_ER=
R(heap));
> > > -             return PTR_ERR(heap);
> > > +             pr_err("dma_heap: failed to create heap (%ld)\n", PTR_E=
RR(heap));
> > > +             return ERR_CAST(heap);
> >
> > This looks unrelated and should possibly be squashed into the previous
> > patch that introduces dma_heap_create()?
> >
> > > +static int coherent_heap_init_dma_mask(struct device *dev)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > > +     if (!ret)
> > > +             return 0;
> > > +
> > > +     /* Fallback to 32-bit DMA mask */
> > > +     return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > > +}
> >
> > Why do you need to mess with the DMA mask? I'd expect that device to be
> > able to access everything.
>=20
> When I tested I was getting: "reserved memory is beyond device's set
> DMA address range", so I tested if it was fixed with
> dma_coerce_mask_and_coherent() and/or dma_set_mask_coherent(). I did
> not debug the value of coherent_dma_mask, but given the error I assume
> it was not set properly? Ultimately, using the 64 bit mask fixed it,
> and I added a 32-bit fallback to ensure support for 32-bit systems.

So you don't need to handle the fallback because
dma_coerce_mask_and_coherent will truncate the generated mask to
dma_addr_t, which is 64bits on 64 bits platforms, and 32 bits on 32 bits
platforms.

https://elixir.bootlin.com/linux/v6.19.3/source/kernel/dma/mapping.c#L908

But I think my point was more than there's nothing specific to the
coherent heap itself: the device allocated for the heap should have the
right mask for any heap, so it's something I'd rather put in
dma_heap_add.

> > > +static int __coherent_heap_register(struct reserved_mem *rmem)
> > > +{
> > > +     struct dma_heap_export_info exp_info;
> > > +     struct coherent_heap *coh_heap;
> > > +     struct device *heap_dev;
> > > +     int ret;
> > > +
> > > +     if (!rmem || !rmem->name)
> > > +             return -EINVAL;
> > > +
> > > +     coh_heap =3D kzalloc_obj(*coh_heap);
> > > +     if (!coh_heap)
> > > +             return -ENOMEM;
> > > +
> > > +     coh_heap->rmem =3D rmem;
> > > +     coh_heap->name =3D kstrdup(rmem->name, GFP_KERNEL);
> > > +     if (!coh_heap->name) {
> > > +             ret =3D -ENOMEM;
> > > +             goto free_coherent_heap;
> > > +     }
> > > +
> > > +     exp_info.name =3D coh_heap->name;
> > > +     exp_info.ops =3D &coherent_heap_ops;
> > > +     exp_info.priv =3D coh_heap;
> > > +
> > > +     coh_heap->heap =3D dma_heap_create(&exp_info);
> > > +     if (IS_ERR(coh_heap->heap)) {
> > > +             ret =3D PTR_ERR(coh_heap->heap);
> > > +             goto free_name;
> > > +     }
> > > +
> > > +     heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> > > +     ret =3D coherent_heap_init_dma_mask(heap_dev);
> > > +     if (ret) {
> > > +             pr_err("coherent_heap: failed to set DMA mask (%d)\n", =
ret);
> > > +             goto destroy_heap;
> > > +     }
> > > +
> > > +     ret =3D of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> > > +     if (ret) {
> > > +             pr_err("coherent_heap: failed to initialize memory (%d)=
\n", ret);
> > > +             goto destroy_heap;
> > > +     }
> > > +
> > > +     ret =3D dma_heap_register(coh_heap->heap);
> > > +     if (ret) {
> > > +             pr_err("coherent_heap: failed to register heap (%d)\n",=
 ret);
> > > +             goto destroy_heap;
> > > +     }
> >
> > I guess it's more of a comment about your previous patch, but it's not
> > clear to me why you needed to split dma_heap_add into dma_heap_create /
> > _register. Can you expand a bit?
>=20
> So first I tried to just use dma_heap_add() and then use the heap_dev
> afterward to call of_reserved_mem_device_init_with_mem(), but if that
> call failed, the error path required some kind dma_heap_remove()
> function as the heap was already registered by then.
>=20
> In the CMA heap for example, dma_heap_add() is invoked at the end of
> the `init` function. Therefore, you do not have this issue, if it
> failed it means the heap was not added and you just need to clean
> everything else.
>=20
> However, performing a remove() does not sound like something that can
> be done safely. I've spent some time thinking on alternatives, but
> splitting felt the best pattern.
>=20
> This way I can:
> 1. Create the device
> 2. Call of_reserved_mem_device_init_with_mem
> 3. Register the heap
>=20
> This places registration at the end, making every error path and
> cleanup easy to handle.
>=20
> Also, the `dma_heap_add()` code already seemed to handle these two
> parts/phases implicitly with device_create(), so splitting felt
> architecturally sound.

That makes sense, thanks!

Maxime

--hngdcoke4k7khock
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaal3SAAKCRAnX84Zoj2+
dn3QAX9E8YO33rmROOTGm7jbkHqsOZ8TA0MZtGRMovqQZMantYBJIMKP5dURZuMJ
oYoU8x4BgLjR9qQ/3rZv2lePDmMzvq1bRUaeUiPuJqKtDmMVvUOIXTdhGEcO1s7+
wnCWMipN7A==
=F33u
-----END PGP SIGNATURE-----

--hngdcoke4k7khock--

