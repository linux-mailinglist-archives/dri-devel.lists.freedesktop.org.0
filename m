Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB141D48D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 09:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FC06E329;
	Thu, 30 Sep 2021 07:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A616E329
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:23:22 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso6120338otu.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1I1nXLI6APgtAXVlnSH2tDSE1F+gk/nTZkMd/P13QnM=;
 b=AM00vJx8YutY2y03FGwOzMB4F65tCdTPaWerM11qRrgq55yZhS8ZGBFp0tpAVyO6Wb
 gUwNrDppdPLFqCHICaRzrcwXawyxIM1xDLWZTR4XVuNzTgSUC02vUfp8LzCl7S/VOFS7
 ixqY5BL4KNH9gHHnwpnTTstkk7zIt/1fY/vKdXaW07IkHOvo7iskocXGhAcSWZcDHc+9
 pq6xubaraFJR+yZ6ZDBB2CK7GaOL0fjp52QcsGtdnG5Cq/zzyxIo/UL05C6//UP+ZNtI
 mnGXbC+CLflXmPAY7glOl3xYRbPBxliG0LxRCw2ZtDSsfhE3jDSaWvqfAHkic75hGp5c
 eCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1I1nXLI6APgtAXVlnSH2tDSE1F+gk/nTZkMd/P13QnM=;
 b=LjHboRXl8RRW5UU44AhupCsQBOe4KCJfwYOGbl+ttHXBddWEJLU8gv8elOcAQWcnVt
 0br/Xh8OAagTL1fDyvne4iHvC7daUj4AmlkdcgpQ5Z/uDegfLNDvs5R4mhB0+C4XWNMq
 JvCsbAJ5ewEpYLO+qRvcck83fPYfUjnRChKQI+p1yJNcslAMkWKTKq21z8vWUvCMpuMF
 XfGoo7cNiWmadjnLqcXXlAlbiaikSn3UfTPPjssCjXXOs9pFMmlr6vZEXpMzifsC1RHo
 nubk0TxfQeGaUG33ImdEXCySqyQjz9aM2yzNzlQ1eTDsBoRl9wOCnlGL3WjSLOdF7ReW
 sZJQ==
X-Gm-Message-State: AOAM532zYXfAiLEEhTOcNYXJn5iBdScVbch+XWcfnXxP+eiGrU7EMX8x
 gxukDEW7c9wFdpa5qbyi+sFWjMgHrGJJ5y/7Gfs=
X-Google-Smtp-Source: ABdhPJzkx0SiPJkTwjnw/szFDmj1KPx6Cg36LPLPfN3a1aV1RvHl2MDEPnGNEoGlyj86D+iBI4eONraBUbwXekv8q/s=
X-Received: by 2002:a05:6830:1089:: with SMTP id
 y9mr3930400oto.335.1632986602241; 
 Thu, 30 Sep 2021 00:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210930062014.38200-1-mie@igel.co.jp>
 <20210930062014.38200-2-mie@igel.co.jp>
 <CAD=hENdzYGNp14fm9y9+A71D2BJSjV5GewHMkSJKUzNOs0hqWg@mail.gmail.com>
 <CANXvt5pcHbRVa9=Uqi-MN6RY1g6OY1MDecyhdedqL8Xmv0y6QQ@mail.gmail.com>
In-Reply-To: <CANXvt5pcHbRVa9=Uqi-MN6RY1g6OY1MDecyhdedqL8Xmv0y6QQ@mail.gmail.com>
From: Zhu Yanjun <zyjzyj2000@gmail.com>
Date: Thu, 30 Sep 2021 15:23:10 +0800
Message-ID: <CAD=hENcANb07bZiAuDYmozsWmZ4uA23Rqca=400+v23QQua_bg@mail.gmail.com>
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
X-Mailman-Approved-At: Thu, 30 Sep 2021 07:32:23 +0000
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

On Thu, Sep 30, 2021 at 2:58 PM Shunsuke Mie <mie@igel.co.jp> wrote:
>
> 2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 15:37 Zhu Yanjun <zyjzyj200=
0@gmail.com>:
> >
> > On Thu, Sep 30, 2021 at 2:20 PM Shunsuke Mie <mie@igel.co.jp> wrote:
> > >
> > > Implement a new provider method for dma-buf base memory registration.
> > >
> > > Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> > > ---
> > >  providers/rxe/rxe.c | 21 +++++++++++++++++++++
> > >  1 file changed, 21 insertions(+)
> > >
> > > diff --git a/providers/rxe/rxe.c b/providers/rxe/rxe.c
> > > index 3c3ea8bb..84e00e60 100644
> > > --- a/providers/rxe/rxe.c
> > > +++ b/providers/rxe/rxe.c
> > > @@ -239,6 +239,26 @@ static struct ibv_mr *rxe_reg_mr(struct ibv_pd *=
pd, void *addr, size_t length,
> > >         return &vmr->ibv_mr;
> > >  }
> > >
> > > +static struct ibv_mr *rxe_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t =
offset,
> > > +                                       size_t length, uint64_t iova,=
 int fd,
> > > +                                       int access)
> > > +{
> > > +       struct verbs_mr *vmr;
> > > +       int ret;
> > > +
> > > +       vmr =3D malloc(sizeof(*vmr));
> > > +       if (!vmr)
> > > +               return NULL;
> > > +
> >
> > Do we need to set vmr to zero like the following?
> >
> > memset(vmr, 0, sizeof(*vmr));
> >
> > Zhu Yanjun
> Thank you for your quick response.
>
> I think it is better to clear the vmr. Actually the mlx5 driver allocates
> the vmr using calloc().
>
> In addition, rxe_reg_mr() (not rxe_reg_dmabuf_mr()) is used the malloc
> and not clear the vmr. I think It has to be fixed too. Should I make
> another patch to fix this problem?

Yes. Please.

Zhu Yanjun

>
> Thanks a lot.
> Shunsuke
>
> ~
