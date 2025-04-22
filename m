Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF8CA97259
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4CF10E5D7;
	Tue, 22 Apr 2025 16:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XAAk/ptW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1641110E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:17:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso60745e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745338657; x=1745943457;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+VlTv/hTKrlRvm1O4sYCipzPw4t9W4hk+Rbsc7ns3M=;
 b=XAAk/ptWaoUsHxpfJuqpBip3kK7zOgDPy8HuT80IDedlFLayBuaJkqPqggyrT1MqIF
 MO7L1DKjPaGpv0wBNLMJPj1kMWqe6Had2OqbY2/ck4abPfDUA7Zd5NMeAalA1I7yuX34
 Hxx2/qEIZ1vPO5QyU8zr0aIMp2v0Os9M+4z/KcSbjeAfqUwGBXAG79P14yrMdf2h+2Md
 qVyDA1y3UKKYaGjeK8yORYlNFMM0FzaLPTWaEPWdFiLgg6HNKXk2kSydpqbYfAKeUIyu
 0NQMMv+M46i0kvEX7U8gk0RU3RmdJuNmgLJJFdLMZCKbxGCjsooTgybYOZjmgKYEoBc1
 ejaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745338657; x=1745943457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+VlTv/hTKrlRvm1O4sYCipzPw4t9W4hk+Rbsc7ns3M=;
 b=ZEfAD38woleHQuImzZGlGgKKNyMFHdYr9YylDGAFJ4JRgIun1AcNx8U6AyDrkY1DjK
 DwltkQtSju2BBwPnvqaj08ug2cNAQc53p0RH6JSU8AR73TVCx7oqdYz5EdC53POn+l6X
 wYMt4z8GuOiSOYffNg3Isi4oPExsEJn0GJzNAJs7HQfhPLQSxOUogBRM15cSq1PA/ixs
 BZIvvT9Dmpje8HTEmZSayH2KV/Km13Jli2FrNM0gwE/A9uLJXG7jK1Bgdg3XpiWf1XHf
 TNncavCwFSPmvhASK7voGl7h1927xDUs3uh+5HmEpufCNOUoFMWxEt/2pbvxjTvyuEpg
 DWoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFTvme/2WK08ze6CHzjO2+bdYPpgF2Lmj7YOCrVRKqlQWmrqUDAbXMdI5mttNmtQrQngiD+ludhsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMvBeLQhwUjc/GMl7V/QopMpNCL8n+3u2F+mRVnCO90DkpvCBO
 VzYb9XYaIwj/q9aJKVGrN95q49yaK8V9mVBRYJrYkwUc8CW1K25T4HgSB2jt2lj85AzJmIX+xeF
 hjE/9wjSmLe84+ZlkOvu9zcrQFvVbRLhdVDzU
X-Gm-Gg: ASbGnctCutAOfCktt5/+vbp35AOoMPzjWtjf9pB5xyga7RKdJJGoneBmfHJLzPzH5GS
 GoZyHOOefsgSSduGwL42KAtgRgP5Pt0TGwBWQyMqTr0D5FcLPPo1gMXz/vDGoj+j03SFrgym43A
 d1uQwesI851UBbxNeX/zC7MxVdDubjs3S3XKCg7VzIG1eE7dUGfK28
X-Google-Smtp-Source: AGHT+IENoY5KLCLbGnv0xSGeh3ak7+yd+up6SvbsAMQAdxs3P8pPk6x9+6wqqUTe/UoTwxZddmChRUUCohE67dhja5o=
X-Received: by 2002:a05:600c:5809:b0:43d:5b3a:18cc with SMTP id
 5b1f17b1804b1-4406a439719mr5397465e9.2.1745338656623; Tue, 22 Apr 2025
 09:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250417180943.1559755-1-tjmercier@google.com>
 <a4f72149-70a0-4bbe-bdcc-70384c152f83@amd.com>
In-Reply-To: <a4f72149-70a0-4bbe-bdcc-70384c152f83@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 22 Apr 2025 09:17:24 -0700
X-Gm-Features: ATxdqUFWtfUd0V2lIDMC14HVW9RJdQPpnjsioC_15uNznFDm7wn85ZdVHvIBgZU
Message-ID: <CABdmKX2-innZC65Fut6wc2MFUNwO2g6w=_iLv9EBkDn+6LQs5w@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: No separate allocation for
 attachment sg_tables
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Apr 22, 2025 at 1:24=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.04.25 um 20:09 schrieb T.J. Mercier:
> > struct dma_heap_attachment is a separate allocation from the struct
> > sg_table it contains, but there is no reason for this. Let's use the
> > slab allocator just once instead of twice for dma_heap_attachment.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> I'm not *that* expert for this code, but looks totally reasonable to me.

I noticed this while reviewing Maxime Ripard's recent carveout heap
patches, where I was confused about sg_free_table() until I realized
it doesn't free the underlying allocation. Then I started looking at
other heaps and found that most of them do it this way (including the
cma heap), and figured it was a nice cleanup here.

> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Let me know if I should push that to drm-misc-next.
>
> Regards,
> Christian.

Thanks, yes please!




> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 43 ++++++++++++-----------------
> >  1 file changed, 17 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea16..bee10c400cf0 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -35,7 +35,7 @@ struct system_heap_buffer {
> >
> >  struct dma_heap_attachment {
> >       struct device *dev;
> > -     struct sg_table *table;
> > +     struct sg_table table;
> >       struct list_head list;
> >       bool mapped;
> >  };
> > @@ -54,29 +54,22 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIG=
H_ORDER_GFP, LOW_ORDER_GFP};
> >  static const unsigned int orders[] =3D {8, 4, 0};
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> > -static struct sg_table *dup_sg_table(struct sg_table *table)
> > +static int dup_sg_table(struct sg_table *from, struct sg_table *to)
> >  {
> > -     struct sg_table *new_table;
> > -     int ret, i;
> >       struct scatterlist *sg, *new_sg;
> > +     int ret, i;
> >
> > -     new_table =3D kzalloc(sizeof(*new_table), GFP_KERNEL);
> > -     if (!new_table)
> > -             return ERR_PTR(-ENOMEM);
> > -
> > -     ret =3D sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
> > -     if (ret) {
> > -             kfree(new_table);
> > -             return ERR_PTR(-ENOMEM);
> > -     }
> > +     ret =3D sg_alloc_table(to, from->orig_nents, GFP_KERNEL);
> > +     if (ret)
> > +             return ret;
> >
> > -     new_sg =3D new_table->sgl;
> > -     for_each_sgtable_sg(table, sg, i) {
> > +     new_sg =3D to->sgl;
> > +     for_each_sgtable_sg(from, sg, i) {
> >               sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
> >               new_sg =3D sg_next(new_sg);
> >       }
> >
> > -     return new_table;
> > +     return 0;
> >  }
> >
> >  static int system_heap_attach(struct dma_buf *dmabuf,
> > @@ -84,19 +77,18 @@ static int system_heap_attach(struct dma_buf *dmabu=
f,
> >  {
> >       struct system_heap_buffer *buffer =3D dmabuf->priv;
> >       struct dma_heap_attachment *a;
> > -     struct sg_table *table;
> > +     int ret;
> >
> >       a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> >       if (!a)
> >               return -ENOMEM;
> >
> > -     table =3D dup_sg_table(&buffer->sg_table);
> > -     if (IS_ERR(table)) {
> > +     ret =3D dup_sg_table(&buffer->sg_table, &a->table);
> > +     if (ret) {
> >               kfree(a);
> > -             return -ENOMEM;
> > +             return ret;
> >       }
> >
> > -     a->table =3D table;
> >       a->dev =3D attachment->dev;
> >       INIT_LIST_HEAD(&a->list);
> >       a->mapped =3D false;
> > @@ -120,8 +112,7 @@ static void system_heap_detach(struct dma_buf *dmab=
uf,
> >       list_del(&a->list);
> >       mutex_unlock(&buffer->lock);
> >
> > -     sg_free_table(a->table);
> > -     kfree(a->table);
> > +     sg_free_table(&a->table);
> >       kfree(a);
> >  }
> >
> > @@ -129,7 +120,7 @@ static struct sg_table *system_heap_map_dma_buf(str=
uct dma_buf_attachment *attac
> >                                               enum dma_data_direction d=
irection)
> >  {
> >       struct dma_heap_attachment *a =3D attachment->priv;
> > -     struct sg_table *table =3D a->table;
> > +     struct sg_table *table =3D &a->table;
> >       int ret;
> >
> >       ret =3D dma_map_sgtable(attachment->dev, table, direction, 0);
> > @@ -164,7 +155,7 @@ static int system_heap_dma_buf_begin_cpu_access(str=
uct dma_buf *dmabuf,
> >       list_for_each_entry(a, &buffer->attachments, list) {
> >               if (!a->mapped)
> >                       continue;
> > -             dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> > +             dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
> >       }
> >       mutex_unlock(&buffer->lock);
> >
> > @@ -185,7 +176,7 @@ static int system_heap_dma_buf_end_cpu_access(struc=
t dma_buf *dmabuf,
> >       list_for_each_entry(a, &buffer->attachments, list) {
> >               if (!a->mapped)
> >                       continue;
> > -             dma_sync_sgtable_for_device(a->dev, a->table, direction);
> > +             dma_sync_sgtable_for_device(a->dev, &a->table, direction)=
;
> >       }
> >       mutex_unlock(&buffer->lock);
> >
> >
> > base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
>
