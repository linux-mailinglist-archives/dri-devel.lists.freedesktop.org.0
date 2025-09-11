Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA8B529AA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955C10E1A3;
	Thu, 11 Sep 2025 07:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dvLztBsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C7E10E1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:15:52 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso57420166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757574951; x=1758179751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GP9NntJ30KfEYObDqnhrL+C6H0K6PogP4x/qLVkNDh8=;
 b=dvLztBsk1uFevZhks4ejInm2HImW8gr7578U9u0OMG1QRgqEsmbyG8kHcKAhot6MoU
 237kwV3EL8FAL7I0J61rv+HOqB91Ttts8U/IApYVpmvndcjiBTdvqBrlbzXp9W48yHyV
 WSRPSnWJMszer+8cnr5N13Fn44iIsPwwi7wSJTWAEI9FKUraUZvNZK1N9ppieWweXJmC
 QE47AJhoEso1RbnTkIvh9GI3lNiqXxyM1q0j4QId47/70BCCCmko6KleN4PpaGGYJcZZ
 MnnJIBreUI0iLV9c6Qzy8y27EIDBV8LpIbkVy0k8bBLi8nw22Q8+RZnaPzsScL7PY+Pa
 E6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757574951; x=1758179751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GP9NntJ30KfEYObDqnhrL+C6H0K6PogP4x/qLVkNDh8=;
 b=ptjCPe/GlD6T0dfWrIYryNPTDqKZgFh5JDuj9ac1yR8Z/Auua7uKO2OTLdp4FHUY3x
 YiSuRJt0pj7UFdKhYl5RFbd9liFVQVVzzyld3ageIskk7XwHgXYANBZ9vIV7tJkeL9/n
 1V/HZJVymYHRwygO8RKmJIzPHHmnA48p+dK9W0fVYIG7r2vezTyTVKf82KICt8KlEPvs
 cTNSoGShRtVa0mqOFtJYKRxpFgpFcaZq3D0/3KYxO6UYHA/i5XXxXbGeKGoz/fls2lby
 F2tQXvzudQ2f7esujHD6hZZOuCbisZ+K2yeR2Y7escUJIhW7gmv1hkzxAXRJZXBUDOd3
 8fNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuqPcNJvnyea6TSkZ1AK4OJrBADJyCDIdMlP74C6aYoCi6YL6c2l5Bjn277S78HksEWJKjMOaSj1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb2KA1YsbOyDfpS8p/EMx1kEWYYNIevXpbt++FY6FsnLidWYlH
 FBiMCoVP12iApUV4BoWEEcGYlRzYv4448XUGJusGVT/J8CQPVvffxnTyxna5/91CAQaA6dp6fOe
 dEcuG/HAojGcn1n1YfR2tgxhaiJtfcT/+DVEEIm9w/A==
X-Gm-Gg: ASbGnct3cuDsw3o2QOllJJ543/NVQfdeb9r4PoWwnw1AykSCj6ZMjKXal5H3XBOhm4v
 X622vmtp1FhqH0L3xeFjY+FPeFSqYbN7uC+VK+tH1WIPEpduov80Q1SPA0TYdNoxX78s7Yw1zPy
 f2elgYYn6RSUvItfYLHMr9eNiU1so55xPo9NXWGPTx6XJ6UzYQkzToH2ygECe8mHXCWZtV9fIVc
 d0nGmLksMEV4kvr9wR4naAIe59Mrh4//nIGFAU=
X-Google-Smtp-Source: AGHT+IHy2Mv7dBIklAlXQ3z1llA5qfh3QOZdDcp9k/xtxjZUz/DCzy7vfzzhI0hlOYW8883NeAHTA7AVAmb3DRGTR8w=
X-Received: by 2002:a17:906:730e:b0:b04:6546:345a with SMTP id
 a640c23a62f3a-b04b16c733fmr1789866766b.52.1757574950692; Thu, 11 Sep 2025
 00:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org>
 <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
In-Reply-To: <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 11 Sep 2025 12:45:39 +0530
X-Gm-Features: Ac12FXy7pNPcf0b_CAub_P3Nk83sbsucFa_59lr_vcagvKGZnRZhFr4eESPBY3M
Message-ID: <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
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

Hello Jens,

On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> >
> > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > Export the dma-buf heap functions to allow them to be used by the OP-=
TEE
> > > driver. The OP-TEE driver wants to register and manage specific secur=
e
> > > DMA heaps with it.
Thank you for the series.

Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for thes=
e?

With that change, please feel free to use my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> >
> > Can we get an ack from DMAbuf maintainers here? With that we should be
> > able to queue this patch-set for linux-next targetting the 6.18 merge
> > window.
> >
> > -Sumit
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> Sorry I haven't been able to participate much upstream lately.
> >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > >  {
> > >       return heap->priv;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > >
> > >  /**
> > >   * dma_heap_get_name - get heap name
> > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> > >  {
> > >       return heap->name;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_get_name);
> > >
> > >  /**
> > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >       kfree(heap);
> > >       return err_ret;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_add);
> > >
> > >  static char *dma_heap_devnode(const struct device *dev, umode_t *mod=
e)
> > >  {
> > > --
> > > 2.43.0
> > >

Best,
Sumit.
