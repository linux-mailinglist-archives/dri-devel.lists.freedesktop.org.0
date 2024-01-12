Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210DD82C7FA
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 00:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427710EB9A;
	Fri, 12 Jan 2024 23:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ED310EB95
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 23:27:40 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d47fae33e0so50975ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705102060; x=1705706860;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhEbbmE1Z6uLNZgCKtRC6woP3H/Wl1Wl1gQfP+v/DTY=;
 b=qb9hBj4XJWNsaI9ZJtaiklD5jNgplwYPCsR574bT2pbXpXybGZwVicSHvUXWh0TpxG
 Tce8Mfiv50tcADy+QwotfLl/j02PRUTRshZhwa9d9/qfS6c9Am3Szb1eehtmIAdpnq+L
 uvl0QJrgyOA1hh+4vLSqcvnoF2VonBQ3sEhj6sZitlnA6H0EZJ/AQih7zgiVtBzdy8Ew
 w6Y0cCyBrkhh5BA8byWZtwNGl2O3V6XAfDQk7iKXunrsQZPs9ZuA8CcAEQ0Wz6DowV1F
 ZP3uGJgj0Id5xQEa2igKiJHf/ILme527jnfYTPeKVAb4DkUOrwHWnDwqTwjZKsEtzKpv
 Rryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705102060; x=1705706860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhEbbmE1Z6uLNZgCKtRC6woP3H/Wl1Wl1gQfP+v/DTY=;
 b=gU6jyrT6/SXsnqjH5g7djj1DYQl0Dkm2/mp7KZPImzJAORcda/5DmXVGdHx2thh4zM
 uTmjhfIYdzLTeMSjGQkMATOBv41z9smxiSjUhVVFPbZjQ7RIRf6DwHhQCIU4gnZdGubI
 9Jg8nmBhWZlhEiy9251rQ/CdLd1kZT2vMZRyurlxqDDtsDz33f7Usw/kIcNbmcl1jRl+
 k1ymJtDJ9qBKSpTraUue8IlWeo+ZrCELVLejYMyHavvFs8Tg/x0Fy/n+V5g7eKdPOBV6
 /M1qazwJt7s1Jq5MyoUazzifM+W1TbvgRNmGYQogGfZHzIk2zobp8kyfWqqLlrKvpJCT
 C1kA==
X-Gm-Message-State: AOJu0YwxkXbPWWNtwLcqZtdK6SAPNDyGxFHu/p4XmXHE4xBFpBKb3c3s
 bFXZFLb00BPvND9K/v/sICgrx0xsWqhCndtkOpGumk4z8n0=
X-Google-Smtp-Source: AGHT+IFwwNVRgX+18llMY6Crrv0CZvMC6Ee5jLqPJn9RMR+jzSAJCxBI0rpUZIw0G2/SmU4oxB/NiR3hY1G0xancka4=
X-Received: by 2002:a17:903:210d:b0:1d5:a791:ef1b with SMTP id
 o13-20020a170903210d00b001d5a791ef1bmr203692ple.1.1705102059466; Fri, 12 Jan
 2024 15:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
In-Reply-To: <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Fri, 12 Jan 2024 15:27:27 -0800
Message-ID: <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
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

On Fri, Jan 12, 2024 at 2:52=E2=80=AFPM John Stultz <jstultz@google.com> wr=
ote:
>
> On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wr=
ote:
> >
> > Add "struct restricted_heap_ops". For the restricted memory, totally th=
ere
> > are two steps:
> > a) memory_alloc: Allocate the buffer in kernel;
> > b) memory_restrict: Restrict/Protect/Secure that buffer.
> > The memory_alloc is mandatory while memory_restrict is optinal since it=
 may
> > be part of memory_alloc.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
> >  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
> >  2 files changed, 52 insertions(+), 1 deletion(-)
> >
>
> Thanks for sending this out! A thought below.
>
> > diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/=
heaps/restricted_heap.h
> > index 443028f6ba3b..ddeaf9805708 100644
> > --- a/drivers/dma-buf/heaps/restricted_heap.h
> > +++ b/drivers/dma-buf/heaps/restricted_heap.h
> > @@ -15,6 +15,18 @@ struct restricted_buffer {
> >
> >  struct restricted_heap {
> >         const char              *name;
> > +
> > +       const struct restricted_heap_ops *ops;
> > +};
> > +
> > +struct restricted_heap_ops {
> > +       int     (*heap_init)(struct restricted_heap *heap);
> > +
> > +       int     (*memory_alloc)(struct restricted_heap *heap, struct re=
stricted_buffer *buf);
> > +       void    (*memory_free)(struct restricted_heap *heap, struct res=
tricted_buffer *buf);
> > +
> > +       int     (*memory_restrict)(struct restricted_heap *heap, struct=
 restricted_buffer *buf);
> > +       void    (*memory_unrestrict)(struct restricted_heap *heap, stru=
ct restricted_buffer *buf);
> >  };
> >
> >  int restricted_heap_add(struct restricted_heap *rstrd_heap);
>
> So, I'm a little worried here, because you're basically turning the
> restricted_heap dma-buf heap driver into a framework itself.
> Where this patch is creating a subdriver framework.
>
> Part of my hesitancy, is you're introducing this under the dma-buf
> heaps. For things like CMA, that's more of a core subsystem that has
> multiple users, and exporting cma buffers via dmabuf heaps is just an
> additional interface.  What I like about that is the core kernel has
> to define the semantics for the memory type and then the dmabuf heap
> is just exporting that well understood type of buffer.
>
> But with these restricted buffers, I'm not sure there's yet a well
> understood set of semantics nor a central abstraction for that which
> other drivers use directly.
>
> I know part of this effort here is to start to centralize all these
> vendor specific restricted buffer implementations, which I think is
> great, but I just worry that in doing it in the dmabuf heap interface,
> it is a bit too user-facing. The likelihood of encoding a particular
> semantic to the singular "restricted_heap" name seems high.

In patch #5 it has the actual driver implementation for the MTK heap
that includes the heap name of "restricted_mtk_cm", so there shouldn't
be a heap named "restricted_heap" that's actually getting exposed. The
restricted_heap code is a framework, and not a driver itself.  Unless
I'm missing something in this patchset...but that's the way it's
*supposed* to be.

>
> Similarly we might run into systems with multiple types of restricted
> buffers (imagine a discrete gpu having one type along with TEE
> protected buffers also being used on the same system).
>
> So the one question I have: Why not just have a mediatek specific
> restricted_heap dmabuf heap driver?  Since there's already been some
> talk of slight semantic differences in various restricted buffer
> implementations, should we just start with separately named dmabuf
> heaps for each? Maybe consolidating to a common name as more drivers
> arrive and we gain a better understanding of the variations of
> semantics folks are using?
>
> thanks
> -john
