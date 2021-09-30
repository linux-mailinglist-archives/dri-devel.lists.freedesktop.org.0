Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD841D86A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 13:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1980F6EB6C;
	Thu, 30 Sep 2021 11:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFEB8813A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 11:06:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g41so23604563lfv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hx1z0Pj0GS4/tUfd4pnSP67CAPCyRWqRNmIUPcowuII=;
 b=OJ4uZsJwV182DcalBRZYBoqbUwKgzPLb3AvWlbx0nO9e5rIolS8SlVDutUiTeD1C/X
 fS9bjA78G2HNmjq0+vZdZESEkSMR9lug5mBNuCKRaKwGV0LqTAkGHRiuHnsThS43TvD8
 YoGUTl8edDquVLUToIqvF/573jxlP0yNvPrSL0BfP3V66/fQsx2JEQxR25WNl7F7ldPd
 0cp/7NM8U+yV0emLsUOlUBtiIe0Nr9qNmHAKUEyaVrYGz5lbYwvv4uX+TDQbCFxxCsAv
 /SPxyUEMSJwrPDXmuaWCxw5j2rqEIGkfU6w1wEnnbp1PlE0+J5TBJpa4Q4TkXJ1i8P4r
 s83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hx1z0Pj0GS4/tUfd4pnSP67CAPCyRWqRNmIUPcowuII=;
 b=Xjbl7qvvehF4rn8DmRxwdDHFh0e/szzV1Rfyfcu2G8U649jQzn89udykLyDcK54l8I
 4sJA+QBAJm6Q1Drf87zVtPbyBhjO/4galFvbI2ZHPZL80kzwoXyOl733nunkMoHbxOVm
 TBas99UQWBjibSKAH3l15erxjDNBUSMgg6NQlG5ewIdKGPdCxtRKCtSfoFvKo6GBmzym
 AteaOxXfGUgaMxhx8T2LJeEsvCrLFlYp7cz7ITsO5yPFeRPK/RZyMQQj0eVn+M+SBu0f
 iwgbVSwzmqawTuuT4xn3z4nmRUjGPoKPLTzXO/BkBWb7zZ2flCbpjeukSxng0CCMe6i9
 Y56A==
X-Gm-Message-State: AOAM533pF5peak/YA9C6pb5fCf/9G8y5z5yBJgqxIDJXVZSN/8QJ6f3+
 mBwNr/TMVvlbj1K6tpMsC8V/yb0DJhZLvXcdtqAekA==
X-Google-Smtp-Source: ABdhPJxKPRxrbe5NsZ+oT2GuKcakf16+GbMKbAstyqKx6i7dnCgOjsjnMxJC7/+s61S9e60hDcCFzI+NqatuX6dwj8Y=
X-Received: by 2002:ac2:4d99:: with SMTP id g25mr5255275lfe.175.1632999991335; 
 Thu, 30 Sep 2021 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210930062014.38200-1-mie@igel.co.jp>
 <20210930062014.38200-2-mie@igel.co.jp>
 <CAD=hENdzYGNp14fm9y9+A71D2BJSjV5GewHMkSJKUzNOs0hqWg@mail.gmail.com>
 <CANXvt5pcHbRVa9=Uqi-MN6RY1g6OY1MDecyhdedqL8Xmv0y6QQ@mail.gmail.com>
 <CAD=hENcANb07bZiAuDYmozsWmZ4uA23Rqca=400+v23QQua_bg@mail.gmail.com>
In-Reply-To: <CAD=hENcANb07bZiAuDYmozsWmZ4uA23Rqca=400+v23QQua_bg@mail.gmail.com>
From: Shunsuke Mie <mie@igel.co.jp>
Date: Thu, 30 Sep 2021 20:06:17 +0900
Message-ID: <CANXvt5oZp=Ap3fEm4nsiP2WfG_c_8o57mN4+PHrQAGHcp-EH2A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Providers/rxe: Add dma-buf support
To: Zhu Yanjun <zyjzyj2000@gmail.com>
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

2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 16:23 Zhu Yanjun <zyjzyj2000@=
gmail.com>:
>
> On Thu, Sep 30, 2021 at 2:58 PM Shunsuke Mie <mie@igel.co.jp> wrote:
> >
> > 2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 15:37 Zhu Yanjun <zyjzyj2=
000@gmail.com>:
> > >
> > > On Thu, Sep 30, 2021 at 2:20 PM Shunsuke Mie <mie@igel.co.jp> wrote:
> > > >
> > > > Implement a new provider method for dma-buf base memory registratio=
n.
> > > >
> > > > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > > > ---
> > > >  providers/rxe/rxe.c | 21 +++++++++++++++++++++
> > > >  1 file changed, 21 insertions(+)
> > > >
> > > > diff --git a/providers/rxe/rxe.c b/providers/rxe/rxe.c
> > > > index 3c3ea8bb..84e00e60 100644
> > > > --- a/providers/rxe/rxe.c
> > > > +++ b/providers/rxe/rxe.c
> > > > @@ -239,6 +239,26 @@ static struct ibv_mr *rxe_reg_mr(struct ibv_pd=
 *pd, void *addr, size_t length,
> > > >         return &vmr->ibv_mr;
> > > >  }
> > > >
> > > > +static struct ibv_mr *rxe_reg_dmabuf_mr(struct ibv_pd *pd, uint64_=
t offset,
> > > > +                                       size_t length, uint64_t iov=
a, int fd,
> > > > +                                       int access)
> > > > +{
> > > > +       struct verbs_mr *vmr;
> > > > +       int ret;
> > > > +
> > > > +       vmr =3D malloc(sizeof(*vmr));
> > > > +       if (!vmr)
> > > > +               return NULL;
> > > > +
> > >
> > > Do we need to set vmr to zero like the following?
> > >
> > > memset(vmr, 0, sizeof(*vmr));
> > >
> > > Zhu Yanjun
> > Thank you for your quick response.
> >
> > I think it is better to clear the vmr. Actually the mlx5 driver allocat=
es
> > the vmr using calloc().
> >
> > In addition, rxe_reg_mr() (not rxe_reg_dmabuf_mr()) is used the malloc
> > and not clear the vmr. I think It has to be fixed too. Should I make
> > another patch to fix this problem?
>
> Yes. Please.
>
> Zhu Yanjun
>
> >
> > Thanks a lot.
> > Shunsuke
> >
> > ~

I looked into the vmr more, but there was no need to clear it. Moreover,
some implementations also use malloc without memory clear.

Thanks,
Shunsuke
