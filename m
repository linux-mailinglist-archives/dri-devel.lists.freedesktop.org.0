Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74496CFD5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 08:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D943110E6FE;
	Thu,  5 Sep 2024 06:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A8YI29Xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D1710E6FE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 06:56:24 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-70f79f75da6so298386a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725519383; x=1726124183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=is6oA3m8LIEojdfLA7VjQTerM+IVLQZFBibvLCSwhaA=;
 b=A8YI29XhbdfxviM6gL5kXlrKlvya/X0g3w25Jkq3lI0vtLIPTx6MFqhOybefcKQPtx
 bdlAAaAkyKvS/ypqz0s1XEx3oNozogVqACxdkw/ViSjbRJ9C1CyGtW5qQRHqAXsXiAT8
 p0/ZKSqGTPqQpIQeMg35NlasEzQgpRjmOegy3i4H3HCFWbRQXDFwtQ2pBZv2fiYPnCXB
 mPgnqjacfS+esUgCGHGBkaZNopEuH0VXUUUaLjpHnkq9aD20zmxjGU3ZtCVOTeEMiBrG
 13Pe9ealppDC/6z+HJqIgR0UUibwgEZzMGBEkUGhyL7buR4IHxbzhkpVD1KMPtzFHCfD
 V+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725519383; x=1726124183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=is6oA3m8LIEojdfLA7VjQTerM+IVLQZFBibvLCSwhaA=;
 b=Uv4XsArz+abAC58PyPkQ3uO8skNATHSok8RelTbF1xJnTnje8//xJq63eAUILf0PDv
 mU/hvqARAx8M/Id2avW5O7dX6dW0CUWpynOERYYDubeR79xcoGQfUsVgZauwxhRCHShp
 hvkIHjAu24kCru6FA6axgkznF7GD2y+bc1Kzjc3LMc/zib7h36lwCUG9txYXW6NUuyuV
 5Z4+bchgLSUCjtJOR1zcyB29kNY/Mbve0iPVDTKQr3kP7mZj13Wd5dtKtIFJt78tJTs+
 GhML7YL9sc1FgBw9xiQ4bquJod4Wmxc7awfnpcRFzfFWlybUmWLx2EjEa7VTs7QDG+Hh
 nvLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs6bkw1KeF7E97If7ofdet16N48LOz28koowQo7E2hvp+YLSofMhLj/hJrA+eiks5ReYPzxASBm4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcj7xf2UDL7LHor3zc30vDdVrrur9GCyKuUfbMxB1p3rppF8VR
 WFXlYMJvfojHSHoH5Of5QLIh/WO1v2F6SEm3RTrWq6+8AqON5JsSlgG0mkfPvMqhOolh49J90bd
 YxQ/p56a70hnBsBn26ppVrsAueEMiqRU2VmRS5w==
X-Google-Smtp-Source: AGHT+IH5sLg/BL7saD9/TXa220ctb5hvcylawPt/eU1IH9MP/VmfAzkYvlQbzwvsbvXXi2U8bfsvnevyQYB2IQEHh6U=
X-Received: by 2002:a05:6830:25d6:b0:703:63d3:9eef with SMTP id
 46e09a7af769-70f7072e89bmr16742155a34.25.1725519383303; Wed, 04 Sep 2024
 23:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-2-jens.wiklander@linaro.org>
 <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
In-Reply-To: <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 5 Sep 2024 08:56:11 +0200
Message-ID: <CAHUa44G9yF2GoQD8XrE=agkGCditH1v+NYm16WpdORX4aRixYg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dma-buf: heaps: restricted_heap: add no_map
 attribute
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

On Fri, Aug 30, 2024 at 10:47=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 30.08.24 um 09:03 schrieb Jens Wiklander:
> > Add a no_map attribute to struct restricted_heap_attachment and struct
> > restricted_heap to skip the call to dma_map_sgtable() if set. This
> > avoids trying to map a dma-buf that doens't refer to memory accessible
> > by the kernel.
>
> You seem to have a misunderstanding here dma_map_sgtable() is called to
> map a table into IOMMU and not any kernel address space.
>
> So please explain why you need that?

You're right, I had misunderstood dma_map_sgtable(). There's no need
for the no_map attribute, so I'll remove it.

Perhaps you have a suggestion on how to fix a problem when using
dma_map_sgtable()?

Without it, I'll have to assign a pointer to teedev->dev.dma_mask when
using the restricted heap with the OP-TEE driver or there will be a
warning in __dma_map_sg_attrs() ending with a failure when trying to
register the dma-buf fd. OP-TEE is probed with a platform device, and
taking the dma_mask pointer from that device works. Is that a good
approach or is there a better way of assigning dma_mask?

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   drivers/dma-buf/heaps/restricted_heap.c | 17 +++++++++++++----
> >   drivers/dma-buf/heaps/restricted_heap.h |  2 ++
> >   2 files changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/=
heaps/restricted_heap.c
> > index 8bc8a5e3f969..4bf28e3727ca 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.c
> > +++ b/drivers/dma-buf/heaps/restricted_heap.c
> > @@ -16,6 +16,7 @@
> >   struct restricted_heap_attachment {
> >       struct sg_table                 *table;
> >       struct device                   *dev;
> > +     bool no_map;
> >   };
> >
> >   static int
> > @@ -54,6 +55,8 @@ restricted_heap_memory_free(struct restricted_heap *r=
heap, struct restricted_buf
> >   static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attachment)
> >   {
> >       struct restricted_buffer *restricted_buf =3D dmabuf->priv;
> > +     struct dma_heap *heap =3D restricted_buf->heap;
> > +     struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> >       struct restricted_heap_attachment *a;
> >       struct sg_table *table;
> >
> > @@ -70,6 +73,7 @@ static int restricted_heap_attach(struct dma_buf *dma=
buf, struct dma_buf_attachm
> >       sg_dma_mark_restricted(table->sgl);
> >       a->table =3D table;
> >       a->dev =3D attachment->dev;
> > +     a->no_map =3D rheap->no_map;
> >       attachment->priv =3D a;
> >
> >       return 0;
> > @@ -92,9 +96,12 @@ restricted_heap_map_dma_buf(struct dma_buf_attachmen=
t *attachment,
> >       struct sg_table *table =3D a->table;
> >       int ret;
> >
> > -     ret =3D dma_map_sgtable(attachment->dev, table, direction, DMA_AT=
TR_SKIP_CPU_SYNC);
> > -     if (ret)
> > -             return ERR_PTR(ret);
> > +     if (!a->no_map) {
> > +             ret =3D dma_map_sgtable(attachment->dev, table, direction=
,
> > +                                   DMA_ATTR_SKIP_CPU_SYNC);
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +     }
> >       return table;
> >   }
> >
> > @@ -106,7 +113,9 @@ restricted_heap_unmap_dma_buf(struct dma_buf_attach=
ment *attachment, struct sg_t
> >
> >       WARN_ON(a->table !=3D table);
> >
> > -     dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKI=
P_CPU_SYNC);
> > +     if (!a->no_map)
> > +             dma_unmap_sgtable(attachment->dev, table, direction,
> > +                               DMA_ATTR_SKIP_CPU_SYNC);
> >   }
> >
> >   static int
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/=
heaps/restricted_heap.h
> > index 7dec4b8a471b..94cc0842f70d 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > @@ -27,6 +27,8 @@ struct restricted_heap {
> >       unsigned long           cma_paddr;
> >       unsigned long           cma_size;
> >
> > +     bool                    no_map;
> > +
> >       void                    *priv_data;
> >   };
> >
>
