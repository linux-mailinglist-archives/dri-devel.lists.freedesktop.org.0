Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1EB41E207
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 21:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3946E455;
	Thu, 30 Sep 2021 19:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16016E3E3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 11:18:08 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w206so6789997oiw.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 04:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zR1RuttnP3+Oi+vtZg9dj5zmInoMLMP7OLIDzqrCeM4=;
 b=fxo1kP8W8rUyGUvcFNNEduwWPWYudG4siuL76Dk06MfS55J/mxIPYHE6dpD23W3wTu
 +9wzQ0l9bXeuucCAu50S2L1owWxCkJp5lZXU867ndtFXW6/WcimhJw+swolAwg2yhSA/
 zRqK0TPFU30hsXwLJGpkrmOdVnh9hvBrgyjhO97yA3WQk/NryaqB42Sq5AvpeQjl0xnr
 +RAC4szlZocAaq6+yxS6PTatKNZMXtYh9nErdn3p9N0sOBBDCPHZ2UzNnFe48REyMi95
 WYt08rXQcSZDeuIdjNZCYw3MWkWEb/gQggqcRiNkjRLqYnJ8d/tnar66OrCRbPWfsO59
 id8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zR1RuttnP3+Oi+vtZg9dj5zmInoMLMP7OLIDzqrCeM4=;
 b=y212vUMEeCjz+OJTJNHMypgUPU47U3VncmSDqtmRqa5y7JuZV6ITBYkZts3Qa1gIU4
 b8f4sprQgQsuYAp4jM95X9F7w9abR9rmddPdrTMXydlYnI9nPUt2ZOr9fpU7gjSZwdwW
 r4QwJj/4gpJ9Ljl/MNegVoKle2iWgZrW4u/BwY4zNfL+wXvIQksg2uxG7p0Chb76AzXz
 fxq6HuHUSj/lP2v+mBEnc/MEHw8NWEjGRT2ICiX6qa5xpTYViirJh1ywubUzxZr1cY1j
 EMiq0BpYAk9k0FUX44MolDsbHLpVIB27cgNfPYRpGMXngB4hKnagQV0tthFv2DOWgSyW
 ZUcQ==
X-Gm-Message-State: AOAM532nZT7SZSaxgonxEiTleBD5tiPr+NMgnpD9qvihkymmTu0cUp3q
 9PFIyaUyL/mz3zwov2mGVjSOwJZGOAYP0lSVBck=
X-Google-Smtp-Source: ABdhPJz+Xr4nOdlJc56W9ZtZlPsba21tFFtEhlI0kz+IXb9Oz5rYOHIqIiDbxrSrl6wmp1xhHDirSTuh1NTnEeC2e3Y=
X-Received: by 2002:aca:32c5:: with SMTP id y188mr2201314oiy.163.1633000688002; 
 Thu, 30 Sep 2021 04:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210930062014.38200-1-mie@igel.co.jp>
 <20210930062014.38200-2-mie@igel.co.jp>
 <CAD=hENdzYGNp14fm9y9+A71D2BJSjV5GewHMkSJKUzNOs0hqWg@mail.gmail.com>
 <CANXvt5pcHbRVa9=Uqi-MN6RY1g6OY1MDecyhdedqL8Xmv0y6QQ@mail.gmail.com>
 <CAD=hENcANb07bZiAuDYmozsWmZ4uA23Rqca=400+v23QQua_bg@mail.gmail.com>
 <CANXvt5oZp=Ap3fEm4nsiP2WfG_c_8o57mN4+PHrQAGHcp-EH2A@mail.gmail.com>
In-Reply-To: <CANXvt5oZp=Ap3fEm4nsiP2WfG_c_8o57mN4+PHrQAGHcp-EH2A@mail.gmail.com>
From: Zhu Yanjun <zyjzyj2000@gmail.com>
Date: Thu, 30 Sep 2021 19:17:57 +0800
Message-ID: <CAD=hENfMu+OEW7K-WiYqbP7TpksU=0C9e0YZu3xCbqAurNpT9A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Providers/rxe: Add dma-buf support
To: Shunsuke Mie <mie@igel.co.jp>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Jianxin Xiong <jianxin.xiong@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Maor Gottlieb <maorg@nvidia.com>, Sean Hefty <sean.hefty@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, 
 RDMA mailing list <linux-rdma@vger.kernel.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>, 
 Takanari Hayama <taki@igel.co.jp>, Tomohito Esaki <etom@igel.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Sep 2021 19:09:39 +0000
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

On Thu, Sep 30, 2021 at 7:06 PM Shunsuke Mie <mie@igel.co.jp> wrote:
>
> 2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 16:23 Zhu Yanjun <zyjzyj200=
0@gmail.com>:
> >
> > On Thu, Sep 30, 2021 at 2:58 PM Shunsuke Mie <mie@igel.co.jp> wrote:
> > >
> > > 2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 15:37 Zhu Yanjun <zyjzy=
j2000@gmail.com>:
> > > >
> > > > On Thu, Sep 30, 2021 at 2:20 PM Shunsuke Mie <mie@igel.co.jp> wrote=
:
> > > > >
> > > > > Implement a new provider method for dma-buf base memory registrat=
ion.
> > > > >
> > > > > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > > > > ---
> > > > >  providers/rxe/rxe.c | 21 +++++++++++++++++++++
> > > > >  1 file changed, 21 insertions(+)
> > > > >
> > > > > diff --git a/providers/rxe/rxe.c b/providers/rxe/rxe.c
> > > > > index 3c3ea8bb..84e00e60 100644
> > > > > --- a/providers/rxe/rxe.c
> > > > > +++ b/providers/rxe/rxe.c
> > > > > @@ -239,6 +239,26 @@ static struct ibv_mr *rxe_reg_mr(struct ibv_=
pd *pd, void *addr, size_t length,
> > > > >         return &vmr->ibv_mr;
> > > > >  }
> > > > >
> > > > > +static struct ibv_mr *rxe_reg_dmabuf_mr(struct ibv_pd *pd, uint6=
4_t offset,
> > > > > +                                       size_t length, uint64_t i=
ova, int fd,
> > > > > +                                       int access)
> > > > > +{
> > > > > +       struct verbs_mr *vmr;
> > > > > +       int ret;
> > > > > +
> > > > > +       vmr =3D malloc(sizeof(*vmr));
> > > > > +       if (!vmr)
> > > > > +               return NULL;
> > > > > +
> > > >
> > > > Do we need to set vmr to zero like the following?
> > > >
> > > > memset(vmr, 0, sizeof(*vmr));
> > > >
> > > > Zhu Yanjun
> > > Thank you for your quick response.
> > >
> > > I think it is better to clear the vmr. Actually the mlx5 driver alloc=
ates
> > > the vmr using calloc().
> > >
> > > In addition, rxe_reg_mr() (not rxe_reg_dmabuf_mr()) is used the mallo=
c
> > > and not clear the vmr. I think It has to be fixed too. Should I make
> > > another patch to fix this problem?
> >
> > Yes. Please.
> >
> > Zhu Yanjun
> >
> > >
> > > Thanks a lot.
> > > Shunsuke
> > >
> > > ~
>
> I looked into the vmr more, but there was no need to clear it. Moreover,
> some implementations also use malloc without memory clear.
>

I confronted a lot of problems with memory not initialization.
And a latest bug is https://www.spinics.net/lists/linux-rdma/msg105001.html

So it is a good habit to clear a newly allocated memory.

Zhu Yanjun

> Thanks,
> Shunsuke
