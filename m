Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2E782C83A
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 01:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103710EBC1;
	Sat, 13 Jan 2024 00:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1C910EBB9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jan 2024 00:13:35 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d5ad1a14e1so56995ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 16:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705104815; x=1705709615;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZN1rPiXKN7u9zdqvXb7Qif49uja1bfBANswKzoofhOQ=;
 b=kJOYJ+XmD0ray50S1cGRyu8NQ423MuwlFLnGmlksxjkTgCCcXBcYHBe9ImfIA6b5ZP
 gedpotAuerfe+yeKz86U9WbMnH6HWAsk5+CjI4p57nFjeJzgh95RDqm4aquIK2BZwVUe
 z69lWce6A2n2lHE1XA3WfFjqZqX6Cv2+RT8D79HVLNrPse/aFjaJpFwPk41ku+vvaBzT
 awq+WfoVeMEk1h2dyc9ddrCbxzcOKJHzdNJqdgDWqDWqLGbS+g/h3t85TcDo+mKE6Tvi
 KJyrhfkYPwxtF+GXFhU5pGcbfhiADi6z6DYKqJT3xRkQmP7mVG5HZqMjaYMSM4zA91JL
 SC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705104815; x=1705709615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZN1rPiXKN7u9zdqvXb7Qif49uja1bfBANswKzoofhOQ=;
 b=OI4nrgXiUJAVmCH7WDYFKyb2jaJSlKftjFSLOSzaobVAGgbug+D3SBr+7gRg9UeAn5
 Cd3sONyhoG+olXlPbjdmKT59fJI7QOzswCaGFkcflENb7W5G9/xDzRTuV1ynxllDNLrV
 Xxz8eQDa+xwj564W5g2M1rXjM8xDrTbcgoot/tQHjUjNPATPKXGjZcT3P/g5Yir34azC
 ufAbw7BJ7WWWIX+VIMS1dXc8su52ThQYXeDUFjZyJAkOtpz981H+iK/KXhDsENVReTsV
 c4AqMNp+tsFLY6GnyICuerxHhlkLhwlJwaliZ3nVtPjyUIORu+hXAqREp0QxksleDcHy
 3VPw==
X-Gm-Message-State: AOJu0Yx7a42KpKldk+sFL9PMdXBcmKosHGqrgP8rCFCTbz/cXDj/76av
 Pk/TFu0V+Fo3DZVPAif2MfEI54cVvXibEfsXLZuEGV45BMU=
X-Google-Smtp-Source: AGHT+IFoy9IVWruhvKFe05xW5Uee6UeUnu8jeQqa2o5hMHQEB/8kcTZ0reXjfnhh9x+XoVNHMhQznVcSROnNPsA1e0c=
X-Received: by 2002:a17:902:ec8a:b0:1d4:c2bd:eff5 with SMTP id
 x10-20020a170902ec8a00b001d4c2bdeff5mr44003plg.3.1705104814522; Fri, 12 Jan
 2024 16:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
 <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
In-Reply-To: <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Fri, 12 Jan 2024 16:13:22 -0800
Message-ID: <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
To: John Stultz <jstultz@google.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>, youlin.pei@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 3:51=E2=80=AFPM John Stultz <jstultz@google.com> wr=
ote:
>
> On Fri, Jan 12, 2024 at 3:27=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@goo=
gle.com> wrote:
> > On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.com=
> wrote:
> > > On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com=
> wrote:
> > > > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-=
buf/heaps/restricted_heap.h
> > > > index 443028f6ba3b..ddeaf9805708 100644
> > > > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > > > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > > > @@ -15,6 +15,18 @@ struct restricted_buffer {
> > > >
> > > >  struct restricted_heap {
> > > >         const char              *name;
> > > > +
> > > > +       const struct restricted_heap_ops *ops;
> > > > +};
> > > > +
> > > > +struct restricted_heap_ops {
> > > > +       int     (*heap_init)(struct restricted_heap *heap);
> > > > +
> > > > +       int     (*memory_alloc)(struct restricted_heap *heap, struc=
t restricted_buffer *buf);
> > > > +       void    (*memory_free)(struct restricted_heap *heap, struct=
 restricted_buffer *buf);
> > > > +
> > > > +       int     (*memory_restrict)(struct restricted_heap *heap, st=
ruct restricted_buffer *buf);
> > > > +       void    (*memory_unrestrict)(struct restricted_heap *heap, =
struct restricted_buffer *buf);
> > > >  };
> > > >
> > > >  int restricted_heap_add(struct restricted_heap *rstrd_heap);
> > >
> > > So, I'm a little worried here, because you're basically turning the
> > > restricted_heap dma-buf heap driver into a framework itself.
> > > Where this patch is creating a subdriver framework.
> > >
> > > Part of my hesitancy, is you're introducing this under the dma-buf
> > > heaps. For things like CMA, that's more of a core subsystem that has
> > > multiple users, and exporting cma buffers via dmabuf heaps is just an
> > > additional interface.  What I like about that is the core kernel has
> > > to define the semantics for the memory type and then the dmabuf heap
> > > is just exporting that well understood type of buffer.
> > >
> > > But with these restricted buffers, I'm not sure there's yet a well
> > > understood set of semantics nor a central abstraction for that which
> > > other drivers use directly.
> > >
> > > I know part of this effort here is to start to centralize all these
> > > vendor specific restricted buffer implementations, which I think is
> > > great, but I just worry that in doing it in the dmabuf heap interface=
,
> > > it is a bit too user-facing. The likelihood of encoding a particular
> > > semantic to the singular "restricted_heap" name seems high.
> >
> > In patch #5 it has the actual driver implementation for the MTK heap
> > that includes the heap name of "restricted_mtk_cm", so there shouldn't
> > be a heap named "restricted_heap" that's actually getting exposed. The
>
> Ah, I appreciate that clarification! Indeed, you're right the name is
> passed through. Apologies for missing that detail.
>
> > restricted_heap code is a framework, and not a driver itself.  Unless
> > I'm missing something in this patchset...but that's the way it's
> > *supposed* to be.
>
> So I guess I'm not sure I understand the benefit of the extra
> indirection. What then does the restricted_heap.c logic itself
> provide?
> The dmabuf heaps framework already provides a way to add heap implementat=
ions.

So in the v1 patchset, it was done with just a Mediatek specific heap
with no framework or abstractions for another vendor to build on top
of. The feedback was to make this more generic since Mediatek won't be
the only vendor who wants a restricted heap..which is how it ended up
here. There was more code in the framework before relating to TEE
calls, but then that was moved to the vendor specific code since not
all restricted heaps are allocated through a TEE.

This was also desirable for the V4L2 pieces since there's going to be
a V4L2 flag set when using restricted dma_bufs (and it wants to
validate that)....so in order to keep that more generic, there should
be a higher level concept of restricted dma_bufs that isn't specific
to a single vendor.  One other thing that would ideally come out of
this is a cleaner way to check that a dma_buf is restricted or not.
The current V4L2 patchset just attaches the dma_buf and then checks if
the page table is empty....and if so, it's restricted. But now I see
there's other feedback indicating attaching a restricted dma_buf
shouldn't even be allowed, so we'll need another strategy for
detecting them. Ideally there is some function/macro like
is_dma_buf_restricted(struct dma_buf*) that can indicate that...but we
haven't come up with a good way to do that yet which doesn't involve
adding another field to dma_buf or to dma_buf_ops (and if such a thing
would be fine, then OK...but I had assumed we would get pushback on
modifying either of those structs).

>
> thanks
> -john
