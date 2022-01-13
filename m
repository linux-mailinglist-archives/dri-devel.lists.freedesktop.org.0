Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B9448D610
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 11:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9726C10E3AD;
	Thu, 13 Jan 2022 10:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357BD10E3AD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 10:50:50 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g11so18074067lfu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 02:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NYdzsGyEzIJrHP8JYJwpG+jE5+s3oneWhUEBd32KPfc=;
 b=DhhsZ4FcY1ymdPypyg+ee+pcqdiHSzGlYLuwyZma/jDW9t3eFFml3cIDRE+Xfvh99+
 +4oBLTJzqus8vayylwYSGzQKdoQjicyTib8TNKHtenL7vge/5KER7iSIJlAE22OHhGJe
 x26kaaSxBgB6/8hltdzilL4tnDFYGvTapV+X0GXSpKGaE1H9QCc424YeLyw+l6/UYVla
 wQtNgHr259qGkouEiYzjKPAtE/9phQmnDoID2v36ht4co+cvmhsonWjWDetrDg23Ae8Y
 oYC9lNdWL0QXBuHtQ0w3FPum0JejOV6lgCawUm6ESNZY8+czHxksEfkBGAloMBHoU6PX
 K0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NYdzsGyEzIJrHP8JYJwpG+jE5+s3oneWhUEBd32KPfc=;
 b=kZvwB+3ZdjR4EhxPrxKb5txgHjT6g6Zul4A7SvPSPkIAS1gwLqL8Zgf7yt8s+NR28w
 N5jKaf2OdxpcFkYrVyV4bFkVrOzjfueiDEv+dpm+r5qeELNccvEEypx70aLJ0gR7k+C4
 66IKH7HxoHS6JV2AmvS0Y68yvwtVFpX9joxhyFCj7CijPHMVu4cU2J9GUk/azYbMvJK/
 ETxjJ8USgYkshldl4Ikh5KjX0tuKbUn2wqsg/tb62jWJ43AAyqCraTSedhfHKU+jixM+
 Q1VN2hOj3+8mPUwG85shHhp7EccH2pjHRrC2HxbWliqiP1hcrImBDM2VDAJBdMZM6Wf6
 ZNzQ==
X-Gm-Message-State: AOAM532Hwz8LMK3W9yjNHDXprEL+ApqaZ6OI0w7MYm9M/THKSFU/o2e6
 Wp8sV0tjSMXqqV6QVP92hQ4BQInbVuI309itQB9Muw==
X-Google-Smtp-Source: ABdhPJyhIUaFCImjQEUT36hwyszgx3JmEnCBpsaSjbzQZGA3S2YuSL/rPG5RGeiNf1e3gQIc9S9mjOGoHwjjuLtLZ6g=
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr2544065ljk.122.1642071048268; 
 Thu, 13 Jan 2022 02:50:48 -0800 (PST)
MIME-Version: 1.0
References: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
 <20220105063643.119874-1-guangming.cao@mediatek.com>
In-Reply-To: <20220105063643.119874-1-guangming.cao@mediatek.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 13 Jan 2022 16:20:36 +0530
Message-ID: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
To: guangming.cao@mediatek.com
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
Cc: linux-arm-kernel@lists.infradead.org, lmark@codeaurora.org,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 yf.wang@mediatek.com, libo.kang@mediatek.com, benjamin.gaignard@linaro.org,
 bo.song@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, mingyuan.ma@mediatek.com,
 labbott@redhat.com, christian.koenig@amd.com, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Guangming,

On Wed, 5 Jan 2022 at 12:05, <guangming.cao@mediatek.com> wrote:
>
> From: Guangming.Cao <guangming.cao@mediatek.com>
>
> On Tue, 2022-01-04 at 08:47 +0100, Christian K=E9=B0=8Aig wrote:
> > Am 03.01.22 um 19:57 schrieb John Stultz:
> > > On Mon, Dec 27, 2021 at 1:52 AM <guangming.cao@mediatek.com> wrote:
> > > > From: Guangming <Guangming.Cao@mediatek.com>
> > > >
> > >
> > > Thanks for submitting this!
> > >
> > > > Add a size check for allcation since the allocation size is
> > >
> > > nit: "allocation" above.
> > >
> > > > always less than the total DRAM size.
> > >
> > > In general, it might be good to add more context to the commit
> > > message
> > > to better answer *why* this change is needed rather than what the
> > > change is doing.  ie: What negative thing happens without this
> > > change?
> > > And so how does this change avoid or improve things?
> >
> > Completely agree, just one little addition: Could you also add this
> > why
> > as comment to the code?
> >
> > When we stumble over this five years from now it is absolutely not
> > obvious why we do this.
> >
> > Thanks,
> > Christian.
> >
> Thanks for your reply!
> I will update the related reason in the patch later.
>
> The reason for adding this check is that we met a case that the user
> sent an invalid size(It seems it's a negative value, MSB is 0xff, it's
> larger than DRAM size after convert it to size_t) to dma-heap to alloc
> memory, and this allocation was running on a process(such as "gralloc"
> on Android device) can't be killed by OOM flow, and we also couldn't
> find the related dmabuf in "dma_buf_debug_show" because the related
> dmabuf was not exported yet since the allocation is still on going.
>
> Since this invalid argument case can be prevented at dma-heap side, so,
> I added this size check, and moreover, to let debug it easily, I also
> added logs when size is bigger than a threshold we set in mtk system
> heap.
> If you think that print logs in dma-heap framework is better, I will
> update it in next version.
>
> If you have better solution(such as dump the size under allocating
> in "dma_buf_debug_show", which maybe need add global variable to record
> it), please kindly let me know.

Thank you for the patch!

I think just adding the reasoning above as the commit message and a
comment in the code should be enough for now; the debug parts may be
easy to add in case someone runs into issues.

> Thanks :)
> Guangming

Best,
Sumit.

>
> > >
> > >
> > > > Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> > > > Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> > > > ---
> > > > v2: 1. update size limitation as total_dram page size.
> > > >      2. update commit message
> > > > ---
> > > >   drivers/dma-buf/dma-heap.c | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-
> > > > heap.c
> > > > index 56bf5ad01ad5..e39d2be98d69 100644
> > > > --- a/drivers/dma-buf/dma-heap.c
> > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > @@ -55,6 +55,8 @@ static int dma_heap_buffer_alloc(struct
> > > > dma_heap *heap, size_t len,
> > > >          struct dma_buf *dmabuf;
> > > >          int fd;
> > > >
> > > > +       if (len / PAGE_SIZE > totalram_pages())
> > > > +               return -EINVAL;
> > >
> > > This seems sane. I know ION used to have some 1/2 of memory cap to
> > > avoid unnecessary memory pressure on crazy allocations.
> > >
> > > Could you send again with an improved commit message?
> > >
> > > thanks
> > > -john
> >
> >



--
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
