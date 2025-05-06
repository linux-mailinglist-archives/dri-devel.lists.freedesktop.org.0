Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56179AAB91C
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 08:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D077C10E198;
	Tue,  6 May 2025 06:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WT/Ctj3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049BE10E198
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 06:50:34 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7301c227512so3705423a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746514231; x=1747119031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+rnsBrnSg8rRMbhF6ZzJCKOKKucd9+x+mvQiH4XndI=;
 b=WT/Ctj3ouSqMlcBhWfJ5igcfp4be2zZu09haxVY3w5uRmX9PTI/WEZ9ygqdFCVNnmt
 neCFYnVkoOkqKB99L8awdEXz/uFT5yet+rzMw+MWWTLY0+NGylhkliCfF6YKC2SX0MpP
 2x0gFJU3XjjdwTZSbBgyXa1YoaXfarN8bB0y7umwk8mgXMRbV4IrZKHntI0CvXDaQ/Z4
 Bh2oHNCsrwLQvneoj3RFvnEIX0A2qlP7AtEo8/QK2vpW5tOUXRJukV7iLTazSLrJdy2n
 yvqDKFW7MRmo9c+vY3uXbnOXvIB/dfTwZeBeK4xwKgzDvi3T2ery7N0ny6Elvhl/TNcu
 nBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746514231; x=1747119031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+rnsBrnSg8rRMbhF6ZzJCKOKKucd9+x+mvQiH4XndI=;
 b=ugbIH7xb5FMXyqiOdnQqkqknBuf8asJt2lGaTOcW7DbF7lA30IgwrN0tgLMisvKC0l
 l+7PkVoXtZnGy8NT30fqbSX7i6E3bQuVYXTDwBg5q2tmT8cesgVPpGHata5eAOUYSGh2
 fAaLnK7jAIxlFBvRHn0kB/YEwcETWJ7Ci2Xe75Ft6U/LPQCi+PotdNb+9Q4acmuvIIUo
 X71/7Dvd1r7jRwOZY4ljlhvwhLDjGpUA8fEd7rs3nKSje7RgsQsACDC2qrC1uhZGbz7l
 CJ9Pp5hafrT833R2q5ayyIA7FOsb+zLnwdIZg+3nWGDtsnDznU8up7HrDZ9/5/zlrd84
 MRng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyvlnOTnpn3UGtNowqbkcrUCZk54TZV2J24IjEh7erRga9p8TQ5xc7xXB526APWqHTIcbrdmVC8jE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjVpwXUHpeaYGPrg1WgdcpJant+rrvMCZb5mAuXAsgWNo8BvAc
 RidSO84lzNOW69a6mSaFjzugSaeG4xDqoWZSvzCzRrNXKVHQN3u9JhcL4b2Td3BxCj4hC7e5jDC
 KtRgn3e9xP2zOlfpHfTrw8SHcAbZtV9nLuSM9DQ==
X-Gm-Gg: ASbGnct/OnWTEqn27oSqMZtZReN+1MsMmqJUloS9fUP7ooufNe0nxhZk21JA+sfCRHO
 Pra9GtQhTidw/conOv+fiBpthKIdKD/GnKE1wr69gM/i4+cote/Fe2GBJbQZiGH/jsFrcxwVpiP
 R2vTnqxhAW2uGiCaU0pifn59A=
X-Google-Smtp-Source: AGHT+IHNm5GVjhXN3B45lmCfKthx/G+NZUk5+CRKyT+Ba0DNEGI76r0X6+RqWLQrptXlWXRbeCBTBu5IP8WF2QNe6QA=
X-Received: by 2002:a05:6870:a1a3:b0:2d4:e8fd:7ffb with SMTP id
 586e51a60fabf-2db3ccf9c7emr900510fac.1.1746514231320; Mon, 05 May 2025
 23:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-7-jens.wiklander@linaro.org>
 <6a33e85f-6b60-4260-993d-974dd29cf8e6@arm.com>
In-Reply-To: <6a33e85f-6b60-4260-993d-974dd29cf8e6@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 6 May 2025 08:50:20 +0200
X-Gm-Features: ATxdqUHZrVfop0JU0rG-vcdbXQsIPujzLICkuywbLk5p8m1md7a0mES_eJcPprM
Message-ID: <CAHUa44EQV5O+KZbE19-d-Z6Wu=HAQuGQmZe+mXZRpmdvRDbmSA@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] tee: implement protected DMA-heap
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
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

Hi,

On Fri, May 2, 2025 at 3:59=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Implement DMA heap for protected DMA-buf allocation in the TEE
> > subsystem.
> >
> > Restricted memory refers to memory buffers behind a hardware enforced
> > firewall. It is not accessible to the kernel during normal circumstance=
s
> > but rather only accessible to certain hardware IPs or CPUs executing in
> > higher or differently privileged mode than the kernel itself. This
> > interface allows to allocate and manage such protected memory buffers
> > via interaction with a TEE implementation.
> >
> > The protected memory is allocated for a specific use-case, like Secure
> > Video Playback, Trusted UI, or Secure Video Recording where certain
> > hardware devices can access the memory.
> >
> > The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
> > backend drivers needs to implement protected memory pool to manage the
> > protected memory.
>
> [...]> +static struct sg_table *
> > +tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> > +                  enum dma_data_direction direction)
> > +{
> > +     struct tee_heap_attachment *a =3D attachment->priv;
> > +     int ret;
> > +
> > +     ret =3D dma_map_sgtable(attachment->dev, &a->table, direction,
> > +                           DMA_ATTR_SKIP_CPU_SYNC);
>
> If the memory is inaccessible to the kernel, what does this DMA mapping
> even mean? What happens when it tries to perform cache maintenance or
> bounce-buffering on inaccessible memory (which presumably doesn't even
> have a VA if it's not usable as normal kernel memory)?

Doesn't DMA_ATTR_SKIP_CPU_SYNC say that the kernel shouldn't perform
cache maintenance on the buffer since it's already in the device
domain? The device is expected to be permitted to access the memory.

>
> If we're simply housekeeping the TEE's resources on its behalf, and
> giving it back some token to tell it which resource to go do its thing
> with, then that's really not "DMA" as far as the kernel is concerned.

These buffers are supposed to be passed to devices that might be under
only partial control of the kernel.

>
> [...]
> > +static int protmem_pool_op_static_alloc(struct tee_protmem_pool *pool,
> > +                                     struct sg_table *sgt, size_t size=
,
> > +                                     size_t *offs)
> > +{
> > +     struct tee_protmem_static_pool *stp =3D to_protmem_static_pool(po=
ol);
> > +     phys_addr_t pa;
> > +     int ret;
> > +
> > +     pa =3D gen_pool_alloc(stp->gen_pool, size);
> > +     if (!pa)
> > +             return -ENOMEM;
> > +
> > +     ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> > +     if (ret) {
> > +             gen_pool_free(stp->gen_pool, pa, size);
> > +             return ret;
> > +     }
> > +
> > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
>
> Where does "pa" come from here (i.e. what's the provenance of the
> initial "paddr" passed to tee_protmem_static_pool_alloc())? In general
> we can't call {phys,pfn}_to_page() an arbitrary addresses without
> checking pfn_valid() first. A bogus address might even crash
> __pfn_to_page() itself under CONFIG_SPARSEMEM.

That's a good point. Would it be enough to check the address with
pfn_valid() in tee_protmem_static_pool_alloc()?

I expect that the memory is normally carved out of DDR and made secure
or protected in a platform-specific way, either at boot with a static
carveout or dynamically after boot.

Thanks,
Jens


>
> Thanks,
> Robin.
>
> > +     *offs =3D pa - stp->pa_base;
> > +
> > +     return 0;
> > +}
