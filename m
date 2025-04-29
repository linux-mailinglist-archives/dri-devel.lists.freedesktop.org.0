Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C8AA1B7E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 21:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3385410E0A9;
	Tue, 29 Apr 2025 19:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wgszniFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F2B10E0A9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 19:49:22 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cf3192d8bso26575e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745956161; x=1746560961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TzKOWzU43LrPmkFzN5+2z6l0zJFMgpGF/vX9S5W3V2I=;
 b=wgszniFwgu1InwiUwaNnU7LQiaVQ8eIlQ8Rvr2AEcdRH378LPGbmoVOf7vkiNZ5GQq
 9vmLMLpEQXR/esUWmWI141gs+P2aZrJQGyrhxYuEe3wBAye+WPYbxamEF2jIS66R7qPC
 bPkjalTJDlbMyThTOtPCofTk88C2ZoN0oF8RwzSRc681Wc2D65oR53Mk2NGvI+mm/d2K
 10UoXl8CVINA0yt78E103odWe1M+PI1ldR7gesUVSu8PybcL6QFngSGQr/lz7Ey7ft/R
 R0AUTfYTpCA5MiAW6S77/p+XGlpDHttkyKKS7//IzbJbZkk31qC5iWwtsb/VTLnTGdQw
 jKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745956161; x=1746560961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TzKOWzU43LrPmkFzN5+2z6l0zJFMgpGF/vX9S5W3V2I=;
 b=CNgOmnqCYhL/06wJG1Mjuqk2iAwC2cy0t1s+QkR5mNbCwE8jroK7APjx6wvBgQE6kv
 08I5ggftp3E7pE23dCAiN3R1pgDVi4UFQmGwe1Y0P6YUVuFYdB3esSp8Gm/J9hmaGW2p
 /y/DKMtFECq/nFOCYfTaOgPYzGirZRzfGFMToM8tpwMHzBfoJxY3AqDzuntMpnNo4ieM
 mITWzo1OQ7Z9dnv5V2fodsWiep3Al6u2Mw6bhPxAY6KIjcidNaDWKQCwy2N1eW/QccOS
 b1eZq8c97xs6zTgIV1nm9nnDevmVzzHiBuC6aLCOc8hzJGb5i9Vf7/vyc4UUd2ODRQhi
 ryXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFpucqa/S4MF+1ya0hnsuGExMR9c6elxqRzj9AQxLBaHX0xmRRhkeilSVeJAnaoddpMXdILnhm8xE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUvgTiM1XdIL7yU63Ab8PQJ6L++yx3G7ILB2AaDxUmlxNe+Jn1
 +KT9A9ZC3yjj7/10R1gAZxKfovVfQ6Lzlf79uIMrptZFb9/3cqqvd2cRh6gD8qL2eaQqJx2tToM
 TWx0Qi4lyHP8GskabIvnwgbe1hamwnY/ZTufb
X-Gm-Gg: ASbGncvfRLOx0VYugYsihJTFp6RHzvH+sRRk75dJ5q9Lp9MkDqCiCulrUv/iX+2P5Db
 k8Y/F0Y+uunaIbbuzK6zS2ilfI89I77Ml1xjmJpxXMlR5WzC7Af35jJSaHpjIp121vr7MKCQb0X
 d2UD4+KCkzJGq/jIvqsWb399EiIvhiZz0axFbyeIiS+1Ub9/Uwng==
X-Google-Smtp-Source: AGHT+IHWvQ/UxjzUUwRECNcfgu+uE4CxuQo4Yg/huZ0f0f8fGXRQAw3hQFkIdxjr0XHLMAHxPwRY62fHbX9JtKGOg54=
X-Received: by 2002:a05:600c:63cb:b0:43d:5b3a:18cc with SMTP id
 5b1f17b1804b1-441b200a129mr152725e9.2.1745956161141; Tue, 29 Apr 2025
 12:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250417180943.1559755-1-tjmercier@google.com>
 <a4f72149-70a0-4bbe-bdcc-70384c152f83@amd.com>
 <CABdmKX2-innZC65Fut6wc2MFUNwO2g6w=_iLv9EBkDn+6LQs5w@mail.gmail.com>
In-Reply-To: <CABdmKX2-innZC65Fut6wc2MFUNwO2g6w=_iLv9EBkDn+6LQs5w@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 29 Apr 2025 12:49:09 -0700
X-Gm-Features: ATxdqUHw3CpDYUbqlneqXa6xD7zi73EGyL_HFvk88E824RQ0483hIO9wIhSzBDw
Message-ID: <CABdmKX0pjGn85CLFgwauBop8i=WThnpUNkDfFhV3hMe19dDuyA@mail.gmail.com>
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

On Tue, Apr 22, 2025 at 9:17=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Tue, Apr 22, 2025 at 1:24=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 17.04.25 um 20:09 schrieb T.J. Mercier:
> > > struct dma_heap_attachment is a separate allocation from the struct
> > > sg_table it contains, but there is no reason for this. Let's use the
> > > slab allocator just once instead of twice for dma_heap_attachment.
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > I'm not *that* expert for this code, but looks totally reasonable to me=
.
>
> I noticed this while reviewing Maxime Ripard's recent carveout heap
> patches, where I was confused about sg_free_table() until I realized
> it doesn't free the underlying allocation. Then I started looking at
> other heaps and found that most of them do it this way (including the
> cma heap), and figured it was a nice cleanup here.
>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > Let me know if I should push that to drm-misc-next.
> >
> > Regards,
> > Christian.
>
> Thanks, yes please!

Hi Christian, could you push this please? I don't have write permissions.

Thanks,
T.J.

>
>
>
> > > ---
> > >  drivers/dma-buf/heaps/system_heap.c | 43 ++++++++++++---------------=
--
> > >  1 file changed, 17 insertions(+), 26 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/he=
aps/system_heap.c
> > > index 26d5dc89ea16..bee10c400cf0 100644
> > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > @@ -35,7 +35,7 @@ struct system_heap_buffer {
> > >
> > >  struct dma_heap_attachment {
> > >       struct device *dev;
> > > -     struct sg_table *table;
> > > +     struct sg_table table;
> > >       struct list_head list;
> > >       bool mapped;
> > >  };
> > > @@ -54,29 +54,22 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, H=
IGH_ORDER_GFP, LOW_ORDER_GFP};
> > >  static const unsigned int orders[] =3D {8, 4, 0};
> > >  #define NUM_ORDERS ARRAY_SIZE(orders)
> > >
> > > -static struct sg_table *dup_sg_table(struct sg_table *table)
> > > +static int dup_sg_table(struct sg_table *from, struct sg_table *to)
> > >  {
> > > -     struct sg_table *new_table;
> > > -     int ret, i;
> > >       struct scatterlist *sg, *new_sg;
> > > +     int ret, i;
> > >
> > > -     new_table =3D kzalloc(sizeof(*new_table), GFP_KERNEL);
> > > -     if (!new_table)
> > > -             return ERR_PTR(-ENOMEM);
> > > -
> > > -     ret =3D sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL=
);
> > > -     if (ret) {
> > > -             kfree(new_table);
> > > -             return ERR_PTR(-ENOMEM);
> > > -     }
> > > +     ret =3D sg_alloc_table(to, from->orig_nents, GFP_KERNEL);
> > > +     if (ret)
> > > +             return ret;
> > >
> > > -     new_sg =3D new_table->sgl;
> > > -     for_each_sgtable_sg(table, sg, i) {
> > > +     new_sg =3D to->sgl;
> > > +     for_each_sgtable_sg(from, sg, i) {
> > >               sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset=
);
> > >               new_sg =3D sg_next(new_sg);
> > >       }
> > >
> > > -     return new_table;
> > > +     return 0;
> > >  }
> > >
> > >  static int system_heap_attach(struct dma_buf *dmabuf,
> > > @@ -84,19 +77,18 @@ static int system_heap_attach(struct dma_buf *dma=
buf,
> > >  {
> > >       struct system_heap_buffer *buffer =3D dmabuf->priv;
> > >       struct dma_heap_attachment *a;
> > > -     struct sg_table *table;
> > > +     int ret;
> > >
> > >       a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> > >       if (!a)
> > >               return -ENOMEM;
> > >
> > > -     table =3D dup_sg_table(&buffer->sg_table);
> > > -     if (IS_ERR(table)) {
> > > +     ret =3D dup_sg_table(&buffer->sg_table, &a->table);
> > > +     if (ret) {
> > >               kfree(a);
> > > -             return -ENOMEM;
> > > +             return ret;
> > >       }
> > >
> > > -     a->table =3D table;
> > >       a->dev =3D attachment->dev;
> > >       INIT_LIST_HEAD(&a->list);
> > >       a->mapped =3D false;
> > > @@ -120,8 +112,7 @@ static void system_heap_detach(struct dma_buf *dm=
abuf,
> > >       list_del(&a->list);
> > >       mutex_unlock(&buffer->lock);
> > >
> > > -     sg_free_table(a->table);
> > > -     kfree(a->table);
> > > +     sg_free_table(&a->table);
> > >       kfree(a);
> > >  }
> > >
> > > @@ -129,7 +120,7 @@ static struct sg_table *system_heap_map_dma_buf(s=
truct dma_buf_attachment *attac
> > >                                               enum dma_data_direction=
 direction)
> > >  {
> > >       struct dma_heap_attachment *a =3D attachment->priv;
> > > -     struct sg_table *table =3D a->table;
> > > +     struct sg_table *table =3D &a->table;
> > >       int ret;
> > >
> > >       ret =3D dma_map_sgtable(attachment->dev, table, direction, 0);
> > > @@ -164,7 +155,7 @@ static int system_heap_dma_buf_begin_cpu_access(s=
truct dma_buf *dmabuf,
> > >       list_for_each_entry(a, &buffer->attachments, list) {
> > >               if (!a->mapped)
> > >                       continue;
> > > -             dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> > > +             dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
> > >       }
> > >       mutex_unlock(&buffer->lock);
> > >
> > > @@ -185,7 +176,7 @@ static int system_heap_dma_buf_end_cpu_access(str=
uct dma_buf *dmabuf,
> > >       list_for_each_entry(a, &buffer->attachments, list) {
> > >               if (!a->mapped)
> > >                       continue;
> > > -             dma_sync_sgtable_for_device(a->dev, a->table, direction=
);
> > > +             dma_sync_sgtable_for_device(a->dev, &a->table, directio=
n);
> > >       }
> > >       mutex_unlock(&buffer->lock);
> > >
> > >
> > > base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> >
