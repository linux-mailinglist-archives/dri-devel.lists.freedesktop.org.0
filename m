Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DCB82C81D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F6710E127;
	Fri, 12 Jan 2024 23:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257CB10E127
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:51:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e43e55b87so17425e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 15:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705103498; x=1705708298;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kp9mV4Ke/a2nl4+Mq/TPZKlXYFvSYBSYldkMY7yov80=;
 b=qlrZUjvA6KUVEs64grBmnsksJ0C5CVbUZuZqaLusxAUTPs/Q+yxrFRpTvTtwu7q70Q
 25m2lFbguoLmKW7mjsSWjRkFq2+u44wJc1mpNCL/2dGfvglEJdz6PgdEVwbfAtjQdwM0
 JGwa4/xsptagWs6p+cisf6XEg0THJHETGjaMDo69vffBgPyguMCBp828O6XTaCnlY1CJ
 p1Tdn0E4wdCE0BaTMIgFNpc9XaItjh5JlpneEQayTFygmzQnZq7DdN6igydjHnwlsyKE
 1lyVFZIRZ0DxmVS6GlzezT/B8AJ16Ghnak/la89adQoK43T/di6UBV8r/LQGhjH9fh69
 ibBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705103498; x=1705708298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kp9mV4Ke/a2nl4+Mq/TPZKlXYFvSYBSYldkMY7yov80=;
 b=WM9AD5CWUTsuu403eRr6WUJLzqURkU45eymAkv350NwNorMZgcJ5R/hLmE0kskWhsu
 l5on4l7ONx5U6ERnlcCd5muiw+nI4u+HlfsqxtvcQ3UQMyB9MZA4n2BKZDJ0iSvK5iBx
 Ll4Fw4Cd74EvyR//9q18VsJfHwfyiIuFcOdvcan8EtjHSltmiIj+RxfaZplnhalk3Cs8
 xfmo9rhXxEpwhc6BqF13N7KVCh2pS2H29d6vC0L/AaEpDFeg2yGRcGY9bDu2SbDi0AO7
 ADy827HVdF6srPV45EB4g0wyManRsDACuZIGElBdN7NiPxW6O9Kx51/RwFNyXyDM6OSn
 BNdA==
X-Gm-Message-State: AOJu0Yy543mPJmCY3lFEfAnyh1oKFhY+BdS2MmrZRhsULZkRNxgmcpon
 PDvPxePSoNNaiBZQRv4gmt6YDzJ4fa5Ccn64KrZYNf0XLds=
X-Google-Smtp-Source: AGHT+IHw6ArP/KmmpI2CYpNyzdh9UGjQJc8eU/h6V5ZAE1R9MItE23iIMtklhlwhBVwyIqzHg22KBjSAxDaPMMiP1UE=
X-Received: by 2002:a05:600c:3b1d:b0:40d:87df:92ca with SMTP id
 m29-20020a05600c3b1d00b0040d87df92camr30276wms.3.1705103498218; Fri, 12 Jan
 2024 15:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
In-Reply-To: <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 12 Jan 2024 15:51:25 -0800
Message-ID: <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
To: Jeffrey Kardatzke <jkardatzke@google.com>
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

On Fri, Jan 12, 2024 at 3:27=E2=80=AFPM Jeffrey Kardatzke <jkardatzke@googl=
e.com> wrote:
> On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.com> =
wrote:
> > On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> =
wrote:
> > > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-bu=
f/heaps/restricted_heap.h
> > > index 443028f6ba3b..ddeaf9805708 100644
> > > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > > @@ -15,6 +15,18 @@ struct restricted_buffer {
> > >
> > >  struct restricted_heap {
> > >         const char              *name;
> > > +
> > > +       const struct restricted_heap_ops *ops;
> > > +};
> > > +
> > > +struct restricted_heap_ops {
> > > +       int     (*heap_init)(struct restricted_heap *heap);
> > > +
> > > +       int     (*memory_alloc)(struct restricted_heap *heap, struct =
restricted_buffer *buf);
> > > +       void    (*memory_free)(struct restricted_heap *heap, struct r=
estricted_buffer *buf);
> > > +
> > > +       int     (*memory_restrict)(struct restricted_heap *heap, stru=
ct restricted_buffer *buf);
> > > +       void    (*memory_unrestrict)(struct restricted_heap *heap, st=
ruct restricted_buffer *buf);
> > >  };
> > >
> > >  int restricted_heap_add(struct restricted_heap *rstrd_heap);
> >
> > So, I'm a little worried here, because you're basically turning the
> > restricted_heap dma-buf heap driver into a framework itself.
> > Where this patch is creating a subdriver framework.
> >
> > Part of my hesitancy, is you're introducing this under the dma-buf
> > heaps. For things like CMA, that's more of a core subsystem that has
> > multiple users, and exporting cma buffers via dmabuf heaps is just an
> > additional interface.  What I like about that is the core kernel has
> > to define the semantics for the memory type and then the dmabuf heap
> > is just exporting that well understood type of buffer.
> >
> > But with these restricted buffers, I'm not sure there's yet a well
> > understood set of semantics nor a central abstraction for that which
> > other drivers use directly.
> >
> > I know part of this effort here is to start to centralize all these
> > vendor specific restricted buffer implementations, which I think is
> > great, but I just worry that in doing it in the dmabuf heap interface,
> > it is a bit too user-facing. The likelihood of encoding a particular
> > semantic to the singular "restricted_heap" name seems high.
>
> In patch #5 it has the actual driver implementation for the MTK heap
> that includes the heap name of "restricted_mtk_cm", so there shouldn't
> be a heap named "restricted_heap" that's actually getting exposed. The

Ah, I appreciate that clarification! Indeed, you're right the name is
passed through. Apologies for missing that detail.

> restricted_heap code is a framework, and not a driver itself.  Unless
> I'm missing something in this patchset...but that's the way it's
> *supposed* to be.

So I guess I'm not sure I understand the benefit of the extra
indirection. What then does the restricted_heap.c logic itself
provide?
The dmabuf heaps framework already provides a way to add heap implementatio=
ns.

thanks
-john
